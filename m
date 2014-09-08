From: "Roy Spliet" <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: Re: [PATCH 1/8] nv50/display: Set VBLANK time in modeset
	script
Date: Mon, 08 Sep 2014 15:53:14 +0200
Message-ID: <cf8356f9fd24d4dd229b8ee98afecb8e@mail.eclipso.de>
References: <1409842735-7361-1-git-send-email-rspliet@eclipso.eu>
 <1409842735-7361-2-git-send-email-rspliet@eclipso.eu>
 <CACAvsv72CLtzY0_9d8KZq0COk8au_7kqsJbfFvin4r4WK2rvvw@mail.gmail.com>
Reply-To: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv72CLtzY0_9d8KZq0COk8au_7kqsJbfFvin4r4WK2rvvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hey Ben,

Thanks, I'll keep commit message formatting in mind. Did you also review the re-resend of the "clock/nva3: Pause the GPU before reclocking" patch I did earlier?
As for moving the code to the rest of the timing calculation: you have the final call of course, but it seemed to me the calculation is simply redundant for cards in the NVD0 class and upwards because the register it sets disappeared.
Cheers,

Roy

--- original message ---
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: 00:49:03 06-09-2014
To: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: Re: [PATCH 1/8] nv50/display: Set VBLANK time in modeset script

> On Fri, Sep 5, 2014 at 12:58 AM, Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> wrote:
>
> > Solves blinking on reclocking memory. The value set is an underestimate,
> but with non-reduced vblanking this should give us plenty of time
> Hey Roy,
>
> I've merged all (squashed the kepler change into the commit where it's
> needed too) except this patch, which needs to be rebased on top of
> 3.17-rc.  There's one minor nitpick inline too.
>
> Please also try and watch the wrapping of commit messages, I added
> newlines to make it easier to read them in git-log output.
>
> Thanks,
> Ben.
>
> >
> > Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nv50_display.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
>
> > index 4c534b7..cfa7ecf 100644
> > --- a/drivers/gpu/drm/nouveau/nv50_display.c
> > +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> > @@ -1070,7 +1070,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct
> drm_display_mode *umode,
> >         u32 vscan = (mode->flags & DRM_MODE_FLAG_DBLSCAN) ? 2
> : 1;
> >         u32 hactive, hsynce, hbackp, hfrontp, hblanke, hblanks;
> >         u32 vactive, vsynce, vbackp, vfrontp, vblanke, vblanks;
> > -       u32 vblan2e = 0, vblan2s = 1;
> > +       u32 vblan2e = 0, vblan2s = 1, vblankus;
> >         u32 *push;
> >         int ret;
> >
> > @@ -1087,6 +1087,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct
> drm_display_mode *umode,
> >         vblanke = vsynce + vbackp;
> >         vfrontp = (mode->vsync_start - mode->vdisplay) * vscan
> / ilace;
> >         vblanks = vactive - vfrontp - 1;
> > +
> >         if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
> >                 vblan2e = vactive + vsynce + vbackp;
> >                 vblan2s = vblan2e + (mode->vdisplay * vscan / ilace);
>
> > @@ -1100,17 +1101,22 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct
> drm_display_mode *umode,
> >         push = evo_wait(mast, 64);
> >         if (push) {
> >                 if (nv50_vers(mast) < NVD0_DISP_MAST_CLASS) {
> > +                       /* XXX: Safe underestimate, even "0"
> works */
> > +                       vblankus = (vactive - mode->vdisplay - 2)
> * hactive;
> > +                       vblankus *= 1000;
> > +                       vblankus /= mode->clock;
> When you rebase, can you move this calculation into the common code please
> :)
>
> > +
> >                         evo_mthd(push, 0x0804 + (nv_crtc->index *
> 0x400), 2);
> >                         evo_data(push, 0x00800000 | mode->clock);
>
> >                         evo_data(push, (ilace == 2) ? 2 : 0);
> > -                       evo_mthd(push, 0x0810 + (nv_crtc->index *
> 0x400), 6);
> > +                       evo_mthd(push, 0x0810 + (nv_crtc->index *
> 0x400), 8);
> >                         evo_data(push, 0x00000000);
> >                         evo_data(push, (vactive << 16) | hactive);
>
> >                         evo_data(push, ( vsynce << 16) | hsynce);
>
> >                         evo_data(push, (vblanke << 16) | hblanke);
>
> >                         evo_data(push, (vblanks << 16) | hblanks);
>
> >                         evo_data(push, (vblan2e << 16) | vblan2s);
>
> > -                       evo_mthd(push, 0x082c + (nv_crtc->index *
> 0x400), 1);
> > +                       evo_data(push, vblankus);
> >                         evo_data(push, 0x00000000);
> >                         evo_mthd(push, 0x0900 + (nv_crtc->index *
> 0x400), 2);
> >                         evo_data(push, 0x00000311);
> > --
> > 1.9.3
> >
> >
> >
>
