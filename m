From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/dispnv04: Remove dead code
Date: Thu, 30 Apr 2020 16:51:02 -0400
Message-ID: <CAKb7UvhNzfJLS8--5LySAjyzH2bidfZbP7VgzEVfeV2Erva4YQ@mail.gmail.com>
References: <1588278413-21682-1-git-send-email-jrdr.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1588278413-21682-1-git-send-email-jrdr.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Souptick Joarder <jrdr.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, inux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Interesting. I do remember seeing some snow on NV5's overlay at high
resolutions. Wonder if it was because of this missing code...

On Thu, Apr 30, 2020 at 4:19 PM Souptick Joarder <jrdr.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> These are dead code since 3.10. If there is no plan to use
> it further, these can be removed forever.
>
> Signed-off-by: Souptick Joarder <jrdr.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 1f08de4..ad0ef7d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -269,31 +269,11 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
>                 horizStart = horizTotal - 5;
>                 horizEnd = horizTotal - 2;
>                 horizBlankEnd = horizTotal + 4;
> -#if 0
> -               if (dev->overlayAdaptor && drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
> -                       /* This reportedly works around some video overlay bandwidth problems */
> -                       horizTotal += 2;
> -#endif
>         }
>
>         if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>                 vertTotal |= 1;
>
> -#if 0
> -       ErrorF("horizDisplay: 0x%X \n", horizDisplay);
> -       ErrorF("horizStart: 0x%X \n", horizStart);
> -       ErrorF("horizEnd: 0x%X \n", horizEnd);
> -       ErrorF("horizTotal: 0x%X \n", horizTotal);
> -       ErrorF("horizBlankStart: 0x%X \n", horizBlankStart);
> -       ErrorF("horizBlankEnd: 0x%X \n", horizBlankEnd);
> -       ErrorF("vertDisplay: 0x%X \n", vertDisplay);
> -       ErrorF("vertStart: 0x%X \n", vertStart);
> -       ErrorF("vertEnd: 0x%X \n", vertEnd);
> -       ErrorF("vertTotal: 0x%X \n", vertTotal);
> -       ErrorF("vertBlankStart: 0x%X \n", vertBlankStart);
> -       ErrorF("vertBlankEnd: 0x%X \n", vertBlankEnd);
> -#endif
> -
>         /*
>         * compute correct Hsync & Vsync polarity
>         */
> @@ -492,14 +472,6 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
>         /* Except for rare conditions I2C is enabled on the primary crtc */
>         if (nv_crtc->index == 0)
>                 regp->crtc_eng_ctrl |= NV_CRTC_FSEL_I2C;
> -#if 0
> -       /* Set overlay to desired crtc. */
> -       if (dev->overlayAdaptor) {
> -               NVPortPrivPtr pPriv = GET_OVERLAY_PRIVATE(dev);
> -               if (pPriv->overlayCRTC == nv_crtc->index)
> -                       regp->crtc_eng_ctrl |= NV_CRTC_FSEL_OVERLAY;
> -       }
> -#endif
>
>         /* ADDRESS_SPACE_PNVM is the same as setting HCUR_ASI */
>         regp->cursor_cfg = NV_PCRTC_CURSOR_CONFIG_CUR_LINES_64 |
> --
> 1.9.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
