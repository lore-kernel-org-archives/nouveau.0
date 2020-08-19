From: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Subject: Re: [RFC 15/20] drm/i915/dp: Extract
 drm_dp_has_sink_count()
Date: Wed, 19 Aug 2020 11:20:02 -0400
Message-ID: <20200819152002.GC46474@art_vandelay>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-16-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200811200457.134743-16-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Lucas De Marchi <lucas.demarchi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Gwan-gyeong Mun <gwan-gyeong.mun-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Manasi Navare <manasi.d.navare-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Uma Shankar <uma.shankar-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Aug 11, 2020 at 04:04:52PM -0400, Lyude Paul wrote:
> Since other drivers are also going to need to be aware of the sink count
> in order to do proper dongle detection, we might as well steal i915's
> DP_SINK_COUNT helpers and move them into DRM helpers so that other
> dirvers can use them as well.
> 
> Note that this also starts using intel_dp_has_sink_count() in
> intel_dp_detect_dpcd(), which is a functional change.
> 

Reviewed-by: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>

> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_dp_helper.c         | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++++---------
>  include/drm/drm_dp_helper.h             |  8 +++++++-
>  3 files changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 9703b33599c3b..05bb47e589731 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -700,6 +700,28 @@ void drm_dp_set_subconnector_property(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_dp_set_subconnector_property);
>  
> +/**
> + * drm_dp_has_sink_count() - Check whether a given connector has a valid sink
> + * count
> + * @connector: The DRM connector to check
> + * @dpcd: A cached copy of the connector's DPCD RX capabilities
> + * @desc: A cached copy of the connector's DP descriptor
> + *
> + * Returns: %True if the (e)DP connector has a valid sink count that should
> + * be probed, %false otherwise.
> + */
> +bool drm_dp_has_sink_count(struct drm_connector *connector,
> +			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +			   const struct drm_dp_desc *desc)
> +{
> +	/* Some eDP panels don't set a valid value for the sink count */
> +	return connector->connector_type != DRM_MODE_CONNECTOR_eDP &&
> +		dpcd[DP_DPCD_REV] >= DP_DPCD_REV_11 &&
> +		dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT &&
> +		!drm_dp_has_quirk(desc, 0, DP_DPCD_QUIRK_NO_SINK_COUNT);
> +}
> +EXPORT_SYMBOL(drm_dp_has_sink_count);
> +
>  /*
>   * I2C-over-AUX implementation
>   */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 984e49194ca31..35a4779a442e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4634,6 +4634,16 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  	return true;
>  }
>  
> +static bool
> +intel_dp_has_sink_count(struct intel_dp *intel_dp)
> +{
> +	if (!intel_dp->attached_connector)
> +		return false;
> +
> +	return drm_dp_has_sink_count(&intel_dp->attached_connector->base,
> +				     intel_dp->dpcd,
> +				     &intel_dp->desc);
> +}
>  
>  static bool
>  intel_dp_get_dpcd(struct intel_dp *intel_dp)
> @@ -4653,13 +4663,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  		intel_dp_set_common_rates(intel_dp);
>  	}
>  
> -	/*
> -	 * Some eDP panels do not set a valid value for sink count, that is why
> -	 * it don't care about read it here and in intel_edp_init_dpcd().
> -	 */
> -	if (!intel_dp_is_edp(intel_dp) &&
> -	    !drm_dp_has_quirk(&intel_dp->desc, 0,
> -			      DP_DPCD_QUIRK_NO_SINK_COUNT)) {
> +	if (intel_dp_has_sink_count(intel_dp)) {
>  		u8 count;
>  		ssize_t r;
>  
> @@ -5939,9 +5943,8 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>  		return connector_status_connected;
>  
>  	/* If we're HPD-aware, SINK_COUNT changes dynamically */
> -	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
> +	if (intel_dp_has_sink_count(intel_dp) &&
>  	    intel_dp->downstream_ports[0] & DP_DS_PORT_HPD) {
> -
>  		return intel_dp->sink_count ?
>  		connector_status_connected : connector_status_disconnected;
>  	}
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 1349f16564ace..a1413a531eaf4 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1631,6 +1631,11 @@ void drm_dp_set_subconnector_property(struct drm_connector *connector,
>  				      const u8 *dpcd,
>  				      const u8 port_cap[4]);
>  
> +struct drm_dp_desc;
> +bool drm_dp_has_sink_count(struct drm_connector *connector,
> +			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +			   const struct drm_dp_desc *desc);
> +
>  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
>  void drm_dp_aux_init(struct drm_dp_aux *aux);
>  int drm_dp_aux_register(struct drm_dp_aux *aux);
> @@ -1689,7 +1694,8 @@ enum drm_dp_quirk {
>  	 * @DP_DPCD_QUIRK_NO_SINK_COUNT:
>  	 *
>  	 * The device does not set SINK_COUNT to a non-zero value.
> -	 * The driver should ignore SINK_COUNT during detection.
> +	 * The driver should ignore SINK_COUNT during detection. Note that
> +	 * drm_dp_has_sink_count() automatically checks for this quirk.
>  	 */
>  	DP_DPCD_QUIRK_NO_SINK_COUNT,
>  	/**
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
