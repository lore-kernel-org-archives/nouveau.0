From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
Date: Fri, 25 Sep 2020 18:08:06 -0400
Message-ID: <8bd8ee03f88e7e674e0ea8c6d63d783777cfe414.camel@redhat.com>
References: <20200922210510.156220-1-lyude@redhat.com>
         <CAKb7UvhAb0wFd9Qi1FGJ=TAYZJ9DYXL6XXMfnG49xEO=a9TuYg@mail.gmail.com>
         <7b10668ee337e531b14705ebecb1f6c1004728d6.camel@redhat.com>
         <CAKb7Uvj++15aEXiLGgSZb37wwzDSRCetVT+trP6JNwhk8n-whA@mail.gmail.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKb7Uvj++15aEXiLGgSZb37wwzDSRCetVT+trP6JNwhk8n-whA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, 2020-09-22 at 17:22 -0400, Ilia Mirkin wrote:
> On Tue, Sep 22, 2020 at 5:14 PM Lyude Paul <lyude@redhat.com> wrote:
> > On Tue, 2020-09-22 at 17:10 -0400, Ilia Mirkin wrote:
> > > Can we use 6bpc on arbitrary DP monitors, or is there a capability for
> > > it? Maybe only use 6bpc if display_info.bpc == 6 and otherwise use 8?
> > 
> > I don't think that display_info.bpc actually implies a minimum bpc, only a
> > maximum bpc iirc (Ville would know the answer to this one). The other thing
> > to
> > note here is that we want to assume the lowest possible bpc here since we're
> > only concerned if the mode passed to ->mode_valid can be set under -any-
> > conditions (including those that require lowering the bpc beyond it's
> > maximum
> > value), so we definitely do want to always use 6bpc here even once we get
> > support for optimizing the bpc based on the available display bandwidth.
> 
> Yeah, display_info is the max bpc. But would an average monitor
> support 6bpc? And if it does, does the current link training code even
> try that when display_info.bpc != 6?

So I did confirm that 6bpc support is mandatory for DP, so yes-6 bpc will always
work.

But also, your second comment doesn't really apply here. So: to be clear, we're
not really concerned here about whether nouveau will actually use 6bpc or not. 
In truth I'm not actually sure either if we have any code that uses 6bpc (iirc
we don't), since we don't current optimize bpc. I think it's very possible for
us to use 6bpc for eDP displays if I recall though, but I'm not sure on that.

But that's also not the point of this code. ->mode_valid() is only used in two
situations in DRM modesetting: when probing connector modes, and when checking
if a mode is valid or not during the atomic check for atomic modesetting. Its
purpose is only to reject display modes that are physically impossible to set in
hardware due to static hardware constraints. Put another way, we only check the
given mode against constraints which will always remain constant regardless of
the rest of the display state. An example of a static constraint would be the
max pixel clock supported by the hardware, since on sensible hardware this never
changes. A dynamic constraint would be something like how much bandwidth is
currently unused on an MST topology, since that value is entirely dependent on
the rest of the display state.

So - with that said, bpc is technically a dynamic constraint because while a
sink and source both likely have their own bpc limits, any bpc which is equal or
below that limit can be used depending on what the driver decides - which will
be based on the max_bpc property, and additionally for MST displays it will also
depend on the available bandwidth on the topology. The only non-dynamic thing
about bpc is that at a minimum, it will be 6 - so any mode that doesn't fit on
the link with a bpc of 6 is guaranteed to be a mode that we'll never be able to
set and therefore want to prune.

So, even if we're not using 6 in the majority of situations, I'm fairly
confident it's the right value here. It's also what i915 does as well (and they
previously had to fix a bug that was the result of assuming a minimum of 8bpc
instead of 6).

> 
>   -ilia
> 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat
