From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 5/9] drm/nouveau/kms/nv50-: s/harm/armh/g
Date: Tue, 17 Mar 2020 20:41:02 -0400
Message-ID: <20200318004159.235623-6-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We refer to the armed hardware assembly as armh elsewhere in nouveau, so
fix the naming here to make it consistent.

This patch contains no functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
index bb737f9281e6..39cca8eaa066 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -397,7 +397,7 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struc=
t drm_plane_state *state)
 	struct nv50_wndw *wndw =3D nv50_wndw(plane);
 	struct nv50_wndw_atom *armw =3D nv50_wndw_atom(wndw->plane.state);
 	struct nv50_wndw_atom *asyw =3D nv50_wndw_atom(state);
-	struct nv50_head_atom *harm =3D NULL, *asyh =3D NULL;
+	struct nv50_head_atom *armh =3D NULL, *asyh =3D NULL;
 	bool modeset =3D false;
 	int ret;
=20
@@ -418,9 +418,9 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struc=
t drm_plane_state *state)
=20
 	/* Fetch assembly state for the head the window used to belong to. */
 	if (armw->state.crtc) {
-		harm =3D nv50_head_atom_get(asyw->state.state, armw->state.crtc);
-		if (IS_ERR(harm))
-			return PTR_ERR(harm);
+		armh =3D nv50_head_atom_get(asyw->state.state, armw->state.crtc);
+		if (IS_ERR(armh))
+			return PTR_ERR(armh);
 	}
=20
 	/* LUT configuration can potentially cause the window to be disabled. *=
/
@@ -444,8 +444,8 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struc=
t drm_plane_state *state)
 		asyh->wndw.mask |=3D BIT(wndw->id);
 	} else
 	if (armw->visible) {
-		nv50_wndw_atomic_check_release(wndw, asyw, harm);
-		harm->wndw.mask &=3D ~BIT(wndw->id);
+		nv50_wndw_atomic_check_release(wndw, asyw, armh);
+		armh->wndw.mask &=3D ~BIT(wndw->id);
 	} else {
 		return 0;
 	}
--=20
2.24.1
