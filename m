From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 2/3] dri2: Update front buffer pixmap and name
	before exchanging buffers
Date: Fri,  2 Sep 2011 19:33:20 +0200
Message-ID: <1314984801-12029-3-git-send-email-mario.kleiner@tuebingen.mpg.de>
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

Buffer exchange assumes that the front buffer pixmap and name
information is accurate. That may not be the case eg. if the window
has been (un)redirected since the buffer was created.

This is a translation to nouveau of a fix that was originally developed
by Ville Syrjala <syrjala-ORSVBvAovxo@public.gmane.org> for the ati/radeon ddx to fix the
same bug there.

See thread at:

http://lists.x.org/archives/xorg-devel/2011-May/021908.html

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |   45 ++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 87eaf08..9f0ee97 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -140,6 +140,35 @@ struct nouveau_dri2_vblank_state {
 };
 
 static Bool
+update_front(DrawablePtr draw, DRI2BufferPtr front)
+{
+	int r;
+	PixmapPtr pixmap;
+	struct nouveau_dri2_buffer *nvbuf = nouveau_dri2_buffer(front);
+
+	if (draw->type == DRAWABLE_PIXMAP)
+		pixmap = (PixmapPtr)draw;
+	else
+		pixmap = (*draw->pScreen->GetWindowPixmap)((WindowPtr)draw);
+
+	pixmap->refcnt++;
+
+	exaMoveInPixmap(pixmap);
+	r = nouveau_bo_handle_get(nouveau_pixmap_bo(pixmap), &front->name);
+	if (r) {
+		(*draw->pScreen->DestroyPixmap)(pixmap);
+		return FALSE;
+	}
+
+	(*draw->pScreen->DestroyPixmap)(nvbuf->ppix);
+	front->pitch = pixmap->devKind;
+	front->cpp = pixmap->drawable.bitsPerPixel / 8;
+	nvbuf->ppix = pixmap;
+
+	return TRUE;
+}
+
+static Bool
 can_exchange(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix)
 {
 	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
@@ -212,13 +241,14 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 {
 	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
 	NVPtr pNv = NVPTR(scrn);
-	PixmapPtr dst_pix = nouveau_dri2_buffer(s->dst)->ppix;
+	PixmapPtr dst_pix;
 	PixmapPtr src_pix = nouveau_dri2_buffer(s->src)->ppix;
-	struct nouveau_bo *dst_bo = nouveau_pixmap_bo(dst_pix);
+	struct nouveau_bo *dst_bo;
 	struct nouveau_bo *src_bo = nouveau_pixmap_bo(src_pix);
 	struct nouveau_channel *chan = pNv->chan;
 	RegionRec reg;
 	int type, ret;
+	Bool front_updated;
 
 	REGION_INIT(0, &reg, (&(BoxRec){ 0, 0, draw->width, draw->height }), 0);
 	REGION_TRANSLATE(0, &reg, draw->x, draw->y);
@@ -235,6 +265,15 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 	if (ref_crtc_hw_id & 1)
 		ref_crtc_hw_id = 1;
 
+	/* Update frontbuffer pixmap and name: Could have changed due to
+	 * window (un)redirection as part of compositing.
+	 */
+	front_updated = update_front(draw, s->dst);
+
+	/* Assign frontbuffer pixmap, after update in update_front() */
+	dst_pix = nouveau_dri2_buffer(s->dst)->ppix;
+	dst_bo = nouveau_pixmap_bo(dst_pix);
+
 	/* Throttle on the previous frame before swapping */
 	nouveau_bo_map(dst_bo, NOUVEAU_BO_RD);
 	nouveau_bo_unmap(dst_bo);
@@ -253,7 +292,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		FIRE_RING(chan);
 	}
 
-	if (can_exchange(draw, dst_pix, src_pix)) {
+	if (front_updated && can_exchange(draw, dst_pix, src_pix)) {
 		type = DRI2_EXCHANGE_COMPLETE;
 		DamageRegionAppend(draw, &reg);
 
-- 
1.7.1
