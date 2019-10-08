From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/3] drm/nouveau/kms/nv50-: make unexported items static
Date: Tue,  8 Oct 2019 12:07:38 +0100
Message-ID: <20191008110739.13757-2-ben.dooks@codethink.co.uk>
References: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008110739.13757-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: nouveau.vger.kernel.org

Make functions that are not used directly outside the file
they are in static to avoid the following warnings:

drivers/gpu/drm/nouveau/dispnv50/headc57d.c:73:1: warning: symbol 'headc57d_olut_clr' was not declared. Should it be static?
drivers/gpu/drm/nouveau/dispnv50/headc57d.c:85:1: warning: symbol 'headc57d_olut_set' was not declared. Should it be static?
drivers/gpu/drm/nouveau/dispnv50/headc57d.c:155:1: warning: symbol 'headc57d_olut' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 32a7f9e85fb0..f3d46276a7c4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -69,7 +69,7 @@ headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 	}
 }
 
-void
+static void
 headc57d_olut_clr(struct nv50_head *head)
 {
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
@@ -81,7 +81,7 @@ headc57d_olut_clr(struct nv50_head *head)
 	}
 }
 
-void
+static void
 headc57d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nv50_dmac *core = &nv50_disp(head->base.base.dev)->core->chan;
@@ -151,7 +151,7 @@ headc57d_olut_load(struct drm_color_lut *in, int size, void __iomem *mem)
 	writew(readw(mem - 4), mem + 4);
 }
 
-void
+static void
 headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	asyh->olut.mode = 2; /* DIRECT10 */
-- 
2.23.0
