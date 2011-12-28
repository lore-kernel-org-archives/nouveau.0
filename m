From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: move definition of nouveau_grctx to
 separate file
Date: Wed, 28 Dec 2011 22:48:02 +0100
Message-ID: <20111228214802.GB4275@joi.lan>
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

Avoids conditional definition of grctx build functions, which is hard
for IDE's to handle properly.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_grctx.h     |   21 ++-------------------
 drivers/gpu/drm/nouveau/nouveau_grctx_def.h |   21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv40_graph.c        |    2 +-
 drivers/gpu/drm/nouveau/nv50_graph.c        |    2 +-
 4 files changed, 25 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_grctx_def.h

diff --git a/drivers/gpu/drm/nouveau/nouveau_grctx.h b/drivers/gpu/drm/nouveau/nouveau_grctx.h
index 86c2e37..359244c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_grctx.h
+++ b/drivers/gpu/drm/nouveau/nouveau_grctx.h
@@ -1,24 +1,8 @@
 #ifndef __NOUVEAU_GRCTX_H__
 #define __NOUVEAU_GRCTX_H__
 
-struct nouveau_grctx {
-	struct drm_device *dev;
-
-	enum {
-		NOUVEAU_GRCTX_PROG,
-		NOUVEAU_GRCTX_VALS
-	} mode;
-	void *data;
-
-	uint32_t ctxprog_max;
-	uint32_t ctxprog_len;
-	uint32_t ctxprog_reg;
-	int      ctxprog_label[32];
-	uint32_t ctxvals_pos;
-	uint32_t ctxvals_base;
-};
-
-#ifdef CP_CTX
+#include "nouveau_grctx_def.h"
+
 static inline void
 cp_out(struct nouveau_grctx *ctx, uint32_t inst)
 {
@@ -128,6 +112,5 @@ gr_def(struct nouveau_grctx *ctx, uint32_t reg, uint32_t val)
 
 	nv_wo32(ctx->data, reg * 4, val);
 }
-#endif
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_grctx_def.h b/drivers/gpu/drm/nouveau/nouveau_grctx_def.h
new file mode 100644
index 0000000..f9a4e12
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_grctx_def.h
@@ -0,0 +1,21 @@
+#ifndef __NOUVEAU_GRCTX_DEF_H__
+#define __NOUVEAU_GRCTX_DEF_H__
+
+struct nouveau_grctx {
+	struct drm_device *dev;
+
+	enum {
+		NOUVEAU_GRCTX_PROG,
+		NOUVEAU_GRCTX_VALS
+	} mode;
+	void *data;
+
+	uint32_t ctxprog_max;
+	uint32_t ctxprog_len;
+	uint32_t ctxprog_reg;
+	int      ctxprog_label[32];
+	uint32_t ctxvals_pos;
+	uint32_t ctxvals_base;
+};
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nv40_graph.c b/drivers/gpu/drm/nouveau/nv40_graph.c
index ba14a93..20bb65a 100644
--- a/drivers/gpu/drm/nouveau/nv40_graph.c
+++ b/drivers/gpu/drm/nouveau/nv40_graph.c
@@ -27,7 +27,7 @@
 #include "drmP.h"
 #include "drm.h"
 #include "nouveau_drv.h"
-#include "nouveau_grctx.h"
+#include "nouveau_grctx_def.h"
 #include "nouveau_ramht.h"
 
 struct nv40_graph_engine {
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index ac601f7..01e4f812 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -28,7 +28,7 @@
 #include "drm.h"
 #include "nouveau_drv.h"
 #include "nouveau_ramht.h"
-#include "nouveau_grctx.h"
+#include "nouveau_grctx_def.h"
 #include "nouveau_dma.h"
 #include "nouveau_vm.h"
 #include "nv50_evo.h"
-- 
1.7.8.rc3
