From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Don't show connectors as connected
 before probing available PBN
Date: Thu, 5 Mar 2020 20:29:42 +0200
Message-ID: <20200305182942.GP13686@intel.com>
References: <20200304223614.312023-1-lyude@redhat.com>
 <20200304223614.312023-3-lyude@redhat.com>
 <20200305131119.GJ13686@intel.com>
 <73f52c392431cd21a80a118dd2fd1986e2c535df.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73f52c392431cd21a80a118dd2fd1986e2c535df.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>, Mikita Lipski <mikita.lipski@amd.com>
List-Id: nouveau.vger.kernel.org

On Thu, Mar 05, 2020 at 01:13:36PM -0500, Lyude Paul wrote:
> On Thu, 2020-03-05 at 15:11 +0200, Ville Syrjälä wrote:
> > On Wed, Mar 04, 2020 at 05:36:12PM -0500, Lyude Paul wrote:
> > > It's next to impossible for us to do connector probing on topologies
> > > without occasionally racing with userspace, since creating a connector
> > > itself causes a hotplug event which we have to send before probing the
> > > available PBN of a connector. Even if we didn't have this hotplug event
> > > sent, there's still always a chance that userspace started probing
> > > connectors before we finished probing the topology.
> > > 
> > > This can be a problem when validating a new MST state since the
> > > connector will be shown as connected briefly, but without any available
> > > PBN - causing any atomic state which would enable said connector to fail
> > > with -ENOSPC. So, let's simply workaround this by telling userspace new
> > > MST connectors are disconnected until we've finished probing their PBN.
> > > Since we always send a hotplug event at the end of the link address
> > > probing process, userspace will still know to reprobe the connector when
> > > we're ready.
> > > 
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
> > > atomic check")
> > > Cc: Mikita Lipski <mikita.lipski@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Sean Paul <seanpaul@google.com>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 207eef08d12c..7b0ff0cff954 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -4033,6 +4033,19 @@ drm_dp_mst_detect_port(struct drm_connector
> > > *connector,
> > >  			ret = connector_status_connected;
> > >  		break;
> > >  	}
> > > +
> > > +	/* We don't want to tell userspace the port is actually plugged into
> > > +	 * anything until we've finished probing it's available_pbn, otherwise
> > 
> > "its"
> > 
> > Why is the connector even registered before we've finished the probe?
> > 
> Oops, I'm not sure how I did this by accident but the explanation I gave in
> the commit message was uh, completely wrong. I must have forgotten that I made
> sure we didn't expose connectors before probing their PBN back when I started
> my MST cleanup....
> 
> So: despite what I said before it's not actually when new connectors are
> created, it's when downstream hotplugs happen which means that the conenctor's
> always going to be there before we probe the available_pbn.

Not sure I understand. You're saying this is going to change for already
existing connectors when something else gets plugged in, and either we
zero it out during the probe or it always was zero to begin with for
whatever reason?

> I did just notice
> though that we send a hotplug on connection status notifications even before
> we've finished the PBN probe, so I might be able to improve on that as well.
> We still definitely want to report the connector as disconnected before we
> have the available PBN though, in case another probe was already going before
> we got the connection status notification.
> 
> I'll make sure to fixup the explanation in the commit message on the next
> respin
> 
> > > +	 * userspace will see racy atomic check failures
> > > +	 *
> > > +	 * Since we always send a hotplug at the end of probing topology
> > > +	 * state, we can just let userspace reprobe this connector later.
> > > +	 */
> > > +	if (ret == connector_status_connected && !port->available_pbn) {
> > > +		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] not ready yet (PBN not
> > > probed)\n",
> > > +			      connector->base.id, connector->name);
> > > +		ret = connector_status_disconnected;
> > > +	}
> > >  out:
> > >  	drm_dp_mst_topology_put_port(port);
> > >  	return ret;
> > > -- 
> > > 2.24.1
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> -- 
> Cheers,
> 	Lyude Paul (she/her)
> 	Associate Software Engineer at Red Hat

-- 
Ville Syrjälä
Intel
