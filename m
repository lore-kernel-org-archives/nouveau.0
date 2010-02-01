From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] drm/nv50: make the pgraph irq handler loop
	like the pre-nv50 version
Date: Mon,  1 Feb 2010 19:34:33 +0100
Message-ID: <1265049275-7680-2-git-send-email-madman2003@gmail.com>
References: <1265049275-7680-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265049275-7680-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_irq.c |  140 ++++++++++++++++++---------------
 1 files changed, 76 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouveau/nouveau_irq.c
index baa9b3e..475d0f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_irq.c
+++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
@@ -580,83 +580,95 @@ nouveau_pgraph_irq_handler(struct drm_device *dev)
 static void
 nv50_pgraph_irq_handler(struct drm_device *dev)
 {
-	uint32_t status, nsource;
+	uint32_t status;
 
-	status = nv_rd32(dev, NV03_PGRAPH_INTR);
-	nsource = nv_rd32(dev, NV03_PGRAPH_NSOURCE);
+	while ((status = nv_rd32(dev, NV03_PGRAPH_INTR))) {
+		uint32_t nsource = nv_rd32(dev, NV03_PGRAPH_NSOURCE);
 
-	if (status & 0x00000001) {
-		nouveau_pgraph_intr_notify(dev, nsource);
-		status &= ~0x00000001;
-		nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000001);
-	}
+		if (status & 0x00000001) {
+			nouveau_pgraph_intr_notify(dev, nsource);
+			status &= ~0x00000001;
+			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000001);
+		}
 
-	if (status & 0x00000010) {
-		nouveau_pgraph_intr_error(dev, nsource |
-					  NV03_PGRAPH_NSOURCE_ILLEGAL_MTHD);
+		if (status & 0x00000010) {
+			nouveau_pgraph_intr_error(dev, nsource |
+						  NV03_PGRAPH_NSOURCE_ILLEGAL_MTHD);
 
-		status &= ~0x00000010;
-		nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000010);
-	}
+			status &= ~0x00000010;
+			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00000010);
+		}
 
-	if (status & 0x00001000) {
-		nv_wr32(dev, 0x400500, 0x00000000);
-		nv_wr32(dev, NV03_PGRAPH_INTR, NV_PGRAPH_INTR_CONTEXT_SWITCH);
-		nv_wr32(dev, NV40_PGRAPH_INTR_EN, nv_rd32(dev,
-			NV40_PGRAPH_INTR_EN) & ~NV_PGRAPH_INTR_CONTEXT_SWITCH);
-		nv_wr32(dev, 0x400500, 0x00010001);
+		if (status & 0x00001000) {
+			nv_wr32(dev, 0x400500, 0x00000000);
+			nv_wr32(dev, NV03_PGRAPH_INTR, NV_PGRAPH_INTR_CONTEXT_SWITCH);
+			nv_wr32(dev, NV40_PGRAPH_INTR_EN, nv_rd32(dev,
+				NV40_PGRAPH_INTR_EN) & ~NV_PGRAPH_INTR_CONTEXT_SWITCH);
+			nv_wr32(dev, 0x400500, 0x00010001);
 
-		nv50_graph_context_switch(dev);
+			nv50_graph_context_switch(dev);
 
-		status &= ~NV_PGRAPH_INTR_CONTEXT_SWITCH;
-	}
+			status &= ~NV_PGRAPH_INTR_CONTEXT_SWITCH;
+		}
 
-	if (status & 0x00100000) {
-		nouveau_pgraph_intr_error(dev, nsource |
-					  NV03_PGRAPH_NSOURCE_DATA_ERROR);
+		if (status & 0x00100000) {
+			nouveau_pgraph_intr_error(dev, nsource |
+						  NV03_PGRAPH_NSOURCE_DATA_ERROR);
 
-		status &= ~0x00100000;
-		nv_wr32(dev, NV03_PGRAPH_INTR, 0x00100000);
-	}
+			status &= ~0x00100000;
+			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00100000);
+		}
 
-	if (status & 0x00200000) {
-		int r;
-
-		nouveau_pgraph_intr_error(dev, nsource |
-					  NV03_PGRAPH_NSOURCE_PROTECTION_ERROR);
-
-		NV_ERROR(dev, "magic set 1:\n");
-		for (r = 0x408900; r <= 0x408910; r += 4)
-			NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r, nv_rd32(dev, r));
-		nv_wr32(dev, 0x408900, nv_rd32(dev, 0x408904) | 0xc0000000);
-		for (r = 0x408e08; r <= 0x408e24; r += 4)
-			NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r, nv_rd32(dev, r));
-		nv_wr32(dev, 0x408e08, nv_rd32(dev, 0x408e08) | 0xc0000000);
-
-		NV_ERROR(dev, "magic set 2:\n");
-		for (r = 0x409900; r <= 0x409910; r += 4)
-			NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r, nv_rd32(dev, r));
-		nv_wr32(dev, 0x409900, nv_rd32(dev, 0x409904) | 0xc0000000);
-		for (r = 0x409e08; r <= 0x409e24; r += 4)
-			NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r, nv_rd32(dev, r));
-		nv_wr32(dev, 0x409e08, nv_rd32(dev, 0x409e08) | 0xc0000000);
-
-		status &= ~0x00200000;
-		nv_wr32(dev, NV03_PGRAPH_NSOURCE, nsource);
-		nv_wr32(dev, NV03_PGRAPH_INTR, 0x00200000);
-	}
+		if (status & 0x00200000) {
+			int r;
+
+			nouveau_pgraph_intr_error(dev, nsource |
+					NV03_PGRAPH_NSOURCE_PROTECTION_ERROR);
+
+			NV_ERROR(dev, "magic set 1:\n");
+			for (r = 0x408900; r <= 0x408910; r += 4)
+				NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r,
+					nv_rd32(dev, r));
+			nv_wr32(dev, 0x408900,
+				nv_rd32(dev, 0x408904) | 0xc0000000);
+			for (r = 0x408e08; r <= 0x408e24; r += 4)
+				NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r,
+							nv_rd32(dev, r));
+			nv_wr32(dev, 0x408e08,
+				nv_rd32(dev, 0x408e08) | 0xc0000000);
+
+			NV_ERROR(dev, "magic set 2:\n");
+			for (r = 0x409900; r <= 0x409910; r += 4)
+				NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r,
+					nv_rd32(dev, r));
+			nv_wr32(dev, 0x409900,
+				nv_rd32(dev, 0x409904) | 0xc0000000);
+			for (r = 0x409e08; r <= 0x409e24; r += 4)
+				NV_ERROR(dev, "\t0x%08x: 0x%08x\n", r,
+					nv_rd32(dev, r));
+			nv_wr32(dev, 0x409e08,
+				nv_rd32(dev, 0x409e08) | 0xc0000000);
+
+			status &= ~0x00200000;
+			nv_wr32(dev, NV03_PGRAPH_NSOURCE, nsource);
+			nv_wr32(dev, NV03_PGRAPH_INTR, 0x00200000);
+		}
 
-	if (status) {
-		NV_INFO(dev, "Unhandled PGRAPH_INTR - 0x%08x\n", status);
-		nv_wr32(dev, NV03_PGRAPH_INTR, status);
-	}
+		if (status) {
+			NV_INFO(dev, "Unhandled PGRAPH_INTR - 0x%08x\n",
+				status);
+			nv_wr32(dev, NV03_PGRAPH_INTR, status);
+		}
 
-	{
-		const int isb = (1 << 16) | (1 << 0);
+		{
+			const int isb = (1 << 16) | (1 << 0);
 
-		if ((nv_rd32(dev, 0x400500) & isb) != isb)
-			nv_wr32(dev, 0x400500, nv_rd32(dev, 0x400500) | isb);
-		nv_wr32(dev, 0x400824, nv_rd32(dev, 0x400824) & ~(1 << 31));
+			if ((nv_rd32(dev, 0x400500) & isb) != isb)
+				nv_wr32(dev, 0x400500,
+					nv_rd32(dev, 0x400500) | isb);
+			nv_wr32(dev, 0x400824,
+				nv_rd32(dev, 0x400824) & ~(1 << 31));
+		}
 	}
 
 	nv_wr32(dev, NV03_PMC_INTR_0, NV_PMC_INTR_0_PGRAPH_PENDING);
-- 
1.6.6.1
