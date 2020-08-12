From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [RFC 10/20] drm/nouveau/kms: Use new drm_dp_has_mst() helper for
 checking MST caps
Date: Wed, 12 Aug 2020 10:11:55 +1000
Message-ID: <CACAvsv6HZpgSC=gyJa_HyWLYAd70GefPp9j10ZOZ07CDQ70phA@mail.gmail.com>
References: <20200811200457.134743-1-lyude@redhat.com> <20200811200457.134743-11-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200811200457.134743-11-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, 12 Aug 2020 at 06:06, Lyude Paul <lyude@redhat.com> wrote:
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index d701f09aea645..bb85d81c25244 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -44,7 +44,6 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>         struct nv50_mstm *mstm = NULL;
>         int ret;
>         u8 *dpcd = outp->dp.dpcd;
> -       u8 tmp;
>
>         ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
>         if (ret == DP_RECEIVER_CAP_SIZE && dpcd[DP_DPCD_REV]) {
> @@ -56,19 +55,10 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>                 return connector_status_disconnected;
>         }
>
> -       if (nouveau_mst)
> +       if (nouveau_mst) {
>                 mstm = outp->dp.mstm;
> -
> -       if (mstm) {
> -               if (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_12) {
> -                       ret = drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &tmp);
> -                       if (ret < 0)
> -                               return connector_status_disconnected;
> -
> -                       mstm->can_mst = !!(tmp & DP_MST_CAP);
> -               } else {
> -                       mstm->can_mst = false;
> -               }
> +               if (mstm)
> +                       mstm->can_mst = drm_dp_has_mst(aux, dpcd);
>         }
>
>         return connector_status_connected;
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
