From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: Ack interrupts for some fuc engines
Date: Mon, 25 Mar 2013 10:22:37 +0100
Message-ID: <5150175D.3070808@gmail.com>
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
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Fixes 100% cpu usage when the exit interrupt never got acked.

Signed-off-by: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/core/core/falcon.c b/drivers/gpu/drm/nouveau/core/core/falcon.c
index e05c157..b11c5f3 100644
--- a/drivers/gpu/drm/nouveau/core/core/falcon.c
+++ b/drivers/gpu/drm/nouveau/core/core/falcon.c
@@ -229,6 +229,24 @@ _nouveau_falcon_fini(struct nouveau_object *object, bool suspend)
 	return nouveau_engine_fini(&falcon->base, suspend);
 }
 
+void
+nouveau_falcon_intr(struct nouveau_subdev *subdev)
+{
+	struct nouveau_falcon *falcon = (void*)subdev;
+	u32 intr = nv_ro32(falcon, 0x008);
+
+	nv_wo32(falcon, 0x004, intr);
+
+	if (intr & 0x10) {
+		intr &= ~0x10;
+
+		nv_info(falcon, "Exit interrupt called\n");
+	}
+
+	if (intr)
+		nv_error(falcon, "Unhandled interrupt %08x\n", intr);
+}
+
 int
 nouveau_falcon_create_(struct nouveau_object *parent,
 		       struct nouveau_object *engine,
diff --git a/drivers/gpu/drm/nouveau/core/engine/bsp/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/bsp/nvc0.c
index 0a5aa6b..2201c96 100644
--- a/drivers/gpu/drm/nouveau/core/engine/bsp/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/bsp/nvc0.c
@@ -91,6 +91,7 @@ nvc0_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x00008000;
+	nv_subdev(priv)->intr = nouveau_falcon_intr;
 	nv_engine(priv)->cclass = &nvc0_bsp_cclass;
 	nv_engine(priv)->sclass = nvc0_bsp_sclass;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/engine/bsp/nve0.c b/drivers/gpu/drm/nouveau/core/engine/bsp/nve0.c
index d4f23bb..4e7f79b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/bsp/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/bsp/nve0.c
@@ -91,6 +91,7 @@ nve0_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x00008000;
+	nv_subdev(priv)->intr = nouveau_falcon_intr;
 	nv_engine(priv)->cclass = &nve0_bsp_cclass;
 	nv_engine(priv)->sclass = nve0_bsp_sclass;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/engine/ppp/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/ppp/nvc0.c
index ebf0d86..4557c3b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/ppp/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/ppp/nvc0.c
@@ -91,6 +91,7 @@ nvc0_ppp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x00000002;
+	nv_subdev(priv)->intr = nouveau_falcon_intr;
 	nv_engine(priv)->cclass = &nvc0_ppp_cclass;
 	nv_engine(priv)->sclass = nvc0_ppp_sclass;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/engine/vp/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/vp/nvc0.c
index f761949..cc2c8cc 100644
--- a/drivers/gpu/drm/nouveau/core/engine/vp/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/vp/nvc0.c
@@ -91,6 +91,7 @@ nvc0_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x00020000;
+	nv_subdev(priv)->intr = nouveau_falcon_intr;
 	nv_engine(priv)->cclass = &nvc0_vp_cclass;
 	nv_engine(priv)->sclass = nvc0_vp_sclass;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/engine/vp/nve0.c b/drivers/gpu/drm/nouveau/core/engine/vp/nve0.c
index 2384ce5..774ec16 100644
--- a/drivers/gpu/drm/nouveau/core/engine/vp/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/vp/nve0.c
@@ -91,6 +91,7 @@ nve0_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x00020000;
+	nv_subdev(priv)->intr = nouveau_falcon_intr;
 	nv_engine(priv)->cclass = &nve0_vp_cclass;
 	nv_engine(priv)->sclass = nve0_vp_sclass;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/include/core/falcon.h b/drivers/gpu/drm/nouveau/core/include/core/falcon.h
index 1edec38..181aa7d 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/falcon.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/falcon.h
@@ -72,6 +72,8 @@ int nouveau_falcon_create_(struct nouveau_object *, struct nouveau_object *,
 			   struct nouveau_oclass *, u32, bool, const char *,
 			   const char *, int, void **);
 
+void nouveau_falcon_intr(struct nouveau_subdev *subdev);
+
 #define _nouveau_falcon_dtor _nouveau_engine_dtor
 int  _nouveau_falcon_init(struct nouveau_object *);
 int  _nouveau_falcon_fini(struct nouveau_object *, bool);
