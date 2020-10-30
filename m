From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
Date: Fri, 30 Oct 2020 10:30:31 +0200
Message-ID: <df3f5733-21b3-809c-71d7-0bd83f29ae62@ti.com>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
 <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201029132229.4068359-1-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: George Kennedy <george.kennedy-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Gustavo A. R. Silva" <gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peilin Ye <yepeilin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 29/10/2020 15:22, Daniel Vetter wrote:
> So ever since syzbot discovered fbcon, we have solid proof that it's
> full of bugs. And often the solution is to just delete code and remove
> features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> 
> Now the problem is that most modern-ish drivers really only treat
> fbcon as an dumb kernel console until userspace takes over, and Oops
> printer for some emergencies. Looking at drm drivers and the basic
> vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> acceleration:
> 
> - nouveau, seems to be enabled by default
> - omapdrm, when a DMM remapper exists using remapper rewriting for
>   y/xpanning
> - gma500, but that is getting deleted now for the GTT remapper trick,
>   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
>   flag, so unused (and could be deleted already I think).
> 
> No other driver supportes accelerated fbcon. And fbcon is the only
> user of this accel code (it's not exposed as uapi through ioctls),
> which means we could garbage collect fairly enormous amounts of code
> if we kill this.
> 
> Plus because syzbot only runs on virtual hardware, and none of the
> drivers for that have acceleration, we'd remove a huge gap in testing.
> And there's no other even remotely comprehensive testing aside from
> syzbot.
> 
> This patch here just disables the acceleration code by always
> redrawing when scrolling. The plan is that once this has been merged
> for well over a year in released kernels, we can start to go around
> and delete a lot of code.
> 
> v2:
> - Drop a few more unused local variables, somehow I missed the
> compiler warnings (Sam)
> - Fix typo in comment (Jiri)
> - add a todo entry for the cleanup (Thomas)
> 
> v3: Remove more unused variables (0day)
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> Cc: Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> Cc: Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: "Gustavo A. R. Silva" <gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
> Cc: Peilin Ye <yepeilin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: George Kennedy <george.kennedy-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Cc: Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/gpu/todo.rst       | 18 +++++++++++++
>  drivers/video/fbdev/core/fbcon.c | 45 ++++++--------------------------
>  2 files changed, 26 insertions(+), 37 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 6b224ef14455..bec99341a904 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -277,6 +277,24 @@ Contact: Daniel Vetter, Noralf Tronnes
>  
>  Level: Advanced
>  
> +Garbage collect fbdev scrolling acceleration
> +--------------------------------------------
> +
> +Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
> +SCROLL_REDRAW. There's a ton of code this will allow us to remove:
> +- lots of code in fbcon.c
> +- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
> +  directly instead of the function table (with a switch on p->rotate)
> +- fb_copyarea is unused after this, and can be deleted from all drivers
> +
> +Note that not all acceleration code can be deleted, since clearing and cursor
> +support is still accelerated, which might be good candidates for further
> +deletion projects.

Apparently omapdrm's accelerated panning has been broken for some time, and no one has noticed. It does:

strcmp(fbi->fix.id, MODULE_NAME), which is a comparison of omapdrmdrmfb == omapdrm and always fails.

Fixing that, and applying this patch, things work fine (unaccelerated, of course). I did notice a
single call to omap_fbdev_pan_display() when loading the drivers. This comes from fbcon_switch ->
bit_update_start -> fb_pan_display. Maybe this is from the clearing you mention above?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
