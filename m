From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/nouveau: Fix nouveau_connector_ddc_detect()
Date: Thu, 30 Aug 2018 20:36:03 +0300
Message-ID: <20180830173603.GP5565@intel.com>
References: <20180830171628.23999-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180830171628.23999-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, Aug 30, 2018 at 01:16:28PM -0400, Lyude Paul wrote:
> It looks like that when we moved over to using
> drm_connector_for_each_possible_encoder() in nouveau, that one rather
> important part of this function got dropped by accident:
> 
> 	/*          Right   v   here */
> 	for (i = 0; nv_encoder = NULL, i < DRM_CONNECTOR_MAX_ENCODER; i++) {
> 		int id = connector->encoder_ids[i];
> 		if (id == 0)
> 			break;
> 
> Since it's rather difficult to notice: the conditional in this loop is
> actually:
> 
> 	nv_encoder = NULL, i < DRM_CONNECTOR_MAX_ENCODER
> 
> Meaning that all early breaks result in nv_encoder keeping it's value,
> otherwise nv_encoder = NULL. Ugh.
> 
> Since this got dropped, nouveau_connector_ddc_detect() now returns an
> encoder for every single connector, regardless of whether or not it's
> detected:
> 
>     [ 1780.056185] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP-2
> 
> So: fix this to ensure we only return an encoder if we actually found
> one, and clean up the rest of the function while we're at it since it's
> nearly impossible to read properly.
> 
> Changes since v1:
> - Don't skip ddc probing for LVDS if we can't switch DDC through
>   vga-switcheroo, just do the DDC probing without calling
>   vga_switcheroo_lock_ddc() - skeggsb
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Fixes: ddba766dd07e ("drm/nouveau: Use drm_connector_for_each_possible_encoder()")
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 49 ++++++++++++---------
>  1 file changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 71c3bd8ff9f8..461111aaedc4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -414,9 +414,10 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
>  	struct nouveau_connector *nv_connector = nouveau_connector(connector);
>  	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
> -	struct nouveau_encoder *nv_encoder = NULL;
> +	struct nouveau_encoder *nv_encoder = NULL, *found = NULL;
>  	struct drm_encoder *encoder;
> -	int i, panel = -ENODEV;
> +	int i, ret, panel = -ENODEV;
> +	bool switcheroo_ddc = false;
>  
>  	/* eDP panels need powering on by us (if the VBIOS doesn't default it
>  	 * to on) before doing any AUX channel transactions.  LVDS panel power
> @@ -433,37 +434,43 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
>  	drm_connector_for_each_possible_encoder(connector, encoder, i) {
>  		nv_encoder = nouveau_encoder(encoder);
>  
> -		if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> -			int ret = nouveau_dp_detect(nv_encoder);
> +		switch (nv_encoder->dcb->type) {
> +		case DCB_OUTPUT_DP:
> +			ret = nouveau_dp_detect(nv_encoder);
>  			if (ret == NOUVEAU_DP_MST)
>  				return NULL;
> -			if (ret == NOUVEAU_DP_SST)
> -				break;
> -		} else
> -		if ((vga_switcheroo_handler_flags() &
> -		     VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
> -		    nv_encoder->dcb->type == DCB_OUTPUT_LVDS &&
> -		    nv_encoder->i2c) {
> -			int ret;
> -			vga_switcheroo_lock_ddc(dev->pdev);
> -			ret = nvkm_probe_i2c(nv_encoder->i2c, 0x50);
> -			vga_switcheroo_unlock_ddc(dev->pdev);
> -			if (ret)
> +			else if (ret == NOUVEAU_DP_SST)
> +				found = nv_encoder;
> +
> +			break;
> +		case DCB_OUTPUT_LVDS:
> +			switcheroo_ddc = !!(vga_switcheroo_handler_flags() &
> +					    VGA_SWITCHEROO_CAN_SWITCH_DDC);
> +		/* fall-through */
> +		default:
> +			if (!nv_encoder->i2c)
>  				break;
> -		} else
> -		if (nv_encoder->i2c) {
> +
> +			if (switcheroo_ddc)
> +				vga_switcheroo_lock_ddc(dev->pdev);
>  			if (nvkm_probe_i2c(nv_encoder->i2c, 0x50))
> -				break;
> +				found = nv_encoder;
> +			if (switcheroo_ddc)
> +				vga_switcheroo_unlock_ddc(dev->pdev);
> +
> +			break;
>  		}
> +		if (found)
> +			break;

The diff is rather messy due to the change to a switch, but after staring
at it for a while it does look correct to me.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
and sorry for the mess.

>  	}
>  
>  	/* eDP panel not detected, restore panel power GPIO to previous
>  	 * state to avoid confusing the SOR for other output types.
>  	 */
> -	if (!nv_encoder && panel == 0)
> +	if (!found && panel == 0)
>  		nvkm_gpio_set(gpio, 0, DCB_GPIO_PANEL_POWER, 0xff, panel);
>  
> -	return nv_encoder;
> +	return found;
>  }
>  
>  static struct nouveau_encoder *
> -- 
> 2.17.1

-- 
Ville Syrjälä
Intel
