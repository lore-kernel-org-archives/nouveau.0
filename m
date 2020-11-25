From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] drm/nouveau: Add a dedicated mutex for the
 clients list
Date: Wed, 25 Nov 2020 15:26:47 -0500
Message-ID: <20201125202648.5220-3-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201125202648.5220-1-jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Rather than protecting the nouveau_drm clients list with the lock within
the "client" nouveau_cli, add a dedicated lock to serialize access to
the list. This is both clearer and necessary to avoid lockdep being
upset with us when we need to iterate through all the clients in the
list and potentially lock their mutex, which is the same class as the
lock protecting the entire list.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes since v1:
  - Add a mutex_destroy() call when destroying the device struct

 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |  5 +++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4fe4d664c5f2..6ee1adc9bd40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -557,6 +557,7 @@ nouveau_drm_device_init(struct drm_device *dev)
 		nvkm_dbgopt(nouveau_debug, "DRM");
 
 	INIT_LIST_HEAD(&drm->clients);
+	mutex_init(&drm->clients_lock);
 	spin_lock_init(&drm->tile.lock);
 
 	/* workaround an odd issue on nvc1 by disabling the device's
@@ -654,6 +655,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	nvif_parent_dtor(&drm->parent);
+	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
 }
 
@@ -1089,9 +1091,9 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 
 	fpriv->driver_priv = cli;
 
-	mutex_lock(&drm->client.mutex);
+	mutex_lock(&drm->clients_lock);
 	list_add(&cli->head, &drm->clients);
-	mutex_unlock(&drm->client.mutex);
+	mutex_unlock(&drm->clients_lock);
 
 done:
 	if (ret && cli) {
@@ -1117,9 +1119,9 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 		nouveau_abi16_fini(cli->abi16);
 	mutex_unlock(&cli->mutex);
 
-	mutex_lock(&drm->client.mutex);
+	mutex_lock(&drm->clients_lock);
 	list_del(&cli->head);
-	mutex_unlock(&drm->client.mutex);
+	mutex_unlock(&drm->clients_lock);
 
 	nouveau_cli_fini(cli);
 	kfree(cli);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9d04d1b36434..550e5f335146 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -141,6 +141,11 @@ struct nouveau_drm {
 
 	struct list_head clients;
 
+	/**
+	 * @clients_lock: Protects access to the @clients list of &struct nouveau_cli.
+	 */
+	struct mutex clients_lock;
+
 	u8 old_pm_cap;
 
 	struct {
-- 
2.28.0
