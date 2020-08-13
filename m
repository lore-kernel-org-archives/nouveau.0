From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 17/20] drm/vkms: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:41 +0200
Message-ID: <20200813083644.31711-18-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, olek
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: nouveau.vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in vkms.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  8 --------
 drivers/gpu/drm/vkms/vkms_gem.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 83dd5567de8b..a3a1ee1f77fb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,12 +51,6 @@ static const struct file_operations vkms_driver_fops = {
 	.release	= drm_release,
 };
 
-static const struct vm_operations_struct vkms_gem_vm_ops = {
-	.fault = vkms_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static void vkms_release(struct drm_device *dev)
 {
 	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
@@ -101,8 +95,6 @@ static struct drm_driver vkms_driver = {
 	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	.dumb_create		= vkms_dumb_create,
-	.gem_vm_ops		= &vkms_gem_vm_ops,
-	.gem_free_object_unlocked = vkms_gem_free_object,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = vkms_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index a017fc59905e..19a0e260a4df 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -7,6 +7,17 @@
 
 #include "vkms_drv.h"
 
+static const struct vm_operations_struct vkms_gem_vm_ops = {
+	.fault = vkms_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs vkms_gem_object_funcs = {
+	.free = vkms_gem_free_object,
+	.vm_ops = &vkms_gem_vm_ops,
+};
+
 static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 						 u64 size)
 {
@@ -17,6 +28,8 @@ static struct vkms_gem_object *__vkms_gem_create(struct drm_device *dev,
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
+	obj->gem.funcs = &vkms_gem_object_funcs;
+
 	size = roundup(size, PAGE_SIZE);
 	ret = drm_gem_object_init(dev, &obj->gem, size);
 	if (ret) {
-- 
2.28.0
