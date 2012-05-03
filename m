From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau/dri2: don't try to page flip pixmaps
Date: Thu, 3 May 2012 18:46:48 +0200
Message-ID: <20120503164648.GA1761@joi.lan>
References: <20120503125016.GA8466@joi.lan>
 <87397hv20o.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87397hv20o.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michel =?utf-8?Q?D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, May 03, 2012 at 03:15:51PM +0200, Francisco Jerez wrote:
> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> 
> > Port of commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-ati.
> >
> > Fixes https://bugs.freedesktop.org/show_bug.cgi?id=49351
> >
> > (Additionally, don't try to pageflip if user disabled it in xorg.conf.
> > Currently this change is a no-op, because can_exchange returns true only when
> > page flipping is enabled, but commit 169512fbe91f0671a90dfee5e280357f0a4ef701 -
> > which changed can_exchange behavior - is due to be reverted)
> > ---
> >  src/nouveau_dri2.c |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> > index 588735f..3d8d22f 100644
> > --- a/src/nouveau_dri2.c
> > +++ b/src/nouveau_dri2.c
> > @@ -328,7 +328,8 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
> >  		type = DRI2_EXCHANGE_COMPLETE;
> >  		DamageRegionAppend(draw, &reg);
> >  
> > -		if (DRI2CanFlip(draw)) {
> > +		if (DRI2CanFlip(draw) && pNv->has_pageflip &&
> > +				draw->type == DRAWABLE_WINDOW) {
> 
> Hey,
> 
> How about 'if (nouveau_exa_pixmap_is_onscreen(dst_pix)) {...'?  We
> should really never get to that point unless we know for sure that we
> can either flip or exchange, so the 'has_pageflip' check is redundant.

I see your point, but it's all non obvious. How about this patch instead?
:)

---
From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dri2: don't try to page flip pixmaps

Based on commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-ati.

Fixes https://bugs.freedesktop.org/show_bug.cgi?id=49351
---
 src/nouveau_dri2.c |   31 ++++++++++++++++++++-----------
 1 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 588735f..86039ef 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -178,12 +178,14 @@ update_front(DrawablePtr draw, DRI2BufferPtr front)
 }
 
 static Bool
-can_exchange(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix)
+can_exchange_or_flip(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix,
+		Bool *flip)
 {
 	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
 	xf86CrtcConfigPtr xf86_config = XF86_CRTC_CONFIG_PTR(scrn);
 	NVPtr pNv = NVPTR(scrn);
 	int i;
+	Bool dst_is_screen;
 
 	for (i = 0; i < xf86_config->num_crtc; i++) {
 		xf86CrtcPtr crtc = xf86_config->crtc[i];
@@ -192,11 +194,17 @@ can_exchange(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix)
 
 	}
 
-	return ((DRI2CanFlip(draw) && pNv->has_pageflip)) &&
-		dst_pix->drawable.width == src_pix->drawable.width &&
-		dst_pix->drawable.height == src_pix->drawable.height &&
-		dst_pix->drawable.bitsPerPixel == src_pix->drawable.bitsPerPixel &&
-		dst_pix->devKind == src_pix->devKind;
+	if (dst_pix->drawable.width != src_pix->drawable.width ||
+			dst_pix->drawable.height != src_pix->drawable.height ||
+			dst_pix->drawable.bitsPerPixel != src_pix->drawable.bitsPerPixel ||
+			dst_pix->devKind != src_pix->devKind)
+		return FALSE;
+
+	dst_is_screen = nouveau_exa_pixmap_is_onscreen(dst_pix);
+	*flip = dst_is_screen && pNv->has_pageflip && DRI2CanFlip(draw);
+
+	/* Exchange path is currently disabled, see fdo bug 35930 */
+	return *flip /*|| !dst_is_screen*/;
 }
 
 static Bool
@@ -280,7 +288,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 	struct nouveau_pushbuf *push = pNv->pushbuf;
 	RegionRec reg;
 	int type, ret;
-	Bool front_updated;
+	Bool front_updated, flip;
 
 	REGION_INIT(0, &reg, (&(BoxRec){ 0, 0, draw->width, draw->height }), 0);
 	REGION_TRANSLATE(0, &reg, draw->x, draw->y);
@@ -324,17 +332,18 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		nouveau_pushbuf_kick(push, push->channel);
 	}
 
-	if (front_updated && can_exchange(draw, dst_pix, src_pix)) {
-		type = DRI2_EXCHANGE_COMPLETE;
+	if (front_updated && can_exchange_or_flip(draw, dst_pix, src_pix, &flip)) {
 		DamageRegionAppend(draw, &reg);
 
-		if (DRI2CanFlip(draw)) {
+		if (flip) {
 			type = DRI2_FLIP_COMPLETE;
 			ret = drmmode_page_flip(draw, src_pix,
 						violate_oml(draw) ? NULL : s,
 						ref_crtc_hw_id);
 			if (!ret)
 				goto out;
+		} else {
+			type = DRI2_EXCHANGE_COMPLETE;
 		}
 
 		SWAP(s->dst->name, s->src->name);
@@ -343,7 +352,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 		DamageRegionProcessPending(draw);
 
 		/* If it is a page flip, finish it in the flip event handler. */
-		if ((type == DRI2_FLIP_COMPLETE) && !violate_oml(draw))
+		if (flip && !violate_oml(draw))
 			return;
 	} else {
 		type = DRI2_BLIT_COMPLETE;
-- 
1.7.8.5
