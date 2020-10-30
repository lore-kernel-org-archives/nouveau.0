From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
Date: Fri, 30 Oct 2020 09:52:01 +0100
Message-ID: <CAKMK7uEH5dYP9-ybQ2OjS6c3Np99uEWE4QyL-x+nhLT=S7y0AA@mail.gmail.com>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
 <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
 <df3f5733-21b3-809c-71d7-0bd83f29ae62@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <df3f5733-21b3-809c-71d7-0bd83f29ae62@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: George Kennedy <george.kennedy@oracle.com>, Sam Ravnborg <sam@ravnborg.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Peter Rosin <peda@axentia.se>, Linus Torvalds <torvalds@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Nouveau Dev <nouveau@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Nathan Chancellor <natechancellor@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
List-Id: nouveau.vger.kernel.org

On Fri, Oct 30, 2020 at 9:30 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 29/10/2020 15:22, Daniel Vetter wrote:
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
> >
> > v2:
> > - Drop a few more unused local variables, somehow I missed the
> > compiler warnings (Sam)
> > - Fix typo in comment (Jiri)
> > - add a todo entry for the cleanup (Thomas)
> >
> > v3: Remove more unused variables (0day)
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: nouveau@lists.freedesktop.org
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: Peilin Ye <yepeilin.cs@gmail.com>
> > Cc: George Kennedy <george.kennedy@oracle.com>
> > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > Cc: Peter Rosin <peda@axentia.se>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/todo.rst       | 18 +++++++++++++
> >  drivers/video/fbdev/core/fbcon.c | 45 ++++++--------------------------
> >  2 files changed, 26 insertions(+), 37 deletions(-)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 6b224ef14455..bec99341a904 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -277,6 +277,24 @@ Contact: Daniel Vetter, Noralf Tronnes
> >
> >  Level: Advanced
> >
> > +Garbage collect fbdev scrolling acceleration
> > +--------------------------------------------
> > +
> > +Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
> > +SCROLL_REDRAW. There's a ton of code this will allow us to remove:
> > +- lots of code in fbcon.c
> > +- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
> > +  directly instead of the function table (with a switch on p->rotate)
> > +- fb_copyarea is unused after this, and can be deleted from all drivers
> > +
> > +Note that not all acceleration code can be deleted, since clearing and cursor
> > +support is still accelerated, which might be good candidates for further
> > +deletion projects.
>
> Apparently omapdrm's accelerated panning has been broken for some time, and no one has noticed. It does:
>
> strcmp(fbi->fix.id, MODULE_NAME), which is a comparison of omapdrmdrmfb == omapdrm and always fails.
>
> Fixing that, and applying this patch, things work fine (unaccelerated, of course). I did notice a
> single call to omap_fbdev_pan_display() when loading the drivers. This comes from fbcon_switch ->
> bit_update_start -> fb_pan_display. Maybe this is from the clearing you mention above?

The accel left is through fb_fillrect and fb_imageblt, plus there's
still fb_cursor (but not much use of that even in fbdev drivers).

I'm honestly not sure why there's the pan call in there, maybe just to
reset to default state in case an fbdev chardev user moved the origin
around. Aside from the accel code there's a call to this in
fbcon_switch and fbcon_modechanged, so I think it's just that.
-Daniel
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>
>  Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
