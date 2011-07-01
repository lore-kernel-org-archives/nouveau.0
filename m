From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: Fri, 1 Jul 2011 18:35:21 +0200
Message-ID: <20110701163521.GA3162@joi.lan>
References: <20cf304346f0aae407049e3aa3fa@google.com>
	<20110701051649.22615.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110701051649.22615.qmail-FT9nftu9LUyCkawlElnc8EEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 01, 2011 at 01:16:49AM -0400, George Spelvin wrote:
> I mentioned these problems back in March, but went back to the nv driver
> and ignored it.  Since I need to reboot for another reason, I gave nouveau a try again,
> 
> This time, I'm using the kernel git tip, off of 3.0-rc5:
> 181888bfeea73b2ec756b83fd590fd3a62d4171d: drm/nv50/dp: fix hack to work for macbooks booted via EFI
> 
> The X server is Debian's xserver-xorg-video-nouveau, version
> 1:0.0.16+git20110411+8378443-1+b1
> 
> The good news is that my screen "tearing" problem during system activity
> appears to be fixed!
> Hooray.  But I still have two other problems I mentioned at the time:
> 
> 1) The text console, although connected via DVI, appears to be about
>    half a line of text low.  Tall characters (^ and $) on the top line
>    have their top row of pixels "stretched" upward, apparently replicated
>    quite a few times.
>    The bottom row of characters is only partially visible.

Screenshot might be useful.

> 
> 2) I can't start X.  The X server fails to initialize with:
> [  6151.976] (II) NOUVEAU(0): Opened GPU channel 1
> [  6151.976] (II) NOUVEAU(0): [DRI2] Setup complete
> [  6151.976] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux

Can you uninstall 3d driver and check how will it behave?

> [  6151.977] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
> [  6151.977] 
> Fatal server error:
> [  6151.977] AddScreen/ScreenInit failed for driver 0
> [  6151.977] 
> 
> If I can get problem 2 fixed, problem 1 will become less important.
> 
> As mentioned in my old email, it's a uniprocessor Athlon XP system, with a
> Geforce 4 MX video adapter:
> 04:00.0 VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX - nForce GPU] [10de:01f0] (rev a3)

FYI, nouveau finds it as NV1F.

> The display is a 1920x1080 LCD, connected via DVI.  No other outputs are connected.

1920x1080x4 is almost 8MB and you have only 32MB of VRAM. It might be a problem with memory allocation.
You could verify it by applying this patch to xf86-video-nouveau and checking xorg.log:

diff --git a/src/nv_accel_common.c b/src/nv_accel_common.c
index 735f47f..1eac357 100644
--- a/src/nv_accel_common.c
+++ b/src/nv_accel_common.c
@@ -116,8 +116,10 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height, int bpp,
 
 	ret = nouveau_bo_new_tile(pNv->dev, flags, 0, *pitch * height,
 				  tile_mode, tile_flags, bo);
-	if (ret)
+	if (ret) {
+		xf86DrvMsg(scrn->scrnIndex, X_ERROR, "nouveau_bo_new_tile returned: %d, %s\n", ret, strerror(ret));
 		return FALSE;
+	}
 
 	return TRUE;
 }

-

Lowering bpp/resolution for framebuffer and/or X might help. At least temporarily.

Marcin
