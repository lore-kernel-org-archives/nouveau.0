From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv40: allocate ctxprog with kmalloc
Date: Sun, 11 Nov 2012 19:58:52 +0100
Message-ID: <20121111185852.GC3530@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Some archs defconfigs have CONFIG_FRAME_WARN set to 1024, which lead to this
warning:
drivers/gpu/drm/nouveau/core/engine/graph/ctxnv40.c: warning: the frame size
of 1184 bytes is larger than 1024 bytes

Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/ctxnv40.c | 12 +++++++++---
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c    |  4 +++-
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.h    |  2 +-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv40.c
index e45035e..7bbb1e1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv40.c
@@ -669,21 +669,27 @@ nv40_grctx_fill(struct nouveau_device *device, struct nouveau_gpuobj *mem)
 			   });
 }
 
-void
+int
 nv40_grctx_init(struct nouveau_device *device, u32 *size)
 {
-	u32 ctxprog[256], i;
+	u32 *ctxprog = kmalloc(256 * 4, GFP_KERNEL), i;
 	struct nouveau_grctx ctx = {
 		.device = device,
 		.mode = NOUVEAU_GRCTX_PROG,
 		.data = ctxprog,
-		.ctxprog_max = ARRAY_SIZE(ctxprog)
+		.ctxprog_max = 256,
 	};
 
+	if (!ctxprog)
+		return -ENOMEM;
+
 	nv40_grctx_generate(&ctx);
 
 	nv_wr32(device, 0x400324, 0);
 	for (i = 0; i < ctx.ctxprog_len; i++)
 		nv_wr32(device, 0x400328, ctxprog[i]);
 	*size = ctx.ctxvals_pos * 4;
+
+	kfree(ctxprog);
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
index a3742db..0052f09 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -374,7 +374,9 @@ nv40_graph_init(struct nouveau_object *object)
 		return ret;
 
 	/* generate and upload context program */
-	nv40_grctx_init(nv_device(priv), &priv->size);
+	ret = nv40_grctx_init(nv_device(priv), &priv->size);
+	if (ret)
+		return ret;
 
 	/* No context present currently */
 	nv_wr32(priv, NV40_PGRAPH_CTXCTL_CUR, 0x00000000);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h
index d2ac975..7da35a4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.h
@@ -15,7 +15,7 @@ nv44_graph_class(void *priv)
 	return !(0x0baf & (1 << (device->chipset & 0x0f)));
 }
 
-void nv40_grctx_init(struct nouveau_device *, u32 *size);
+int  nv40_grctx_init(struct nouveau_device *, u32 *size);
 void nv40_grctx_fill(struct nouveau_device *, struct nouveau_gpuobj *);
 
 #endif
-- 
1.7.12
