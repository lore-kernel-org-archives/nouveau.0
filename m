From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: Fri, 1 Jul 2011 22:15:16 +0200
Message-ID: <20110701201516.GB3162@joi.lan>
References: <20110701163521.GA3162@joi.lan>
	<20110701192238.7169.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110701192238.7169.qmail-FT9nftu9LUyCkawlElnc8EEOCMrvLtNR@public.gmane.org>
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

On Fri, Jul 01, 2011 at 03:22:38PM -0400, George Spelvin wrote:
> > Lowering bpp/resolution for framebuffer and/or X might help. At least temporarily.
> 
> Bingo!  Dropping to 16 bpp produced a working display.  Xorg.0.log appensed.

Great :)

> > Screenshot might be useful.
> 
> Will be a few days; I don't have a camera handy.  I thought I described it
> pretty well: cut off the bttom 8 pixels or so, replicating the top line
> of pixels to fill the space.  Actually I just realized that, using 16x8
> characters, my screen is 67.5x240; maybe the 0.5 character is causing
> some rounding error?
>
> > 2) I can't start X.  The X server fails to initialize with:
> > [  6151.976] (II) NOUVEAU(0): Opened GPU channel 1
> > [  6151.976] (II) NOUVEAU(0): [DRI2] Setup complete
> > [  6151.976] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
> 
> > Can you uninstall 3d driver and check how will it behave?
> 
> Forgive me; can you elaborate on what 3d driver you are referring to?  Is it some
> kernel module, or a user-space thing?  The modules I have loaded are:
> Module                  Size  Used by
> nouveau               481474  2 
> (...)

3d driver is nouveau_vieux_dri.so, which I misreaded as loading in a log above.
Now I see this in a new log:
[ 59710.306] (EE) AIGLX error: dlopen of /usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so failed (/usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so: cannot open shared object file: No such file or directory)
[ 59710.306] (EE) AIGLX: reverting to software rendering                     
which means you don't have it installed. Good ;).

> 
> > 1920x1080x4 is almost 8MB and you have only 32MB of VRAM. It might be a problem with memory allocation.
> > You could verify it by applying this patch to xf86-video-nouveau and checking xorg.log:
> 
> The "lowering bpp" suggestion was faster, soI tried it successfully.  Is this patch still
> useful?  I'll try it over the weekend.

No. As suggested by mwk on irc the problem is probably in kernel - on NV1x, nouveau
allocates color buffers only in bottom half of VRAM, so if fbcon takes almost half of it and
there are some other allocations, second 8MB buffer cannot be allocated.
Can you test this patch to verify it?
--
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 890d50e..6884c88 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -146,7 +146,7 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t type)
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(nvbo->bo.bdev);
 	int vram_pages = dev_priv->vram_size >> PAGE_SHIFT;
 
-	if (dev_priv->card_type == NV_10 &&
+	if (0 && dev_priv->card_type == NV_10 &&
 	    nvbo->tile_mode && (type & TTM_PL_FLAG_VRAM) &&
 	    nvbo->bo.mem.num_pages < vram_pages / 2) {
 		/*
--

> Does nouveau leave the text mode console allocated?  Without it, it
> actually uses hardware text mode, which is a lot less VRAM.

fbcon remain allocated after start of X. You could boot with lower bpp/resolution to
leave more VRAM for X...
http://nouveau.freedesktop.org/wiki/KernelModeSetting#ForcingModes


Marcin
