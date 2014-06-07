From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [RFC PATCH] drm/gk208/gr: adjust a couple of init values
Date: Sat,  7 Jun 2014 15:48:17 -0400
Message-ID: <1402170497-32354-1-git-send-email-imirkin@alum.mit.edu>
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
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

MMIO32 R 0x17e91c 0x0b040a0b PMFB_BROADCAST.SUBP_BROADCAST.UNK11C => 0xb040a0b
MMIO32 R 0x17e920 0x00090c03 PMFB_BROADCAST.SUBP_BROADCAST.UNK120 => 0x90c03
MMIO32 W 0x17e91c 0x0b030a0c PMFB_BROADCAST.SUBP_BROADCAST.UNK11C <= 0xb030a0c
MMIO32 W 0x17e920 0x00090d08 PMFB_BROADCAST.SUBP_BROADCAST.UNK120 <= 0x90d08

And then later when it writes these values into memory,

MMIO32 R 0x17e91c 0x0b030a0c PMFB_BROADCAST.SUBP_BROADCAST.UNK11C => 0xb030a0c
MMIO32 R 0x17e920 0x00090d08 PMFB_BROADCAST.SUBP_BROADCAST.UNK120 => 0x90d08
RAMIN32 1b5080 7fce1080 <= 17e91c
RAMIN32 1b5084 7fce1084 <= b030a0c
MMIO32 W 0x070000 0x00000001 PFIFO_FLUSH.FLUSH_CTRL <= { TRIGGER }
MMIO32 R 0x070000 0x00000000 PFIFO_FLUSH.FLUSH_CTRL => { 0 }
RAMIN32 1b5088 7fce1088 <= 17e920
RAMIN32 1b508c 7fce108c <= 90d08

So perhaps the mmio_list needs to grow a mask option (and have it store the
mask)? Not sure what any of this means, and doing this didn't fix
anything. So... this is more informational than to be applied
necessarily. Although the values that 337.25 writes on the GK208 I was testing
on (GT630, 10de:1284) were different than what you were writing in (at least
for the first reg).

 drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
index 8de4a42..b0bc5db 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
@@ -537,6 +537,7 @@ nv108_grctx_generate_mods(struct nvc0_graph_priv *priv, struct nvc0_grctx *info)
 	u32 magic[GPC_MAX][2];
 	u32 offset;
 	int gpc;
+	u32 r17e91c, r17e920;
 
 	mmio_data(0x003000, 0x0100, NV_MEM_ACCESS_RW | NV_MEM_ACCESS_SYS);
 	mmio_data(0x008000, 0x0100, NV_MEM_ACCESS_RW | NV_MEM_ACCESS_SYS);
@@ -571,8 +572,10 @@ nv108_grctx_generate_mods(struct nvc0_graph_priv *priv, struct nvc0_grctx *info)
 		offset += 0x07ff * priv->tpc_nr[gpc];
 	}
 
-	mmio_list(0x17e91c, 0x0b040a0b, 0, 0);
-	mmio_list(0x17e920, 0x00090d08, 0, 0);
+	r17e91c = nv_rd32(priv, 0x17e91c);
+	r17e920 = nv_rd32(priv, 0x17e920);
+	mmio_list(0x17e91c, (r17e91c & ~0x000f000f) | 0x0003000c, 0, 0);
+	mmio_list(0x17e920, (r17e920 & ~0x00000f0f) | 0x00000d08, 0, 0);
 }
 
 struct nouveau_oclass *
-- 
1.8.5.5
