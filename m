From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau: get rid of math.h,
	replace log2i with order_base_2
Date: Sat, 27 Jul 2013 00:27:00 -0400
Message-ID: <1374899221-11511-2-git-send-email-imirkin@alum.mit.edu>
References: <1374899221-11511-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1374899221-11511-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Fairly sure that the functions are the same, I pulled both
implementations into a standalone C program and compared. It's nice to
use the shared implementations, IMO.

 drivers/gpu/drm/nouveau/core/core/ramht.c        |  5 +++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c  |  5 +++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c  |  5 +++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  |  5 +++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c  |  5 +++--
 drivers/gpu/drm/nouveau/core/include/core/math.h | 16 ----------------
 6 files changed, 15 insertions(+), 26 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/core/include/core/math.h

diff --git a/drivers/gpu/drm/nouveau/core/core/ramht.c b/drivers/gpu/drm/nouveau/core/core/ramht.c
index 86a6404..5596ebe 100644
--- a/drivers/gpu/drm/nouveau/core/core/ramht.c
+++ b/drivers/gpu/drm/nouveau/core/core/ramht.c
@@ -20,9 +20,10 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/log2.h>
+
 #include <core/object.h>
 #include <core/ramht.h>
-#include <core/math.h>
 
 #include <subdev/bar.h>
 
@@ -104,6 +105,6 @@ nouveau_ramht_new(struct nouveau_object *parent, struct nouveau_object *pargpu,
 	if (ret)
 		return ret;
 
-	ramht->bits = log2i(nv_gpuobj(ramht)->size >> 3);
+	ramht->bits = order_base_2(nv_gpuobj(ramht)->size >> 3);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
index e9b8217..267532e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
@@ -22,11 +22,12 @@
  * Authors: Ben Skeggs
  */
 
+#include <linux/log2.h>
+
 #include <core/client.h>
 #include <core/engctx.h>
 #include <core/ramht.h>
 #include <core/class.h>
-#include <core/math.h>
 
 #include <subdev/timer.h>
 #include <subdev/bar.h>
@@ -278,7 +279,7 @@ nv50_fifo_chan_ctor_ind(struct nouveau_object *parent,
 		return ret;
 
 	ioffset = args->ioffset;
-	ilength = log2i(args->ilength / 8);
+	ilength = order_base_2(args->ilength / 8);
 
 	nv_wo32(base->ramfc, 0x3c, 0x403f6078);
 	nv_wo32(base->ramfc, 0x44, 0x01003fff);
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
index d4ed3b4..4cd4e14 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
@@ -22,13 +22,14 @@
  * Authors: Ben Skeggs
  */
 
+#include <linux/log2.h>
+
 #include <core/os.h>
 #include <core/client.h>
 #include <core/engctx.h>
 #include <core/ramht.h>
 #include <core/event.h>
 #include <core/class.h>
-#include <core/math.h>
 
 #include <subdev/timer.h>
 #include <subdev/bar.h>
@@ -260,7 +261,7 @@ nv84_fifo_chan_ctor_ind(struct nouveau_object *parent,
 	nv_parent(chan)->object_detach = nv50_fifo_object_detach;
 
 	ioffset = args->ioffset;
-	ilength = log2i(args->ilength / 8);
+	ilength = order_base_2(args->ilength / 8);
 
 	nv_wo32(base->ramfc, 0x3c, 0x403f6078);
 	nv_wo32(base->ramfc, 0x44, 0x01003fff);
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
index 46dfa68..51a5226 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
@@ -22,6 +22,8 @@
  * Authors: Ben Skeggs
  */
 
+#include <linux/log2.h>
+
 #include <core/client.h>
 #include <core/handle.h>
 #include <core/namedb.h>
@@ -29,7 +31,6 @@
 #include <core/engctx.h>
 #include <core/event.h>
 #include <core/class.h>
-#include <core/math.h>
 #include <core/enum.h>
 
 #include <subdev/timer.h>
@@ -200,7 +201,7 @@ nvc0_fifo_chan_ctor(struct nouveau_object *parent,
 
 	usermem = chan->base.chid * 0x1000;
 	ioffset = args->ioffset;
-	ilength = log2i(args->ilength / 8);
+	ilength = order_base_2(args->ilength / 8);
 
 	for (i = 0; i < 0x1000; i += 4)
 		nv_wo32(priv->user.mem, usermem + i, 0x00000000);
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
index 09644fa..a821ca3 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
@@ -22,6 +22,8 @@
  * Authors: Ben Skeggs
  */
 
+#include <linux/log2.h>
+
 #include <core/client.h>
 #include <core/handle.h>
 #include <core/namedb.h>
@@ -29,7 +31,6 @@
 #include <core/engctx.h>
 #include <core/event.h>
 #include <core/class.h>
-#include <core/math.h>
 #include <core/enum.h>
 
 #include <subdev/timer.h>
@@ -240,7 +241,7 @@ nve0_fifo_chan_ctor(struct nouveau_object *parent,
 
 	usermem = chan->base.chid * 0x200;
 	ioffset = args->ioffset;
-	ilength = log2i(args->ilength / 8);
+	ilength = order_base_2(args->ilength / 8);
 
 	for (i = 0; i < 0x200; i += 4)
 		nv_wo32(priv->user.mem, usermem + i, 0x00000000);
diff --git a/drivers/gpu/drm/nouveau/core/include/core/math.h b/drivers/gpu/drm/nouveau/core/include/core/math.h
deleted file mode 100644
index f808131..0000000
--- a/drivers/gpu/drm/nouveau/core/include/core/math.h
+++ /dev/null
@@ -1,16 +0,0 @@
-#ifndef __NOUVEAU_MATH_H__
-#define __NOUVEAU_MATH_H__
-
-static inline int
-log2i(u64 base)
-{
-	u64 temp = base >> 1;
-	int log2;
-
-	for (log2 = 0; temp; log2++, temp >>= 1) {
-	}
-
-	return (base & (base - 1)) ? log2 + 1: log2;
-}
-
-#endif
-- 
1.8.1.5
