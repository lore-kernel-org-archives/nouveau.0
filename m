From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Don't show connectors as connected
 before probing available PBN
Date: Thu, 5 Mar 2020 15:11:19 +0200
Message-ID: <20200305131119.GJ13686@intel.com>
References: <20200304223614.312023-1-lyude@redhat.com>
 <20200304223614.312023-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200304223614.312023-3-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>, Mikita Lipski <mikita.lipski@amd.com>
List-Id: nouveau.vger.kernel.org

On Wed, Mar 04, 2020 at 05:36:12PM -0500, Lyude Paul wrote:
> It's next to impossible for us to do connector probing on topologies
> without occasionally racing with userspace, since creating a connector
> itself causes a hotplug event which we have to send before probing the
> available PBN of a connector. Even if we didn't have this hotplug event
> sent, there's still always a chance that userspace started probing
> connectors before we finished probing the topology.
> 
> This can be a problem when validating a new MST state since the
> connector will be shown as connected briefly, but without any available
> PBN - causing any atomic state which would enable said connector to fail
> with -ENOSPC. So, let's simply workaround this by telling userspace new
> MST connectors are disconnected until we've finished probing their PBN.
> Since we always send a hotplug event at the end of the link address
> probing process, userspace will still know to reprobe the connector when
> we're ready.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Sean Paul <seanpaul@google.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 207eef08d12c..7b0ff0cff954 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4033,6 +4033,19 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>  			ret = connector_status_connected;
>  		break;
>  	}
> +
> +	/* We don't want to tell userspace the port is actually plugged into
> +	 * anything until we've finished probing it's available_pbn, otherwise

"its"

Why is the connector even registered before we've finished the probe?

> +	 * userspace will see racy atomic check failures
> +	 *
> +	 * Since we always send a hotplug at the end of probing topology
> +	 * state, we can just let userspace reprobe this connector later.
> +	 */
> +	if (ret == connector_status_connected && !port->available_pbn) {
> +		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] not ready yet (PBN not probed)\n",
> +			      connector->base.id, connector->name);
> +		ret = connector_status_disconnected;
> +	}
>  out:
>  	drm_dp_mst_topology_put_port(port);
>  	return ret;
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
