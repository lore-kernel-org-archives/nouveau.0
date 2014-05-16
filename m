From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] clk: allow config option to enable reclocking
Date: Fri, 16 May 2014 12:42:45 -0400
Message-ID: <1400258565-28941-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Adds a NvReclock boolean option to allow the user to enable (or disable)
reclocking. All chipsets default to off, except NVAA/NVAC, which are
reportedly complete.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Ben, I know you've been saying that reclocking is in a pretty bad state, but I
do think that there are going to be groups of people for whom the current code
can work at least a little bit. May as well let them try it. The memory script
execution is still behind the extra-special flag as well...

Also this provides a way forward to enable reclocking on some chips and leave
it off for others, by default.

 nvkm/include/subdev/clock.h | 8 +++++---
 nvkm/subdev/clock/base.c    | 8 ++++++--
 nvkm/subdev/clock/nv04.c    | 3 ++-
 nvkm/subdev/clock/nv40.c    | 3 ++-
 nvkm/subdev/clock/nv50.c    | 2 +-
 nvkm/subdev/clock/nva3.c    | 3 ++-
 nvkm/subdev/clock/nvaa.c    | 3 ++-
 nvkm/subdev/clock/nvc0.c    | 3 ++-
 nvkm/subdev/clock/nve0.c    | 3 ++-
 9 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/nvkm/include/subdev/clock.h b/nvkm/include/subdev/clock.h
index 8f4ced7..c01e29c 100644
--- a/nvkm/include/subdev/clock.h
+++ b/nvkm/include/subdev/clock.h
@@ -77,6 +77,8 @@ struct nouveau_clock {
 	int tstate; /* thermal adjustment (max-) */
 	int dstate; /* display adjustment (min+) */
 
+	bool allow_reclock;
+
 	int  (*read)(struct nouveau_clock *, enum nv_clk_src);
 	int  (*calc)(struct nouveau_clock *, struct nouveau_cstate *);
 	int  (*prog)(struct nouveau_clock *);
@@ -106,8 +108,8 @@ struct nouveau_clocks {
 	int mdiv;
 };
 
-#define nouveau_clock_create(p,e,o,i,d)                                        \
-	nouveau_clock_create_((p), (e), (o), (i), sizeof(**d), (void **)d)
+#define nouveau_clock_create(p,e,o,i,r,d)                                      \
+	nouveau_clock_create_((p), (e), (o), (i), (r), sizeof(**d), (void **)d)
 #define nouveau_clock_destroy(p) ({                                            \
 	struct nouveau_clock *clk = (p);                                       \
 	_nouveau_clock_dtor(nv_object(clk));                                   \
@@ -121,7 +123,7 @@ struct nouveau_clocks {
 
 int  nouveau_clock_create_(struct nouveau_object *, struct nouveau_object *,
 			   struct nouveau_oclass *,
-			   struct nouveau_clocks *, int, void **);
+			   struct nouveau_clocks *, bool, int, void **);
 void _nouveau_clock_dtor(struct nouveau_object *);
 int _nouveau_clock_init(struct nouveau_object *);
 #define _nouveau_clock_fini _nouveau_subdev_fini
diff --git a/nvkm/subdev/clock/base.c b/nvkm/subdev/clock/base.c
index dd62bae..80ad9d3 100644
--- a/nvkm/subdev/clock/base.c
+++ b/nvkm/subdev/clock/base.c
@@ -346,8 +346,8 @@ nouveau_clock_ustate_update(struct nouveau_clock *clk, int req)
 	struct nouveau_pstate *pstate;
 	int i = 0;
 
-	/* YKW repellant */
-	return -ENOSYS;
+	if (!clk->allow_reclock)
+		return -ENOSYS;
 
 	if (req != -1 && req != -2) {
 		list_for_each_entry(pstate, &clk->states, head) {
@@ -456,6 +456,7 @@ nouveau_clock_create_(struct nouveau_object *parent,
 		      struct nouveau_object *engine,
 		      struct nouveau_oclass *oclass,
 		      struct nouveau_clocks *clocks,
+		      bool allow_reclock,
 		      int length, void **object)
 {
 	struct nouveau_device *device = nv_device(parent);
@@ -478,6 +479,9 @@ nouveau_clock_create_(struct nouveau_object *parent,
 		ret = nouveau_pstate_new(clk, idx++);
 	} while (ret == 0);
 
+	clk->allow_reclock =
+		nouveau_boolopt(device->cfgopt, "NvReclock", allow_reclock);
+
 	mode = nouveau_stropt(device->cfgopt, "NvClkMode", &arglen);
 	if (mode) {
 		if (!strncasecmpz(mode, "disabled", arglen)) {
diff --git a/nvkm/subdev/clock/nv04.c b/nvkm/subdev/clock/nv04.c
index b74db6c..eb2d442 100644
--- a/nvkm/subdev/clock/nv04.c
+++ b/nvkm/subdev/clock/nv04.c
@@ -82,7 +82,8 @@ nv04_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv04_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nv04_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nv04_domain, false,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nv40.c b/nvkm/subdev/clock/nv40.c
index db7346f..651e299 100644
--- a/nvkm/subdev/clock/nv40.c
+++ b/nvkm/subdev/clock/nv40.c
@@ -213,7 +213,8 @@ nv40_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv40_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nv40_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nv40_domain, false,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nv50.c b/nvkm/subdev/clock/nv50.c
index 250a6d9..8c13277 100644
--- a/nvkm/subdev/clock/nv50.c
+++ b/nvkm/subdev/clock/nv50.c
@@ -507,7 +507,7 @@ nv50_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_clock_create(parent, engine, oclass, pclass->domains,
-				  &priv);
+				   false, &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nva3.c b/nvkm/subdev/clock/nva3.c
index 4f5a137..9fb5835 100644
--- a/nvkm/subdev/clock/nva3.c
+++ b/nvkm/subdev/clock/nva3.c
@@ -302,7 +302,8 @@ nva3_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nva3_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nva3_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nva3_domain, false,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nvaa.c b/nvkm/subdev/clock/nvaa.c
index 7a723b4..6a65fc9 100644
--- a/nvkm/subdev/clock/nvaa.c
+++ b/nvkm/subdev/clock/nvaa.c
@@ -421,7 +421,8 @@ nvaa_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvaa_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nvaa_domains, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nvaa_domains, true,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nvc0.c b/nvkm/subdev/clock/nvc0.c
index c310572..dbf8517 100644
--- a/nvkm/subdev/clock/nvc0.c
+++ b/nvkm/subdev/clock/nvc0.c
@@ -437,7 +437,8 @@ nvc0_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nvc0_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nvc0_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nvc0_domain, false,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
diff --git a/nvkm/subdev/clock/nve0.c b/nvkm/subdev/clock/nve0.c
index d3c37c9..860aa73 100644
--- a/nvkm/subdev/clock/nve0.c
+++ b/nvkm/subdev/clock/nve0.c
@@ -473,7 +473,8 @@ nve0_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nve0_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nve0_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nve0_domain, false,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
-- 
1.8.5.5
