From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 3/5] drm/nouveau: Add missing RPM get/put() when
 probing connectors
Date: Tue, 17 Jul 2018 12:11:24 +0200
Message-ID: <CACO55ts0OiOQqzu617kL2XfcMxJ2PnjTvmkb2K_bFFFznh9O5Q@mail.gmail.com>
References: <20180716235936.11268-1-lyude@redhat.com> <20180716235936.11268-4-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180716235936.11268-4-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <karolherbst@gmail.com>

On Tue, Jul 17, 2018 at 1:59 AM, Lyude Paul <lyude@redhat.com> wrote:
> While the GPU is guaranteed to be on when a hotplug has been received,
> the same assertion does not hold true if a connector probe has been
> started by userspace without having had received a sysfs event. So
> ensure that any connector probing keeps the GPU alive for the duration
> of the probe.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 21 +++++++++++++++++++--
>  drivers/gpu/drm/nouveau/nouveau_connector.h |  3 +++
>  3 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index ea2a886854fe..0f283ca75189 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -858,7 +858,7 @@ static const struct drm_connector_funcs
>  nv50_mstc = {
>         .reset = nouveau_conn_reset,
>         .detect = nv50_mstc_detect,
> -       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .fill_modes = nouveau_connector_probe_single_connector_modes,
>         .destroy = nv50_mstc_destroy,
>         .atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
>         .atomic_destroy_state = nouveau_conn_atomic_destroy_state,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 2a45b4c2ceb0..feb142fb7a8a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -770,6 +770,23 @@ nouveau_connector_force(struct drm_connector *connector)
>         nouveau_connector_set_encoder(connector, nv_encoder);
>  }
>
> +int
> +nouveau_connector_probe_single_connector_modes(struct drm_connector *connector,
> +                                              uint32_t maxX, uint32_t maxY)
> +{
> +       struct device *dev = connector->dev->dev;
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(dev);
> +       if (WARN_ON(ret < 0 && ret != -EACCES))
> +               return 0;
> +
> +       ret = drm_helper_probe_single_connector_modes(connector, maxX, maxY);
> +
> +       pm_runtime_put_autosuspend(dev);
> +       return ret;
> +}
> +
>  static int
>  nouveau_connector_set_property(struct drm_connector *connector,
>                                struct drm_property *property, uint64_t value)
> @@ -1088,7 +1105,7 @@ nouveau_connector_funcs = {
>         .reset = nouveau_conn_reset,
>         .detect = nouveau_connector_detect,
>         .force = nouveau_connector_force,
> -       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .fill_modes = nouveau_connector_probe_single_connector_modes,
>         .set_property = nouveau_connector_set_property,
>         .destroy = nouveau_connector_destroy,
>         .atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
> @@ -1103,7 +1120,7 @@ nouveau_connector_funcs_lvds = {
>         .reset = nouveau_conn_reset,
>         .detect = nouveau_connector_detect_lvds,
>         .force = nouveau_connector_force,
> -       .fill_modes = drm_helper_probe_single_connector_modes,
> +       .fill_modes = nouveau_connector_probe_single_connector_modes,
>         .set_property = nouveau_connector_set_property,
>         .destroy = nouveau_connector_destroy,
>         .atomic_duplicate_state = nouveau_conn_atomic_duplicate_state,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
> index 2d9d35a146a4..e9ffc6eebda2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
> @@ -106,6 +106,9 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
>
>  struct drm_connector *
>  nouveau_connector_create(struct drm_device *, const struct dcb_output *);
> +int
> +nouveau_connector_probe_single_connector_modes(struct drm_connector *,
> +                                              uint32_t, uint32_t);
>
>  extern int nouveau_tv_disable;
>  extern int nouveau_ignorelid;
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
