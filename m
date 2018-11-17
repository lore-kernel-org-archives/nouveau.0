From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/2] drm/nouveau: Grab an rpm reference before/after DP AUX transactions
Date: Fri, 16 Nov 2018 20:50:23 -0500
Message-ID: <20181117015024.5771-3-lyude@redhat.com>
References: <20181117015024.5771-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117015024.5771-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Now that we have ->pre_transfer() and ->post_transfer() for DP AUX
channel devices, we can implement these hooks in order to ensure that
the GPU is actually woken up before AUX transactions happen. This fixes
/dev/drm_dp_aux* not working while the GPU is suspended, along with some
more rare issues where the GPU might runtime-suspend if the time between
two DP AUX channel transactions ends up being longer then the runtime
suspend delay (sometimes observed on KASAN kernels where everything is
slow).

Additionally, we add tracking for the current task that's running our
runtime suspend/resume callbacks. We need this in order to avoid trying
to grab a runtime power reference when nouveau uses the DP AUX channel
for MST suspend/resume in it's runtime susped/resume callbacks.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 36 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c       | 12 ++++++-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |  8 +++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index fd80661dff92..d2e9752f2f91 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1171,6 +1171,38 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	return NVIF_NOTIFY_KEEP;
 }
 
+static int
+nouveau_connector_aux_pre_xfer(struct drm_dp_aux *obj)
+{
+	struct nouveau_connector *nv_connector =
+		container_of(obj, typeof(*nv_connector), aux);
+	struct nouveau_drm *drm = nouveau_drm(nv_connector->base.dev);
+	int ret;
+
+	if (nouveau_is_rpm_worker(drm))
+		return 0;
+
+	ret = pm_runtime_get_sync(drm->dev->dev);
+	if (ret < 0 && ret != -EAGAIN)
+		return ret;
+
+	return 0;
+}
+
+static void
+nouveau_connector_aux_post_xfer(struct drm_dp_aux *obj)
+{
+	struct nouveau_connector *nv_connector =
+		container_of(obj, typeof(*nv_connector), aux);
+	struct nouveau_drm *drm = nouveau_drm(nv_connector->base.dev);
+
+	if (nouveau_is_rpm_worker(drm))
+		return;
+
+	pm_runtime_mark_last_busy(drm->dev->dev);
+	pm_runtime_put_autosuspend(drm->dev->dev);
+}
+
 static ssize_t
 nouveau_connector_aux_xfer(struct drm_dp_aux *obj, struct drm_dp_aux_msg *msg)
 {
@@ -1341,6 +1373,10 @@ nouveau_connector_create(struct drm_device *dev, int index)
 	case DRM_MODE_CONNECTOR_DisplayPort:
 	case DRM_MODE_CONNECTOR_eDP:
 		nv_connector->aux.dev = dev->dev;
+		nv_connector->aux.pre_transfer =
+			nouveau_connector_aux_pre_xfer;
+		nv_connector->aux.post_transfer =
+			nouveau_connector_aux_post_xfer;
 		nv_connector->aux.transfer = nouveau_connector_aux_xfer;
 		ret = drm_dp_aux_register(&nv_connector->aux);
 		if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2b2baf6e0e0d..4323e9e61c2e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -859,6 +859,7 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	int ret;
 
 	if (!nouveau_pmops_runtime()) {
@@ -866,6 +867,8 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
+	drm->rpm_task = current;
+
 	nouveau_switcheroo_optimus_dsm();
 	ret = nouveau_do_suspend(drm_dev, true);
 	pci_save_state(pdev);
@@ -873,6 +876,8 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 	pci_ignore_hotplug(pdev);
 	pci_set_power_state(pdev, PCI_D3cold);
 	drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+
+	drm->rpm_task = NULL;
 	return ret;
 }
 
@@ -881,6 +886,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct nvif_device *device = &nouveau_drm(drm_dev)->client.device;
 	int ret;
 
@@ -889,11 +895,13 @@ nouveau_pmops_runtime_resume(struct device *dev)
 		return -EBUSY;
 	}
 
+	drm->rpm_task = current;
+
 	pci_set_power_state(pdev, PCI_D0);
 	pci_restore_state(pdev);
 	ret = pci_enable_device(pdev);
 	if (ret)
-		return ret;
+		goto out;
 	pci_set_master(pdev);
 
 	ret = nouveau_do_resume(drm_dev, true);
@@ -905,6 +913,8 @@ nouveau_pmops_runtime_resume(struct device *dev)
 	/* Monitors may have been connected / disconnected during suspend */
 	schedule_work(&nouveau_drm(drm_dev)->hpd_work);
 
+out:
+	drm->rpm_task = NULL;
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0b2191fa96f7..e8d4203ddfb4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -212,6 +212,8 @@ struct nouveau_drm {
 	bool have_disp_power_ref;
 
 	struct dev_pm_domain vga_pm_domain;
+
+	struct task_struct *rpm_task;
 };
 
 static inline struct nouveau_drm *
@@ -231,6 +233,12 @@ int nouveau_pmops_suspend(struct device *);
 int nouveau_pmops_resume(struct device *);
 bool nouveau_pmops_runtime(void);
 
+static inline bool
+nouveau_is_rpm_worker(struct nouveau_drm *drm)
+{
+	return drm->rpm_task == current;
+}
+
 #include <nvkm/core/tegra.h>
 
 struct drm_device *
-- 
2.19.1
