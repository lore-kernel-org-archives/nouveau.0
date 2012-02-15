From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 8/9] dri2: Reimplement hack for triple-buffering
	on old X-Servers.
Date: Thu, 16 Feb 2012 00:45:23 +0100
Message-ID: <1329349524-11650-9-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1329349524-11650-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329349524-11650-1-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
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
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

X-Servers before 1.12.0 don't have the DRI2SwapLimit()
API. On these, default to a swaplimit of 1 - double-buffering.

This patch implements support for swap limit of 2,
triple-buffering, on old x-servers via Francisco Jerez
previous hack:

Return DRI2SwapComplete() before the swap has completed,
so clients don't get blocked on the pending swap. This
allows for a "triple-buffering look-alike" behaviour, but
breaks the swap scheduling and timestamping defined
in the OML_sync_control spec, so applications which
rely on conformant behaviour will break with a swap
limit of 2 on pre 1.12.0 x-servers.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 man/nouveau.man    |    6 +++++-
 src/nouveau_dri2.c |   32 +++++++++++++++++++++++++++++---
 src/nv_driver.c    |   11 ++++++-----
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index 59f6c1a..7c72907 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -101,7 +101,11 @@ a drawable before a client is blocked.
 A value of 1 corresponds to double-buffering. A value of 2 corresponds
 to triple-buffering. Higher values may allow higher framerate, but also
 increase lag for interactive applications, e.g., games. Nouveau currently
-supports a maximum value of 2 on XOrg 1.12+ and a maximum of 1 on older servers.
+reliably supports a maximum value of 2 on XOrg 1.12+. A maximum setting of 2
+on older x-servers is allowed, but it will break conformance with the
+OpenML OML_sync_control specification and will cause failure of software
+that relies on correct presentation timing behaviour as defined in that
+specification.
 .br
 Default: 2 for XOrg 1.12+, 1 for older servers.
 .SH "SEE ALSO"
diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index fdc5148..f0c7fec 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -255,6 +255,18 @@ nouveau_dri2_swap_limit_validate(DrawablePtr draw, int swap_limit)
 }
 #endif
 
+/* Shall we intentionally violate the OML_sync_control spec to
+ * get some sort of triple-buffering behaviour on a pre 1.12.0
+ * x-server?
+ */
+static Bool violate_oml(DrawablePtr draw)
+{
+	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
+	NVPtr pNv = NVPTR(scrn);
+
+	return (DRI2INFOREC_VERSION < 6) && (pNv->swap_limit > 1);
+}
+
 static void
 nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 			 unsigned int tv_sec, unsigned int tv_usec,
@@ -319,7 +331,9 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 
 		if (DRI2CanFlip(draw)) {
 			type = DRI2_FLIP_COMPLETE;
-			ret = drmmode_page_flip(draw, src_pix, s, ref_crtc_hw_id);
+			ret = drmmode_page_flip(draw, src_pix,
+						violate_oml(draw) ? NULL : s,
+						ref_crtc_hw_id);
 			if (!ret)
 				goto out;
 		}
@@ -330,7 +344,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		DamageRegionProcessPending(draw);
 
 		/* If it is a page flip, finish it in the flip event handler. */
-		if (type == DRI2_FLIP_COMPLETE)
+		if ((type == DRI2_FLIP_COMPLETE) && !violate_oml(draw))
 			return;
 	} else {
 		type = DRI2_BLIT_COMPLETE;
@@ -344,7 +358,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		REGION_TRANSLATE(0, &reg, -draw->x, -draw->y);
 		nouveau_dri2_copy_region(draw, &reg, s->dst, s->src);
 
-		if (can_sync_to_vblank(draw)) {
+		if (can_sync_to_vblank(draw) && !violate_oml(draw)) {
 			/* Request a vblank event one vblank from now, the most
 			 * likely (optimistic?) time a direct framebuffer blit
 			 * will complete or a desktop compositor will update its
@@ -361,6 +375,14 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		}
 	}
 
+	/* Special triple-buffering hack for old pre 1.12.0 x-servers used? */
+	if (violate_oml(draw)) {
+		/* Signal to client that swap completion timestamps and counts
+		 * are invalid - they violate the specification.
+		 */
+		frame = tv_sec = tv_usec = 0;
+	}
+
 	/*
 	 * Tell the X server buffers are already swapped even if they're
 	 * not, to prevent it from blocking the client on the next
@@ -371,6 +393,10 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 	 *       It is still needed as a fallback for some copy swaps as
 	 *       we lack a method to detect true swap completion for
 	 *       DRI2_BLIT_COMPLETE.
+	 *
+	 *       It is also used if triple-buffering is requested on
+	 *       old x-servers which don't support the DRI2SwapLimit()
+	 *       function.
 	 */
 	DRI2SwapComplete(s->client, draw, frame, tv_sec, tv_usec,
 			 type, s->func, s->data);
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 5def531..7512464 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -863,11 +863,12 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 		reason = "";
 		from = X_CONFIG;
 
-		if (DRI2INFOREC_VERSION < 6) {
-			/* No swap limit api in server. Stick to server default of 1. */
-			pNv->swap_limit = 1;
-			from = X_DEFAULT;
-			reason = ": This X-Server only supports a swap limit of 1.";
+		if ((DRI2INFOREC_VERSION < 6) && (pNv->swap_limit > 1)) {
+			/* No swap limit api in server. A value > 1 requires use
+			 * of problematic hacks.
+			 */
+			from = X_WARNING;
+			reason = ": Caution: Use of this swap limit > 1 violates OML_sync_control spec on this X-Server!\n";
 		}
 	} else {
 		/* Driver default: Double buffering on old servers, triple-buffering
-- 
1.7.5.4
