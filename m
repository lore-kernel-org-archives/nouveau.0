From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau/i2c: pass the function pointers in at creation
	time
Date: Fri, 23 Aug 2013 13:03:14 -0400
Message-ID: <1377277394-7648-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Hans-Peter Deifel <hpdeifel@gmx.de>
List-Id: nouveau.vger.kernel.org

i2c_bit_add_bus can call the pre_xfer function, which expects the func
pointer to be set. Pass in func to the port creation logic so that it is
set before i2c_bit_add_bus.

See https://bugs.freedesktop.org/show_bug.cgi?id=68456

Reported-by: Hans-Peter Deifel <hpdeifel@gmx.de>
Tested-by: Hans-Peter Deifel <hpdeifel@gmx.de>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

This will only happen if i2c_algo_bit.bit_test=1.

 drivers/gpu/drm/nouveau/core/include/subdev/i2c.h |  8 +++++---
 drivers/gpu/drm/nouveau/core/subdev/i2c/anx9805.c | 10 ++++------
 drivers/gpu/drm/nouveau/core/subdev/i2c/base.c    |  2 ++
 drivers/gpu/drm/nouveau/core/subdev/i2c/nv04.c    |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/i2c/nv4e.c    |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.c    |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c    |  8 ++++----
 drivers/gpu/drm/nouveau/core/subdev/i2c/nvd0.c    |  4 ++--
 8 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/i2c.h b/drivers/gpu/drm/nouveau/core/include/subdev/i2c.h
index 888384c..7e4e277 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/i2c.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/i2c.h
@@ -39,8 +39,8 @@ struct nouveau_i2c_func {
 	int  (*drv_ctl)(struct nouveau_i2c_port *, int lane, int sw, int pe);
 };
 
-#define nouveau_i2c_port_create(p,e,o,i,a,d)                                   \
-	nouveau_i2c_port_create_((p), (e), (o), (i), (a),                      \
+#define nouveau_i2c_port_create(p,e,o,i,a,f,d)                                 \
+	nouveau_i2c_port_create_((p), (e), (o), (i), (a), (f),                 \
 				 sizeof(**d), (void **)d)
 #define nouveau_i2c_port_destroy(p) ({                                         \
 	struct nouveau_i2c_port *port = (p);                                   \
@@ -53,7 +53,9 @@ struct nouveau_i2c_func {
 
 int nouveau_i2c_port_create_(struct nouveau_object *, struct nouveau_object *,
 			     struct nouveau_oclass *, u8,
-			     const struct i2c_algorithm *, int, void **);
+			     const struct i2c_algorithm *,
+			     const struct nouveau_i2c_func *,
+			     int, void **);
 void _nouveau_i2c_port_dtor(struct nouveau_object *);
 #define _nouveau_i2c_port_init nouveau_object_init
 #define _nouveau_i2c_port_fini nouveau_object_fini
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/anx9805.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/anx9805.c
index dec94e9..4b195ac 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/anx9805.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/anx9805.c
@@ -118,7 +118,8 @@ anx9805_aux_chan_ctor(struct nouveau_object *parent,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_aux_algo, &chan);
+				      &nouveau_i2c_aux_algo, &anx9805_aux_func,
+				      &chan);
 	*pobject = nv_object(chan);
 	if (ret)
 		return ret;
@@ -140,8 +141,6 @@ anx9805_aux_chan_ctor(struct nouveau_object *parent,
 		struct i2c_algo_bit_data *algo = mast->adapter.algo_data;
 		algo->udelay = max(algo->udelay, 40);
 	}
-
-	chan->base.func = &anx9805_aux_func;
 	return 0;
 }
 
@@ -234,7 +233,8 @@ anx9805_ddc_port_ctor(struct nouveau_object *parent,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &anx9805_i2c_algo, &port);
+				      &anx9805_i2c_algo, &anx9805_i2c_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
@@ -256,8 +256,6 @@ anx9805_ddc_port_ctor(struct nouveau_object *parent,
 		struct i2c_algo_bit_data *algo = mast->adapter.algo_data;
 		algo->udelay = max(algo->udelay, 40);
 	}
-
-	port->base.func = &anx9805_i2c_func;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
index 8ae2625..2895c19 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c
@@ -95,6 +95,7 @@ nouveau_i2c_port_create_(struct nouveau_object *parent,
 			 struct nouveau_object *engine,
 			 struct nouveau_oclass *oclass, u8 index,
 			 const struct i2c_algorithm *algo,
+			 const struct nouveau_i2c_func *func,
 			 int size, void **pobject)
 {
 	struct nouveau_device *device = nv_device(parent);
@@ -112,6 +113,7 @@ nouveau_i2c_port_create_(struct nouveau_object *parent,
 	port->adapter.owner = THIS_MODULE;
 	port->adapter.dev.parent = &device->pdev->dev;
 	port->index = index;
+	port->func = func;
 	i2c_set_adapdata(&port->adapter, i2c);
 
 	if ( algo == &nouveau_i2c_bit_algo &&
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv04.c
index 2ad1884..860d5d2 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv04.c
@@ -91,12 +91,12 @@ nv04_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_bit_algo, &port);
+				      &nouveau_i2c_bit_algo, &nv04_i2c_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
 
-	port->base.func = &nv04_i2c_func;
 	port->drive = info->drive;
 	port->sense = info->sense;
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv4e.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv4e.c
index f501ae2..0c2655a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv4e.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv4e.c
@@ -84,12 +84,12 @@ nv4e_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_bit_algo, &port);
+				      &nouveau_i2c_bit_algo, &nv4e_i2c_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
 
-	port->base.func = &nv4e_i2c_func;
 	port->addr = 0x600800 + info->drive;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.c
index 378dfa3..a8d67a2 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.c
@@ -85,7 +85,8 @@ nv50_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_bit_algo, &port);
+				      &nouveau_i2c_bit_algo, &nv50_i2c_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
@@ -93,7 +94,6 @@ nv50_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (info->drive >= nv50_i2c_addr_nr)
 		return -EINVAL;
 
-	port->base.func = &nv50_i2c_func;
 	port->state = 0x00000007;
 	port->addr = nv50_i2c_addr[info->drive];
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c
index 61b7716..df6d3e4 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c
@@ -186,7 +186,8 @@ nv94_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_bit_algo, &port);
+				      &nouveau_i2c_bit_algo, &nv94_i2c_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
@@ -194,7 +195,6 @@ nv94_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (info->drive >= nv50_i2c_addr_nr)
 		return -EINVAL;
 
-	port->base.func = &nv94_i2c_func;
 	port->state = 7;
 	port->addr = nv50_i2c_addr[info->drive];
 	if (info->share != DCB_I2C_UNUSED) {
@@ -221,12 +221,12 @@ nv94_aux_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_aux_algo, &port);
+				      &nouveau_i2c_aux_algo, &nv94_aux_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
 
-	port->base.func = &nv94_aux_func;
 	port->addr = info->drive;
 	if (info->share != DCB_I2C_UNUSED) {
 		port->ctrl = 0x00e500 + (info->drive * 0x50);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nvd0.c b/drivers/gpu/drm/nouveau/core/subdev/i2c/nvd0.c
index f761b8a..29967d3 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/i2c/nvd0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/i2c/nvd0.c
@@ -60,12 +60,12 @@ nvd0_i2c_port_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	int ret;
 
 	ret = nouveau_i2c_port_create(parent, engine, oclass, index,
-				     &nouveau_i2c_bit_algo, &port);
+				      &nouveau_i2c_bit_algo, &nvd0_i2c_func,
+				      &port);
 	*pobject = nv_object(port);
 	if (ret)
 		return ret;
 
-	port->base.func = &nvd0_i2c_func;
 	port->state = 0x00000007;
 	port->addr = 0x00d014 + (info->drive * 0x20);
 	if (info->share != DCB_I2C_UNUSED) {
-- 
1.8.1.5
