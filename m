From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50: enable cube map array texture support
Date: Wed, 19 Feb 2014 00:05:55 -0500
Message-ID: <1392786355-30849-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Christoph Bumiller <e0425955@student.tuwien.ac.at>, nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

All the arb_texture_cube_map_array piglits pass except the sampler-cube-shadow
one. However, nva0+ appear to all fail at the non-array version of that test,
sampler-cube-shadow, so I think it's very likely to be related. Probably some
sampler setup bits changed.

 src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp | 5 +++--
 src/gallium/drivers/nouveau/nv50/nv50_screen.c                | 3 ---
 src/gallium/drivers/nouveau/nv50/nv50_tex.c                   | 8 ++++----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index 984a8ca..0908447 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -664,7 +664,7 @@ NV50LoweringPreSSA::handleTEX(TexInstruction *i)
          bld.mkOp2(OP_MIN, TYPE_U32, src, src, bld.loadImm(NULL, 511));
          i->setSrc(arg - 1, src);
       }
-      if (i->tex.target.isCube()) {
+      if (i->tex.target.isCube() && i->srcCount() > 4) {
          std::vector<Value *> acube, a2d;
          int c;
 
@@ -681,9 +681,10 @@ NV50LoweringPreSSA::handleTEX(TexInstruction *i)
 
          for (c = 0; c < 3; ++c)
             i->setSrc(c, a2d[c]);
-         i->setSrc(c, NULL);
          for (; i->srcExists(c + 1); ++c)
             i->setSrc(c, i->getSrc(c + 1));
+         i->setSrc(c, NULL);
+         assert(c <= 4);
 
          i->tex.target = i->tex.target.isShadow() ?
             TEX_TARGET_2D_ARRAY_SHADOW : TEX_TARGET_2D_ARRAY;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 781b391..0ebcbb8 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -112,10 +112,7 @@ nv50_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
    case PIPE_CAP_SEAMLESS_CUBE_MAP_PER_TEXTURE:
       return 0;
    case PIPE_CAP_CUBE_MAP_ARRAY:
-      return 0;
-      /*
       return nv50_screen(pscreen)->tesla->oclass >= NVA3_3D_CLASS;
-      */
    case PIPE_CAP_TWO_SIDED_STENCIL:
    case PIPE_CAP_DEPTH_CLIP_DISABLE:
    case PIPE_CAP_POINT_SPRITE:
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_tex.c b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
index 6784821..5cfce3a 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
@@ -115,12 +115,12 @@ nv50_create_texture_view(struct pipe_context *pipe,
 
    addr = mt->base.address;
 
-   if (mt->base.base.target == PIPE_TEXTURE_1D_ARRAY ||
-       mt->base.base.target == PIPE_TEXTURE_2D_ARRAY) {
+   depth = MAX2(mt->base.base.array_size, mt->base.base.depth0);
+
+   if (mt->base.base.array_size > 1) {
+      /* there doesn't seem to be a base layer field in TIC */
       addr += view->pipe.u.tex.first_layer * mt->layer_stride;
       depth = view->pipe.u.tex.last_layer - view->pipe.u.tex.first_layer + 1;
-   } else {
-      depth = mt->base.base.depth0;
    }
 
    tic[2] = 0x10001000 | NV50_TIC_2_NO_BORDER;
-- 
1.8.3.2
