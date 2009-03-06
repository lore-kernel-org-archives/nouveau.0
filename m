From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Subject: [PATCH] Fix nv50_screen_create()
Date: Fri, 06 Mar 2009 14:05:59 +0100
Message-ID: <49B11FB7.5020902@haypocalc.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080408070304060707010403"
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
--------------080408070304060707010403
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Setup screen->pipe before using it (screen->constbuf =
screen->pipe.buffer_create(...)): just move the code.

Victor

--------------080408070304060707010403
Content-Type: text/x-patch;
 name="0002-Fix-nv50_screen_create.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-Fix-nv50_screen_create.patch"

From c1a140dd7eab917a913bc46ff450f9fa6553366c Mon Sep 17 00:00:00 2001
From: Victor Stinner <victor.stinner-XgyrR7WU8tJ8UrSeD/g0lQ@public.gmane.org>
Date: Fri, 6 Mar 2009 14:03:15 +0100
Subject: [PATCH] Fix nv50_screen_create()

Setup screen->pipe before using it (screen->constbuf =
screen->pipe.buffer_create(...))
---
 src/gallium/drivers/nv50/nv50_screen.c |   35 ++++++++++++++++---------------
 1 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index bbfe42e..9bf5e8c 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -124,9 +124,9 @@ nv50_screen_get_param(struct pipe_screen *pscreen, int param)
 		return 1;
 	case PIPE_CAP_MAX_VERTEX_TEXTURE_UNITS:
 		return 0;
-	case NOUVEAU_CAP_HW_VTXBUF:	
+	case NOUVEAU_CAP_HW_VTXBUF:
 		return 1;
-	case NOUVEAU_CAP_HW_IDXBUF:	
+	case NOUVEAU_CAP_HW_IDXBUF:
 		return 0;
 	default:
 		NOUVEAU_ERR("Unknown PIPE_CAP %d\n", param);
@@ -234,6 +234,22 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_winsys *nvws)
 		return NULL;
 	}
 
+        /* Setup the pipe */
+	screen->pipe.winsys = ws;
+
+	screen->pipe.destroy = nv50_screen_destroy;
+
+	screen->pipe.get_name = nv50_screen_get_name;
+	screen->pipe.get_vendor = nv50_screen_get_vendor;
+	screen->pipe.get_param = nv50_screen_get_param;
+	screen->pipe.get_paramf = nv50_screen_get_paramf;
+
+	screen->pipe.is_format_supported = nv50_screen_is_format_supported;
+
+	nv50_screen_init_miptree_functions(&screen->pipe);
+	nv50_transfer_init_screen_functions(&screen->pipe);
+	u_simple_screen_init(&screen->pipe);
+
 	/* Static M2MF init */
 	so = so_new(32, 0);
 	so_method(so, screen->m2mf, 0x0180, 3);
@@ -353,21 +369,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_winsys *nvws)
 	so_ref(so, &screen->static_init);
 	nvws->push_flush(nvws, 0, NULL);
 
-	screen->pipe.winsys = ws;
-
-	screen->pipe.destroy = nv50_screen_destroy;
-
-	screen->pipe.get_name = nv50_screen_get_name;
-	screen->pipe.get_vendor = nv50_screen_get_vendor;
-	screen->pipe.get_param = nv50_screen_get_param;
-	screen->pipe.get_paramf = nv50_screen_get_paramf;
-
-	screen->pipe.is_format_supported = nv50_screen_is_format_supported;
-
-	nv50_screen_init_miptree_functions(&screen->pipe);
-	nv50_transfer_init_screen_functions(&screen->pipe);
-	u_simple_screen_init(&screen->pipe);
-
 	return &screen->pipe;
 }
 
-- 
1.5.6.3


--------------080408070304060707010403
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------080408070304060707010403--
