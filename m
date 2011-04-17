From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix a crash at card takedown for
 NV40 and older cards trying to free a vga bo
Date: Sun, 17 Apr 2011 16:15:09 -0400
Message-ID: <20110417161509.6e6aa2ed@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

NV40 and older cards (pre NV50) reserve a vram bo for the vga memory at
card init. This bo is then freed at card shutdown.  The problem is that
the ttm bo vram manager was already freed. So a crash occurs when the
vga bo is freed. The fix is to free the vga bo prior to freeing the ttm
bo vram manager. There might be other solutions but this seemed the
simplest to me. 

Signed-off-by: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c
b/drivers/gpu/drm/nouveau/nouveau_mem.c index 9c7bc3f..ce3cb5e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -154,8 +154,6 @@ nouveau_mem_vram_fini(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	nouveau_bo_ref(NULL, &dev_priv->vga_ram);
-
 	ttm_bo_device_release(&dev_priv->ttm.bdev);
 
 	nouveau_ttm_global_release(dev_priv);
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c
b/drivers/gpu/drm/nouveau/nouveau_state.c index 66e8037..98ab6b2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -738,6 +738,11 @@ static void nouveau_card_takedown(struct
drm_device *dev) engine->mc.takedown(dev);
 	engine->display.late_takedown(dev);
 
+	if (dev_priv->vga_ram) {
+		nouveau_bo_unpin(dev_priv->vga_ram);
+		nouveau_bo_ref(NULL, &dev_priv->vga_ram);
+	}
+
 	mutex_lock(&dev->struct_mutex);
 	ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM);
 	ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_TT);
