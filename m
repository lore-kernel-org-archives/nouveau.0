From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 2/9] dri2: Implement handling of pageflip
	completion events.
Date: Thu, 16 Feb 2012 00:45:17 +0100
Message-ID: <1329349524-11650-3-git-send-email-mario.kleiner@tuebingen.mpg.de>
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

Requests pageflip completion events from the kernel.
Implements pageflip completion handler to finalize
and timestamp swaps.

Completion handler includes a consistency check, and
disambiguation if multiple crtc's are involved in a
pageflip (e.g., clone mode, extendend desktop). Only
the timestamp of the crtc whose vblank event initially
triggered the swap is used, but handler waits for flip
completion on all involved crtc's before completing the
swap and releasing the old framebuffer.

This code is almost identical to the code used in the
ati/radeon ddx and intel ddx.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/drmmode_display.c |  107 +++++++++++++++++++++++++++++++++++++++++++++++--
 src/nouveau_dri2.c    |   89 ++++++++++++++++++++++++++++++++++++++--
 src/nv_proto.h        |    5 ++-
 3 files changed, 191 insertions(+), 10 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 75ef6dd..9e15c29 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -83,6 +83,21 @@ typedef struct {
     drmmode_prop_ptr props;
 } drmmode_output_private_rec, *drmmode_output_private_ptr;
 
+typedef struct {
+    drmmode_ptr drmmode;
+    unsigned old_fb_id;
+    int flip_count;
+    void *event_data;
+    unsigned int fe_frame;
+    unsigned int fe_tv_sec;
+    unsigned int fe_tv_usec;
+} drmmode_flipdata_rec, *drmmode_flipdata_ptr;
+
+typedef struct {
+    drmmode_flipdata_ptr flipdata;
+    Bool dispatch_me;
+} drmmode_flipevtcarrier_rec, *drmmode_flipevtcarrier_ptr;
+
 static void drmmode_output_dpms(xf86OutputPtr output, int mode);
 
 static drmmode_ptr
@@ -1245,13 +1260,17 @@ drmmode_cursor_init(ScreenPtr pScreen)
 }
 
 Bool
-drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv)
+drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv,
+		  unsigned int ref_crtc_hw_id)
 {
 	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
 	xf86CrtcConfigPtr config = XF86_CRTC_CONFIG_PTR(scrn);
 	drmmode_crtc_private_ptr crtc = config->crtc[0]->driver_private;
 	drmmode_ptr mode = crtc->drmmode;
 	int ret, i, old_fb_id;
+	int emitted = 0;
+	drmmode_flipdata_ptr flipdata;
+	drmmode_flipevtcarrier_ptr flipcarrier;
 
 	old_fb_id = mode->fb_id;
 	ret = drmModeAddFB(mode->fd, scrn->virtualX, scrn->virtualY,
@@ -1264,24 +1283,64 @@ drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv)
 		return FALSE;
 	}
 
+	flipdata = calloc(1, sizeof(drmmode_flipdata_rec));
+	if (!flipdata) {
+		xf86DrvMsg(scrn->scrnIndex, X_WARNING,
+		"flip queue: data alloc failed.\n");
+		goto error_undo;
+	}
+
+	flipdata->event_data = priv;
+	flipdata->drmmode = mode;
+
 	for (i = 0; i < config->num_crtc; i++) {
 		crtc = config->crtc[i]->driver_private;
 
 		if (!config->crtc[i]->enabled)
 			continue;
 
+		flipdata->flip_count++;
+
+		flipcarrier = calloc(1, sizeof(drmmode_flipevtcarrier_rec));
+		if (!flipcarrier) {
+			xf86DrvMsg(scrn->scrnIndex, X_WARNING,
+				   "flip queue: carrier alloc failed.\n");
+			if (emitted == 0)
+				free(flipdata);
+			goto error_undo;
+		}
+
+		/* Only the reference crtc will finally deliver its page flip
+		 * completion event. All other crtc's events will be discarded.
+		 */
+		flipcarrier->dispatch_me = ((1 << i) == ref_crtc_hw_id);
+		flipcarrier->flipdata = flipdata;
+
 		ret = drmModePageFlip(mode->fd, crtc->mode_crtc->crtc_id,
-				      mode->fb_id, 0, priv);
+				      mode->fb_id, DRM_MODE_PAGE_FLIP_EVENT,
+				      flipcarrier);
 		if (ret) {
 			xf86DrvMsg(scrn->scrnIndex, X_WARNING,
 				   "flip queue failed: %s\n", strerror(errno));
-			return FALSE;
+
+			free(flipcarrier);
+			if (emitted == 0)
+				free(flipdata);
+			goto error_undo;
 		}
+
+		emitted++;
 	}
 
-	drmModeRmFB(mode->fd, old_fb_id);
+	/* Will release old fb after all crtc's completed flip. */
+	flipdata->old_fb_id = old_fb_id;
 
 	return TRUE;
+
+error_undo:
+	drmModeRmFB(mode->fd, mode->fb_id);
+	mode->fb_id = old_fb_id;
+	return FALSE;
 }
 
 #ifdef HAVE_LIBUDEV
@@ -1347,6 +1406,42 @@ drmmode_uevent_fini(ScrnInfoPtr scrn)
 }
 
 static void
+drmmode_flip_handler(int fd, unsigned int frame, unsigned int tv_sec,
+		     unsigned int tv_usec, void *event_data)
+{
+	drmmode_flipevtcarrier_ptr flipcarrier = event_data;
+	drmmode_flipdata_ptr flipdata = flipcarrier->flipdata;
+	drmmode_ptr drmmode = flipdata->drmmode;
+
+	/* Is this the event whose info shall be delivered to higher level? */
+	if (flipcarrier->dispatch_me) {
+		/* Yes: Cache msc, ust for later delivery. */
+		flipdata->fe_frame = frame;
+		flipdata->fe_tv_sec = tv_sec;
+		flipdata->fe_tv_usec = tv_usec;
+	}
+	free(flipcarrier);
+
+	/* Last crtc completed flip? */
+	flipdata->flip_count--;
+	if (flipdata->flip_count > 0)
+		return;
+
+	/* Release framebuffer */
+	drmModeRmFB(drmmode->fd, flipdata->old_fb_id);
+
+	if (flipdata->event_data == NULL) {
+		free(flipdata);
+		return;
+	}
+
+	/* Deliver cached msc, ust from reference crtc to flip event handler */
+	nouveau_dri2_flip_event_handler(flipdata->fe_frame, flipdata->fe_tv_sec,
+					flipdata->fe_tv_usec, flipdata->event_data);
+	free(flipdata);
+}
+
+static void
 drmmode_wakeup_handler(pointer data, int err, pointer p)
 {
 	ScrnInfoPtr scrn = data;
@@ -1376,6 +1471,10 @@ drmmode_screen_init(ScreenPtr pScreen)
 	/* Plug in a vblank event handler */
 	drmmode->event_context.version = DRM_EVENT_CONTEXT_VERSION;
 	drmmode->event_context.vblank_handler = nouveau_dri2_vblank_handler;
+
+	/* Plug in a pageflip completion event handler */
+	drmmode->event_context.page_flip_handler = drmmode_flip_handler;
+
 	AddGeneralSocket(drmmode->fd);
 
 	/* Register a wakeup handler to get informed on DRM events */
diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 5b62425..acef08a 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -140,6 +140,7 @@ struct nouveau_dri2_vblank_state {
 	DRI2BufferPtr src;
 	DRI2SwapEventPtr func;
 	void *data;
+	unsigned int frame;
 };
 
 static Bool
@@ -225,6 +226,18 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 	REGION_INIT(0, &reg, (&(BoxRec){ 0, 0, draw->width, draw->height }), 0);
 	REGION_TRANSLATE(0, &reg, draw->x, draw->y);
 
+	/* Main crtc for this drawable shall finally deliver pageflip event. */
+	unsigned int ref_crtc_hw_id = nv_window_belongs_to_crtc(scrn, draw->x,
+								draw->y,
+								draw->width,
+								draw->height);
+
+	/* Whenever first crtc is involved, choose it as reference, as
+	 * its vblank event triggered this swap.
+	 */
+	if (ref_crtc_hw_id & 1)
+		ref_crtc_hw_id = 1;
+
 	/* Throttle on the previous frame before swapping */
 	nouveau_bo_map(dst_bo, NOUVEAU_BO_RD);
 	nouveau_bo_unmap(dst_bo);
@@ -249,7 +262,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 
 		if (DRI2CanFlip(draw)) {
 			type = DRI2_FLIP_COMPLETE;
-			ret = drmmode_page_flip(draw, src_pix, s);
+			ret = drmmode_page_flip(draw, src_pix, s, ref_crtc_hw_id);
 			if (!ret)
 				goto out;
 		}
@@ -258,6 +271,10 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		SWAP(nouveau_pixmap(dst_pix)->bo, nouveau_pixmap(src_pix)->bo);
 
 		DamageRegionProcessPending(draw);
+
+		/* If it is a page flip, finish it in the flip event handler. */
+		if (type == DRI2_FLIP_COMPLETE)
+			return;
 	} else {
 		type = DRI2_BLIT_COMPLETE;
 
@@ -292,7 +309,7 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 			   DRI2SwapEventPtr func, void *data)
 {
 	struct nouveau_dri2_vblank_state *s;
-	CARD64 current_msc;
+	CARD64 current_msc, expect_msc;
 	int ret;
 
 	/* Initialize a swap structure */
@@ -301,7 +318,7 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 		return FALSE;
 
 	*s = (struct nouveau_dri2_vblank_state)
-		{ SWAP, client, draw->id, dst, src, func, data };
+		{ SWAP, client, draw->id, dst, src, func, data, 0 };
 
 	if (can_sync_to_vblank(draw)) {
 		/* Get current sequence */
@@ -319,10 +336,10 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 		ret = nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
 					  DRM_VBLANK_EVENT,
 					  max(current_msc, *target_msc - 1),
-					  NULL, NULL, s);
+					  &expect_msc, NULL, s);
 		if (ret)
 			goto fail;
-
+		s->frame = (unsigned int) expect_msc & 0xffffffff;
 	} else {
 		/* We can't/don't want to sync to vblank, just swap. */
 		nouveau_dri2_finish_swap(draw, 0, 0, 0, s);
@@ -426,6 +443,68 @@ nouveau_dri2_vblank_handler(int fd, unsigned int frame,
 	}
 }
 
+void
+nouveau_dri2_flip_event_handler(unsigned int frame, unsigned int tv_sec,
+				unsigned int tv_usec, void *event_data)
+{
+	struct nouveau_dri2_vblank_state *flip = event_data;
+	DrawablePtr draw;
+	ScreenPtr screen;
+	ScrnInfoPtr scrn;
+	int status;
+	PixmapPtr pixmap;
+
+	status = dixLookupDrawable(&draw, flip->draw, serverClient,
+				   M_ANY, DixWriteAccess);
+	if (status != Success) {
+		free(flip);
+		return;
+	}
+
+	screen = draw->pScreen;
+	scrn = xf86Screens[screen->myNum];
+
+	pixmap = screen->GetScreenPixmap(screen);
+	xf86DrvMsgVerb(scrn->scrnIndex, X_INFO, 4,
+		       "%s: flipevent : width %d x height %d : msc %d : ust = %d.%06d\n",
+		       __func__, pixmap->drawable.width, pixmap->drawable.height,
+		       frame, tv_sec, tv_usec);
+
+	/* We assume our flips arrive in order, so we don't check the frame */
+	switch (flip->action) {
+	case SWAP:
+		/* Check for too small vblank count of pageflip completion,
+		 * taking wraparound into account. This usually means some
+		 * defective kms pageflip completion, causing wrong (msc, ust)
+		 * return values and possible visual corruption.
+		 * Skip test for frame == 0, as this is a valid constant value
+		 * reported by all Linux kernels at least up to Linux 3.0.
+		 */
+		if ((frame != 0) &&
+		    (frame < flip->frame) && (flip->frame - frame < 5)) {
+			xf86DrvMsg(scrn->scrnIndex, X_WARNING,
+				   "%s: Pageflip has impossible msc %d < target_msc %d\n",
+				   __func__, frame, flip->frame);
+			/* All-Zero values signal failure of (msc, ust)
+			 * timestamping to client.
+			 */
+			frame = tv_sec = tv_usec = 0;
+		}
+
+		DRI2SwapComplete(flip->client, draw, frame, tv_sec, tv_usec,
+				 DRI2_FLIP_COMPLETE, flip->func,
+				 flip->data);
+		break;
+	default:
+		xf86DrvMsg(scrn->scrnIndex, X_WARNING,
+			   "%s: unknown vblank event received\n", __func__);
+		/* Unknown type */
+		break;
+	}
+
+	free(flip);
+}
+
 Bool
 nouveau_dri2_init(ScreenPtr pScreen)
 {
diff --git a/src/nv_proto.h b/src/nv_proto.h
index 0b8e513..8bf2fc1 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -7,7 +7,8 @@ void drmmode_adjust_frame(ScrnInfoPtr pScrn, int x, int y, int flags);
 void drmmode_remove_fb(ScrnInfoPtr pScrn);
 Bool drmmode_cursor_init(ScreenPtr pScreen);
 void drmmode_fbcon_copy(ScreenPtr pScreen);
-Bool drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv);
+Bool drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv,
+		       unsigned int ref_crtc_hw_id);
 void drmmode_screen_init(ScreenPtr pScreen);
 void drmmode_screen_fini(ScreenPtr pScreen);
 
@@ -26,6 +27,8 @@ Bool nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height,
 void nouveau_dri2_vblank_handler(int fd, unsigned int frame,
 				 unsigned int tv_sec, unsigned int tv_usec,
 				 void *event_data);
+void nouveau_dri2_flip_event_handler(unsigned int frame, unsigned int tv_sec,
+				     unsigned int tv_usec, void *event_data);
 Bool nouveau_dri2_init(ScreenPtr pScreen);
 void nouveau_dri2_fini(ScreenPtr pScreen);
 
-- 
1.7.5.4
