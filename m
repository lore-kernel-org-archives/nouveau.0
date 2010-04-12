From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] fbmem: fix aperture overlapping check
Date: Mon, 12 Apr 2010 13:34:38 +0200
Message-ID: <20100412113438.GB2789@joi.lan>
References: <1270929334-3742-1-git-send-email-marcin.slusarz@gmail.com>
	<1271030068.3554.1.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1271030068.3554.1.camel@localhost>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Peter Jones <pjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Apr 12, 2010 at 09:54:28AM +1000, Dave Airlie wrote:
> On Sat, 2010-04-10 at 21:55 +0200, marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > fb_do_apertures_overlap is returning wrong value when one aperture
> > is completely whithin the other. Add generic ranges_overlap macro
> > (probably kernel.h candidate) and use it here.
> > 
> 
> That doesn't seem right.
> 
> The rules are:
> 
> the generic aperture has to be equal or smaller than the hw aperture,
> otherwise the generic driver will be trashing random hw pieces on the
> machine.

Why "it has to"? Why generic aperture can't start one byte before hw?

> So with that in mind, the check makes sure the generic aperture starts
> somewhere inside the hw aperture, which the test clearly gets right.

So your only objection is that it's impossible with the current code?

> Have you got a pointer to a machine where it fails?

No, it failed with an artifical test while I was working on vga16fb handoff
(unfinished).

> Dave.
> 
> 
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Cc: Peter Jones <pjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> > ---
> >  drivers/video/fbmem.c |   24 +++++++++++++++++-------
> >  1 files changed, 17 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/video/fbmem.c b/drivers/video/fbmem.c
> > index a15b44e..41f2e5e 100644
> > --- a/drivers/video/fbmem.c
> > +++ b/drivers/video/fbmem.c
> > @@ -1468,15 +1468,25 @@ static int fb_check_foreignness(struct fb_info *fi)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * ranges_overlap - check whether two ranges overlap (their intersection is not empty)
> > + * @start1: start of the first range
> > + * @size1:  length of the first range
> > + * @start2: start of the second range
> > + * @size2:  length of the second range
> > + */
> > +#define ranges_overlap(start1, size1, start2, size2) ({	\
> > +	typeof(start1) __start1 = (start1);		\
> > +	typeof(size1)  __size1  = (size1);		\
> > +	typeof(start2) __start2 = (start2);		\
> > +	typeof(size2)  __size2  = (size2);		\
> > +	__start1 < __start2 + __size2 && __start1 + __size1 > __start2; \
> > +})
> > +
> >  static bool fb_do_apertures_overlap(struct fb_info *gen, struct fb_info *hw)
> >  {
> > -	/* is the generic aperture base the same as the HW one */
> > -	if (gen->aperture_base == hw->aperture_base)
> > -		return true;
> > -	/* is the generic aperture base inside the hw base->hw base+size */
> > -	if (gen->aperture_base > hw->aperture_base && gen->aperture_base <= hw->aperture_base + hw->aperture_size)
> > -		return true;
> > -	return false;
> > +	return ranges_overlap(gen->aperture_base, gen->aperture_size,
> > +				hw->aperture_base, hw->aperture_size);
> >  }
> >  /**
> >   *	register_framebuffer - registers a frame buffer device
> 
> 
