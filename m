From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 3/9] drm/nouveau/kms/nv140-: Don't modify depth in state during atomic commit
Date: Tue, 17 Mar 2020 20:41:00 -0400
Message-ID: <20200318004159.235623-4-lyude@redhat.com>
References: <20200318004159.235623-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200318004159.235623-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Currently, we modify the depth value stored in the atomic state when
performing a commit in order to workaround the fact we haven't
implemented support for depths higher then 10 yet. This isn't idempotent
though, as it will happen every atomic commit where we modify the OR
state even if the head's depth in the atomic state hasn't been modified.

Normally this wouldn't matter, since we don't modify OR state outside of
modesets, but since the CRC capture region is implemented as part of the
OR state in hardware we'll want to make sure all commits modifying OR
state are idempotent so as to avoid changing the depth unexpectedly.

So, fix this by simply not writing the reduced depth value we come up
with to the atomic state.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 11 +++++++----
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 11 +++++++----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/headc37d.c
index 00011ce109a6..68920f8d9c79 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -27,17 +27,20 @@ static void
 headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nv50_dmac *core =3D &nv50_disp(head->base.base.dev)->core->chan;
+	u8 depth;
 	u32 *push;
+
 	if ((push =3D evo_wait(core, 2))) {
 		/*XXX: This is a dirty hack until OR depth handling is
 		 *     improved later for deep colour etc.
 		 */
 		switch (asyh->or.depth) {
-		case 6: asyh->or.depth =3D 5; break;
-		case 5: asyh->or.depth =3D 4; break;
-		case 2: asyh->or.depth =3D 1; break;
-		case 0:	asyh->or.depth =3D 4; break;
+		case 6: depth =3D 5; break;
+		case 5: depth =3D 4; break;
+		case 2: depth =3D 1; break;
+		case 0:	depth =3D 4; break;
 		default:
+			depth =3D asyh->or.depth;
 			WARN_ON(1);
 			break;
 		}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/headc57d.c
index 938d910a1b1e..0296cd1d761f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -27,17 +27,20 @@ static void
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nv50_dmac *core =3D &nv50_disp(head->base.base.dev)->core->chan;
+	u8 depth;
 	u32 *push;
+
 	if ((push =3D evo_wait(core, 2))) {
 		/*XXX: This is a dirty hack until OR depth handling is
 		 *     improved later for deep colour etc.
 		 */
 		switch (asyh->or.depth) {
-		case 6: asyh->or.depth =3D 5; break;
-		case 5: asyh->or.depth =3D 4; break;
-		case 2: asyh->or.depth =3D 1; break;
-		case 0:	asyh->or.depth =3D 4; break;
+		case 6: depth =3D 5; break;
+		case 5: depth =3D 4; break;
+		case 2: depth =3D 1; break;
+		case 0:	depth =3D 4; break;
 		default:
+			depth =3D asyh->or.depth;
 			WARN_ON(1);
 			break;
 		}
--=20
2.24.1
