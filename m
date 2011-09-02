From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 3/3] dri2: Fixes to swap scheduling,
	especially for copy-swaps.
Date: Fri,  2 Sep 2011 19:33:21 +0200
Message-ID: <1314984801-12029-4-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1314984801-12029-1-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Treats vblank event scheduling for the non-pageflip swap
case correctly. Allows vblank controlled swaps for redirected
windows. Fixes some corner-cases in OML_sync_control scheduling
when divisor and remainder parameters are used.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |   71 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 9f0ee97..f14dea4 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -196,10 +196,8 @@ can_sync_to_vblank(DrawablePtr draw)
 {
 	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
 	NVPtr pNv = NVPTR(scrn);
-	PixmapPtr pix = NVGetDrawablePixmap(draw);
 
 	return pNv->glx_vblank &&
-		nouveau_exa_pixmap_is_onscreen(pix) &&
 		nv_window_belongs_to_crtc(scrn, draw->x, draw->y,
 					  draw->width, draw->height);
 }
@@ -344,9 +342,40 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 			   CARD64 *target_msc, CARD64 divisor, CARD64 remainder,
 			   DRI2SwapEventPtr func, void *data)
 {
+	PixmapPtr dst_pix;
+	PixmapPtr src_pix = nouveau_dri2_buffer(src)->ppix;
 	struct nouveau_dri2_vblank_state *s;
 	CARD64 current_msc, expect_msc;
-	int ret;
+	int ret, flip = 0;
+	Bool front_updated;
+
+	/* Truncate to match kernel interfaces; means occasional overflow
+	 * misses, but that's generally not a big deal.
+	 */
+	*target_msc &= 0xffffffff;
+	divisor &= 0xffffffff;
+	remainder &= 0xffffffff;
+
+	/* Update frontbuffer pixmap and name: Could have changed due to
+	 * window (un)redirection as part of compositing.
+	 */
+	front_updated = update_front(draw, dst);
+
+	/* Assign frontbuffer pixmap, after update in update_front() */
+	dst_pix = nouveau_dri2_buffer(dst)->ppix;
+
+	/* Flips need to be submitted one frame before */
+	if (DRI2CanFlip(draw) && front_updated &&
+	    can_exchange(draw, dst_pix, src_pix)) {
+		flip = 1;
+	}
+
+	/* Correct target_msc by 'flip' if this is a page-flipped swap.
+	 * Do it early, so handling of different timing constraints
+	 * for divisor, remainder and msc vs. target_msc works.
+	 */
+	if (*target_msc > 0)
+		*target_msc -= (CARD64) flip;
 
 	/* Initialize a swap structure */
 	s = malloc(sizeof(*s));
@@ -363,19 +392,34 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 		if (ret)
 			goto fail;
 
-		/* Calculate a swap target if we don't have one */
-		if (current_msc >= *target_msc && divisor)
+		/* Calculate a swap target if we don't have one or if
+		 * divisor/remainder relationship must be satisfied.
+		 */
+		if (current_msc >= *target_msc && divisor) {
 			*target_msc = current_msc + divisor
 				- (current_msc - remainder) % divisor;
 
-		/* Request a vblank event one frame before the target */
+			/* Account for extra pageflip delay if flip > 0 */
+			*target_msc -= (CARD64) flip;
+		}
+
+		/* Request a vblank event one frame before the target, unless
+		 * this is a copy-swap, in which case we need to make sure
+		 * it is only dispatched at the target frame or later.
+		 */
 		ret = nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
-					  DRM_VBLANK_EVENT,
-					  max(current_msc, *target_msc - 1),
+					  DRM_VBLANK_EVENT |
+					  ((flip) ? 0 : DRM_VBLANK_NEXTONMISS),
+					  max(current_msc, *target_msc),
 					  &expect_msc, NULL, s);
 		if (ret)
 			goto fail;
-		s->frame = (unsigned int) expect_msc & 0xffffffff;
+
+		/* Store expected target_msc for later consistency check and
+		 * return it to server for proper swap_interval implementation.
+		 */
+		s->frame = ((unsigned int) (expect_msc & 0xffffffff)) + flip ;
+		*target_msc = s->frame;
 	} else {
 		/* We can't/don't want to sync to vblank, just swap. */
 		nouveau_dri2_finish_swap(draw, 0, 0, 0, s);
@@ -396,6 +440,13 @@ nouveau_dri2_schedule_wait(ClientPtr client, DrawablePtr draw,
 	CARD64 current_msc;
 	int ret;
 
+	/* Truncate to match kernel interfaces; means occasional overflow
+	 * misses, but that's generally not a big deal.
+	 */
+	target_msc &= 0xffffffff;
+	divisor &= 0xffffffff;
+	remainder &= 0xffffffff;
+
 	if (!can_sync_to_vblank(draw)) {
 		DRI2WaitMSCComplete(client, draw, target_msc, 0, 0);
 		return TRUE;
@@ -415,7 +466,7 @@ nouveau_dri2_schedule_wait(ClientPtr client, DrawablePtr draw,
 		goto fail;
 
 	/* Calculate a wait target if we don't have one */
-	if (current_msc > target_msc && divisor)
+	if (current_msc >= target_msc && divisor)
 		target_msc = current_msc + divisor
 			- (current_msc - remainder) % divisor;
 
-- 
1.7.1
