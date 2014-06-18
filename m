From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nv30: plug some memory leaks on screen
	destroy and shader compile
Date: Tue, 17 Jun 2014 22:39:31 -0400
Message-ID: <1403059172-27689-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv30/nv30_screen.c   | 6 ++++++
 src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv30/nv30_screen.c b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
index fb9378c..4baabaf 100644
--- a/src/gallium/drivers/nouveau/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nouveau/nv30/nv30_screen.c
@@ -327,6 +327,12 @@ nv30_screen_destroy(struct pipe_screen *pscreen)
       nouveau_fence_ref(NULL, &screen->base.fence.current);
    }
 
+   nouveau_bo_ref(NULL, &screen->notify);
+
+   nouveau_heap_destroy(&screen->query_heap);
+   nouveau_heap_destroy(&screen->vp_exec_heap);
+   nouveau_heap_destroy(&screen->vp_data_heap);
+
    nouveau_object_del(&screen->query);
    nouveau_object_del(&screen->fence);
    nouveau_object_del(&screen->ntfy);
diff --git a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
index 4955226..1f1fba2 100644
--- a/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nouveau/nv30/nvfx_fragprog.c
@@ -1225,6 +1225,7 @@ out:
    if(fpc)
    {
       FREE(fpc->r_temp);
+      FREE(fpc->r_imm);
       util_dynarray_fini(&fpc->if_stack);
       util_dynarray_fini(&fpc->label_relocs);
       util_dynarray_fini(&fpc->imm_data);
-- 
1.8.5.5
