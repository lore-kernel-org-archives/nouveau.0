From: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] perfmon: remove PDAEMON signals
Date: Mon, 15 Sep 2014 13:25:42 +0200
Message-ID: <1410780342-2808-4-git-send-email-samuel.pitoiset@gmail.com>
References: <1410780342-2808-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410780342-2808-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

As discussed with Martin Peres, PDAEMON signals should be exposed
through sysfs and not managed by the perfmon engine which is only
used for performance counters.

Signed-off-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drm/Kbuild                       |   1 -
 drm/core/engine/perfmon/daemon.c |   1 -
 nvkm/engine/perfmon/Makefile.am  |   1 -
 nvkm/engine/perfmon/daemon.c     | 109 ---------------------------------------
 nvkm/engine/perfmon/nva3.c       |  20 +------
 nvkm/engine/perfmon/nvc0.c       |   6 ---
 nvkm/engine/perfmon/nve0.c       |   7 ---
 nvkm/engine/perfmon/nvf0.c       |   5 --
 nvkm/engine/perfmon/priv.h       |   4 --
 nvkm/include/engine/perfmon.h    |   4 --
 10 files changed, 1 insertion(+), 157 deletions(-)
 delete mode 120000 drm/core/engine/perfmon/daemon.c
 delete mode 100644 nvkm/engine/perfmon/daemon.c

diff --git a/drm/Kbuild b/drm/Kbuild
index 949a034..b63c0ed 100644
--- a/drm/Kbuild
+++ b/drm/Kbuild
@@ -319,7 +319,6 @@ nouveau-y += core/engine/mpeg/nv44.o
 nouveau-y += core/engine/mpeg/nv50.o
 nouveau-y += core/engine/mpeg/nv84.o
 nouveau-y += core/engine/perfmon/base.o
-nouveau-y += core/engine/perfmon/daemon.o
 nouveau-y += core/engine/perfmon/nv40.o
 nouveau-y += core/engine/perfmon/nv50.o
 nouveau-y += core/engine/perfmon/nv84.o
diff --git a/drm/core/engine/perfmon/daemon.c b/drm/core/engine/perfmon/daemon.c
deleted file mode 120000
index 3351142..0000000
--- a/drm/core/engine/perfmon/daemon.c
+++ /dev/null
@@ -1 +0,0 @@
-../../../../nvkm/engine/perfmon/daemon.c
\ No newline at end of file
diff --git a/nvkm/engine/perfmon/Makefile.am b/nvkm/engine/perfmon/Makefile.am
index f6e2279..48e3801 100644
--- a/nvkm/engine/perfmon/Makefile.am
+++ b/nvkm/engine/perfmon/Makefile.am
@@ -1,7 +1,6 @@
 noinst_LTLIBRARIES = libperfmon.la
 
 libperfmon_la_SOURCES = base.c \
-			daemon.c \
 			nv40.c \
 			nv50.c \
 			nv84.c \
diff --git a/nvkm/engine/perfmon/daemon.c b/nvkm/engine/perfmon/daemon.c
deleted file mode 100644
index 50696cc..0000000
--- a/nvkm/engine/perfmon/daemon.c
+++ /dev/null
@@ -1,109 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-
-#include "priv.h"
-
-static void
-pwr_perfctr_init(struct nouveau_perfmon *ppm, struct nouveau_perfdom *dom,
-		 struct nouveau_perfctr *ctr)
-{
-	u32 mask = 0x00000000;
-	u32 ctrl = 0x00000001;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ctr->signal) && ctr->signal[i]; i++)
-		mask |= 1 << (ctr->signal[i] - dom->signal);
-
-	nv_wr32(ppm, 0x10a504 + (ctr->slot * 0x10), mask);
-	nv_wr32(ppm, 0x10a50c + (ctr->slot * 0x10), ctrl);
-	nv_wr32(ppm, 0x10a50c + (ppm->last * 0x10), 0x00000003);
-}
-
-static void
-pwr_perfctr_read(struct nouveau_perfmon *ppm, struct nouveau_perfdom *dom,
-		 struct nouveau_perfctr *ctr)
-{
-	ctr->ctr = ppm->pwr[ctr->slot];
-	ctr->clk = ppm->pwr[ppm->last];
-}
-
-static void
-pwr_perfctr_next(struct nouveau_perfmon *ppm, struct nouveau_perfdom *dom)
-{
-	int i;
-
-	for (i = 0; i <= ppm->last; i++) {
-		ppm->pwr[i] = nv_rd32(ppm, 0x10a508 + (i * 0x10));
-		nv_wr32(ppm, 0x10a508 + (i * 0x10), 0x80000000);
-	}
-}
-
-static const struct nouveau_funcdom
-pwr_perfctr_func = {
-	.init = pwr_perfctr_init,
-	.read = pwr_perfctr_read,
-	.next = pwr_perfctr_next,
-};
-
-const struct nouveau_specdom
-nva3_perfmon_pwr[] = {
-	{ 0x20, (const struct nouveau_specsig[]) {
-			{ 0x00, "pwr_gr_idle" },
-			{ 0x04, "pwr_bsp_idle" },
-			{ 0x05, "pwr_vp_idle" },
-			{ 0x06, "pwr_ppp_idle" },
-			{ 0x13, "pwr_ce0_idle" },
-			{}
-		}, &pwr_perfctr_func },
-	{}
-};
-
-const struct nouveau_specdom
-nvc0_perfmon_pwr[] = {
-	{ 0x20, (const struct nouveau_specsig[]) {
-			{ 0x00, "pwr_gr_idle" },
-			{ 0x04, "pwr_bsp_idle" },
-			{ 0x05, "pwr_vp_idle" },
-			{ 0x06, "pwr_ppp_idle" },
-			{ 0x13, "pwr_ce0_idle" },
-			{ 0x14, "pwr_ce1_idle" },
-			{}
-		}, &pwr_perfctr_func },
-	{}
-};
-
-const struct nouveau_specdom
-nve0_perfmon_pwr[] = {
-	{ 0x20, (const struct nouveau_specsig[]) {
-			{ 0x00, "pwr_gr_idle" },
-			{ 0x04, "pwr_bsp_idle" },
-			{ 0x05, "pwr_vp_idle" },
-			{ 0x06, "pwr_ppp_idle" },
-			{ 0x13, "pwr_ce0_idle" },
-			{ 0x14, "pwr_ce1_idle" },
-			{ 0x15, "pwr_ce2_idle" },
-			{}
-		}, &pwr_perfctr_func },
-	{}
-};
diff --git a/nvkm/engine/perfmon/nva3.c b/nvkm/engine/perfmon/nva3.c
index 6197ebd..43e17cd 100644
--- a/nvkm/engine/perfmon/nva3.c
+++ b/nvkm/engine/perfmon/nva3.c
@@ -65,29 +65,11 @@ nva3_perfmon[] = {
 	{}
 };
 
-static int
-nva3_perfmon_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
-		  struct nouveau_oclass *oclass, void *data, u32 size,
-		  struct nouveau_object **object)
-{
-	int ret = nv40_perfmon_ctor(parent, engine, oclass, data, size, object);
-	if (ret == 0) {
-		struct nv40_perfmon_priv *priv = (void *)*object;
-		ret = nouveau_perfdom_new(&priv->base, "pwr", 0, 0, 0, 0,
-					   nva3_perfmon_pwr);
-		if (ret)
-			return ret;
-
-		priv->base.last = 3;
-	}
-	return ret;
-}
-
 struct nouveau_oclass *
 nva3_perfmon_oclass = &(struct nv40_perfmon_oclass) {
 	.base.handle = NV_ENGINE(PERFMON, 0xa3),
 	.base.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = nva3_perfmon_ctor,
+		.ctor = nv40_perfmon_ctor,
 		.dtor = _nouveau_perfmon_dtor,
 		.init = _nouveau_perfmon_init,
 		.fini = _nouveau_perfmon_fini,
diff --git a/nvkm/engine/perfmon/nvc0.c b/nvkm/engine/perfmon/nvc0.c
index 74b2410..420d42f 100644
--- a/nvkm/engine/perfmon/nvc0.c
+++ b/nvkm/engine/perfmon/nvc0.c
@@ -124,11 +124,6 @@ nvc0_perfmon_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	ret = nouveau_perfdom_new(&priv->base, "pwr", 0, 0, 0, 0,
-				   nvc0_perfmon_pwr);
-	if (ret)
-		return ret;
-
 	/* HUB */
 	ret = nouveau_perfdom_new(&priv->base, "hub", 0, 0x1b0000, 0, 0x200,
 				   nvc0_perfmon_hub);
@@ -157,7 +152,6 @@ nvc0_perfmon_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	nv_engine(priv)->cclass = &nouveau_perfmon_cclass;
 	nv_engine(priv)->sclass =  nouveau_perfmon_sclass;
-	priv->base.last = 7;
 	return 0;
 }
 
diff --git a/nvkm/engine/perfmon/nve0.c b/nvkm/engine/perfmon/nve0.c
index 71d718c..333a282 100644
--- a/nvkm/engine/perfmon/nve0.c
+++ b/nvkm/engine/perfmon/nve0.c
@@ -112,12 +112,6 @@ nve0_perfmon_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	/* PDAEMON */
-	ret = nouveau_perfdom_new(&priv->base, "pwr", 0, 0, 0, 0,
-				   nve0_perfmon_pwr);
-	if (ret)
-		return ret;
-
 	/* HUB */
 	ret = nouveau_perfdom_new(&priv->base, "hub", 0, 0x1b0000, 0, 0x200,
 				   nve0_perfmon_hub);
@@ -146,7 +140,6 @@ nve0_perfmon_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	nv_engine(priv)->cclass = &nouveau_perfmon_cclass;
 	nv_engine(priv)->sclass =  nouveau_perfmon_sclass;
-	priv->base.last = 7;
 	return 0;
 }
 
diff --git a/nvkm/engine/perfmon/nvf0.c b/nvkm/engine/perfmon/nvf0.c
index 47256f7..c3a0d30 100644
--- a/nvkm/engine/perfmon/nvf0.c
+++ b/nvkm/engine/perfmon/nvf0.c
@@ -49,11 +49,6 @@ nvf0_perfmon_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	ret = nouveau_perfdom_new(&priv->base, "pwr", 0, 0, 0, 0,
-				   nve0_perfmon_pwr);
-	if (ret)
-		return ret;
-
 	nv_engine(priv)->cclass = &nouveau_perfmon_cclass;
 	nv_engine(priv)->sclass =  nouveau_perfmon_sclass;
 	return 0;
diff --git a/nvkm/engine/perfmon/priv.h b/nvkm/engine/perfmon/priv.h
index 9e27ff5..f32fe71 100644
--- a/nvkm/engine/perfmon/priv.h
+++ b/nvkm/engine/perfmon/priv.h
@@ -38,10 +38,6 @@ struct nouveau_specdom {
 	const struct nouveau_funcdom *func;
 };
 
-extern const struct nouveau_specdom nva3_perfmon_pwr[];
-extern const struct nouveau_specdom nvc0_perfmon_pwr[];
-extern const struct nouveau_specdom nve0_perfmon_pwr[];
-
 struct nouveau_perfdom {
 	struct list_head head;
 	struct list_head list;
diff --git a/nvkm/include/engine/perfmon.h b/nvkm/include/engine/perfmon.h
index 88cc812..0cc2430 100644
--- a/nvkm/include/engine/perfmon.h
+++ b/nvkm/include/engine/perfmon.h
@@ -15,10 +15,6 @@ struct nouveau_perfmon {
 
 	struct list_head domains;
 	u32 sequence;
-
-	/*XXX: temp for daemon backend */
-	u32 pwr[8];
-	u32 last;
 };
 
 static inline struct nouveau_perfmon *
-- 
2.0.0
