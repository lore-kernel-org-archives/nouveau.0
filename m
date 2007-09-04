From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [RANDR-1.2 branch] [NVSwitchMode] X crash by
	calling XF86 VidMode extension
Date: Tue, 4 Sep 2007 20:43:31 +0200
Message-ID: <6d4bc9fc0709041143x2bb2b5e1lb5e74183de81975f@mail.gmail.com>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709041603260.25038@jbgna.fhfr.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.LNX.0.999-openSUSE-1.0709041603260.25038-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The main branch now includes randr-1.2 support (Option "Randr12"
"true"), and i've begun fixing it up. I will look at this later.

Maarten.

On 9/4/07, Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org> wrote:
> On Mon, 3 Sep 2007, Bernhard Kaindl wrote:
> >
> > Hi,
> >   Please find attached the patches which I currently use on my desktop
> > machine for dual head with the randr branch to fix the issues which I found.
> >
> > They may help others as well but may e.g. also disable the Xv blitter
> > which might be working for some (but didn't on my card) - more information
> > is found in the text comments in the patches.
>
> Anther patch: This one fixes a crash in the randr-1.2 branch which always
> happens when a program tries to set a video mode thru the XF86 VidMode
> extension (which are very many)
>
> Patch below and in attachment.
>
> Best Regards.
> Bernhard
>
> // With the current randr-1.2 branch, the X server crashes when
> // the XF86 VidMode extension is used to switch the video mode.
> //
> // SDL and freeglut use it, so for example all program which
> // which use either to switch to fullscreen mode cause the crash.
> //
> // Reason for the crash: The current implmentation of NVSwitchMode()
> // which gets called by the extension to set the video mode tries
> // to call a non-existing function.
> //
> // I implemented a version of that function which should do what
> // is needed and with this, trackballs and glest not longer crash
> // my X server.
> //
> // Since on my card (G70 - GeForce 7600 GS - NV40 generation), changing
> // video modes is broken (using the xrandr does not give e.g. a working
> /  1280x1024 mode), I didn't test to actually switch to different
> // resolutionss thru the extension, but the X crash is gone and there
> // is an implementation which could work for some, so it's definitely
> // an improvement.
> //
> // I also removed the prototypes for two other undefined functions
> // from nv_proto.h
> //
> --- nouveau-0.20070903/xf86-video-nouveau/src/nv_crtc.c
> +++ nouveau-0.20070902/xf86-video-nouveau/src/nv_crtc.c
> @@ -1297,6 +1324,15 @@ void NVCrtcSetCursor(xf86CrtcPtr crtc, B
>     NVWriteVgaCrtc(crtc, NV_VGA_CRTCX_CURCTL1, current);
>   }
>
> +void NVSetMode(ScrnInfoPtr pScrn, DisplayModePtr mode)
> +{
> +       xf86CrtcConfigPtr   xf86_config = XF86_CRTC_CONFIG_PTR(pScrn);
> +       int i;
> +       for (i = 0; i < xf86_config->num_crtc; i++)
> +               if (xf86_config->crtc[i]->enabled)
> +                       nv_crtc_mode_set(xf86_config->crtc[i], mode, NULL, 0,0);
> +}
> +
>   static void NVCrtcWriteDacMask(xf86CrtcPtr crtc, CARD8 value)
>   {
>     ScrnInfoPtr pScrn = crtc->scrn;
> --- nouveau-0.20070903/xf86-video-nouveau/src/nv_driver.c
> +++ nouveau-0.20070902/xf86-video-nouveau/src/nv_driver.c
> @@ -818,7 +818,42 @@ NVProbe(DriverPtr drv, int flags)
>         return foundScreen;
>   }
>
> -/* Usually mandatory */
> +/*
> + * This function is needed by the XF86VideMode extension which is used by
> + * the current pre-randr clients. The API covers only one screen, but
> + * implementing the latest modesetting framework like done in the Intel
> + * driver is more than a few lines of patch, the randr-1.2 branch in its
> + * current form cannot the mode switching in a perfect way right now.
> + *
> + * As there are effors to bring modesetting into the kernel, controlled
> + * thru the drm module, of which nouveu currently requires its own version,
> + * one could even try to go one step further and try to bring the nouveau
> + * modesetting into the nouveau kernel module.c (as a first step which does
> + * not require a kernel patch), which would increase the chances that the
> + * text console is properly restored after X dies as the kernel can simply
> + * restore the text console when the process which has changed modes thru
> + * /dev/drm has been disconnected from the device.
> + *
> + * The current implementation simply tries to set each crtc to the mode
> + * for which the application asks for, hoping that one of them gives a
> + * usable monitor display (no error handling implemented), and sets
> + * the viewport of each crtc to (0,0), which means essentially clone
> + * mode with all monitors which managed to switch to the mode showing
> + * top left area of the framebuffer memory if the application's window
> + * is there. This is essentially what the Intel driver did in earlyer
> + * versions. To restore a LeftOf/RightOf layout, you two randr calls
> + * seem to be neccessary, one which sets the reversed layout, followed
> + * by one which sets the desired layout:
> + *
> + * xrandr --output Digital-1 --left-of Digital-0
> + * xrandr --output Digital-0 --left-of Digital-1
> + *
> + * FIXME: This could be fixed by getting the current viewports for the
> + * CRTCs and use these during mode settings, or (preferably) by getting
> + * the current screen layout and adapting the new viewports so that
> + * a new, continuos screen layout with the same monitor arrangement,
> + * but in the new mode is set up.
> + */
>   Bool
>   NVSwitchMode(int scrnIndex, DisplayModePtr mode, int flags)
>   {
> @@ -829,12 +864,16 @@ NVSwitchMode(int scrnIndex, DisplayModeP
>         NVFBLayout *pLayout = &pNv->CurrentLayout;
>
>         if (pLayout->mode != mode) {
> -               if (!NVSetMode(pScrn, mode, RR_Rotate_0))
> +#ifdef modesetting_has_error_handling // not implemented yet
> +               if (NVSetMode(pScrn, mode))
> +                       pLayout->mode = mode;
> +               else
>                         ret = FALSE;
> +#else
> +               NVSetMode(pScrn, mode);
> +               pLayout->mode = mode;
> +#endif
>         }
> -
> -       pLayout->mode = mode;
> -
>         return ret;
>   }
>
> --- nouveau-0.20070903/xf86-video-nouveau/src/nv_proto.h
> +++ nouveau-0.20070902/xf86-video-nouveau/src/nv_proto.h
> @@ -97,9 +97,7 @@ void nForceUpdateArbitrationSettings (un
>
>
>   /* nv_crtc.c */
> -Bool NVSetMode(ScrnInfoPtr pScrn, DisplayModePtr pMode, Rotation rotation);
> -Bool NVCrtcSetMode(xf86CrtcPtr crtc, DisplayModePtr pMode, Rotation rotation, int x, int y);
> -DisplayModePtr NVCrtcFindClosestMode(xf86CrtcPtr crtc, DisplayModePtr pMode);
> +void NVSetMode(ScrnInfoPtr pScrn, DisplayModePtr mode);
>   void NVCrtcSetBase (xf86CrtcPtr crtc, int x, int y);
>   void NVCrtcLoadPalette(xf86CrtcPtr crtc);
>   void NVCrtcBlankScreen(xf86CrtcPtr crtc, Bool on);
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
>
