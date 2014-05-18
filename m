From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] clk: allow end-user reclocking for nv40, nvaa,
 and nve0 clock types
Date: Sun, 18 May 2014 01:04:16 -0400
Message-ID: <1400389456-2273-2-git-send-email-imirkin@alum.mit.edu>
References: <1400389456-2273-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400389456-2273-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Use with caution.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Same patch as before, but adds nv40 and nve0 as on by default, and removes end
user ability to turn it on for nv50/nva3/nvc0.

I finally found the nv50-related stuff you nuked, and yeah, the current code
definitely can't work as-is. Oh well. I'll play around with reinstating it in
one way or another.

 nvkm/include/subdev/clock.h | 8 +++++---
 nvkm/subdev/clock/base.c    | 7 +++++--
 nvkm/subdev/clock/nv04.c    | 3 ++-
 nvkm/subdev/clock/nv40.c    | 3 ++-
 nvkm/subdev/clock/nv50.c    | 2 +-
 nvkm/subdev/clock/nva3.c    | 3 ++-
 nvkm/subdev/clock/nvaa.c    | 3 ++-
 nvkm/subdev/clock/nvc0.c    | 3 ++-
 nvkm/subdev/clock/nve0.c    | 3 ++-
 9 files changed, 23 insertions(+), 12 deletions(-)

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
index dd62bae..22351f5 100644
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
@@ -478,6 +479,8 @@ nouveau_clock_create_(struct nouveau_object *parent,
 		ret = nouveau_pstate_new(clk, idx++);
 	} while (ret == 0);
 
+	clk->allow_reclock = allow_reclock;
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
index db7346f..8a9e168 100644
--- a/nvkm/subdev/clock/nv40.c
+++ b/nvkm/subdev/clock/nv40.c
@@ -213,7 +213,8 @@ nv40_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nv40_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nv40_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nv40_domain, true,
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
index d3c37c9..4ac1aa3 100644
--- a/nvkm/subdev/clock/nve0.c
+++ b/nvkm/subdev/clock/nve0.c
@@ -473,7 +473,8 @@ nve0_clock_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	struct nve0_clock_priv *priv;
 	int ret;
 
-	ret = nouveau_clock_create(parent, engine, oclass, nve0_domain, &priv);
+	ret = nouveau_clock_create(parent, engine, oclass, nve0_domain, true,
+				   &priv);
 	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
-- 
1.8.5.5
