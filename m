From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: RFC: bicubic filtering patch
Date: Mon, 29 Mar 2010 16:54:00 +1000
Message-ID: <1269845640.2472.6.camel@nisroch>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-qqXAqmwS2+3WML2GfFEt"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--=-qqXAqmwS2+3WML2GfFEt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hey,

There's one relevant patch in the F13 DDX package that hasn't been
pushed into git still.

The patch simply switches off the bicubic filtering if we're scaling the
image by less than 200% in either direction in order to prevent some
excessive blurriness in the image (very noticable with the gstreamer
xvideo test).

The patch has been in the Fedora package since F11 as a user reported
the issue as a bug, and the radeon driver has similar code, but I
thought I'd ask for opinions before I pushed this to git.

Ben.

--=-qqXAqmwS2+3WML2GfFEt
Content-Disposition: attachment; filename="nouveau-bicubic-2x.patch"
Content-Type: text/x-patch; name="nouveau-bicubic-2x.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 9e1f2ff45e5b22406f3575298113f1168b3bde5a Mon Sep 17 00:00:00 2001
From: Ben Skeggs <skeggsb-KEl1lVR6jwNSq9BJjBFyUp/QNRX+jHPU@public.gmane.org>
Date: Mon, 4 May 2009 17:04:34 +1000
Subject: [PATCH 1/2] xv: only use bicubic filtering when scaling >=2x

---
 src/nv30_xv_tex.c |    7 +++++--
 src/nv40_xv_tex.c |    8 ++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/src/nv30_xv_tex.c b/src/nv30_xv_tex.c
index 617e63b..f4bc1da 100644
--- a/src/nv30_xv_tex.c
+++ b/src/nv30_xv_tex.c
@@ -258,7 +258,7 @@ NV30PutTextureImage(ScrnInfoPtr pScrn, struct nouveau_bo *src, int src_offset,
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *rankine = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
-	Bool redirected = FALSE;
+	Bool redirected = FALSE, bicubic = pPriv->bicubic;
 	float X1, X2, Y1, Y2;
 	BoxPtr pbox;
 	int nbox;
@@ -342,7 +342,10 @@ NV30PutTextureImage(ScrnInfoPtr pScrn, struct nouveau_bo *src, int src_offset,
 	BEGIN_RING(chan, rankine, NV34TCL_TX_ENABLE(3), 1);
 	OUT_RING  (chan, 0x0);
 
-	if (!NV30_LoadFragProg(pScrn, pPriv->bicubic ?
+	if (drw_w / 2 < src_w || drw_h / 2 < src_h)
+		bicubic = FALSE;
+
+	if (!NV30_LoadFragProg(pScrn, bicubic ?
 			       &nv30_fp_yv12_bicubic :
 			       &nv30_fp_yv12_bilinear)) {
 		MARK_UNDO(chan);
diff --git a/src/nv40_xv_tex.c b/src/nv40_xv_tex.c
index 3a5d439..a46f1e3 100644
--- a/src/nv40_xv_tex.c
+++ b/src/nv40_xv_tex.c
@@ -262,7 +262,7 @@ NV40PutTextureImage(ScrnInfoPtr pScrn,
 	struct nouveau_channel *chan = pNv->chan;
 	struct nouveau_grobj *curie = pNv->Nv3D;
 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
-	Bool redirected = FALSE;
+	Bool redirected = FALSE, bicubic = pPriv->bicubic;
 	float X1, X2, Y1, Y2;
 	BoxPtr pbox;
 	int nbox;
@@ -322,7 +322,11 @@ NV40PutTextureImage(ScrnInfoPtr pScrn,
 	}
 
 	NV40_LoadVtxProg(pScrn, &nv40_vp_video);
-	if (!NV40_LoadFragProg(pScrn, pPriv->bicubic ?
+
+	if (drw_w / 2 < src_w || drw_h / 2 < src_h)
+		bicubic = FALSE;
+
+	if (!NV40_LoadFragProg(pScrn, bicubic ?
 			       &nv40_fp_yv12_bicubic :
 			       &nv30_fp_yv12_bilinear)) {
 		MARK_UNDO(chan);
-- 
1.7.0.1


--=-qqXAqmwS2+3WML2GfFEt
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-qqXAqmwS2+3WML2GfFEt--
