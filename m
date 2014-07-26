From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/3] clk: support for non-BIOS pstates
Date: Sat, 26 Jul 2014 18:41:40 +0900
Message-ID: <1406367701-9155-3-git-send-email-gnurou@gmail.com>
References: <1406367701-9155-1-git-send-email-gnurou@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1406367701-9155-1-git-send-email-gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Make nouveau_clock_create() take new two optional arguments: an array
of pstates and its size. When these are specified,
nouveau_clock_create() will use the provided pstates instead of
probing them using the BIOS.

This is useful for platforms which do not provide a BIOS, like Tegra.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 nvkm/include/subdev/clock.h |  8 +++++---
 nvkm/subdev/clock/base.c    | 16 ++++++++++++----
 nvkm/subdev/clock/nv04.c    |  4 ++--
 nvkm/subdev/clock/nv40.c    |  4 ++--
 nvkm/subdev/clock/nv50.c    |  2 +-
 nvkm/subdev/clock/nva3.c    |  4 ++--
 nvkm/subdev/clock/nvaa.c    |  4 ++--
 nvkm/subdev/clock/nvc0.c    |  4 ++--
 nvkm/subdev/clock/nve0.c    |  4 ++--
 9 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/nvkm/include/subdev/clock.h b/nvkm/include/subdev/clock.h
index 9f37c09..a758147 100644
--- a/nvkm/include/subdev/clock.h
+++ b/nvkm/include/subdev/clock.h
@@ -115,8 +115,9 @@ struct nouveau_clocks {
 	int mdiv;
 };
 
-#define nouveau_clock_create(p,e,o,i,r,d)                                      \
-	nouveau_clock_create_((p), (e), (o), (i), (r), sizeof(**d), (void **)d)
+#define nouveau_clock_create(p,e,o,i,r,s,n,d)                                  \
+	nouveau_clock_create_((p), (e), (o), (i), (r), (s), (n), sizeof(**d),  \
+			      (void **)d)
 #define nouveau_clock_destroy(p) ({                                            \
 	struct nouveau_clock *clk = (p);                                       \
 	_nouveau_clock_dtor(nv_object(clk));                                   \
@@ -132,7 +133,8 @@ struct nouveau_clocks {
 
 int  nouveau_clock_create_(struct nouveau_object *, struct nouveau_object *,
 			   struct nouveau_oclass *,
-			   struct nouveau_clocks *, bool, int, void **);
+			   struct nouveau_clocks *, struct nouveau_pstate *,
+			   int, bool, int, void **);
 void _nouveau_clock_dtor(struct nouveau_object *);
 int  _nouveau_clock_init(struct nouveau_object *);
 int  _nouveau_clock_fini(struct nouveau_object *, bool);
diff --git a/nvkm/subdev/clock/base.c b/nvkm/subdev/clock/base.c
index 508639d..d3f70d8 100644
--- a/nvkm/subdev/clock/base.c
+++ b/nvkm/subdev/clock/base.c
@@ -534,6 +534,7 @@ nouveau_clock_create_(struct nouveau_object *parent,
 		      struct nouveau_object *engine,
 		      struct nouveau_oclass *oclass,
 		      struct nouveau_clocks *clocks,
+		      struct nouveau_pstate *pstates, int nb_pstates,
 		      bool allow_reclock,
 		      int length, void **object)
 {
@@ -557,10 +558,17 @@ nouveau_clock_create_(struct nouveau_object *parent,
 	init_waitqueue_head(&clk->wait);
 	atomic_set(&clk->waiting, 0);
 
-	idx = 0;
-	do {
-		ret = nouveau_pstate_new(clk, idx++);
-	} while (ret == 0);
+	/* If no pstates are provided, try and fetch them from the BIOS */
+	if (!pstates) {
+		idx = 0;
+		do {
+			ret = nouveau_pstate_new(clk, idx++);
+		} while (ret == 0);
+	} else {
+		for (idx = 0; idx < nb_pstates; idx++)
+			list_add_tail(&pstates[idx].head, &clk->states);
+		clk->state_nr = nb_pstates;
+	}
 
 	clk->allow_reclock = allow_reclock;
 
diff --git a/nvkm/subdev/clock/nv04.c b/nvkm/subdev/clock/nv04.c
index eb2d442..4c48232 100644
--- a/nvkm/subdev/clock/nv04.c
+++ b/nvkm/subdev/clock/nv04.c
@@ -82,8 +82,8 @@ nv04_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv04_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nv04_domain, false,
-				   &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nv04_domain, NULL, 0,
+				   false, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nv40.c b/nvkm/subdev/clock/nv40.c
index 8a9e168..08368fe 100644
--- a/nvkm/subdev/clock/nv40.c
+++ b/nvkm/subdev/clock/nv40.c
@@ -213,8 +213,8 @@ nv40_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv40_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nv40_domain, true,
-				   &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nv40_domain, NULL, 0,
+				   true, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nv50.c b/nvkm/subdev/clock/nv50.c
index 8c13277..5070ebc 100644
--- a/nvkm/subdev/clock/nv50.c
+++ b/nvkm/subdev/clock/nv50.c
@@ -507,7 +507,7 @@ nv50_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_clock_create(parent, engine, oclass, pclass->domains,
-				   false, &priv);
+				   NULL, 0, false, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nva3.c b/nvkm/subdev/clock/nva3.c
index 9fb5835..087012b 100644
--- a/nvkm/subdev/clock/nva3.c
+++ b/nvkm/subdev/clock/nva3.c
@@ -302,8 +302,8 @@ nva3_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nva3_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nva3_domain, false,
-				   &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nva3_domain, NULL, 0,
+				   false, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nvaa.c b/nvkm/subdev/clock/nvaa.c
index 6a65fc9..74e1973 100644
--- a/nvkm/subdev/clock/nvaa.c
+++ b/nvkm/subdev/clock/nvaa.c
@@ -421,8 +421,8 @@ nvaa_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvaa_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nvaa_domains, true,
-				   &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nvaa_domains, NULL,
+				   0, true, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nvc0.c b/nvkm/subdev/clock/nvc0.c
index dbf8517..1234aba 100644
--- a/nvkm/subdev/clock/nvc0.c
+++ b/nvkm/subdev/clock/nvc0.c
@@ -437,8 +437,8 @@ nvc0_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvc0_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nvc0_domain, false,
-				   &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nvc0_domain, NULL, 0,
+				   false, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nve0.c b/nvkm/subdev/clock/nve0.c
index 0e62a32..7eccad5 100644
--- a/nvkm/subdev/clock/nve0.c
+++ b/nvkm/subdev/clock/nve0.c
@@ -475,8 +475,8 @@ nve0_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nve0_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nve0_domain, true,
-				   &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nve0_domain, NULL, 0,
+				   true, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
-- 
2.0.2
