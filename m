From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: Re: [PATCH RFC] drm: Add update_native_mode callback to
	connectors
Date: Fri, 28 Mar 2014 13:07:27 +0100
Message-ID: <2564613.a7yXaqHRBk@kongar>
References: <1395185950-14191-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395185950-14191-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Any updates on this?

Alexander


On Wednesday 19 March 2014, 00:39:10 wrote Alexander Stein:
> When reading EDID from firmware file, the nouveau driver can not setup
> it's native_mode like when reading EDID from hardware.
> Add this callback to allow driver to update their native_mode.
> 
> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
> ---
> This might be a fast forward hack. I'm wondering if there is a better way
> to achieve the same.
> The actual problem is that nv_connector->native_mode stays NULL when EDID
> is read from file instead of hardware because nouveau_connector_get_modes
> isn't called in that case. Neither is nouveau_connector_native_mode which
> would update native_mode.
> 
>  drivers/gpu/drm/drm_crtc_helper.c           |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++++++
>  include/drm/drm_crtc_helper.h               |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index ea92b82..8816f3f 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -173,6 +173,9 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  	if (count == 0)
>  		goto prune;
>  
> +	if (*connector_funcs->update_native_mode)
> +		(*connector_funcs->update_native_mode)(connector);
> +
>  	drm_mode_connector_list_update(connector);
>  
>  	if (maxX && maxY)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 1674882..c9c32b7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -880,11 +880,22 @@ nouveau_connector_best_encoder(struct drm_connector *connector)
>  	return NULL;
>  }
>  
> +static void
> +nouveau_connector_update_native_mode(struct drm_connector *connector)
> +{
> +	struct nouveau_connector *nv_connector = nouveau_connector(connector);
> +
> +	if (!nv_connector->native_mode)
> +		nv_connector->native_mode =
> +			nouveau_connector_native_mode(connector);
> +}
> +
>  static const struct drm_connector_helper_funcs
>  nouveau_connector_helper_funcs = {
>  	.get_modes = nouveau_connector_get_modes,
>  	.mode_valid = nouveau_connector_mode_valid,
>  	.best_encoder = nouveau_connector_best_encoder,
> +	.update_native_mode = nouveau_connector_update_native_mode,
>  };
>  
>  static const struct drm_connector_funcs
> diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
> index b1388b5..5327d4f 100644
> --- a/include/drm/drm_crtc_helper.h
> +++ b/include/drm/drm_crtc_helper.h
> @@ -123,6 +123,7 @@ struct drm_connector_helper_funcs {
>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>  					   struct drm_display_mode *mode);
>  	struct drm_encoder *(*best_encoder)(struct drm_connector *connector);
> +	void (*update_native_mode)(struct drm_connector *connector);
>  };
>  
>  extern int drm_helper_probe_single_connector_modes(struct drm_connector *connector, uint32_t maxX, uint32_t maxY);
> 
