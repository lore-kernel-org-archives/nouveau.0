From: Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: missing cases of rename ttm_mem_reg
 to ttm_resource.
Date: Thu,  6 Aug 2020 21:15:17 -0400
Message-ID: <20200807011517.2814096-1-rodrigo.vivi@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Rodrigo Vivi <rodrigo.vivi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

These are missed cases that I just identified with allyesconfig build.

Fixes: 2966141ad2dd ("drm/ttm: rename ttm_mem_reg to ttm_resource.")
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.h     | 14 +++++++-------
 drivers/gpu/drm/nouveau/nouveau_bo0039.c |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo5039.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 52489ce7d029c..aecb7481df0da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -139,28 +139,28 @@ nouveau_bo_new_pin_map(struct nouveau_cli *cli, u64 size, int align, u32 flags,
 
 int nv04_bo_move_init(struct nouveau_channel *, u32);
 int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nv50_bo_move_init(struct nouveau_channel *, u32);
 int nv50_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nv84_bo_move_exec(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nva3_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nvc0_bo_move_init(struct nouveau_channel *, u32);
 int nvc0_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nvc0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 int nve0_bo_move_init(struct nouveau_channel *, u32);
 int nve0_bo_move_copy(struct nouveau_channel *, struct ttm_buffer_object *,
-		      struct ttm_mem_reg *, struct ttm_mem_reg *);
+		      struct ttm_resource *, struct ttm_resource *);
 
 #define NVBO_WR32_(b,o,dr,f) nouveau_bo_wr32((b), (o)/4 + (dr), (f))
 #define NVBO_RD32_(b,o,dr)   nouveau_bo_rd32((b), (o)/4 + (dr))
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index bf7ae2cecaf68..7390132129fe7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -36,7 +36,7 @@
 
 static inline uint32_t
 nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
-		      struct nouveau_channel *chan, struct ttm_mem_reg *reg)
+		      struct nouveau_channel *chan, struct ttm_resource *reg)
 {
 	if (reg->mem_type == TTM_PL_TT)
 		return NvDmaTT;
@@ -45,7 +45,7 @@ nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
 
 int
 nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nvif_push *push = chan->chan.push;
 	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index f9b9b85abe444..4c75c7b3804ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -37,7 +37,7 @@
 
 int
 nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
index 1b5fd78ddcba9..ed6c09d678407 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
@@ -34,7 +34,7 @@
 
 int
 nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
index f0df172b029e0..dec29b2d8bb22 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
@@ -38,7 +38,7 @@
 
 int
 nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
index 52fefb37064c8..776b04976cdfa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
@@ -36,7 +36,7 @@
 
 int
 nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nvif_push *push = chan->chan.push;
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
index 34b79d561c7f4..8499f58213e3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
@@ -31,7 +31,7 @@
 
 int
 nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
index 394e29012e504..575212472e7a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
@@ -36,7 +36,7 @@
 
 int
 nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
-		  struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
+		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	struct nvif_push *push = chan->chan.push;
-- 
2.26.2
