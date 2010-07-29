From: Tomas Carnecky <tom-ix/z9KG6G0Jl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] Reflow logic to make it easier to follow
Date: Fri, 30 Jul 2010 00:06:03 +0200
Message-ID: <1280441163-18695-1-git-send-email-tom@dbservice.com>
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

The control flow was:

if (!y) {
  ppix = ...
}

if (y) {
  ...
} else if (x) {
  use ppix for something
} else {
  use ppix for something
}

Merge the if(!y) block with the two else branches. This avoids
a false-positive in the clang static analyzer, it can't know that
!y and x are mutually exclusive.

The result looks something like this:

if (y) {
  ...
} else {
  ppix = ...
  if (x) {
    use ppix for something
  } else {
    use ppix for something
  }
}

Signed-off-by: Tomas Carnecky <tom-ix/z9KG6G0Jl57MIdRCFDg@public.gmane.org>
---

This patch actually compiles. There are still a couple clang warnings, but
those are dead assignments and one dead initialization. If there is interest
I can send patches for those as well. The clang results can be viewed at
http://stuff.caurea.org/clang-static-analyzer/nouveau

 src/nouveau_xv.c |  114 ++++++++++++++++++++++++++----------------------------
 1 files changed, 55 insertions(+), 59 deletions(-)

diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
index 4437aa6..eb43207 100644
--- a/src/nouveau_xv.c
+++ b/src/nouveau_xv.c
@@ -920,7 +920,6 @@ NVPutImage(ScrnInfoPtr pScrn, short src_x, short src_y, short drw_x,
 {
 	NVPortPrivPtr pPriv = (NVPortPrivPtr)data;
 	NVPtr pNv = NVPTR(pScrn);
-	PixmapPtr ppix;
 	/* source box */
 	INT32 xa = 0, xb = 0, ya = 0, yb = 0;
 	/* size to allocate in VRAM and in GART respectively */
@@ -1249,11 +1248,29 @@ CPU_copy:
 	if (pPriv->currentHostBuffer != NO_PRIV_HOST_BUFFER_AVAILABLE)
 		pPriv->currentHostBuffer ^= 1;
 
-	/* If we're not using the hw overlay, we're rendering into a pixmap
-	 * and need to take a couple of additional steps...
-	 */
-	if (!(action_flags & USE_OVERLAY)) {
-		ppix = NVGetDrawablePixmap(pDraw);
+	if (action_flags & USE_OVERLAY) {
+		if (pNv->Architecture == NV_ARCH_04) {
+			NV04PutOverlayImage(pScrn, pPriv->video_mem, offset,
+					    id, dstPitch, &dstBox, 0, 0,
+					    xb, yb, npixels, nlines,
+					    src_w, src_h, drw_w, drw_h,
+					    clipBoxes);
+		} else {
+			NV10PutOverlayImage(pScrn, pPriv->video_mem, offset,
+					    uv_offset, id, dstPitch, &dstBox,
+					    0, 0, xb, yb,
+					    npixels, nlines, src_w, src_h,
+					    drw_w, drw_h, clipBoxes);
+		}
+
+		pPriv->currentBuffer ^= 1;
+	} else {
+		int ret = BadImplementation;
+
+		/* If we're not using the hw overlay, we're rendering into a pixmap
+		 * and need to take a couple of additional steps...
+		 */
+		PixmapPtr ppix = NVGetDrawablePixmap(pDraw);
 
 		/* Ensure pixmap is in offscreen memory */
 		pNv->exa_force_cp = TRUE;
@@ -1274,69 +1291,48 @@ CPU_copy:
 			dstBox.y2 -= ppix->screen_y;
 		}
 #endif
-	}
-
-	if (action_flags & USE_OVERLAY) {
-		if (pNv->Architecture == NV_ARCH_04) {
-			NV04PutOverlayImage(pScrn, pPriv->video_mem, offset,
-					    id, dstPitch, &dstBox, 0, 0,
-					    xb, yb, npixels, nlines,
-					    src_w, src_h, drw_w, drw_h,
-					    clipBoxes);
-		} else {
-			NV10PutOverlayImage(pScrn, pPriv->video_mem, offset,
-					    uv_offset, id, dstPitch, &dstBox,
-					    0, 0, xb, yb,
-					    npixels, nlines, src_w, src_h,
-					    drw_w, drw_h, clipBoxes);
-		}
 
-		pPriv->currentBuffer ^= 1;
-	} else 
-	if (action_flags & USE_TEXTURE) {
-		int ret = BadImplementation;
 
-		if (pNv->Architecture == NV_ARCH_30) {
-			ret = NV30PutTextureImage(pScrn, pPriv->video_mem,
-						  offset, uv_offset,
-						  id, dstPitch, &dstBox, 0, 0,
-						  xb, yb, npixels, nlines,
-						  src_w, src_h, drw_w, drw_h,
-						  clipBoxes, ppix, pPriv);
-		} else
-		if (pNv->Architecture == NV_ARCH_40) {
-			ret = NV40PutTextureImage(pScrn, pPriv->video_mem, 
-						  offset, uv_offset,
-						  id, dstPitch, &dstBox, 0, 0,
-						  xb, yb, npixels, nlines,
-						  src_w, src_h, drw_w, drw_h,
-						  clipBoxes, ppix, pPriv);
-		} else
-		if (pNv->Architecture == NV_ARCH_50) {
-			ret = nv50_xv_image_put(pScrn, pPriv->video_mem,
-						offset, uv_offset,
-						id, dstPitch, &dstBox, 0, 0,
-						xb, yb, npixels, nlines,
-						src_w, src_h, drw_w, drw_h,
-						clipBoxes, ppix, pPriv);
+		if (action_flags & USE_TEXTURE) {
+			if (pNv->Architecture == NV_ARCH_30) {
+				ret = NV30PutTextureImage(pScrn, pPriv->video_mem,
+							  offset, uv_offset,
+							  id, dstPitch, &dstBox, 0, 0,
+							  xb, yb, npixels, nlines,
+							  src_w, src_h, drw_w, drw_h,
+							  clipBoxes, ppix, pPriv);
+			} else
+			if (pNv->Architecture == NV_ARCH_40) {
+				ret = NV40PutTextureImage(pScrn, pPriv->video_mem, 
+							  offset, uv_offset,
+							  id, dstPitch, &dstBox, 0, 0,
+							  xb, yb, npixels, nlines,
+							  src_w, src_h, drw_w, drw_h,
+							  clipBoxes, ppix, pPriv);
+			} else
+			if (pNv->Architecture == NV_ARCH_50) {
+				ret = nv50_xv_image_put(pScrn, pPriv->video_mem,
+							offset, uv_offset,
+							id, dstPitch, &dstBox, 0, 0,
+							xb, yb, npixels, nlines,
+							src_w, src_h, drw_w, drw_h,
+							clipBoxes, ppix, pPriv);
+			}
+		} else {
+			ret = NVPutBlitImage(pScrn, pPriv->video_mem, offset, id,
+					     dstPitch, &dstBox, 0, 0, xb, yb, npixels,
+					     nlines, src_w, src_h, drw_w, drw_h,
+					     clipBoxes, ppix);
 		}
 
 		if (ret != Success)
 			return ret;
-	} else {
-		ret = NVPutBlitImage(pScrn, pPriv->video_mem, offset, id,
-				     dstPitch, &dstBox, 0, 0, xb, yb, npixels,
-				     nlines, src_w, src_h, drw_w, drw_h,
-				     clipBoxes, ppix);
-		if (ret != Success)
-			return ret;
-	}
 
 #ifdef COMPOSITE
-	/* Damage tracking */
-	if (!(action_flags & USE_OVERLAY))
+		/* Damage tracking */
 		DamageDamageRegion(&ppix->drawable, clipBoxes);
 #endif
+	}
 
 	return Success;
 }
-- 
1.7.2.1.g43c6fa
