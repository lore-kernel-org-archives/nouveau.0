From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 13/36] drm/nouveau: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 11:12:15 -0400
Message-ID: <CAKb7Uvgo=93HxGX9F9BvReKbPpbQRozztk0_+GXKqZ3PydCHsA@mail.gmail.com>
References: <1569242880-182878-1-git-send-email-hjc@rock-chips.com> <1569242880-182878-3-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569242880-182878-3-git-send-email-hjc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sandy Huang <hjc@rock-chips.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 23, 2019 at 8:56 AM Sandy Huang <hjc@rock-chips.com> wrote:
>
> cpp[BytePerPlane] can't describe the 10bit data format correctly,
> So we use bpp[BitPerPlane] to instead cpp.
>
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c     | 7 ++++---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c | 4 ++--
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c | 2 +-
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index f22f010..59d2f07 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -874,11 +874,12 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
>
>         /* Update the framebuffer location. */
>         regp->fb_start = nv_crtc->fb.offset & ~3;
> -       regp->fb_start += (y * drm_fb->pitches[0]) + (x * drm_fb->format->cpp[0]);
> +       regp->fb_start += (y * drm_fb->pitches[0]) +
> +                               (x * drm_fb->format->bpp[0] / 8);
>         nv_set_crtc_base(dev, nv_crtc->index, regp->fb_start);
>
>         /* Update the arbitration parameters. */
> -       nouveau_calc_arb(dev, crtc->mode.clock, drm_fb->format->cpp[0] * 8,
> +       nouveau_calc_arb(dev, crtc->mode.clock, drm_fb->format->bpp[0],
>                          &arb_burst, &arb_lwm);
>
>         regp->CRTC[NV_CIO_CRE_FF_INDEX] = arb_burst;
> @@ -1238,7 +1239,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
>
>         /* Initialize a page flip struct */
>         *s = (struct nv04_page_flip_state)
> -               { { }, event, crtc, fb->format->cpp[0] * 8, fb->pitches[0],
> +               { { }, event, crtc, fb->format->bpp[0], fb->pitches[0],
>                   new_bo->bo.offset };
>
>         /* Keep vblanks on during flip, for the target crtc of this flip */
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> index d5e295c..59883bd0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -190,12 +190,12 @@ base507c_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>                 return ret;
>
>         if (!wndw->func->ilut) {
> -               if ((asyh->base.cpp != 1) ^ (fb->format->cpp[0] != 1))
> +               if (asyh->base.cpp != 1 ^ fb->format->bpp[0] != 8)

Please leave the parens in. Even if it works out to the same thing
(don't know), ^ vs != ordering isn't fresh in many people's minds
(mine included).

>                         asyh->state.color_mgmt_changed = true;
>         }
>
>         asyh->base.depth = fb->format->depth;
> -       asyh->base.cpp = fb->format->cpp[0];
> +       asyh->base.cpp = fb->format->bpp[0] / 8;
>         asyh->base.x = asyw->state.src.x1 >> 16;
>         asyh->base.y = asyw->state.src.y1 >> 16;
>         asyh->base.w = asyw->state.fb->width;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> index cc41766..c6c2e0b 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> @@ -135,7 +135,7 @@ ovly507e_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>         if (ret)
>                 return ret;
>
> -       asyh->ovly.cpp = fb->format->cpp[0];
> +       asyh->ovly.cpp = fb->format->bpp[0] / 8;
>         return 0;
>  }
>
> --
> 2.7.4
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
