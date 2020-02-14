From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 4/5] drm/nouveau/kms/nv50-: Move 8BPC limit for MST into nv50_mstc_get_modes()
Date: Fri, 14 Feb 2020 17:58:55 -0500
Message-ID: <20200214225910.695210-5-lyude@redhat.com>
References: <20200214225910.695210-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200214225910.695210-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Manasi Navare <manasi.d.navare@intel.com>, Mikita Lipski <mikita.lipski@amd.com>, Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This just limits the BPC for MST connectors to a maximum of 8 from
nv50_mstc_get_modes(), instead of doing so during
nv50_msto_atomic_check(). This doesn't introduce any functional changes
yet (other then userspace now lying about the max bpc, but we can't
support that yet anyway so meh). But, we'll need this in a moment so
that we can share mode validation between SST and MST which will fix
some real world issues.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
index cab92de3da90..020058811831 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -903,15 +903,9 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 	if (!state->duplicated) {
 		const int clock =3D crtc_state->adjusted_mode.clock;
=20
-		/*
-		 * XXX: Since we don't use HDR in userspace quite yet, limit
-		 * the bpc to 8 to save bandwidth on the topology. In the
-		 * future, we'll want to properly fix this by dynamically
-		 * selecting the highest possible bpc that would fit in the
-		 * topology
-		 */
-		asyh->or.bpc =3D min(connector->display_info.bpc, 8U);
-		asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3, false);
+		asyh->or.bpc =3D connector->display_info.bpc;
+		asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3,
+						    false);
 	}
=20
 	slots =3D drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr, mstc->port,
@@ -1071,8 +1065,17 @@ nv50_mstc_get_modes(struct drm_connector *connecto=
r)
 	if (mstc->edid)
 		ret =3D drm_add_edid_modes(&mstc->connector, mstc->edid);
=20
-	if (!mstc->connector.display_info.bpc)
-		mstc->connector.display_info.bpc =3D 8;
+	/*
+	 * XXX: Since we don't use HDR in userspace quite yet, limit the bpc
+	 * to 8 to save bandwidth on the topology. In the future, we'll want
+	 * to properly fix this by dynamically selecting the highest possible
+	 * bpc that would fit in the topology
+	 */
+	if (connector->display_info.bpc)
+		connector->display_info.bpc =3D
+			clamp(connector->display_info.bpc, 6U, 8U);
+	else
+		connector->display_info.bpc =3D 8;
=20
 	if (mstc->native)
 		drm_mode_destroy(mstc->connector.dev, mstc->native);
--=20
2.24.1
