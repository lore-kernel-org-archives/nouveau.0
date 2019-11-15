From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 3/3] drm/nouveau/kms/nv50-: Limit MST BPC to 8
Date: Fri, 15 Nov 2019 16:07:20 -0500
Message-ID: <20191115210728.3467-4-lyude@redhat.com>
References: <20191115210728.3467-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191115210728.3467-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@redhat.com>, Jerry Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>, Juston Li <juston.li@intel.com>, Sam Ravnborg <sam@ravnborg.org>, Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Noticed this while working on some unrelated CRC stuff. Currently,
userspace has very little support for BPCs higher than 8. While this
doesn't matter for most things, on MST topologies we need to be careful
about ensuring that we do our best to make any given display
configuration fit within the bandwidth restraints of the topology, since
otherwise less people's monitor configurations will work.

Allowing for BPC settings higher than 8 dramatically increases the
required bandwidth for displays in most configurations, and consequently
makes it a lot less likely that said display configurations will pass
the atomic check.

In the future we want to fix this correctly by making it so that we
adjust the bpp for each display in a topology to be as high as possible,
while making sure to lower the bpp of each display in the event that we
run out of bandwidth and need to rerun our atomic check. But for now,
follow the behavior that both i915 and amdgpu are sticking to.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 232c9eec417a ("drm/nouveau: Use atomic VCPI helpers for MST")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@redhat.com>
Cc: Jerry Zuo <Jerry.Zuo@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Juston Li <juston.li@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: <stable@vger.kernel.org> # v5.1+
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouv=
eau/dispnv50/disp.c
index 93665aecce57..9ac47fe519f8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -798,7 +798,14 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 =09if (!state->duplicated) {
 =09=09const int clock =3D crtc_state->adjusted_mode.clock;
=20
-=09=09asyh->or.bpc =3D connector->display_info.bpc;
+=09=09/*
+=09=09 * XXX: Since we don't use HDR in userspace quite yet, limit
+=09=09 * the bpc to 8 to save bandwidth on the topology. In the
+=09=09 * future, we'll want to properly fix this by dynamically
+=09=09 * selecting the highest possible bpc that would fit in the
+=09=09 * topology
+=09=09 */
+=09=09asyh->or.bpc =3D min(connector->display_info.bpc, 8U);
 =09=09asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3);
 =09}
=20
--=20
2.21.0
