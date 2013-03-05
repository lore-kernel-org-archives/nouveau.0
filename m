From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix crash in vram manager debug
	callback
Date: Tue,  5 Mar 2013 19:57:09 +0100
Message-ID: <1362509833-28968-2-git-send-email-marcin.slusarz@gmail.com>
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

It's probably impossible to hit it now on mainline kernel.
I only noticed it because one of my debugging patches uses it.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 9be9cb5..9c60ef6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -35,14 +35,16 @@
 static int
 nouveau_vram_manager_init(struct ttm_mem_type_manager *man, unsigned long psize)
 {
-	/* nothing to do */
+	struct nouveau_drm *drm = nouveau_bdev(man->bdev);
+	struct nouveau_fb *pfb = nouveau_fb(drm->device);
+	man->priv = pfb;
 	return 0;
 }
 
 static int
 nouveau_vram_manager_fini(struct ttm_mem_type_manager *man)
 {
-	/* nothing to do */
+	man->priv = NULL;
 	return 0;
 }
 
@@ -104,7 +106,8 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
 static void
 nouveau_vram_manager_debug(struct ttm_mem_type_manager *man, const char *prefix)
 {
-	struct nouveau_mm *mm = man->priv;
+	struct nouveau_fb *pfb = man->priv;
+	struct nouveau_mm *mm = &pfb->vram;
 	struct nouveau_mm_node *r;
 	u32 total = 0, free = 0;
 
-- 
1.8.1.4
