From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nv50: fix 2 off by one memory leaks
 (nv50_miptree_level->image_offset)
Date: Tue, 12 Jan 2010 15:43:03 +0100
Message-ID: <20100112144303.GG2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nv50: fix 2 off by one memory leaks (nv50_miptree_level->image_offset)

---
 src/gallium/drivers/nv50/nv50_miptree.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 3f1edf0..cecb1ef 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -145,7 +145,7 @@ nv50_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *tmp)
 				  mt->level[0].tile_mode, tile_flags,
 				  &mt->base.bo);
 	if (ret) {
-		for (l = 0; l < pt->last_level; ++l)
+		for (l = 0; l <= pt->last_level; ++l)
 			FREE(mt->level[l].image_offset);
 		FREE(mt);
 		return NULL;
@@ -188,7 +188,7 @@ nv50_miptree_destroy(struct pipe_texture *pt)
 	struct nv50_miptree *mt = nv50_miptree(pt);
 	unsigned l;
 
-	for (l = 0; l < pt->last_level; ++l)
+	for (l = 0; l <= pt->last_level; ++l)
 		FREE(mt->level[l].image_offset);
 
 	nouveau_bo_ref(NULL, &mt->base.bo);
-- 
1.6.6.rc3
