From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50-/disp: use the number of dac, sor,
	pior rather than hardcoded values
Date: Tue, 30 Jul 2013 01:01:10 +0100
Message-ID: <1375142470-6543-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The values are already stored on chipset specific basis in the ctor.
Make the most of them and simplify the code further by using a temporary
variable to avoid code duplication.

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Found this patch laying around in a local branch. While the it does not
reduce the number of lines, I believe that it makes the code is alot more
readable.

Cheers
Emil
---
 drivers/gpu/drm/nouveau/core/engine/disp/nv50.c | 34 ++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index 7ffe2f3..c168ae3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -628,7 +628,7 @@ nv50_disp_base_init(struct nouveau_object *object)
 	}
 
 	/* ... PIOR caps */
-	for (i = 0; i < 3; i++) {
+	for (i = 0; i < priv->pior.nr; i++) {
 		tmp = nv_rd32(priv, 0x61e000 + (i * 0x800));
 		nv_wr32(priv, 0x6101f0 + (i * 0x04), tmp);
 	}
@@ -834,10 +834,11 @@ exec_script(struct nv50_disp_priv *priv, int head, int id)
 	u8  ver, hdr, cnt, len;
 	u16 data;
 	u32 ctrl = 0x00000000;
+	u32 reg;
 	int i;
 
 	/* DAC */
-	for (i = 0; !(ctrl & (1 << head)) && i < 3; i++)
+	for (i = 0; !(ctrl & (1 << head)) && i < priv->dac.nr; i++)
 		ctrl = nv_rd32(priv, 0x610b5c + (i * 8));
 
 	/* SOR */
@@ -845,19 +846,18 @@ exec_script(struct nv50_disp_priv *priv, int head, int id)
 		if (nv_device(priv)->chipset  < 0x90 ||
 		    nv_device(priv)->chipset == 0x92 ||
 		    nv_device(priv)->chipset == 0xa0) {
-			for (i = 0; !(ctrl & (1 << head)) && i < 2; i++)
-				ctrl = nv_rd32(priv, 0x610b74 + (i * 8));
-			i += 4;
+			reg = 0x610b74;
 		} else {
-			for (i = 0; !(ctrl & (1 << head)) && i < 4; i++)
-				ctrl = nv_rd32(priv, 0x610798 + (i * 8));
-			i += 4;
+			reg = 0x610798;
 		}
+		for (i = 0; !(ctrl & (1 << head)) && i < priv->sor.nr; i++)
+			ctrl = nv_rd32(priv, reg + (i * 8));
+		i += 4;
 	}
 
 	/* PIOR */
 	if (!(ctrl & (1 << head))) {
-		for (i = 0; !(ctrl & (1 << head)) && i < 3; i++)
+		for (i = 0; !(ctrl & (1 << head)) && i < priv->pior.nr; i++)
 			ctrl = nv_rd32(priv, 0x610b84 + (i * 8));
 		i += 8;
 	}
@@ -893,10 +893,11 @@ exec_clkcmp(struct nv50_disp_priv *priv, int head, int id, u32 pclk,
 	u8  ver, hdr, cnt, len;
 	u32 ctrl = 0x00000000;
 	u32 data, conf = ~0;
+	u32 reg;
 	int i;
 
 	/* DAC */
-	for (i = 0; !(ctrl & (1 << head)) && i < 3; i++)
+	for (i = 0; !(ctrl & (1 << head)) && i < priv->dac.nr; i++)
 		ctrl = nv_rd32(priv, 0x610b58 + (i * 8));
 
 	/* SOR */
@@ -904,19 +905,18 @@ exec_clkcmp(struct nv50_disp_priv *priv, int head, int id, u32 pclk,
 		if (nv_device(priv)->chipset  < 0x90 ||
 		    nv_device(priv)->chipset == 0x92 ||
 		    nv_device(priv)->chipset == 0xa0) {
-			for (i = 0; !(ctrl & (1 << head)) && i < 2; i++)
-				ctrl = nv_rd32(priv, 0x610b70 + (i * 8));
-			i += 4;
+			reg = 0x610b70;
 		} else {
-			for (i = 0; !(ctrl & (1 << head)) && i < 4; i++)
-				ctrl = nv_rd32(priv, 0x610794 + (i * 8));
-			i += 4;
+			reg = 0x610794;
 		}
+		for (i = 0; !(ctrl & (1 << head)) && i < priv->sor.nr; i++)
+			ctrl = nv_rd32(priv, reg + (i * 8));
+		i += 4;
 	}
 
 	/* PIOR */
 	if (!(ctrl & (1 << head))) {
-		for (i = 0; !(ctrl & (1 << head)) && i < 3; i++)
+		for (i = 0; !(ctrl & (1 << head)) && i < priv->pior.nr; i++)
 			ctrl = nv_rd32(priv, 0x610b80 + (i * 8));
 		i += 8;
 	}
-- 
1.8.3.3
