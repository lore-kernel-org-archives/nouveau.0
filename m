From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Patch "fbcon: Disable accelerated scrolling" has been
 added to the 5.10-stable tree
Date: Mon, 04 Jan 2021 15:28:01 +0100
Message-ID: <1609770481573@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, george.kennedy-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org, penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, tzimmermann-l3A5Bk7waGM@public.gmane.org, yepeilin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: stable-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org


This is a note to let you know that I've just added the patch titled

    fbcon: Disable accelerated scrolling

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fbcon-disable-accelerated-scrolling.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> know about it.


From 39aead8373b3c20bb5965c024dfb51a94e526151 Mon Sep 17 00:00:00 2001
From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Date: Thu, 29 Oct 2020 14:22:29 +0100
Subject: fbcon: Disable accelerated scrolling

From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

commit 39aead8373b3c20bb5965c024dfb51a94e526151 upstream.

So ever since syzbot discovered fbcon, we have solid proof that it's
full of bugs. And often the solution is to just delete code and remove
features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").

Now the problem is that most modern-ish drivers really only treat
fbcon as an dumb kernel console until userspace takes over, and Oops
printer for some emergencies. Looking at drm drivers and the basic
vesa/efi fbdev drivers shows that only 3 drivers support any kind of
acceleration:

- nouveau, seems to be enabled by default
- omapdrm, when a DMM remapper exists using remapper rewriting for
  y/xpanning
- gma500, but that is getting deleted now for the GTT remapper trick,
  and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
  flag, so unused (and could be deleted already I think).

No other driver supportes accelerated fbcon. And fbcon is the only
user of this accel code (it's not exposed as uapi through ioctls),
which means we could garbage collect fairly enormous amounts of code
if we kill this.

Plus because syzbot only runs on virtual hardware, and none of the
drivers for that have acceleration, we'd remove a huge gap in testing.
And there's no other even remotely comprehensive testing aside from
syzbot.

This patch here just disables the acceleration code by always
redrawing when scrolling. The plan is that once this has been merged
for well over a year in released kernels, we can start to go around
and delete a lot of code.

v2:
- Drop a few more unused local variables, somehow I missed the
compiler warnings (Sam)
- Fix typo in comment (Jiri)
- add a todo entry for the cleanup (Thomas)

v3: Remove more unused variables (0day)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Reviewed-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Reviewed-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Jiri Slaby <jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Gustavo A. R. Silva" <gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tetsuo Handa <penguin-kernel-JPay3/Yim36HaxMnTkn67Xf5DAMn2ifp@public.gmane.org>
Cc: Peilin Ye <yepeilin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: George Kennedy <george.kennedy-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20201029132229.4068359-1-daniel.vetter-/w4YWyX8dFk@public.gmane.org
Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

---
 Documentation/gpu/todo.rst       |   18 +++++++++++++++
 drivers/video/fbdev/core/fbcon.c |   45 ++++++---------------------------------
 2 files changed, 26 insertions(+), 37 deletions(-)

--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -273,6 +273,24 @@ Contact: Daniel Vetter, Noralf Tronnes
 
 Level: Advanced
 
+Garbage collect fbdev scrolling acceleration
+--------------------------------------------
+
+Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
+SCROLL_REDRAW. There's a ton of code this will allow us to remove:
+- lots of code in fbcon.c
+- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
+  directly instead of the function table (with a switch on p->rotate)
+- fb_copyarea is unused after this, and can be deleted from all drivers
+
+Note that not all acceleration code can be deleted, since clearing and cursor
+support is still accelerated, which might be good candidates for further
+deletion projects.
+
+Contact: Daniel Vetter
+
+Level: Intermediate
+
 idr_init_base()
 ---------------
 
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1033,7 +1033,7 @@ static void fbcon_init(struct vc_data *v
 	struct vc_data *svc = *default_mode;
 	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
 	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
-	int cap, ret;
+	int ret;
 
 	if (WARN_ON(info_idx == -1))
 	    return;
@@ -1042,7 +1042,6 @@ static void fbcon_init(struct vc_data *v
 		con2fb_map[vc->vc_num] = info_idx;
 
 	info = registered_fb[con2fb_map[vc->vc_num]];
-	cap = info->flags;
 
 	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
 		logo_shown = FBCON_LOGO_DONTSHOW;
@@ -1147,11 +1146,13 @@ static void fbcon_init(struct vc_data *v
 
 	ops->graphics = 0;
 
-	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
-	    !(cap & FBINFO_HWACCEL_DISABLED))
-		p->scrollmode = SCROLL_MOVE;
-	else /* default to something safe */
-		p->scrollmode = SCROLL_REDRAW;
+	/*
+	 * No more hw acceleration for fbcon.
+	 *
+	 * FIXME: Garbage collect all the now dead code after sufficient time
+	 * has passed.
+	 */
+	p->scrollmode = SCROLL_REDRAW;
 
 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1961,45 +1962,15 @@ static void updatescrollmode(struct fbco
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	int fh = vc->vc_font.height;
-	int cap = info->flags;
-	u16 t = 0;
-	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
-				  info->fix.xpanstep);
-	int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
 	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
 				   info->var.xres_virtual);
-	int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
-		divides(ypan, vc->vc_font.height) && vyres > yres;
-	int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
-		divides(ywrap, vc->vc_font.height) &&
-		divides(vc->vc_font.height, vyres) &&
-		divides(vc->vc_font.height, yres);
-	int reading_fast = cap & FBINFO_READS_FAST;
-	int fast_copyarea = (cap & FBINFO_HWACCEL_COPYAREA) &&
-		!(cap & FBINFO_HWACCEL_DISABLED);
-	int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
-		!(cap & FBINFO_HWACCEL_DISABLED);
 
 	p->vrows = vyres/fh;
 	if (yres > (fh * (vc->vc_rows + 1)))
 		p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
 	if ((yres % fh) && (vyres % fh < yres % fh))
 		p->vrows--;
-
-	if (good_wrap || good_pan) {
-		if (reading_fast || fast_copyarea)
-			p->scrollmode = good_wrap ?
-				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
-		else
-			p->scrollmode = good_wrap ? SCROLL_REDRAW :
-				SCROLL_PAN_REDRAW;
-	} else {
-		if (reading_fast || (fast_copyarea && !fast_imageblit))
-			p->scrollmode = SCROLL_MOVE;
-		else
-			p->scrollmode = SCROLL_REDRAW;
-	}
 }
 
 #define PITCH(w) (((w) + 7) >> 3)


Patches currently in stable-queue which might be from daniel.vetter-/w4YWyX8dFk@public.gmane.org are

queue-5.10/fbcon-disable-accelerated-scrolling.patch
