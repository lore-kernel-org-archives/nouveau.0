From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/kms/gv100-: Re-set LUT after clearing for modesets
Date: Wed, 12 Feb 2020 18:11:49 -0500
Message-ID: <20200212231150.171495-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

While certain modeset operations on gv100+ need us to temporarily
disable the LUT, we make the mistake of sometimes neglecting to
reprogram the LUT after such modesets. In particular, moving a head from
one encoder to another seems to trigger this quite often. GV100+ is very
picky about having a LUT in most scenarios, so this causes the display
engine to hang with the following error code:

disp: chid 1 stat 00005080 reason 5 [INVALID_STATE] mthd 0200 data
00000001 code 0000002d)

So, fix this by always re-programming the LUT if we're clearing it in a
state where the wndw is still visible, and has a XLUT handle programmed.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: facaed62b4cb ("drm/nouveau/kms/gv100: initial support")
Cc: <stable@vger.kernel.org> # v4.18+
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
index 890315291b01..bb737f9281e6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -458,6 +458,8 @@ nv50_wndw_atomic_check(struct drm_plane *plane, struc=
t drm_plane_state *state)
 		asyw->clr.ntfy =3D armw->ntfy.handle !=3D 0;
 		asyw->clr.sema =3D armw->sema.handle !=3D 0;
 		asyw->clr.xlut =3D armw->xlut.handle !=3D 0;
+		if (asyw->clr.xlut && asyw->visible)
+			asyw->set.xlut =3D asyw->xlut.handle !=3D 0;
 		asyw->clr.csc  =3D armw->csc.valid;
 		if (wndw->func->image_clr)
 			asyw->clr.image =3D armw->image.handle[0] !=3D 0;
--=20
2.24.1
