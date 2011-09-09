From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3] dri2: Implement handling of pageflip
	completion events.
Date: Fri, 09 Sep 2011 23:05:57 +0200
Message-ID: <8762l1toi2.fsf@riseup.net>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1314984801-12029-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<871uvsvund.fsf@riseup.net>
	<F6AA723B-2F62-4FD7-8D1D-2A08BAEDFF51@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0363908455=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <F6AA723B-2F62-4FD7-8D1D-2A08BAEDFF51-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> (Mario
	Kleiner's message of "Thu, 8 Sep 2011 20:06:24 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0363908455==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:

> On Sep 8, 2011, at 12:45 AM, Francisco Jerez wrote:
>
>> Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:
>>
>>> Requests pageflip completion events from the kernel.
>>> Implements pageflip completion handler to finalize
>>> and timestamp swaps.
>>>
>>> Completion handler includes a consistency check, and
>>> disambiguation if multiple crtc's are involved in a
>>> pageflip (e.g., clone mode, extendend desktop). Only
>>> the timestamp of the crtc whose vblank event initially
>>> triggered the swap is used, but handler waits for flip
>>> completion on all involved crtc's before completing the
>>> swap and releasing the old framebuffer.
>>>
>>> This code is almost identical to the code used in the
>>> ati/radeon ddx and intel ddx.
>>>
>> There's a good reason that I held myself back from doing this when I
>> wrote the rest of the SwapBuffers stuff; right now the X server
>> assumes
>> that the DDX can't handle more than one SwapBuffers request in
>> flight at
>> any given time, so, after a SwapBuffers request has been received, the
>> client is prevented from doing anything until the swap (and,
>> consequently, the whole rendering of the previous frame) has been
>> completed, that means that the client is forced to render each frame
>> in
>> lock-step, and it leads to a considerable performance loss.
>>
>> In my judgment it seemed quite dumb to wire up all the page-flipping
>> infrastructure together, only to notice that it was slowing things
>> down
>> even further (since performance was the main point I had for
>> it...). As
>> the ability to report accurate swap completion events seemed to be of
>> comparatively limited usefulness, I made the DDX pretend the buffers
>> are
>> swapped one frame before they actually are as a temporary workaround
>> (see the comment at the end of nouveau_dri2_finish_swap()).
>>
>
> Hi, thanks for the comments.

Thank you for looking into this :)
>
> I see your point, but at least as a starting point for the first
> iteration i don't think the current dri2 implementation of pageflips
> was a dumb decision.
>
> It is the same default "double buffer" behaviour that the binary
> drivers on Linux and also on other os'es (OS/X and Windows) expose.

Not the nvidia one, last time I checked.

> As a default i think it makes sense if an application wants tight
> control over presentation timing or - in the case of games - wants to
> prevent irritating lag between user input and visual updates -- limit
> the number of frames that the game can prerender.
>
> On the intel and ati gpu's, purely double-buffered pageflipping is
> already a win for conserving memory bandwidth and because you avoid
> blocking the single command fifo for multiple rendering clients, as
> you have to if you use vsync'ed copy-blits to avoid tearing. This may
> be less of a win on nvidia because they have multiple fifo's or some
> independent dma engines if i understand correctly?

Yeah, but right now the sync-to-vblank is pushed through the main X
server channel, which means it stalls all X rendering until the next
vblank - that could be fixed though, by extending the kernel interface
to make it end up in the right channel, but I haven't found the
motivation to do it so far because it hasn't proved to be a big problem
in practice.

>
> Anyway, it's better for performance if clients can queue up multiple
> rendered frames for other non-interactive use cases, e.g., benchmarks
> or graphics demos. Or if client apps can decide themselves about
> presentation timing. That was the point of support for the
> oml_sync_control and intel_swap_events extensions and all the
> timestamping.
>
> My specific use case for this patchset is a popular free software
> toolkit (http://www.psychtoolbox.org) used by neuro-scientists and
> brain scientists in general for audio & visual stimulus presentation,
> i/o etc. . Nouveau in its current state, at least on the cards i
> tested, would be already a very suitable solution for doing this on
> linux+nvidia.
>
> The only missing "must-have" feature for such applications are very
> reliable and accurate presentation timestamps. Having those puts
> nouveau ahead of the binary blob for such apps. The workloads are
> usually not as demanding as current games and an occassional skipped
> frame is tolerable, but frequently getting wrong/misleading
> timestamps of when a frame was presented would be a total show-=20
> stopper. Currently i have to blacklist nouveau in my toolkit just for
> that reason.
>
>> So, IMHO, this change depends on the X server N-buffering changes
>> going
>> in - actually the DRI2SwapLimit() API that (IIRC) Pauli Nieminen
>> proposed some time ago was all we needed, but it hasn't been accepted
>> upstream for some reason.
>>
>
> I was involved in that discussion at the time, iirc. I think having
> the DRI2SwapLimit() API would make a lot of sense as a first step and
> that those patches just got dropped due to maintainer-overload, not
> really too much for technical reasons. To do multi-buffering
> correctly, as specified by the oml_sync_control spec, a bit more than
> Paul's API for setting the swap_limit would be needed, either on the
> ddx driver level or in the x-server itself, e.g., to make sure the
> ordering of glXSwapBuffersMscOML() swaps is correct, no more than one
> swap gets executed per video refresh and to satisfy the divisor/
> remainder constraints correctly if they are used by a client.

At least in nouveau's case, all of these problems are either already
solved or already present (even if you force it to do double-buffering),
and multi-buffering doesn't change the nature of the problem for us in
any way.

With the current implementation (and IIRC it's the same on both radeon
and intel) the divisor/remainder relation is ignored in the case where
the gpu is too busy to finish its rendering in time for the predicted
MSC; the flip is carried out as soon as the GPU finishes, possibly a few
vblank periods later.

To fix this properly in nouveau, I think it would be good to push the
divisor/remainder calculation down to the kernel (second reason so far
to extend the kernel interface), but once it's done we'll get the
divisor/remainder relation right no matter if multibuffering is being
used or not.

> Special cases which are not important for typical games or benchmarks
> but important for toolkits with precise timing needs. I actually
> wanted to work on that, but didn't get around to do it so far. First
> i'd like to have nouveau at the same level of timing functionality as
> ati and intel.
>
> Could we have an optional nouveau-ddx xorg.conf parameter to select
> between the current codepath and the "lower-performance but correct
> timestamping" path implemented in these patches? Something like
> "EnableTriplebuffering" or "Swaplimit" or
> "MaxNumberPrerenderedFrames"?

IMHO getting a small (and required) fix (the swaplimit API) into one
software component is more advisable from the maintainership standpoint
than putting in place two different codepaths in another software
component, both of which are broken in its own way.

> I think having such a setting would make sense anyway, even if Paul's
> API is implemented, exactly to control things like max number of
> prerendered frames for games and apps which only use glXSwapBuffers()
> but should have some control over input lag.
>
> The latest intel ddx seems to do the same with a "Triplebuffering"
> setting.
>
> The setting could default to your current performance
> implementation. The path in the new patches would get pretty frequent
> exercise &  testing by myself and currently a couple of hundred happy
> neuro-=20
> scientists.
>
> thanks,
> -mario
>
>>> Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
>>> ---
>>>  src/drmmode_display.c |  105 +++++++++++++++++++++++++++++++++++++
>>> ++++++++++--
>>>  src/nouveau_dri2.c    |   89 +++++++++++++++++++++++++++++++++++++
>>> ++--
>>>  src/nv_proto.h        |    5 ++-
>>>  3 files changed, 189 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
>>> index 3afef66..bcb2a94 100644
>>> --- a/src/drmmode_display.c
>>> +++ b/src/drmmode_display.c
>>> @@ -83,6 +83,21 @@ typedef struct {
>>>      drmmode_prop_ptr props;
>>>  } drmmode_output_private_rec, *drmmode_output_private_ptr;
>>>
>>> +typedef struct {
>>> +    drmmode_ptr drmmode;
>>> +    unsigned old_fb_id;
>>> +    int flip_count;
>>> +    void *event_data;
>>> +    unsigned int fe_frame;
>>> +    unsigned int fe_tv_sec;
>>> +    unsigned int fe_tv_usec;
>>> +} drmmode_flipdata_rec, *drmmode_flipdata_ptr;
>>> +
>>> +typedef struct {
>>> +    drmmode_flipdata_ptr flipdata;
>>> +    Bool dispatch_me;
>>> +} drmmode_flipevtcarrier_rec, *drmmode_flipevtcarrier_ptr;
>>> +
>>>  static void drmmode_output_dpms(xf86OutputPtr output, int mode);
>>>
>>>  static drmmode_ptr
>>> @@ -1246,13 +1261,17 @@ drmmode_cursor_init(ScreenPtr pScreen)
>>>  }
>>>
>>>  Bool
>>> -drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv)
>>> +drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv,
>>> +		  unsigned int ref_crtc_hw_id)
>>>  {
>>>  	ScrnInfoPtr scrn =3D xf86Screens[draw->pScreen->myNum];
>>>  	xf86CrtcConfigPtr config =3D XF86_CRTC_CONFIG_PTR(scrn);
>>>  	drmmode_crtc_private_ptr crtc =3D config->crtc[0]->driver_private;
>>>  	drmmode_ptr mode =3D crtc->drmmode;
>>>  	int ret, i, old_fb_id;
>>> +	int emitted =3D 0;
>>> +	drmmode_flipdata_ptr flipdata;
>>> +	drmmode_flipevtcarrier_ptr flipcarrier;
>>>
>>>  	old_fb_id =3D mode->fb_id;
>>>  	ret =3D drmModeAddFB(mode->fd, scrn->virtualX, scrn->virtualY,
>>> @@ -1265,24 +1284,64 @@ drmmode_page_flip(DrawablePtr draw,
>>> PixmapPtr back, void *priv)
>>>  		return FALSE;
>>>  	}
>>>
>>> +	flipdata =3D calloc(1, sizeof(drmmode_flipdata_rec));
>>> +	if (!flipdata) {
>>> +		xf86DrvMsg(scrn->scrnIndex, X_WARNING,
>>> +		"flip queue: data alloc failed.\n");
>>> +		goto error_undo;
>>> +	}
>>> +
>>> +	flipdata->event_data =3D priv;
>>> +	flipdata->drmmode =3D mode;
>>> +
>>>  	for (i =3D 0; i < config->num_crtc; i++) {
>>>  		crtc =3D config->crtc[i]->driver_private;
>>>
>>>  		if (!config->crtc[i]->enabled)
>>>  			continue;
>>>
>>> +		flipdata->flip_count++;
>>> +
>>> +		flipcarrier =3D calloc(1, sizeof(drmmode_flipevtcarrier_rec));
>>> +		if (!flipcarrier) {
>>> +			xf86DrvMsg(scrn->scrnIndex, X_WARNING,
>>> +				   "flip queue: carrier alloc failed.\n");
>>> +			if (emitted =3D=3D 0)
>>> +				free(flipdata);
>>> +			goto error_undo;
>>> +		}
>>> +
>>> +		/* Only the reference crtc will finally deliver its page flip
>>> +		 * completion event. All other crtc's events will be discarded.
>>> +		 */
>>> +		flipcarrier->dispatch_me =3D ((1 << i) =3D=3D ref_crtc_hw_id);
>>> +		flipcarrier->flipdata =3D flipdata;
>>> +
>>>  		ret =3D drmModePageFlip(mode->fd, crtc->mode_crtc->crtc_id,
>>> -				      mode->fb_id, 0, priv);
>>> +				      mode->fb_id, DRM_MODE_PAGE_FLIP_EVENT,
>>> +				      flipcarrier);
>>>  		if (ret) {
>>>  			xf86DrvMsg(scrn->scrnIndex, X_WARNING,
>>>  				   "flip queue failed: %s\n", strerror(errno));
>>> -			return FALSE;
>>> +
>>> +			free(flipcarrier);
>>> +			if (emitted =3D=3D 0)
>>> +				free(flipdata);
>>> +			goto error_undo;
>>>  		}
>>> +
>>> +		emitted++;
>>>  	}
>>>
>>> -	drmModeRmFB(mode->fd, old_fb_id);
>>> +	/* Will release old fb after all crtc's completed flip. */
>>> +	flipdata->old_fb_id =3D old_fb_id;
>>>
>>>  	return TRUE;
>>> +
>>> +error_undo:
>>> +	drmModeRmFB(mode->fd, mode->fb_id);
>>> +	mode->fb_id =3D old_fb_id;
>>> +	return FALSE;
>>>  }
>>>
>>>  #ifdef HAVE_LIBUDEV
>>> @@ -1348,6 +1407,40 @@ drmmode_uevent_fini(ScrnInfoPtr scrn)
>>>  }
>>>
>>>  static void
>>> +drmmode_flip_handler(int fd, unsigned int frame, unsigned int
>>> tv_sec,
>>> +		     unsigned int tv_usec, void *event_data)
>>> +{
>>> +	drmmode_flipevtcarrier_ptr flipcarrier =3D event_data;
>>> +	drmmode_flipdata_ptr flipdata =3D flipcarrier->flipdata;
>>> +	drmmode_ptr drmmode =3D flipdata->drmmode;
>>> +
>>> +	/* Is this the event whose info shall be delivered to higher
>>> level? */
>>> +	if (flipcarrier->dispatch_me) {
>>> +		/* Yes: Cache msc, ust for later delivery. */
>>> +		flipdata->fe_frame =3D frame;
>>> +		flipdata->fe_tv_sec =3D tv_sec;
>>> +		flipdata->fe_tv_usec =3D tv_usec;
>>> +	}
>>> +	free(flipcarrier);
>>> +
>>> +	/* Last crtc completed flip? */
>>> +	flipdata->flip_count--;
>>> +	if (flipdata->flip_count > 0)
>>> +		return;
>>> +
>>> +	/* Release framebuffer */
>>> +	drmModeRmFB(drmmode->fd, flipdata->old_fb_id);
>>> +
>>> +	if (flipdata->event_data =3D=3D NULL)
>>> +		return;
>>> +
>>> +	/* Deliver cached msc, ust from reference crtc to flip event
>>> handler */
>>> +	nouveau_dri2_flip_event_handler(flipdata->fe_frame, flipdata-
>>> >fe_tv_sec,
>>> +					flipdata->fe_tv_usec, flipdata->event_data);
>>> +	free(flipdata);
>>> +}
>>> +
>>> +static void
>>>  drmmode_wakeup_handler(pointer data, int err, pointer p)
>>>  {
>>>  	ScrnInfoPtr scrn =3D data;
>>> @@ -1377,6 +1470,10 @@ drmmode_screen_init(ScreenPtr pScreen)
>>>  	/* Plug in a vblank event handler */
>>>  	drmmode->event_context.version =3D DRM_EVENT_CONTEXT_VERSION;
>>>  	drmmode->event_context.vblank_handler =3D
>>> nouveau_dri2_vblank_handler;
>>> +
>>> +	/* Plug in a pageflip completion event handler */
>>> +	drmmode->event_context.page_flip_handler =3D drmmode_flip_handler;
>>> +
>>>  	AddGeneralSocket(drmmode->fd);
>>>
>>>  	/* Register a wakeup handler to get informed on DRM events */
>>> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
>>> index 1a68ed3..87eaf08 100644
>>> --- a/src/nouveau_dri2.c
>>> +++ b/src/nouveau_dri2.c
>>> @@ -136,6 +136,7 @@ struct nouveau_dri2_vblank_state {
>>>  	DRI2BufferPtr src;
>>>  	DRI2SwapEventPtr func;
>>>  	void *data;
>>> +	unsigned int frame;
>>>  };
>>>
>>>  static Bool
>>> @@ -222,6 +223,18 @@ nouveau_dri2_finish_swap(DrawablePtr draw,
>>> unsigned int frame,
>>>  	REGION_INIT(0, &reg, (&(BoxRec){ 0, 0, draw->width, draw-
>>> >height }), 0);
>>>  	REGION_TRANSLATE(0, &reg, draw->x, draw->y);
>>>
>>> +	/* Main crtc for this drawable shall finally deliver pageflip
>>> event. */
>>> +	unsigned int ref_crtc_hw_id =3D nv_window_belongs_to_crtc(scrn,
>>> draw->x,
>>> +								draw->y,
>>> +								draw->width,
>>> +								draw->height);
>>> +
>>> +	/* Whenever first crtc is involved, choose it as reference, as
>>> +	 * its vblank event triggered this swap.
>>> +	 */
>>> +	if (ref_crtc_hw_id & 1)
>>> +		ref_crtc_hw_id =3D 1;
>>> +
>>>  	/* Throttle on the previous frame before swapping */
>>>  	nouveau_bo_map(dst_bo, NOUVEAU_BO_RD);
>>>  	nouveau_bo_unmap(dst_bo);
>>> @@ -246,7 +259,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw,
>>> unsigned int frame,
>>>
>>>  		if (DRI2CanFlip(draw)) {
>>>  			type =3D DRI2_FLIP_COMPLETE;
>>> -			ret =3D drmmode_page_flip(draw, src_pix, s);
>>> +			ret =3D drmmode_page_flip(draw, src_pix, s, ref_crtc_hw_id);
>>>  			if (!ret)
>>>  				goto out;
>>>  		}
>>> @@ -255,6 +268,10 @@ nouveau_dri2_finish_swap(DrawablePtr draw,
>>> unsigned int frame,
>>>  		SWAP(nouveau_pixmap(dst_pix)->bo, nouveau_pixmap(src_pix)->bo);
>>>
>>>  		DamageRegionProcessPending(draw);
>>> +
>>> +		/* If it is a page flip, finish it in the flip event handler. */
>>> +		if (type =3D=3D DRI2_FLIP_COMPLETE)
>>> +			return;
>>>  	} else {
>>>  		type =3D DRI2_BLIT_COMPLETE;
>>>
>>> @@ -289,7 +306,7 @@ nouveau_dri2_schedule_swap(ClientPtr client,
>>> DrawablePtr draw,
>>>  			   DRI2SwapEventPtr func, void *data)
>>>  {
>>>  	struct nouveau_dri2_vblank_state *s;
>>> -	CARD64 current_msc;
>>> +	CARD64 current_msc, expect_msc;
>>>  	int ret;
>>>
>>>  	/* Initialize a swap structure */
>>> @@ -298,7 +315,7 @@ nouveau_dri2_schedule_swap(ClientPtr client,
>>> DrawablePtr draw,
>>>  		return FALSE;
>>>
>>>  	*s =3D (struct nouveau_dri2_vblank_state)
>>> -		{ SWAP, client, draw->id, dst, src, func, data };
>>> +		{ SWAP, client, draw->id, dst, src, func, data, 0 };
>>>
>>>  	if (can_sync_to_vblank(draw)) {
>>>  		/* Get current sequence */
>>> @@ -316,10 +333,10 @@ nouveau_dri2_schedule_swap(ClientPtr client,
>>> DrawablePtr draw,
>>>  		ret =3D nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
>>>  					  DRM_VBLANK_EVENT,
>>>  					  max(current_msc, *target_msc - 1),
>>> -					  NULL, NULL, s);
>>> +					  &expect_msc, NULL, s);
>>>  		if (ret)
>>>  			goto fail;
>>> -
>>> +		s->frame =3D (unsigned int) expect_msc & 0xffffffff;
>>>  	} else {
>>>  		/* We can't/don't want to sync to vblank, just swap. */
>>>  		nouveau_dri2_finish_swap(draw, 0, 0, 0, s);
>>> @@ -423,6 +440,68 @@ nouveau_dri2_vblank_handler(int fd, unsigned
>>> int frame,
>>>  	}
>>>  }
>>>
>>> +void
>>> +nouveau_dri2_flip_event_handler(unsigned int frame, unsigned int
>>> tv_sec,
>>> +				unsigned int tv_usec, void *event_data)
>>> +{
>>> +	struct nouveau_dri2_vblank_state *flip =3D event_data;
>>> +	DrawablePtr draw;
>>> +	ScreenPtr screen;
>>> +	ScrnInfoPtr scrn;
>>> +	int status;
>>> +	PixmapPtr pixmap;
>>> +
>>> +	status =3D dixLookupDrawable(&draw, flip->draw, serverClient,
>>> +				   M_ANY, DixWriteAccess);
>>> +	if (status !=3D Success) {
>>> +		free(flip);
>>> +		return;
>>> +	}
>>> +
>>> +	screen =3D draw->pScreen;
>>> +	scrn =3D xf86Screens[screen->myNum];
>>> +
>>> +	pixmap =3D screen->GetScreenPixmap(screen);
>>> +	xf86DrvMsg(scrn->scrnIndex, X_INFO,
>>> +		   "%s:%d fevent[%p] width %d pitch %d (/4 %d)\n",
>>> +		   __func__, __LINE__, flip, pixmap->drawable.width,
>>> +		   pixmap->devKind, pixmap->devKind/4);
>>> +
>>> +	/* We assume our flips arrive in order, so we don't check the
>>> frame */
>>> +	switch (flip->action) {
>>> +	case SWAP:
>>> +		/* Check for too small vblank count of pageflip completion,
>>> +		 * taking wraparound into account. This usually means some
>>> +		 * defective kms pageflip completion, causing wrong (msc, ust)
>>> +		 * return values and possible visual corruption.
>>> +		 * Skip test for frame =3D=3D 0, as this is a valid constant value
>>> +		 * reported by all Linux kernels at least up to Linux 3.0.
>>> +		 */
>>> +		if ((frame !=3D 0) &&
>>> +		    (frame < flip->frame) && (flip->frame - frame < 5)) {
>>> +			xf86DrvMsg(scrn->scrnIndex, X_WARNING,
>>> +				   "%s: Pageflip has impossible msc %d < target_msc %d\n",
>>> +				   __func__, frame, flip->frame);
>>> +			/* All-Zero values signal failure of (msc, ust)
>>> +			 * timestamping to client.
>>> +			 */
>>> +			frame =3D tv_sec =3D tv_usec =3D 0;
>>> +		}
>>> +
>>> +		DRI2SwapComplete(flip->client, draw, frame, tv_sec, tv_usec,
>>> +				 DRI2_FLIP_COMPLETE, flip->func,
>>> +				 flip->data);
>>> +		break;
>>> +	default:
>>> +		xf86DrvMsg(scrn->scrnIndex, X_WARNING,
>>> +			   "%s: unknown vblank event received\n", __func__);
>>> +		/* Unknown type */
>>> +		break;
>>> +	}
>>> +
>>> +	free(flip);
>>> +}
>>> +
>>>  Bool
>>>  nouveau_dri2_init(ScreenPtr pScreen)
>>>  {
>>> diff --git a/src/nv_proto.h b/src/nv_proto.h
>>> index 2e4fce0..2bd2ac7 100644
>>> --- a/src/nv_proto.h
>>> +++ b/src/nv_proto.h
>>> @@ -7,7 +7,8 @@ void drmmode_adjust_frame(ScrnInfoPtr pScrn, int x,
>>> int y, int flags);
>>>  void drmmode_remove_fb(ScrnInfoPtr pScrn);
>>>  Bool drmmode_cursor_init(ScreenPtr pScreen);
>>>  void drmmode_fbcon_copy(ScreenPtr pScreen);
>>> -Bool drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void
>>> *priv);
>>> +Bool drmmode_page_flip(DrawablePtr draw, PixmapPtr back, void *priv,
>>> +		       unsigned int ref_crtc_hw_id);
>>>  void drmmode_screen_init(ScreenPtr pScreen);
>>>  void drmmode_screen_fini(ScreenPtr pScreen);
>>>
>>> @@ -26,6 +27,8 @@ Bool nouveau_allocate_surface(ScrnInfoPtr scrn,
>>> int width, int height,
>>>  void nouveau_dri2_vblank_handler(int fd, unsigned int frame,
>>>  				 unsigned int tv_sec, unsigned int tv_usec,
>>>  				 void *event_data);
>>> +void nouveau_dri2_flip_event_handler(unsigned int frame, unsigned
>>> int tv_sec,
>>> +				     unsigned int tv_usec, void *event_data);
>>>  Bool nouveau_dri2_init(ScreenPtr pScreen);
>>>  void nouveau_dri2_fini(ScreenPtr pScreen);
>
> *********************************************************************
> Mario Kleiner
> Max Planck Institute for Biological Cybernetics
> Spemannstr. 38
> 72076 Tuebingen
> Germany
>
> e-mail: mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
> office: +49 (0)7071/601-1623
> fax:    +49 (0)7071/601-616
> www:    http://www.kyb.tuebingen.mpg.de/~kleinerm
> *********************************************************************
> "For a successful technology, reality must take precedence
> over public relations, for Nature cannot be fooled."
> (Richard Feynman)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk5qf7UACgkQg5k4nX1Sv1vafQD/V3KCs6Rl8Drbf0s/jvtLbxXI
uJGmsINBfEqb1yWbA1YA/ArgI6t8QaqaSQr9g7ydFgC5DMFRzykLbR496myz9CHA
=L9sW
-----END PGP SIGNATURE-----
--==-=-=--

--===============0363908455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0363908455==--
