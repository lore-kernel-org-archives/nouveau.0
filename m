From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] drm/nouveau: silence warnings reported during builds with W=1
Date: Wed, 31 Aug 2016 00:17:16 +0800
Message-ID: <1472573836-2759-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get some warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c:222:1: warning: no previous prototype for 'gf117_grctx_generate_main' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c:255:1: warning: no previous prototype for 'nv50_grctx_fill' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c:265:1: warning: no previous prototype for 'nv50_grctx_init' [-Wmissing-prototypes]
....

In fact, some functions are only used in the file in which they
are declared and don't need a declaration, but can be made static.
and others are declared in the header files, but need to add
missing header dependencies.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/dispnv04/overlay.c          | 2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c           | 2 +-
 drivers/gpu/drm/nouveau/nv10_fence.c                | 2 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c        | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c   | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c  | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c   | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c   | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c    | 2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c      | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c      | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c       | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c      | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c     | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c   | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c      | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c      | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c    | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c    | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c     | 2 ++
 23 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index ec444ea..a79514d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -33,7 +33,7 @@
 #include "nouveau_connector.h"
 #include "nouveau_display.h"
 #include "nvreg.h"
-
+#include "disp.h"
 
 struct nouveau_plane {
 	struct drm_plane base;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index afbf557..b60ee21 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -92,7 +92,7 @@ calc(int blanks, int blanke, int total, int line)
 	return line;
 }
 
-int
+static int
 nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 				ktime_t *stime, ktime_t *etime)
 {
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 4e3de34..619f79d 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -66,7 +66,7 @@ nv10_fence_context_del(struct nouveau_channel *chan)
 	nouveau_fence_context_free(&fctx->base);
 }
 
-int
+static int
 nv10_fence_context_new(struct nouveau_channel *chan)
 {
 	struct nv10_fence_chan *fctx;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 34ecd4a..058ff46 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -20,6 +20,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <core/device.h>
+#include <core/firmware.h>
 
 /**
  * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 79a8f71..513ee6b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -326,7 +326,7 @@ nvkm_udevice = {
 	.sclass = nvkm_udevice_child_get,
 };
 
-int
+static int
 nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		 struct nvkm_object **pobject)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
index dd2953b..26990d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
@@ -153,7 +153,7 @@ nv50_disp_chan_uevent = {
 	.fini = nv50_disp_chan_uevent_fini,
 };
 
-int
+static int
 nv50_disp_chan_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
 	struct nv50_disp_chan *chan = nv50_disp_chan(object);
@@ -163,7 +163,7 @@ nv50_disp_chan_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 	return 0;
 }
 
-int
+static int
 nv50_disp_chan_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
 	struct nv50_disp_chan *chan = nv50_disp_chan(object);
@@ -173,7 +173,7 @@ nv50_disp_chan_wr32(struct nvkm_object *object, u64 addr, u32 data)
 	return 0;
 }
 
-int
+static int
 nv50_disp_chan_ntfy(struct nvkm_object *object, u32 type,
 		    struct nvkm_event **pevent)
 {
@@ -189,7 +189,7 @@ nv50_disp_chan_ntfy(struct nvkm_object *object, u32 type,
 	return -EINVAL;
 }
 
-int
+static int
 nv50_disp_chan_map(struct nvkm_object *object, u64 *addr, u32 *size)
 {
 	struct nv50_disp_chan *chan = nv50_disp_chan(object);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
index 2f9cecd..6424b39 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
@@ -66,7 +66,7 @@ nv50_disp_root_scanoutpos(NV50_DISP_MTHD_V0)
 	return 0;
 }
 
-int
+static int
 nv50_disp_root_mthd_(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
 	union {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
index aeb3387..15a992b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
@@ -129,7 +129,7 @@ g84_fifo_chan_engine_fini(struct nvkm_fifo_chan *base,
 }
 
 
-int
+static int
 g84_fifo_chan_engine_init(struct nvkm_fifo_chan *base,
 			  struct nvkm_engine *engine)
 {
@@ -170,7 +170,7 @@ g84_fifo_chan_engine_ctor(struct nvkm_fifo_chan *base,
 	return nvkm_object_bind(object, NULL, 0, &chan->engn[engn]);
 }
 
-int
+static int
 g84_fifo_chan_object_ctor(struct nvkm_fifo_chan *base,
 			  struct nvkm_object *object)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c
index c925ade..74a64e3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c
@@ -218,7 +218,7 @@ gf117_grctx_generate_attrib(struct gf100_grctx *info)
 	}
 }
 
-void
+static void
 gf117_grctx_generate_main(struct gf100_gr *gr, struct gf100_grctx *info)
 {
 	struct nvkm_device *device = gr->base.engine.subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
index 6d3c501..4c4b5ab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c
@@ -933,7 +933,7 @@ gm107_grctx_generate_attrib(struct gf100_grctx *info)
 	}
 }
 
-void
+static void
 gm107_grctx_generate_tpcid(struct gf100_gr *gr)
 {
 	struct nvkm_device *device = gr->base.engine.subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
index 1e13278..0490ee8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
@@ -109,6 +109,8 @@
 
 #include <subdev/fb.h>
 
+#include "nv50.h"
+
 #define IS_NVA3F(x) (((x) > 0xa0 && (x) < 0xaa) || (x) == 0xaf)
 #define IS_NVAAF(x) ((x) >= 0xaa && (x) <= 0xac)
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 157919c..eccdee0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -1384,7 +1384,7 @@ gf100_gr_intr(struct nvkm_gr *base)
 	nvkm_fifo_chan_put(device->fifo, flags, &chan);
 }
 
-void
+static void
 gf100_gr_init_fw(struct gf100_gr *gr, u32 fuc_base,
 		 struct gf100_gr_fuc *code, struct gf100_gr_fuc *data)
 {
@@ -1701,7 +1701,7 @@ gf100_gr_oneinit(struct nvkm_gr *base)
 	return 0;
 }
 
-int
+static int
 gf100_gr_init_(struct nvkm_gr *base)
 {
 	struct gf100_gr *gr = gf100_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c
index 45f965f..2c67fac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c
@@ -308,7 +308,7 @@ gm107_gr_init_bios(struct gf100_gr *gr)
 	}
 }
 
-int
+static int
 gm107_gr_init(struct gf100_gr *gr)
 {
 	struct nvkm_device *device = gr->base.engine.subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
index 8616636..dde89a4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
@@ -71,7 +71,7 @@ nvkm_perfdom_find(struct nvkm_pm *pm, int di)
 	return NULL;
 }
 
-struct nvkm_perfsig *
+static struct nvkm_perfsig *
 nvkm_perfsig_find(struct nvkm_pm *pm, u8 di, u8 si, struct nvkm_perfdom **pdom)
 {
 	struct nvkm_perfdom *dom = *pdom;
@@ -699,7 +699,7 @@ nvkm_pm_oclass_get(struct nvkm_oclass *oclass, int index,
 	return 1;
 }
 
-int
+static int
 nvkm_perfsrc_new(struct nvkm_pm *pm, struct nvkm_perfsig *sig,
 		 const struct nvkm_specsrc *spec)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
index 80fed7e..e290581 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
@@ -25,7 +25,7 @@
 #include <subdev/bios/bit.h>
 #include <subdev/bios/fan.h>
 
-u16
+static u16
 nvbios_fan_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 {
 	struct bit_entry bit_P;
@@ -52,7 +52,7 @@ nvbios_fan_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 	return 0x0000;
 }
 
-u16
+static u16
 nvbios_fan_entry(struct nvkm_bios *bios, int idx, u8 *ver, u8 *hdr,
 		 u8 *cnt, u8 *len)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
index 056702e..96e0941 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c
@@ -180,7 +180,7 @@ gt215_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
 	return 0;
 }
 
-int
+static int
 gt215_clk_info(struct nvkm_clk *base, int idx, u32 khz,
 	       struct gt215_clk_info *info)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index d15ea88..f106643 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -95,7 +95,7 @@ struct gt215_ram {
 	struct gt215_ltrain ltrain;
 };
 
-void
+static void
 gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
 {
 	int i, lo, hi;
@@ -149,7 +149,7 @@ gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
 /*
  * Link training for (at least) DDR3
  */
-int
+static int
 gt215_link_train(struct gt215_ram *ram)
 {
 	struct gt215_ltrain *train = &ram->ltrain;
@@ -267,7 +267,7 @@ out:
 	return ret;
 }
 
-int
+static int
 gt215_link_train_init(struct gt215_ram *ram)
 {
 	static const u32 pattern[16] = {
@@ -333,7 +333,7 @@ gt215_link_train_init(struct gt215_ram *ram)
 	return 0;
 }
 
-void
+static void
 gt215_link_train_fini(struct gt215_ram *ram)
 {
 	if (ram->ltrain.mem)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c
index b9f1ffd..4dcd874 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c
@@ -23,6 +23,7 @@
  *          Ben Skeggs
  */
 #include "priv.h"
+#include "ram.h"
 
 struct ramxlat {
 	int id;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c
index 2690033..eca8a44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c
@@ -23,6 +23,7 @@
  * 	    Roy Spliet <rspliet@eclipso.eu>
  */
 #include "priv.h"
+#include "ram.h"
 
 struct ramxlat {
 	int id;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c
index 3f45afd1..2ead515 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c
@@ -37,7 +37,7 @@ gk104_gpio_intr_stat(struct nvkm_gpio *gpio, u32 *hi, u32 *lo)
 	nvkm_wr32(device, 0x00dc80, intr1);
 }
 
-void
+static void
 gk104_gpio_intr_mask(struct nvkm_gpio *gpio, u32 type, u32 mask, u32 data)
 {
 	struct nvkm_device *device = gpio->subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c
index f1e2dc9..ec48e4a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.c
@@ -1364,7 +1364,7 @@ gm200_secboot_init(struct nvkm_secboot *sb)
 	return 0;
 }
 
-int
+static int
 gm200_secboot_fini(struct nvkm_secboot *sb, bool suspend)
 {
 	struct gm200_secboot *gsb = gm200_secboot(sb);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c
index 420bd84..1527d12 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk104.c
@@ -34,7 +34,7 @@ struct gk104_volt {
 	struct nvbios_volt bios;
 };
 
-int
+static int
 gk104_volt_get(struct nvkm_volt *base)
 {
 	struct nvbios_volt *bios = &gk104_volt(base)->bios;
@@ -47,7 +47,7 @@ gk104_volt_get(struct nvkm_volt *base)
 	return bios->base + bios->pwm_range * duty / div;
 }
 
-int
+static int
 gk104_volt_set(struct nvkm_volt *base, u32 uv)
 {
 	struct nvbios_volt *bios = &gk104_volt(base)->bios;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c
index d2bac1d..e46b618 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c
@@ -26,6 +26,8 @@
 #include <subdev/bios/gpio.h>
 #include <subdev/gpio.h>
 
+#include "priv.h"
+
 static const u8 tags[] = {
 	DCB_GPIO_VID0, DCB_GPIO_VID1, DCB_GPIO_VID2, DCB_GPIO_VID3,
 	DCB_GPIO_VID4, DCB_GPIO_VID5, DCB_GPIO_VID6, DCB_GPIO_VID7,
-- 
2.7.4
