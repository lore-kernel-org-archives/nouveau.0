From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/5] drm/nv40/mpeg: use the nv31-provided classes
Date: Sat,  7 Sep 2013 21:04:10 -0400
Message-ID: <1378602252-11521-3-git-send-email-imirkin@alum.mit.edu>
References: <1378602252-11521-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378602252-11521-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Since nv40 only covers pre-nv44 now, it can use the nv31-provided
functions.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c    | 12 +---
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h    | 15 +++++
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c    | 68 ++--------------------
 drivers/gpu/drm/nouveau/core/include/engine/mpeg.h |  2 +-
 4 files changed, 22 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index 5c54aa1..2f80b223 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -34,15 +34,7 @@
 
 #include <engine/fifo.h>
 #include <engine/mpeg.h>
-
-struct nv31_mpeg_priv {
-	struct nouveau_mpeg base;
-	atomic_t refcount;
-};
-
-struct nv31_mpeg_chan {
-	struct nouveau_object base;
-};
+#include <engine/mpeg/nv31.h>
 
 /*******************************************************************************
  * MPEG object classes
@@ -167,7 +159,7 @@ nv31_mpeg_context_dtor(struct nouveau_object *object)
 	nouveau_object_destroy(&chan->base);
 }
 
-static struct nouveau_oclass
+struct nouveau_oclass
 nv31_mpeg_cclass = {
 	.handle = NV_ENGCTX(MPEG, 0x31),
 	.ofuncs = &(struct nouveau_ofuncs) {
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h
new file mode 100644
index 0000000..a488c13
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h
@@ -0,0 +1,15 @@
+#ifndef __NV31_MPEG_H__
+#define __NV31_MPEG_H__
+
+#include <engine/mpeg.h>
+
+struct nv31_mpeg_priv {
+	struct nouveau_mpeg base;
+	atomic_t refcount;
+};
+
+struct nv31_mpeg_chan {
+	struct nouveau_object base;
+};
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
index dd61960..26f3262 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
@@ -31,67 +31,7 @@
 #include <subdev/instmem.h>
 
 #include <engine/mpeg.h>
-#include <engine/graph/nv40.h>
-
-struct nv40_mpeg_priv {
-	struct nouveau_mpeg base;
-};
-
-struct nv40_mpeg_chan {
-	struct nouveau_mpeg_chan base;
-};
-
-/*******************************************************************************
- * PMPEG context
- ******************************************************************************/
-
-static int
-nv40_mpeg_context_ctor(struct nouveau_object *parent,
-		       struct nouveau_object *engine,
-		       struct nouveau_oclass *oclass, void *data, u32 size,
-		       struct nouveau_object **pobject)
-{
-	struct nv40_mpeg_chan *chan;
-	int ret;
-
-	ret = nouveau_mpeg_context_create(parent, engine, oclass, NULL,
-					  264 * 4, 16,
-					  NVOBJ_FLAG_ZERO_ALLOC, &chan);
-	*pobject = nv_object(chan);
-	if (ret)
-		return ret;
-
-	nv_wo32(&chan->base.base, 0x78, 0x02001ec1);
-	return 0;
-}
-
-static int
-nv40_mpeg_context_fini(struct nouveau_object *object, bool suspend)
-{
-
-	struct nv40_mpeg_priv *priv = (void *)object->engine;
-	struct nv40_mpeg_chan *chan = (void *)object;
-	u32 inst = 0x80000000 | nv_gpuobj(chan)->addr >> 4;
-
-	nv_mask(priv, 0x00b32c, 0x00000001, 0x00000000);
-	if (nv_rd32(priv, 0x00b318) == inst)
-		nv_mask(priv, 0x00b318, 0x80000000, 0x00000000);
-	nv_mask(priv, 0x00b32c, 0x00000001, 0x00000001);
-	return 0;
-}
-
-static struct nouveau_oclass
-nv40_mpeg_cclass = {
-	.handle = NV_ENGCTX(MPEG, 0x40),
-	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = nv40_mpeg_context_ctor,
-		.dtor = _nouveau_mpeg_context_dtor,
-		.init = _nouveau_mpeg_context_init,
-		.fini = nv40_mpeg_context_fini,
-		.rd32 = _nouveau_mpeg_context_rd32,
-		.wr32 = _nouveau_mpeg_context_wr32,
-	},
-};
+#include <engine/mpeg/nv31.h>
 
 /*******************************************************************************
  * PMPEG engine/subdev functions
@@ -100,7 +40,7 @@ nv40_mpeg_cclass = {
 static void
 nv40_mpeg_intr(struct nouveau_subdev *subdev)
 {
-	struct nv40_mpeg_priv *priv = (void *)subdev;
+	struct nv31_mpeg_priv *priv = (void *)subdev;
 	u32 stat;
 
 	if ((stat = nv_rd32(priv, 0x00b100)))
@@ -117,7 +57,7 @@ nv40_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	       struct nouveau_oclass *oclass, void *data, u32 size,
 	       struct nouveau_object **pobject)
 {
-	struct nv40_mpeg_priv *priv;
+	struct nv31_mpeg_priv *priv;
 	int ret;
 
 	ret = nouveau_mpeg_create(parent, engine, oclass, &priv);
@@ -127,7 +67,7 @@ nv40_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	nv_subdev(priv)->unit = 0x00000002;
 	nv_subdev(priv)->intr = nv40_mpeg_intr;
-	nv_engine(priv)->cclass = &nv40_mpeg_cclass;
+	nv_engine(priv)->cclass = &nv31_mpeg_cclass;
 	nv_engine(priv)->sclass = nv31_mpeg_sclass;
 	nv_engine(priv)->tile_prog = nv31_mpeg_tile_prog;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
index 6f4263d..8b7560e 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
@@ -45,7 +45,7 @@ extern struct nouveau_oclass nv40_mpeg_oclass;
 extern struct nouveau_oclass nv44_mpeg_oclass;
 extern struct nouveau_oclass nv50_mpeg_oclass;
 extern struct nouveau_oclass nv84_mpeg_oclass;
-
+extern struct nouveau_oclass nv31_mpeg_cclass;
 extern struct nouveau_oclass nv31_mpeg_sclass[];
 void nv31_mpeg_intr(struct nouveau_subdev *);
 void nv31_mpeg_tile_prog(struct nouveau_engine *, int);
-- 
1.8.1.5
