From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [RFC 01/20] drm/nouveau/kms: Fix some indenting in nouveau_dp_detect()
Date: Wed, 12 Aug 2020 10:10:13 +1000
Message-ID: <CACAvsv5FnVom3Od=EfZO3Y1WhCXDhBvCSNwFx8bc_BNg75iL4g@mail.gmail.com>
References: <20200811200457.134743-1-lyude@redhat.com> <20200811200457.134743-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200811200457.134743-2-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, 12 Aug 2020 at 06:05, Lyude Paul <lyude@redhat.com> wrote:
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index 8a0f7994e1aeb..ee778ddc95fae 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -76,10 +76,10 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
>         nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
>
>         NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
> -                    nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
> +                nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
>         NV_DEBUG(drm, "encoder: %dx%d\n",
> -                    nv_encoder->dcb->dpconf.link_nr,
> -                    nv_encoder->dcb->dpconf.link_bw);
> +                nv_encoder->dcb->dpconf.link_nr,
> +                nv_encoder->dcb->dpconf.link_bw);
>
>         if (nv_encoder->dcb->dpconf.link_nr < nv_encoder->dp.link_nr)
>                 nv_encoder->dp.link_nr = nv_encoder->dcb->dpconf.link_nr;
> @@ -87,7 +87,7 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
>                 nv_encoder->dp.link_bw = nv_encoder->dcb->dpconf.link_bw;
>
>         NV_DEBUG(drm, "maximum: %dx%d\n",
> -                    nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
> +                nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
>
>         nouveau_dp_probe_oui(dev, aux, dpcd);
>
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
