From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Subject: [PATCH] Fix nouveau_pipe_create() / nouveau_context_init()
Date: Fri, 06 Mar 2009 13:59:45 +0100
Message-ID: <49B11E41.8050804@haypocalc.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020306070001090004020404"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------020306070001090004020404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

My first patch to help the gallium driver :-)

Fix nouveau_pipe_create() / nouveau_context_init(): raise an error if 
the screen/pipe creation failed.

Victor

--------------020306070001090004020404
Content-Type: text/x-patch;
 name="0001-Fix-nouveau_pipe_create-nouveau_context_init.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-Fix-nouveau_pipe_create-nouveau_context_init.patch"

From 69086668a51278c0e985ef3018df14477e41416b Mon Sep 17 00:00:00 2001
From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Date: Fri, 6 Mar 2009 13:52:19 +0100
Subject: [PATCH] Fix nouveau_pipe_create() / nouveau_context_init(): raise an error if
 the screen/pipe creation failed

---
 .../winsys/drm/nouveau/common/nouveau_context.c    |    6 ++++--
 .../winsys/drm/nouveau/common/nouveau_winsys.c     |    7 ++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/src/gallium/winsys/drm/nouveau/common/nouveau_context.c b/src/gallium/winsys/drm/nouveau/common/nouveau_context.c
index 25c9845..d9321ea 100644
--- a/src/gallium/winsys/drm/nouveau/common/nouveau_context.c
+++ b/src/gallium/winsys/drm/nouveau/common/nouveau_context.c
@@ -132,8 +132,10 @@ nouveau_context_init(struct nouveau_screen *nv_screen,
 		struct pipe_screen *pscreen;
 
 		pipe = nouveau_pipe_create(nv);
-		if (!pipe)
+		if (!pipe) {
 			NOUVEAU_ERR("Couldn't create hw pipe\n");
+			return 1;
+		}
 		pscreen = nvc->pscreen;
 
 		nv->cap.hw_vertex_buffer =
@@ -199,7 +201,7 @@ nouveau_context_cleanup(struct nouveau_context *nv)
 			nv->nv_screen->nvc = NULL;
 		}
 	}
-	
+
 	/* XXX: Who cleans up the pipe? */
 }
 
diff --git a/src/gallium/winsys/drm/nouveau/common/nouveau_winsys.c b/src/gallium/winsys/drm/nouveau/common/nouveau_winsys.c
index b6199f8..52c3b02 100644
--- a/src/gallium/winsys/drm/nouveau/common/nouveau_winsys.c
+++ b/src/gallium/winsys/drm/nouveau/common/nouveau_winsys.c
@@ -133,8 +133,13 @@ nouveau_pipe_create(struct nouveau_context *nv)
 
 	ws = nouveau_create_pipe_winsys(nv);
 
-	if (!nvc->pscreen)
+	if (!nvc->pscreen) {
 		nvc->pscreen = hws_create(ws, nvws);
+		if (!nvc->pscreen) {
+			NOUVEAU_ERR("Couldn't create hw screen\n");
+			return NULL;
+		}
+	}
 	nvc->pctx[nv->pctx_id] = hw_create(nvc->pscreen, nv->pctx_id);
 	return nvc->pctx[nv->pctx_id];
 }
-- 
1.5.6.3


--------------020306070001090004020404
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------020306070001090004020404--
