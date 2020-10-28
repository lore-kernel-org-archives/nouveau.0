From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
Date: Wed, 28 Oct 2020 20:57:55 +0100
Message-ID: <CAKMK7uGBf7Revnr80n2jtBKht_3M7hoKskGhcEhOz5HqeMVB0g@mail.gmail.com>
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
 <20201028185029.GA683411@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201028185029.GA683411-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tetsuo Handa <penguin-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "Gustavo A. R. Silva" <gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Peilin Ye <yepeilin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, George Kennedy <george.kennedy-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Oct 28, 2020 at 7:50 PM Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi Daniel.
>
> On Wed, Oct 28, 2020 at 05:06:00PM +0100, Daniel Vetter wrote:
> > So ever since syzbot discovered fbcon, we have solid proof that it's
> > full of bugs. And often the solution is to just delete code and remove
> > features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> >
> > Now the problem is that most modern-ish drivers really only treat
> > fbcon as an dumb kernel console until userspace takes over, and Oops
> > printer for some emergencies. Looking at drm drivers and the basic
> > vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> > acceleration:
> >
> > - nouveau, seems to be enabled by default
> > - omapdrm, when a DMM remapper exists using remapper rewriting for
> >   y/xpanning
> > - gma500, but that is getting deleted now for the GTT remapper trick,
> >   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
> >   flag, so unused (and could be deleted already I think).
> >
> > No other driver supportes accelerated fbcon. And fbcon is the only
> > user of this accel code (it's not exposed as uapi through ioctls),
> > which means we could garbage collect fairly enormous amounts of code
> > if we kill this.
> >
> > Plus because syzbot only runs on virtual hardware, and none of the
> > drivers for that have acceleration, we'd remove a huge gap in testing.
> > And there's no other even remotely comprehensive testing aside from
> > syzbot.
> >
> > This patch here just disables the acceleration code by always
> > redrawing when scrolling. The plan is that once this has been merged
> > for well over a year in released kernels, we can start to go around
> > and delete a lot of code.
>
> See below for a warning fix.
>
> Some figures from trying to toss accel code out from a few fbdev drivers:
>
>  drivers/video/fbdev/cirrusfb.c | 300 +----------------------------------------
>  1 file changed, 4 insertions(+), 296 deletions(-)
>
>  drivers/video/fbdev/aty/radeon_accel.c | 174 ---------------------------------
>  drivers/video/fbdev/aty/radeon_base.c  |  43 ++------
>  drivers/video/fbdev/aty/radeon_pm.c    |   7 --
>  drivers/video/fbdev/aty/radeonfb.h     |   3 -
>  4 files changed, 7 insertions(+), 220 deletions(-)
>
> This may open up the discussion if the right course of action would be
> to drop the drivers in favour of drm counterparts - but thats another
> story.

Yeah I think we can start deleting drivers for which we have drm
drivers which are mostly feature parity and see whether anyone pipes
up. There's always going to be the odd corner case (like apparently
the fbdev ati driver works better on some ppc machines than the drm
one).

The thing is, we can't delete the entire accel code with this, I think
only fb_copyarea goes away. The other hooks I think still have some
users.
-Daniel

>
>         Sam
>
> > @@ -1961,7 +1963,6 @@ static void updatescrollmode(struct fbcon_display *p,
> >  {
> >       struct fbcon_ops *ops = info->fbcon_par;
> >       int fh = vc->vc_font.height;
> > -     int cap = info->flags;
> >       u16 t = 0;
> >       int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> >                                 info->fix.xpanstep);
> > @@ -1969,37 +1970,12 @@ static void updatescrollmode(struct fbcon_display *p,
> >       int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> >       int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> >                                  info->var.xres_virtual);
> > -     int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
> > -             divides(ypan, vc->vc_font.height) && vyres > yres;
> > -     int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
> > -             divides(ywrap, vc->vc_font.height) &&
> > -             divides(vc->vc_font.height, vyres) &&
> > -             divides(vc->vc_font.height, yres);
> > -     int reading_fast = cap & FBINFO_READS_FAST;
> > -     int fast_copyarea = (cap & FBINFO_HWACCEL_COPYAREA) &&
> > -             !(cap & FBINFO_HWACCEL_DISABLED);
> > -     int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
> > -             !(cap & FBINFO_HWACCEL_DISABLED);
>
> Some bot will likely tell you that this causes warnings.
> At least it did in my sparc64 build.
>
> Fix:
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 398914e035e9..e8b009c621d8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2150,10 +2150,6 @@ static void updatescrollmode(struct fbcon_display *p,
>  {
>         struct fbcon_ops *ops = info->fbcon_par;
>         int fh = vc->vc_font.height;
> -       u16 t = 0;
> -       int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> -                                 info->fix.xpanstep);
> -       int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
>         int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>         int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>                                    info->var.xres_virtual);
>
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
