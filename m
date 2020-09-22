From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
Date: Tue, 22 Sep 2020 17:14:48 -0400
Message-ID: <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
References: <20200922210510.156220-1-lyude@redhat.com>
         <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, 2020-09-22 at 17:10 -0400, Ilia Mirkin wrote:
> Can we use 6bpc on arbitrary DP monitors, or is there a capability for
> it? Maybe only use 6bpc if display_info.bpc == 6 and otherwise use 8?

I don't think that display_info.bpc actually implies a minimum bpc, only a
maximum bpc iirc (Ville would know the answer to this one). The other thing to
note here is that we want to assume the lowest possible bpc here since we're
only concerned if the mode passed to ->mode_valid can be set under -any-
conditions (including those that require lowering the bpc beyond it's maximum
value), so we definitely do want to always use 6bpc here even once we get
support for optimizing the bpc based on the available display bandwidth.
> 
> On Tue, Sep 22, 2020 at 5:06 PM Lyude Paul <lyude@redhat.com> wrote:
> > While I thought I had this correct (since it actually did reject modes
> > like I expected during testing), Ville Syrjala from Intel pointed out
> > that the logic here isn't correct. max_clock refers to the max symbol
> > rate supported by the encoder, so limiting clock to ds_clock using max()
> > doesn't make sense. Additionally, we want to check against 6bpc for the
> > time being since that's the minimum possible bpc here, not the reported
> > bpc from the connector. See:
> > 
> > https://lists.freedesktop.org/archives/dri-devel/2020-September/280276.html
> > 
> > For more info.
> > 
> > So, let's rewrite this using Ville's advice.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 409d38139b42 ("drm/nouveau/kms/nv50-: Use downstream DP clock
> > limits for mode validation")
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_dp.c | 23 +++++++++++++----------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c
> > b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > index 7b640e05bd4cd..24c81e423d349 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > @@ -231,23 +231,26 @@ nv50_dp_mode_valid(struct drm_connector *connector,
> >                    const struct drm_display_mode *mode,
> >                    unsigned *out_clock)
> >  {
> > -       const unsigned min_clock = 25000;
> > -       unsigned max_clock, ds_clock, clock;
> > +       const unsigned int min_clock = 25000;
> > +       unsigned int max_clock, ds_clock, clock;
> > +       const u8 bpp = 18; /* 6 bpc */
> >         enum drm_mode_status ret;
> > 
> >         if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp-
> > >caps.dp_interlace)
> >                 return MODE_NO_INTERLACE;
> > 
> >         max_clock = outp->dp.link_nr * outp->dp.link_bw;
> > -       ds_clock = drm_dp_downstream_max_dotclock(outp->dp.dpcd,
> > -                                                 outp-
> > >dp.downstream_ports);
> > -       if (ds_clock)
> > -               max_clock = min(max_clock, ds_clock);
> > -
> > -       clock = mode->clock * (connector->display_info.bpc * 3) / 10;
> > -       ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
> > -                                           &clock);
> > +       clock = mode->clock * bpp / 8;
> > +       if (clock > max_clock)
> > +               return MODE_CLOCK_HIGH;
> > +
> > +       ds_clock = drm_dp_downstream_max_dotclock(outp->dp.dpcd, outp-
> > >dp.downstream_ports);
> > +       if (ds_clock && mode->clock > ds_clock)
> > +               return MODE_CLOCK_HIGH;
> > +
> > +       ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
> > &clock);
> >         if (out_clock)
> >                 *out_clock = clock;
> > +
> >         return ret;
> >  }
> > --
> > 2.26.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat
