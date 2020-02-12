From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/4] drm/nouveau/kms/gv100-: Add support for interlaced modes
Date: Wed, 12 Feb 2020 18:00:36 -0500
Message-ID: <20200212230043.170477-3-lyude@redhat.com>
References: <20200212230043.170477-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200212230043.170477-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We advertise being able to set interlaced modes, so let's actually make
sure to do that. Otherwise, we'll end up hanging the display engine due
to trying to set a mode with timings adjusted for interlacing without
telling the hardware it's actually an interlaced mode.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 5 +++--
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/headc37d.c
index 00011ce109a6..4a9a32b89f74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -168,14 +168,15 @@ headc37d_mode(struct nv50_head *head, struct nv50_h=
ead_atom *asyh)
 	struct nv50_dmac *core =3D &nv50_disp(head->base.base.dev)->core->chan;
 	struct nv50_head_mode *m =3D &asyh->mode;
 	u32 *push;
-	if ((push =3D evo_wait(core, 12))) {
+	if ((push =3D evo_wait(core, 13))) {
 		evo_mthd(push, 0x2064 + (head->base.index * 0x400), 5);
 		evo_data(push, (m->v.active  << 16) | m->h.active );
 		evo_data(push, (m->v.synce   << 16) | m->h.synce  );
 		evo_data(push, (m->v.blanke  << 16) | m->h.blanke );
 		evo_data(push, (m->v.blanks  << 16) | m->h.blanks );
 		evo_data(push, (m->v.blank2e << 16) | m->v.blank2s);
-		evo_mthd(push, 0x200c + (head->base.index * 0x400), 1);
+		evo_mthd(push, 0x2008 + (head->base.index * 0x400), 2);
+		evo_data(push, m->interlace);
 		evo_data(push, m->clock * 1000);
 		evo_mthd(push, 0x2028 + (head->base.index * 0x400), 1);
 		evo_data(push, m->clock * 1000);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/headc57d.c
index 938d910a1b1e..859131a8bc3c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -173,14 +173,15 @@ headc57d_mode(struct nv50_head *head, struct nv50_h=
ead_atom *asyh)
 	struct nv50_dmac *core =3D &nv50_disp(head->base.base.dev)->core->chan;
 	struct nv50_head_mode *m =3D &asyh->mode;
 	u32 *push;
-	if ((push =3D evo_wait(core, 12))) {
+	if ((push =3D evo_wait(core, 13))) {
 		evo_mthd(push, 0x2064 + (head->base.index * 0x400), 5);
 		evo_data(push, (m->v.active  << 16) | m->h.active );
 		evo_data(push, (m->v.synce   << 16) | m->h.synce  );
 		evo_data(push, (m->v.blanke  << 16) | m->h.blanke );
 		evo_data(push, (m->v.blanks  << 16) | m->h.blanks );
 		evo_data(push, (m->v.blank2e << 16) | m->v.blank2s);
-		evo_mthd(push, 0x200c + (head->base.index * 0x400), 1);
+		evo_mthd(push, 0x2008 + (head->base.index * 0x400), 2);
+		evo_data(push, m->interlace);
 		evo_data(push, m->clock * 1000);
 		evo_mthd(push, 0x2028 + (head->base.index * 0x400), 1);
 		evo_data(push, m->clock * 1000);
--=20
2.24.1
