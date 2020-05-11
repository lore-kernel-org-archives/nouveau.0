From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v3 3/5] drm/nouveau/kms/gv100-: Add support for interlaced modes
Date: Mon, 11 May 2020 19:05:58 -0400
Message-ID: <CAKb7UvjQfw9UvxCdcu1k3t0dnq7PdQJrw5CtWhB42=uiW9-4dA@mail.gmail.com>
References: <20200511224148.598468-1-lyude@redhat.com> <20200511224148.598468-4-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200511224148.598468-4-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, May 11, 2020 at 6:42 PM Lyude Paul <lyude@redhat.com> wrote:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 43bcbb6d73c4..6dae00da5d7e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1065,7 +1065,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
>                 return get_slave_funcs(encoder)->mode_valid(encoder, mode);
>         case DCB_OUTPUT_DP:
>                 if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
> -                   !nv_encoder->dp.caps.interlace)
> +                   !nv_encoder->caps.dp_interlace)
>                         return MODE_NO_INTERLACE;
>
>                 max_clock  = nv_encoder->dp.link_nr;

You probably meant for this hunk to go into an earlier patch.

  -ilia
