From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: handle same-fb page flips
Date: Fri, 5 Oct 2012 21:37:59 +0200
Message-ID: <20121005193759.GA8531@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

It's questionable use case, but weston/wayland already relies on this behaviour,
and other drivers don't care about it, so it's a matter of compatibility.
Without it, process invoking such page flip hangs in unkillable state, trying
to reserve the same buffer twice.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 61f370d..a52cfd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -530,9 +530,11 @@ nouveau_page_flip_reserve(struct nouveau_bo *old_bo,
 	if (ret)
 		goto fail;
 
-	ret = ttm_bo_reserve(&old_bo->bo, false, false, false, 0);
-	if (ret)
-		goto fail_unreserve;
+	if (likely(old_bo != new_bo)) {
+		ret = ttm_bo_reserve(&old_bo->bo, false, false, false, 0);
+		if (ret)
+			goto fail_unreserve;
+	}
 
 	return 0;
 
@@ -551,8 +553,10 @@ nouveau_page_flip_unreserve(struct nouveau_bo *old_bo,
 	nouveau_bo_fence(new_bo, fence);
 	ttm_bo_unreserve(&new_bo->bo);
 
-	nouveau_bo_fence(old_bo, fence);
-	ttm_bo_unreserve(&old_bo->bo);
+	if (likely(old_bo != new_bo)) {
+		nouveau_bo_fence(old_bo, fence);
+		ttm_bo_unreserve(&old_bo->bo);
+	}
 
 	nouveau_bo_unpin(old_bo);
 }
@@ -624,6 +628,12 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	if (!drm->channel)
 		return -ENODEV;
 
+	if (unlikely(old_bo == new_bo)) {
+		char name[sizeof(current->comm)];
+		pr_debug_ratelimited("'%s': useless page flip invoked\n",
+				get_task_comm(name, current));
+	}
+
 	s = kzalloc(sizeof(*s), GFP_KERNEL);
 	if (!s)
 		return -ENOMEM;
-- 
1.7.12
