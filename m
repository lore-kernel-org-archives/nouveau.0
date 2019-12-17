From: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix ttm move init with multiple GPUs
Date: Mon, 16 Dec 2019 16:56:12 -0800
Message-ID: <20191217005612.2827-1-jajones@nvidia.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The pointer used to walk the table of move ops
and pick the right one for the current GPU was
declared static, meaning its state was carried
over between invocations of the function, and also
made the function non-rentrant and thread-unsafe.
Since the table is ordered such that newer GPU
methods are listed first, the result of this was
that initializing newer GPUs after older GPUs
would result in no suitable ttm move acceleration
operations being found, and ttm would fall back
to CPU blits on the older GPUs.

This change declares the walking pointer
separately from the table and makes it non-static
to fix the logic.

Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f8015e0318d7..1b62ccc57aef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1162,7 +1162,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 void
 nouveau_bo_move_init(struct nouveau_drm *drm)
 {
-	static const struct {
+	static const struct _method_table {
 		const char *name;
 		int engine;
 		s32 oclass;
@@ -1192,7 +1192,8 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 		{  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
 		{},
 		{ "CRYPT", 0, 0x88b4, nv98_bo_move_exec, nv50_bo_move_init },
-	}, *mthd = _methods;
+	};
+	const struct _method_table *mthd = _methods;
 	const char *name = "CPU";
 	int ret;
 
-- 
2.17.1
