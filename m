From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/3] drm/nvc0/devinit: set the disable mask based
	on punits register
Date: Thu,  9 Jan 2014 21:19:13 -0500
Message-ID: <1389320353-21375-3-git-send-email-imirkin@alum.mit.edu>
References: <1389320353-21375-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389320353-21375-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This replaces the custom disable checks throughout the implementations.
As a side-effect this will honor hw disables on video decoding engines
as well as PDISP on nvc0:nvd0.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not strictly needed, but I think it's nice to unify it all. (And it also
handles the video engines which were missing the checks.) It seems to me that
PCE2 can be disabled as well with the higher bits on NVE0+, but the old code
didn't do it, so I left it alone.

It looks like there's also a SW_DISABLE register at 0x22580, should we look at
it as well? Again, leaving to a future patch to avoid regressions.

 drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c    |  6 ------
 drivers/gpu/drm/nouveau/core/engine/copy/nve0.c    |  6 ------
 drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c    |  3 ---
 drivers/gpu/drm/nouveau/core/engine/disp/nve0.c    |  3 ---
 drivers/gpu/drm/nouveau/core/engine/disp/nvf0.c    |  3 ---
 drivers/gpu/drm/nouveau/core/subdev/devinit/nvc0.c | 23 ++++++++++++++++++++++
 6 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c
index 993df09..ac3291f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/copy/nvc0.c
@@ -105,9 +105,6 @@ nvc0_copy0_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvc0_copy_priv *priv;
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000100)
-		return -ENODEV;
-
 	ret = nouveau_falcon_create(parent, engine, oclass, 0x104000, true,
 				    "PCE0", "copy0", &priv);
 	*pobject = nv_object(priv);
@@ -133,9 +130,6 @@ nvc0_copy1_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvc0_copy_priv *priv;
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000200)
-		return -ENODEV;
-
 	ret = nouveau_falcon_create(parent, engine, oclass, 0x105000, true,
 				    "PCE1", "copy1", &priv);
 	*pobject = nv_object(priv);
diff --git a/drivers/gpu/drm/nouveau/core/engine/copy/nve0.c b/drivers/gpu/drm/nouveau/core/engine/copy/nve0.c
index 30f1ef1..748a61e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/copy/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/copy/nve0.c
@@ -88,9 +88,6 @@ nve0_copy0_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nve0_copy_priv *priv;
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000100)
-		return -ENODEV;
-
 	ret = nouveau_engine_create(parent, engine, oclass, true,
 				    "PCE0", "copy0", &priv);
 	*pobject = nv_object(priv);
@@ -112,9 +109,6 @@ nve0_copy1_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nve0_copy_priv *priv;
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000200)
-		return -ENODEV;
-
 	ret = nouveau_engine_create(parent, engine, oclass, true,
 				    "PCE1", "copy1", &priv);
 	*pobject = nv_object(priv);
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
index 378a015..d52c0f5 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
@@ -967,9 +967,6 @@ nvd0_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int heads = nv_rd32(parent, 0x022448);
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000001)
-		return -ENODEV;
-
 	ret = nouveau_disp_create(parent, engine, oclass, heads,
 				  "PDISP", "display", &priv);
 	*pobject = nv_object(priv);
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c
index fb1fe6a..20725b3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c
@@ -54,9 +54,6 @@ nve0_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int heads = nv_rd32(parent, 0x022448);
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000001)
-		return -ENODEV;
-
 	ret = nouveau_disp_create(parent, engine, oclass, heads,
 				  "PDISP", "display", &priv);
 	*pobject = nv_object(priv);
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvf0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nvf0.c
index 42aa6b9..a488c36 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nvf0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nvf0.c
@@ -54,9 +54,6 @@ nvf0_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int heads = nv_rd32(parent, 0x022448);
 	int ret;
 
-	if (nv_rd32(parent, 0x022500) & 0x00000001)
-		return -ENODEV;
-
 	ret = nouveau_disp_create(parent, engine, oclass, heads,
 				  "PDISP", "display", &priv);
 	*pobject = nv_object(priv);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/devinit/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/devinit/nvc0.c
index 19e265b..8ded642 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/devinit/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/devinit/nvc0.c
@@ -59,6 +59,28 @@ nvc0_devinit_pll_set(struct nouveau_devinit *devinit, u32 type, u32 freq)
 	return ret;
 }
 
+static void
+nvc0_disable_engines(struct nouveau_object *object)
+{
+	struct nouveau_device *device = nv_device(object);
+	u32 r22500 = nv_rd32(device, 0x22500);
+
+	if (r22500 & 0x001)
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_DISP;
+	if (r22500 & 0x002) {
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_VP;
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_PPP;
+	}
+	if (r22500 & 0x004)
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_BSP;
+	if (device->chipset > 0xd0 && (r22500 & 0x008))
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_VENC;
+	if (r22500 & 0x100)
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_COPY0;
+	if (r22500 & 0x200)
+		device->disable_mask |= 1ULL << NVDEV_ENGINE_COPY1;
+}
+
 static int
 nvc0_devinit_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		  struct nouveau_oclass *oclass, void *data, u32 size,
@@ -73,6 +95,7 @@ nvc0_devinit_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	priv->base.pll_set = nvc0_devinit_pll_set;
+	priv->disable_engines = nvc0_disable_engines;
 	if (nv_rd32(priv, 0x022500) & 0x00000001)
 		priv->base.post = true;
 	return 0;
-- 
1.8.3.2
