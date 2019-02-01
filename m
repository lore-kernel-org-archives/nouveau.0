From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/4] drm/dp_mst: Remove port validation in
 drm_dp_atomic_find_vcpi_slots()
Date: Fri, 1 Feb 2019 18:54:17 +0100
Message-ID: <20190201175417.GG3271@phenom.ffwll.local>
References: <20190201011506.21055-1-lyude@redhat.com>
 <20190201011506.21055-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190201011506.21055-3-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <karolherbst@gmail.com>, Ilia Mirkin <imirkin@alum.mit.edu>, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Jan 31, 2019 at 08:14:49PM -0500, Lyude Paul wrote:
> Since we now have an easy way of refcounting drm_dp_mst_port structs and
> safely accessing their contents, there isn't any good reason to keep
> validating ports here. It doesn't prevent us from performing modesets on
> branch devices that have been removed either, and we already disallow
> enabling new displays on unregistered connectors in
> update_connector_routing() in drm_atomic_check_modeset(). All it does is
> cause us to have to make weird special exceptions in our atomic
> modesetting code. So, get rid of it entirely.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: eceae1472467 ("drm/dp_mst: Start tracking per-port VCPI allocations")
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c   | 12 ++----------
>  drivers/gpu/drm/i915/intel_dp_mst.c     | 17 ++++++-----------
>  drivers/gpu/drm/nouveau/dispnv50/disp.c |  3 +--
>  3 files changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index abb0ea8ba9d9..4325e1518286 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3117,10 +3117,6 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>  	if (IS_ERR(topology_state))
>  		return PTR_ERR(topology_state);
>  
> -	port = drm_dp_mst_topology_get_port_validated(mgr, port);
> -	if (port == NULL)
> -		return -EINVAL;
> -
>  	/* Find the current allocation for this port, if any */
>  	list_for_each_entry(pos, &topology_state->vcpis, next) {
>  		if (pos->port == port) {

Also noticed that the WARN_ON() return -EINVAL; here gets fixed with this
patch.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> @@ -3153,10 +3149,8 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>  	/* Add the new allocation to the state */
>  	if (!vcpi) {
>  		vcpi = kzalloc(sizeof(*vcpi), GFP_KERNEL);
> -		if (!vcpi) {
> -			ret = -ENOMEM;
> -			goto out;
> -		}
> +		if (!vcpi)
> +			return -ENOMEM;
>  
>  		drm_dp_mst_get_port_malloc(port);
>  		vcpi->port = port;
> @@ -3165,8 +3159,6 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
>  	vcpi->vcpi = req_slots;
>  
>  	ret = req_slots;
> -out:
> -	drm_dp_mst_topology_put_port(port);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_find_vcpi_slots);
> diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
> index cdb83d294cdd..fb67cd931117 100644
> --- a/drivers/gpu/drm/i915/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/intel_dp_mst.c
> @@ -80,17 +80,12 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  	mst_pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock, bpp);
>  	pipe_config->pbn = mst_pbn;
>  
> -	/* Zombie connectors can't have VCPI slots */
> -	if (!drm_connector_is_unregistered(connector)) {
> -		slots = drm_dp_atomic_find_vcpi_slots(state,
> -						      &intel_dp->mst_mgr,
> -						      port,
> -						      mst_pbn);
> -		if (slots < 0) {
> -			DRM_DEBUG_KMS("failed finding vcpi slots:%d\n",
> -				      slots);
> -			return slots;
> -		}
> +	slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr, port,
> +					      mst_pbn);
> +	if (slots < 0) {
> +		DRM_DEBUG_KMS("failed finding vcpi slots:%d\n",
> +			      slots);
> +		return slots;
>  	}
>  
>  	intel_link_compute_m_n(bpp, lane_count,
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 2e8a5fd9b262..60d858c2f2ce 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -771,8 +771,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  	mstc->pbn = drm_dp_calc_pbn_mode(crtc_state->adjusted_mode.clock,
>  					 bpp);
>  
> -	if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> -	    !drm_connector_is_unregistered(connector)) {
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
>  						      mstc->port, mstc->pbn);
>  		if (slots < 0)
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
