From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: add missing pll_calc calls
Date: Fri, 16 Nov 2012 17:47:16 +0100
Message-ID: <50A66E14.3030709@canonical.com>
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
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes a null pointer dereference when reclocking on my fermi.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
index 39e73b9..41b7a6a 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
@@ -54,6 +54,7 @@ int nv04_clock_pll_calc(struct nouveau_clock *, struct nvbios_pll *,
 			int clk, struct nouveau_pll_vals *);
 int nv04_clock_pll_prog(struct nouveau_clock *, u32 reg1,
 			struct nouveau_pll_vals *);
-
+int nva3_clock_pll_calc(struct nouveau_clock *, struct nvbios_pll *,
+			int clk, struct nouveau_pll_vals *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index cc8d7d1..9068c98 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -66,6 +66,24 @@ nva3_clock_pll_set(struct nouveau_clock *clk, u32 type, u32 freq)
 	return ret;
 }
 
+int
+nva3_clock_pll_calc(struct nouveau_clock *clock, struct nvbios_pll *info,
+		    int clk, struct nouveau_pll_vals *pv)
+{
+	int ret, N, M, P;
+
+	ret = nva3_pll_calc(clock, info, clk, &N, NULL, &M, &P);
+
+	if (ret > 0) {
+		pv->refclk = info->refclk;
+		pv->N1 = N;
+		pv->M1 = M;
+		pv->log2P = P;
+	}
+	return ret;
+}
+
+
 static int
 nva3_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		struct nouveau_oclass *oclass, void *data, u32 size,
@@ -80,6 +98,7 @@ nva3_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	priv->base.pll_set = nva3_clock_pll_set;
+	priv->base.pll_calc = nva3_clock_pll_calc;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c
index 5ccce0b..f6962c9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c
@@ -79,6 +79,7 @@ nvc0_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	priv->base.pll_set = nvc0_clock_pll_set;
+	priv->base.pll_calc = nva3_clock_pll_calc;
 	return 0;
 }
