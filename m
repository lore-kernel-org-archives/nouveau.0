From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/5] drm/nouveau/gr/gf100-: make undeclared symbols static
Date: Tue,  8 Oct 2019 12:35:55 +0100
Message-ID: <20191008113559.29569-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: nouveau.vger.kernel.org

The following functions are not declared outside of the
file they are in, so make them static to avoid these
warnings:

drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:745:1: warning: symbol 'gf100_gr_fecs_start_ctxsw' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:760:1: warning: symbol 'gf100_gr_fecs_stop_ctxsw' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:2071:1: warning: symbol 'gf100_gr_ctor_fw_legacy' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index c578deb5867a..f1d1174ce67a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -741,7 +741,7 @@ gf100_gr_fecs_ctrl_ctxsw(struct gf100_gr *gr, u32 mthd)
 	return -ETIMEDOUT;
 }
 
-int
+static int
 gf100_gr_fecs_start_ctxsw(struct nvkm_gr *base)
 {
 	struct gf100_gr *gr = gf100_gr(base);
@@ -756,7 +756,7 @@ gf100_gr_fecs_start_ctxsw(struct nvkm_gr *base)
 	return ret;
 }
 
-int
+static int
 gf100_gr_fecs_stop_ctxsw(struct nvkm_gr *base)
 {
 	struct gf100_gr *gr = gf100_gr(base);
@@ -2067,7 +2067,7 @@ gf100_gr_ = {
 	.ctxsw.inst = gf100_gr_ctxsw_inst,
 };
 
-int
+static int
 gf100_gr_ctor_fw_legacy(struct gf100_gr *gr, const char *fwname,
 			struct gf100_gr_fuc *fuc, int ret)
 {
-- 
2.23.0
