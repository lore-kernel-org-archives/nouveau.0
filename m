From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau_xv: Avoid reading off the end of the
	source image on NV50+
Date: Fri,  3 May 2013 09:59:39 -0400
Message-ID: <1367589579-19091-1-git-send-email-imirkin@alum.mit.edu>
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
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The 'w' argument to NVCopyNV12ColorPlanes is used to index into the
source image. line_len is rounded up to 8 on NV50+, so if the source
image (+ left offset) is not rounded to 8, NVCopyNV12ColorPlanes could
read past the end of the array and crash X. This change can cause the
last few horizontal pixels of dst to not be initialized, but they
should be truncated by the renderer anyways.

See https://bugs.freedesktop.org/show_bug.cgi?id=63263

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

I've been running with this patch (+ some extra debug info) for a
while and haven't seen any ill effects in Xv rendering. The debugging
info I had added suggests that the overruns are gone when the image is
dragged partially off the screen on the left.

 src/nouveau_xv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
index f7dc2bc..8eafcf0 100644
--- a/src/nouveau_xv.c
+++ b/src/nouveau_xv.c
@@ -1095,7 +1095,7 @@ NVPutImage(ScrnInfoPtr pScrn, short src_x, short src_y, short drw_x,
 				NVCopyNV12ColorPlanes(buf + s2offset,
 						      buf + s3offset, dst,
 						      line_len, srcPitch2,
-						      nlines, line_len);
+						      nlines, npixels);
 			}
 		} else {
 			for (i = 0; i < nlines; i++) {
@@ -1161,7 +1161,7 @@ CPU_copy:
 				NVCopyNV12ColorPlanes(buf + s2offset,
 						      buf + s3offset,
 						      map, dstPitch, srcPitch2,
-						      nlines, line_len);
+						      nlines, npixels);
 			}
 		} else {
 			/* YUY2 and RGB */
-- 
1.8.1.5
