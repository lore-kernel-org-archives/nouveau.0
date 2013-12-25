From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] drm/nve4: fix size of POLY2ESETUP buffer
Date: Wed, 25 Dec 2013 18:00:33 +0100
Message-ID: <1387990833-15830-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This fixes write faults from GPCCLIENT 5 in geometry shader tests.

For now this is just a guess from a single mmio trace, it looks
like 8 large pages are being used, i.e. one per TPC.

Can we just ask NV for the correct sizes ?
---
 drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
index e2de73e..ff0960f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
@@ -813,7 +813,7 @@ nve4_grctx_generate_mods(struct nvc0_graph_priv *priv, struct nvc0_grctx *info)
 
 	mmio_data(0x003000, 0x0100, NV_MEM_ACCESS_RW | NV_MEM_ACCESS_SYS);
 	mmio_data(0x008000, 0x0100, NV_MEM_ACCESS_RW | NV_MEM_ACCESS_SYS);
-	mmio_data(0x060000, 0x1000, NV_MEM_ACCESS_RW);
+	mmio_data(priv->gpc_nr << 17, 0x1000, NV_MEM_ACCESS_RW);
 	mmio_list(0x40800c, 0x00000000,  8, 1);
 	mmio_list(0x408010, 0x80000000,  0, 0);
 	mmio_list(0x419004, 0x00000000,  8, 1);
-- 
1.8.1.5
