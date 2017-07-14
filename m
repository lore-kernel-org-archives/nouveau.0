From: Mike Galbraith <efault@gmx.de>
Subject: Re: [regression drm/noveau] suspend to ram -> BOOM: exception RIP:
 drm_calc_vbltimestamp_from_scanoutpos+335
Date: Fri, 14 Jul 2017 17:11:57 +0200
Message-ID: <1500045117.5763.18.camel@gmx.de>
References: <1499794333.5315.8.camel@gmx.de>
         <CAKb7Uvgh-gj+4dHhDfptLD1Ggz5rwxsG3jBOqQ3h6yxV6_woqg@mail.gmail.com>
         <1499796510.5315.27.camel@gmx.de>
         <CAKb7UvgOOzVj=tygh4-BDRXGFUr2Y8U0pkV+-oYjy6EVYsQ+hg@mail.gmail.com>
         <1499853345.23742.8.camel@gmx.de> <1499858703.23742.25.camel@gmx.de>
         <CAKb7UvhMzbMKFMFP1UvbrTC0Un4F2u5_mv5VWrkizRxo_AbN4g@mail.gmail.com>
         <1500039368.5763.12.camel@gmx.de> <1500039693.5763.15.camel@gmx.de>
         <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6341f91f-1c56-2188-f55b-2f47d23262fc@mni.thm.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>, Ilia Mirkin <imirkin@alum.mit.edu>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Fri, 2017-07-14 at 17:05 +0200, Tobias Klausmann wrote:
> On 7/14/17 3:41 PM, Mike Galbraith wrote:
> > On Fri, 2017-07-14 at 15:36 +0200, Mike Galbraith wrote:
> >>   All DRM did was to slip a
> >> WARN_ON_ONCE() that nouveau triggers into a kernel module where such
> >> things no longer warn, they blow the box out of the water.
> > BTW, turn that irksome WARN_ON_ONCE() in drivers/gpu/drm/drm_vblank.c
> > into a WARN_ONCE(), and all is peachy, you get the warning, box lives.
> >
> > ---
> >   drivers/gpu/drm/drm_vblank.c |    3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -605,7 +605,8 @@ bool drm_calc_vbltimestamp_from_scanoutp
> >   	 */
> >   	if (mode->crtc_clock == 0) {
> >   		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
> > -		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
> > +		WARN_ONCE(drm_drv_uses_atomic_modeset(dev), "%s: report me.\n",
> > +			  dev->driver->name);
> >   
> >   		return false;
> >   	}
> 
> 
> Hey,
> 
> confirmed this helps saving the box, but we still have to find the root 
> cause! Backtrace with the above fix applied (and the one which came in 
> with the latest drm-fixes merge)!

Yeah, I'll be reporting some extra whining from my 8600 GT backup box.

	-Mike
