From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 4/9] drm/nouveau/kms/nv50-: Fix disabling dithering
Date: Tue, 17 Mar 2020 20:41:01 -0400
Message-ID: <20200318004159.235623-5-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

While we expose the ability to turn off hardware dithering for nouveau,
we actually make the mistake of turning it on anyway, due to
dithering_depth containing a non-zero value if our dithering depth isn't
also set to 6 bpc.

So, fix it by never enabling dithering when it's disabled.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/no=
uveau/dispnv50/head.c
index e29ea40e7c33..72bc3bce396a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -84,18 +84,20 @@ nv50_head_atomic_check_dither(struct nv50_head_atom *=
armh,
 {
 	u32 mode =3D 0x00;
=20
-	if (asyc->dither.mode =3D=3D DITHERING_MODE_AUTO) {
-		if (asyh->base.depth > asyh->or.bpc * 3)
-			mode =3D DITHERING_MODE_DYNAMIC2X2;
-	} else {
-		mode =3D asyc->dither.mode;
-	}
+	if (asyc->dither.mode) {
+		if (asyc->dither.mode =3D=3D DITHERING_MODE_AUTO) {
+			if (asyh->base.depth > asyh->or.bpc * 3)
+				mode =3D DITHERING_MODE_DYNAMIC2X2;
+		} else {
+			mode =3D asyc->dither.mode;
+		}
=20
-	if (asyc->dither.depth =3D=3D DITHERING_DEPTH_AUTO) {
-		if (asyh->or.bpc >=3D 8)
-			mode |=3D DITHERING_DEPTH_8BPC;
-	} else {
-		mode |=3D asyc->dither.depth;
+		if (asyc->dither.depth =3D=3D DITHERING_DEPTH_AUTO) {
+			if (asyh->or.bpc >=3D 8)
+				mode |=3D DITHERING_DEPTH_8BPC;
+		} else {
+			mode |=3D asyc->dither.depth;
+		}
 	}
=20
 	asyh->dither.enable =3D mode;
--=20
2.24.1
