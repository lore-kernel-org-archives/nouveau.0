From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nv50/nv40/nv30: fix small memory leak of
 nouveau_resources on screen_destroy
Date: Tue, 12 Jan 2010 15:41:50 +0100
Message-ID: <20100112144150.GE2984@joi.lan>
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
Subject: [mesa PATCH] nv50/nv40/nv30: fix small memory leak of nouveau_resources on screen_destroy

---
tested only on nv50;
needs patch "nouveau: add nouveau_resource_destroy" to libdrm
---
 src/gallium/drivers/nv30/nv30_screen.c |    6 +++---
 src/gallium/drivers/nv40/nv40_screen.c |    6 +++---
 src/gallium/drivers/nv50/nv50_screen.c |    3 +++
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_screen.c b/src/gallium/drivers/nv30/nv30_screen.c
index 9ed4817..d17b305 100644
--- a/src/gallium/drivers/nv30/nv30_screen.c
+++ b/src/gallium/drivers/nv30/nv30_screen.c
@@ -163,9 +163,9 @@ nv30_screen_destroy(struct pipe_screen *pscreen)
 			so_ref(NULL, &screen->state[i]);
 	}
 
-	nouveau_resource_free(&screen->vp_exec_heap);
-	nouveau_resource_free(&screen->vp_data_heap);
-	nouveau_resource_free(&screen->query_heap);
+	nouveau_resource_destroy(&screen->vp_exec_heap);
+	nouveau_resource_destroy(&screen->vp_data_heap);
+	nouveau_resource_destroy(&screen->query_heap);
 	nouveau_notifier_free(&screen->query);
 	nouveau_notifier_free(&screen->sync);
 	nouveau_grobj_free(&screen->rankine);
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index 9e55e5a..bcaf989 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -147,9 +147,9 @@ nv40_screen_destroy(struct pipe_screen *pscreen)
 			so_ref(NULL, &screen->state[i]);
 	}
 
-	nouveau_resource_free(&screen->vp_exec_heap);
-	nouveau_resource_free(&screen->vp_data_heap);
-	nouveau_resource_free(&screen->query_heap);
+	nouveau_resource_destroy(&screen->vp_exec_heap);
+	nouveau_resource_destroy(&screen->vp_data_heap);
+	nouveau_resource_destroy(&screen->query_heap);
 	nouveau_notifier_free(&screen->query);
 	nouveau_notifier_free(&screen->sync);
 	nouveau_grobj_free(&screen->curie);
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 28e2b35..02dd19c 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -185,6 +185,9 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
 	nouveau_grobj_free(&screen->tesla);
 	nouveau_grobj_free(&screen->eng2d);
 	nouveau_grobj_free(&screen->m2mf);
+	nouveau_resource_destroy(&screen->immd_heap[0]);
+	nouveau_resource_destroy(&screen->parm_heap[0]);
+	nouveau_resource_destroy(&screen->parm_heap[1]);
 	nouveau_screen_fini(&screen->base);
 	FREE(screen);
 }
-- 
1.6.6.rc3
