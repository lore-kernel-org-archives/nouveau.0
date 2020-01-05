From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: remove set but unused variable.
Date: Mon, 6 Jan 2020 08:06:45 +1000
Message-ID: <CACAvsv5YEB0njcvFBhHWiCumuHroAqMm-T+fA8gJfsXijy+LVg@mail.gmail.com>
References: <20191231205607.1005-1-wambui.karugax@gmail.com> <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wambui Karuga <wambui.karugax@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, ML dri-devel <dri-devel@lists.freedesktop.org>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
List-Id: nouveau.vger.kernel.org

On Thu, 2 Jan 2020 at 04:48, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Dec 31, 2019 at 11:56:07PM +0300, Wambui Karuga wrote:
> > The local variable `pclks` is defined and set but not used and can
> > therefore be removed.
> > Issue found by coccinelle.
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> > index 362495535e69..f607a04d262d 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> > @@ -54,7 +54,7 @@ static void
> >  nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
> >  {
> >       int pagemiss, cas, width, bpp;
> > -     int nvclks, mclks, pclks, crtpagemiss;
> > +     int nvclks, mclks, crtpagemiss;
>
> Hm, reading the code (just from how stuff is named) I wonder whether the
> original idea was that the calculation for us_p should us pclks, not
> nvclks, but given that this code is as old as the initial nouveau merge
> probably not a good idea to touch it. Plus I guess not many with a vintage
> nv04 in working condition around to even test stuff ...
>
> Ben, what should we do here?
I looked at the original code from xf86-video-nv, and pclks is
similarly unused there also, so, I'd vote for just picking up this
patch.  I don't believe anyone has the knowledge+hw anymore to mess
with it in any other way.

Ben.

> -Daniel
>
> >       int found, mclk_extra, mclk_loop, cbs, m1, p1;
> >       int mclk_freq, pclk_freq, nvclk_freq;
> >       int us_m, us_n, us_p, crtc_drain_rate;
> > @@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
> >       bpp = arb->bpp;
> >       cbs = 128;
> >
> > -     pclks = 2;
> >       nvclks = 10;
> >       mclks = 13 + cas;
> >       mclk_extra = 3;
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
