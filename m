From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau/connector: Fix indenting in nouveau_connector_detect()
Date: Tue, 17 Mar 2020 20:04:22 -0400
Message-ID: <20200318000423.205005-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

No functional changes

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
index 9a9a7f5003d3..0d42a7e5deff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -582,7 +582,7 @@ nouveau_connector_detect(struct drm_connector *connec=
tor, bool force)
 			nv_connector->edid =3D drm_get_edid(connector, i2c);
=20
 		drm_connector_update_edid_property(connector,
-							nv_connector->edid);
+						   nv_connector->edid);
 		if (!nv_connector->edid) {
 			NV_ERROR(drm, "DDC responded, but no EDID for %s\n",
 				 connector->name);
@@ -635,7 +635,7 @@ nouveau_connector_detect(struct drm_connector *connec=
tor, bool force)
 						encoder->helper_private;
=20
 		if (helper->detect(encoder, connector) =3D=3D
-						connector_status_connected) {
+		    connector_status_connected) {
 			nouveau_connector_set_encoder(connector, nv_encoder);
 			conn_status =3D connector_status_connected;
 			goto out;
--=20
2.24.1
