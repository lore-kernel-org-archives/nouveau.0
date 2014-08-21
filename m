From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 7/7] clock/nva3: Pause the GPU before reclocking
Date: Thu, 21 Aug 2014 13:45:18 +0200
Message-ID: <1408621518-32350-8-git-send-email-rspliet@eclipso.eu>
References: <1408621518-32350-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408621518-32350-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 .../gpu/drm/nouveau/core/include/subdev/clock.h    |  3 ++
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c   | 45 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c   | 30 ++++-----------
 3 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
index 676b49e..52e65b8 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
@@ -146,6 +146,9 @@ int nv04_clock_pll_prog(struct nouveau_clock *, u32 reg1,
 int nva3_clock_pll_calc(struct nouveau_clock *, struct nvbios_pll *,
 			int clk, struct nouveau_pll_vals *);
 
+int nva3_clock_pre(struct nouveau_clock *clk, unsigned long *flags);
+void nva3_clock_post(struct nouveau_clock *clk, unsigned long *flags);
+
 int nouveau_clock_ustate(struct nouveau_clock *, int req);
 int nouveau_clock_astate(struct nouveau_clock *, int req, int rel);
 int nouveau_clock_dstate(struct nouveau_clock *, int req, int rel);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index 14a5060..cd31cf3 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -23,6 +23,7 @@
  *          Roy Spliet
  */
 
+#include <engine/fifo.h>
 #include <subdev/bios.h>
 #include <subdev/bios/pll.h>
 #include <subdev/timer.h>
@@ -293,6 +294,41 @@ calc_host(struct nva3_clock_priv *priv, struct nouveau_cstate *cstate)
 	return ret;
 }
 
+int
+nva3_clock_pre(struct nouveau_clock *clk, unsigned long *flags)
+{
+	struct nouveau_fifo *pfifo = nouveau_fifo(clk);
+
+	/* halt and idle execution engines */
+	nv_mask(clk, 0x020060, 0x00070000, 0x00000000);
+	nv_mask(clk, 0x002504, 0x00000001, 0x00000001);
+	/* Wait until the interrupt handler is finished */
+	if (!nv_wait(clk, 0x000100, 0xffffffff, 0x00000000))
+		return -EBUSY;
+
+	if (pfifo)
+		pfifo->pause(pfifo, flags);
+
+	if (!nv_wait(clk, 0x002504, 0x00000010, 0x00000010))
+		return -EIO;
+	if (!nv_wait(clk, 0x00251c, 0x0000003f, 0x0000003f))
+		return -EIO;
+
+	return 0;
+}
+
+void
+nva3_clock_post(struct nouveau_clock *clk, unsigned long *flags)
+{
+	struct nouveau_fifo *pfifo = nouveau_fifo(clk);
+
+	if (pfifo)
+		pfifo->start(pfifo, flags);
+
+	nv_mask(clk, 0x002504, 0x00000001, 0x00000000);
+	nv_mask(clk, 0x020060, 0x00070000, 0x00040000);
+}
+
 static void
 disable_clk_src(struct nva3_clock_priv *priv, u32 src)
 {
@@ -421,6 +457,12 @@ nva3_clock_prog(struct nouveau_clock *clk)
 {
 	struct nva3_clock_priv *priv = (void *)clk;
 	struct nva3_clock_info *core = &priv->eng[nv_clk_src_core];
+	int ret;
+	unsigned long flags;
+
+	ret = nva3_clock_pre(clk, &flags);
+	if (ret)
+		return ret;
 
 	if (core->pll)
 		prog_core(priv, nv_clk_src_core_intm);
@@ -430,6 +472,9 @@ nva3_clock_prog(struct nouveau_clock *clk)
 	prog_clk(priv, 0x20, nv_clk_src_disp);
 	prog_clk(priv, 0x21, nv_clk_src_vdec);
 	prog_host(priv);
+
+	nva3_clock_post(clk, &flags);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c
index 6a65fc9..fa91d2a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c
@@ -299,25 +299,13 @@ static int
 nvaa_clock_prog(struct nouveau_clock *clk)
 {
 	struct nvaa_clock_priv *priv = (void *)clk;
-	struct nouveau_fifo *pfifo = nouveau_fifo(clk);
+	u32 pllmask = 0, mast;
 	unsigned long flags;
-	u32 pllmask = 0, mast, ptherm_gate;
-	int ret = -EBUSY;
-
-	/* halt and idle execution engines */
-	ptherm_gate = nv_mask(clk, 0x020060, 0x00070000, 0x00000000);
-	nv_mask(clk, 0x002504, 0x00000001, 0x00000001);
-	/* Wait until the interrupt handler is finished */
-	if (!nv_wait(clk, 0x000100, 0xffffffff, 0x00000000))
-		goto resume;
-
-	if (pfifo)
-		pfifo->pause(pfifo, &flags);
+	int ret;
 
-	if (!nv_wait(clk, 0x002504, 0x00000010, 0x00000010))
-		goto resume;
-	if (!nv_wait(clk, 0x00251c, 0x0000003f, 0x0000003f))
-		goto resume;
+	ret = nva3_clock_pre(clk, &flags);
+	if (ret)
+		return ret;
 
 	/* First switch to safe clocks: href */
 	mast = nv_mask(clk, 0xc054, 0x03400e70, 0x03400640);
@@ -378,12 +366,6 @@ nvaa_clock_prog(struct nouveau_clock *clk)
 	ret = 0;
 
 resume:
-	if (pfifo)
-		pfifo->start(pfifo, &flags);
-
-	nv_mask(clk, 0x002504, 0x00000001, 0x00000000);
-	nv_wr32(clk, 0x020060, ptherm_gate);
-
 	/* Disable some PLLs and dividers when unused */
 	if (priv->csrc != nv_clk_src_core) {
 		nv_wr32(clk, 0x4040, 0x00000000);
@@ -395,6 +377,8 @@ resume:
 		nv_mask(clk, 0x4020, 0x80000000, 0x00000000);
 	}
 
+	nva3_clock_post(clk, &flags);
+
 	return ret;
 }
 
-- 
1.9.3
