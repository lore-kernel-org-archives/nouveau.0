From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/3] drm/dp_mst: Don't show connectors as connected before probing available PBN
Date: Wed,  4 Mar 2020 17:36:12 -0500
Message-ID: <20200304223614.312023-3-lyude@redhat.com>
References: <20200304223614.312023-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mikita Lipski <mikita.lipski@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@google.com>, Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

It's next to impossible for us to do connector probing on topologies
without occasionally racing with userspace, since creating a connector
itself causes a hotplug event which we have to send before probing the
available PBN of a connector. Even if we didn't have this hotplug event
sent, there's still always a chance that userspace started probing
connectors before we finished probing the topology.

This can be a problem when validating a new MST state since the
connector will be shown as connected briefly, but without any available
PBN - causing any atomic state which would enable said connector to fail
with -ENOSPC. So, let's simply workaround this by telling userspace new
MST connectors are disconnected until we've finished probing their PBN.
Since we always send a hotplug event at the end of the link address
probing process, userspace will still know to reprobe the connector when
we're ready.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST =
atomic check")
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
index 207eef08d12c..7b0ff0cff954 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4033,6 +4033,19 @@ drm_dp_mst_detect_port(struct drm_connector *conne=
ctor,
 			ret =3D connector_status_connected;
 		break;
 	}
+
+	/* We don't want to tell userspace the port is actually plugged into
+	 * anything until we've finished probing it's available_pbn, otherwise
+	 * userspace will see racy atomic check failures
+	 *
+	 * Since we always send a hotplug at the end of probing topology
+	 * state, we can just let userspace reprobe this connector later.
+	 */
+	if (ret =3D=3D connector_status_connected && !port->available_pbn) {
+		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] not ready yet (PBN not probed)\n",
+			      connector->base.id, connector->name);
+		ret =3D connector_status_disconnected;
+	}
 out:
 	drm_dp_mst_topology_put_port(port);
 	return ret;
--=20
2.24.1
