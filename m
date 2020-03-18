From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/2] drm/nouveau/connector: Fix DDC error when probing force-disabled connectors
Date: Tue, 17 Mar 2020 20:04:23 -0400
Message-ID: <20200318000423.205005-2-lyude@redhat.com>
References: <20200318000423.205005-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200318000423.205005-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
index 0d42a7e5deff..9fb00c4b9764 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -550,6 +550,9 @@ nouveau_connector_detect(struct drm_connector *connec=
tor, bool force)
 	int ret;
 	enum drm_connector_status conn_status =3D connector_status_disconnected=
;
=20
+	if (connector->force =3D=3D DRM_FORCE_OFF)
+		return conn_status;
+
 	/* Cleanup the previous EDID block. */
 	if (nv_connector->edid) {
 		drm_connector_update_edid_property(connector, NULL);
--=20
2.24.1
