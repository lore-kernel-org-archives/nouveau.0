From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/3] drm/dp_mst: Rename drm_dp_mst_is_dp_mst_end_device() to be less redundant
Date: Wed,  4 Mar 2020 17:36:11 -0500
Message-ID: <20200304223614.312023-2-lyude@redhat.com>
References: <20200304223614.312023-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mikita Lipski <mikita.lipski@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@google.com>, Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

It's already prefixed by dp_mst, so we don't really need to repeat
ourselves here. One of the changes I should have picked up originally
when reviewing MST DSC support.

There should be no functional changes here

Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_=
dp_mst_topology.c
index 61e7beada832..207eef08d12c 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1937,7 +1937,7 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_po=
rt *port,
 	return parent_lct + 1;
 }
=20
-static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
+static bool drm_dp_mst_is_end_device(u8 pdt, bool mcs)
 {
 	switch (pdt) {
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
@@ -1967,13 +1967,13 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port,=
 u8 new_pdt,
=20
 	/* Teardown the old pdt, if there is one */
 	if (port->pdt !=3D DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/*
 			 * If the new PDT would also have an i2c bus,
 			 * don't bother with reregistering it
 			 */
 			if (new_pdt !=3D DP_PEER_DEVICE_NONE &&
-			    drm_dp_mst_is_dp_mst_end_device(new_pdt, new_mcs)) {
+			    drm_dp_mst_is_end_device(new_pdt, new_mcs)) {
 				port->pdt =3D new_pdt;
 				port->mcs =3D new_mcs;
 				return 0;
@@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u=
8 new_pdt,
 	port->mcs =3D new_mcs;
=20
 	if (port->pdt !=3D DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/* add i2c over sideband */
 			ret =3D drm_dp_mst_register_i2c_bus(&port->aux);
 		} else {
@@ -2169,7 +2169,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_bra=
nch *mstb,
 	}
=20
 	if (port->pdt !=3D DP_PEER_DEVICE_NONE &&
-	    drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 		port->cached_edid =3D drm_get_edid(port->connector,
 						 &port->aux.ddc);
 		drm_connector_set_tile_property(port->connector);
--=20
2.24.1
