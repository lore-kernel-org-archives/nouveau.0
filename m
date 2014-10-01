From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH] fb/ramnva3: Link training for DDR3
Date: Wed,  1 Oct 2014 14:32:33 +0200
Message-ID: <1412166753-25855-1-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-3-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412011639-3210-3-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

V2: fix whitespace errors in memx.fuc

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/pwr.h  |   2 +
 drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h    |  16 ++
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c   | 318 +++++++++++++++++++--
 .../gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc   | 111 +++++++
 drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h   |   5 +
 drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c     |  35 ++-
 6 files changed, 458 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h b/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
index bf3d1f6..f2427bf 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
@@ -48,6 +48,8 @@ void nouveau_memx_wait(struct nouveau_memx *,
 		       u32 addr, u32 mask, u32 data, u32 nsec);
 void nouveau_memx_nsec(struct nouveau_memx *, u32 nsec);
 void nouveau_memx_wait_vblank(struct nouveau_memx *);
+void nouveau_memx_train(struct nouveau_memx *);
+int  nouveau_memx_train_result(struct nouveau_pwr *, u32 *, int);
 void nouveau_memx_block(struct nouveau_memx *);
 void nouveau_memx_unblock(struct nouveau_memx *);
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
index d1fbbe4..0ac7256 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
@@ -141,6 +141,20 @@ ramfuc_wait_vblank(struct ramfuc *ram)
 }
 
 static inline void
+ramfuc_train(struct ramfuc *ram)
+{
+	nouveau_memx_train(ram->memx);
+}
+
+static inline int
+ramfuc_train_result(struct nouveau_fb *pfb, u32 *result, u32 rsize)
+{
+	struct nouveau_pwr *ppwr = nouveau_pwr(pfb);
+
+	return nouveau_memx_train_result(ppwr, result, rsize);
+}
+
+static inline void
 ramfuc_block(struct ramfuc *ram)
 {
 	nouveau_memx_block(ram->memx);
@@ -162,6 +176,8 @@ ramfuc_unblock(struct ramfuc *ram)
 #define ram_wait(s,r,m,d,n)  ramfuc_wait(&(s)->base, (r), (m), (d), (n))
 #define ram_nsec(s,n)        ramfuc_nsec(&(s)->base, (n))
 #define ram_wait_vblank(s)   ramfuc_wait_vblank(&(s)->base)
+#define ram_train(s)         ramfuc_train(&(s)->base)
+#define ram_train_result(s,r,l) ramfuc_train_result((s), (r), (l))
 #define ram_block(s)         ramfuc_block(&(s)->base)
 #define ram_unblock(s)       ramfuc_unblock(&(s)->base)
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index 3601dec..719a09b 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -20,17 +20,23 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  * Authors: Ben Skeggs
+ * 	    Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
  */
 
 #include <subdev/bios.h>
 #include <subdev/bios/bit.h>
 #include <subdev/bios/pll.h>
 #include <subdev/bios/rammap.h>
+#include <subdev/bios/M0205.h>
 #include <subdev/bios/timing.h>
 
 #include <subdev/clock/nva3.h>
 #include <subdev/clock/pll.h>
 
+#include <subdev/timer.h>
+
+#include <engine/fifo.h>
+
 #include <core/option.h>
 
 #include "ramfuc.h"
@@ -39,11 +45,14 @@
 
 struct nva3_ramfuc {
 	struct ramfuc base;
+	struct ramfuc_reg r_0x001610;
+	struct ramfuc_reg r_0x001700;
 	struct ramfuc_reg r_0x004000;
 	struct ramfuc_reg r_0x004004;
 	struct ramfuc_reg r_0x004018;
 	struct ramfuc_reg r_0x004128;
 	struct ramfuc_reg r_0x004168;
+	struct ramfuc_reg r_0x100080;
 	struct ramfuc_reg r_0x100200;
 	struct ramfuc_reg r_0x100210;
 	struct ramfuc_reg r_0x100220[9];
@@ -56,6 +65,7 @@ struct nva3_ramfuc {
 	struct ramfuc_reg r_0x100714;
 	struct ramfuc_reg r_0x100718;
 	struct ramfuc_reg r_0x10071c;
+	struct ramfuc_reg r_0x100720;
 	struct ramfuc_reg r_0x100760;
 	struct ramfuc_reg r_0x1007a0;
 	struct ramfuc_reg r_0x1007e0;
@@ -63,15 +73,276 @@ struct nva3_ramfuc {
 	struct ramfuc_reg r_0x1110e0;
 	struct ramfuc_reg r_0x111100;
 	struct ramfuc_reg r_0x111104;
+	struct ramfuc_reg r_0x1111e0;
+	struct ramfuc_reg r_0x111400;
 	struct ramfuc_reg r_0x611200;
 	struct ramfuc_reg r_mr[4];
 };
 
+struct nva3_ltrain {
+	enum {
+		NVA3_TRAIN_UNKNOWN,
+		NVA3_TRAIN_UNSUPPORTED,
+		NVA3_TRAIN_ONCE,
+		NVA3_TRAIN_EXEC,
+		NVA3_TRAIN_DONE
+	} state;
+	u32 r_100720;
+	u32 r_1111e0;
+	u32 r_111400;
+	struct nouveau_mem *mem;
+};
+
 struct nva3_ram {
 	struct nouveau_ram base;
 	struct nva3_ramfuc fuc;
+	struct nva3_ltrain ltrain;
 };
 
+void
+nva3_link_train_calc(u32 *vals, struct nva3_ltrain *train)
+{
+	int i, lo, hi;
+	u8 median[8], bins[4] = {0, 0, 0, 0}, bin = 0, qty = 0;
+
+	for (i = 0; i < 8; i++) {
+		for (lo = 0; lo < 0x40; lo++) {
+			if (!(vals[lo] & 0x80000000))
+				continue;
+			if (vals[lo] & (0x101 << i))
+				break;
+		}
+
+		if (lo == 0x40)
+			return;
+
+		for (hi = lo + 1; hi < 0x40; hi++) {
+			if (!(vals[lo] & 0x80000000))
+				continue;
+			if (!(vals[hi] & (0x101 << i))) {
+				hi--;
+				break;
+			}
+		}
+
+		median[i] = ((hi - lo) >> 1) + lo;
+		bins[(median[i] & 0xf0) >> 4]++;
+		median[i] += 0x30;
+	}
+
+	/* Find the best value for 0x1111e0 */
+	for (i = 0; i < 4; i++) {
+		if (bins[i] > qty) {
+			bin = i + 3;
+			qty = bins[i];
+		}
+	}
+
+	train->r_100720 = 0;
+	for (i = 0; i < 8; i++) {
+		median[i] = max(median[i], (u8) (bin << 4));
+		median[i] = min(median[i], (u8) ((bin << 4) | 0xf));
+
+		train->r_100720 |= ((median[i] & 0x0f) << (i << 2));
+	}
+
+	train->r_1111e0 = 0x02000000 | (bin * 0x101);
+	train->r_111400 = 0x0;
+}
+
+/*
+ * Link training for (at least) DDR3
+ */
+int
+nva3_link_train(struct nouveau_fb *pfb)
+{
+	struct nouveau_bios *bios = nouveau_bios(pfb);
+	struct nva3_ram *ram = (void *)pfb->ram;
+	struct nouveau_clock *clk = nouveau_clock(pfb);
+	struct nva3_ltrain *train = &ram->ltrain;
+	struct nouveau_device *device = nv_device(pfb);
+	struct nva3_ramfuc *fuc = &ram->fuc;
+	u32 *result, r1700;
+	int ret, i;
+	struct nvbios_M0205T M0205T = { 0 };
+	u8 ver, hdr, cnt, len, snr, ssz;
+	unsigned int clk_current;
+	unsigned long flags;
+	unsigned long *f = &flags;
+
+	if (nouveau_boolopt(device->cfgopt, "NvMemExec", true) != true)
+		return -ENOSYS;
+
+	/* XXX: Multiple partitions? */
+	result = kmalloc(64 * sizeof(u32), GFP_KERNEL);
+	if (!result)
+		return -ENOMEM;
+
+	train->state = NVA3_TRAIN_EXEC;
+
+	/* Clock speeds for training and back */
+	nvbios_M0205Tp(bios, &ver, &hdr, &cnt, &len, &snr, &ssz, &M0205T);
+	if (M0205T.freq == 0)
+		return -ENOENT;
+
+	clk_current = clk->read(clk, nv_clk_src_mem);
+
+	ret = nva3_clock_pre(clk, f);
+	if (ret)
+		goto out;
+
+	/* First: clock up/down */
+	ret = ram->base.calc(pfb, (u32) M0205T.freq * 1000);
+	if (ret)
+		goto out;
+
+	/* Do this *after* calc, eliminates write in script */
+	nv_wr32(pfb, 0x111400, 0x00000000);
+	/* XXX: Magic writes that improve train reliability? */
+	nv_mask(pfb, 0x100674, 0x0000ffff, 0x00000000);
+	nv_mask(pfb, 0x1005e4, 0x0000ffff, 0x00000000);
+	nv_mask(pfb, 0x100b0c, 0x000000ff, 0x00000000);
+	nv_wr32(pfb, 0x100c04, 0x00000400);
+
+	/* Now the training script */
+	r1700 = ram_rd32(fuc, 0x001700);
+
+	ram_mask(fuc, 0x100200, 0x00000800, 0x00000000);
+	ram_wr32(fuc, 0x611200, 0x3300);
+	ram_wait_vblank(fuc);
+	ram_wait(fuc, 0x611200, 0x00000003, 0x00000000, 500000);
+	ram_mask(fuc, 0x001610, 0x00000083, 0x00000003);
+	ram_mask(fuc, 0x100080, 0x00000020, 0x00000000);
+	ram_mask(fuc, 0x10f804, 0x80000000, 0x00000000);
+	ram_wr32(fuc, 0x001700, 0x00000000);
+
+	ram_train(fuc);
+
+	/* Reset */
+	ram_mask(fuc, 0x10f804, 0x80000000, 0x80000000);
+	ram_wr32(fuc, 0x10053c, 0x0);
+	ram_wr32(fuc, 0x100720, train->r_100720);
+	ram_wr32(fuc, 0x1111e0, train->r_1111e0);
+	ram_wr32(fuc, 0x111400, train->r_111400);
+	ram_nuke(fuc, 0x100080);
+	ram_mask(fuc, 0x100080, 0x00000020, 0x00000020);
+	ram_nsec(fuc, 1000);
+
+	ram_wr32(fuc, 0x001700, r1700);
+	ram_mask(fuc, 0x001610, 0x00000083, 0x00000080);
+	ram_wr32(fuc, 0x611200, 0x3330);
+	ram_mask(fuc, 0x100200, 0x00000800, 0x00000800);
+
+	ram_exec(fuc, true);
+
+	ram->base.calc(pfb, clk_current);
+	ram_exec(fuc, true);
+
+	/* Post-processing, avoids flicker */
+	nv_mask(pfb, 0x616308, 0x10, 0x10);
+	nv_mask(pfb, 0x616b08, 0x10, 0x10);
+
+	nva3_clock_post(clk, f);
+
+	ram_train_result(pfb, result, 64);
+	for (i = 0; i < 64; i++)
+		nv_debug(pfb, "Train: %08x", result[i]);
+	nva3_link_train_calc(result, train);
+
+	nv_debug(pfb, "Train: %08x %08x %08x", train->r_100720,
+			train->r_1111e0, train->r_111400);
+
+	kfree(result);
+
+	train->state = NVA3_TRAIN_DONE;
+
+	return ret;
+
+out:
+	if(ret == -EBUSY)
+		f = NULL;
+
+	train->state = NVA3_TRAIN_UNSUPPORTED;
+
+	nva3_clock_post(clk, f);
+	return ret;
+}
+
+int
+nva3_link_train_init(struct nouveau_fb *pfb)
+{
+	static const u32 pattern[16] = {
+		0xaaaaaaaa, 0xcccccccc, 0xdddddddd, 0xeeeeeeee,
+		0x00000000, 0x11111111, 0x44444444, 0xdddddddd,
+		0x33333333, 0x55555555, 0x77777777, 0x66666666,
+		0x99999999, 0x88888888, 0xeeeeeeee, 0xbbbbbbbb,
+	};
+	struct nouveau_bios *bios = nouveau_bios(pfb);
+	struct nva3_ram *ram = (void *)pfb->ram;
+	struct nva3_ltrain *train = &ram->ltrain;
+	struct nouveau_mem *mem;
+	struct nvbios_M0205E M0205E;
+	u8 ver, hdr, cnt, len;
+	u32 r001700;
+	int ret, i = 0;
+
+	train->state = NVA3_TRAIN_UNSUPPORTED;
+
+	/* We support type "5"
+	 * XXX: training pattern table appears to be unused for this routine */
+	if (!nvbios_M0205Ep(bios, i, &ver, &hdr, &cnt, &len, &M0205E))
+		return -ENOENT;
+
+	if (M0205E.type != 5)
+		return 0;
+
+	train->state = NVA3_TRAIN_ONCE;
+
+	ret = pfb->ram->get(pfb, 0x8000, 0x10000, 0, 0x800, &ram->ltrain.mem);
+	if (ret)
+		return ret;
+
+	mem = ram->ltrain.mem;
+
+	nv_wr32(pfb, 0x100538, 0x10000000 | (mem->offset >> 16));
+	nv_wr32(pfb, 0x1005a8, 0x0000ffff);
+	nv_mask(pfb, 0x10f800, 0x00000001, 0x00000001);
+
+	for (i = 0; i < 0x30; i++) {
+		nv_wr32(pfb, 0x10f8c0, (i << 8) | i);
+		nv_wr32(pfb, 0x10f900, pattern[i % 16]);
+	}
+
+	for (i = 0; i < 0x30; i++) {
+		nv_wr32(pfb, 0x10f8e0, (i << 8) | i);
+		nv_wr32(pfb, 0x10f920, pattern[i % 16]);
+	}
+
+	/* And upload the pattern */
+	r001700 = nv_rd32(pfb, 0x1700);
+	nv_wr32(pfb, 0x1700, mem->offset >> 16);
+	for (i = 0; i < 16; i++)
+		nv_wr32(pfb, 0x700000 + (i << 2), pattern[i]);
+	for (i = 0; i < 16; i++)
+		nv_wr32(pfb, 0x700100 + (i << 2), pattern[i]);
+	nv_wr32(pfb, 0x1700, r001700);
+
+	train->r_100720 = nv_rd32(pfb, 0x100720);
+	train->r_1111e0 = nv_rd32(pfb, 0x1111e0);
+	train->r_111400 = nv_rd32(pfb, 0x111400);
+
+	return 0;
+}
+
+void
+nva3_link_train_fini(struct nouveau_fb *pfb)
+{
+	struct nva3_ram *ram = (void *)pfb->ram;
+
+	if (ram->ltrain.mem)
+		pfb->ram->put(pfb, &ram->ltrain.mem);
+}
+
 static int
 nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 {
@@ -90,6 +361,9 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	next->freq = freq;
 	ram->base.next = next;
 
+	if (ram->ltrain.state == NVA3_TRAIN_ONCE)
+		nva3_link_train(pfb);
+
 	/* lookup memory config data relevant to the target frequency */
 	i = 0;
 	while ((data = nvbios_rammapEp(bios, i++, &ver, &hdr, &cnt, &len,
@@ -330,38 +604,24 @@ nva3_ram_init(struct nouveau_object *object)
 {
 	struct nouveau_fb *pfb = (void *)object->parent;
 	struct nva3_ram   *ram = (void *)object;
-	int ret, i;
+	int ret;
 
 	ret = nouveau_ram_init(&ram->base);
 	if (ret)
 		return ret;
 
-	/* prepare for ddr link training, and load training patterns */
-	switch (ram->base.type) {
-	case NV_MEM_TYPE_DDR3: {
-		if (nv_device(pfb)->chipset == 0xa8) {
-			static const u32 pattern[16] = {
-				0xaaaaaaaa, 0xcccccccc, 0xdddddddd, 0xeeeeeeee,
-				0x00000000, 0x11111111, 0x44444444, 0xdddddddd,
-				0x33333333, 0x55555555, 0x77777777, 0x66666666,
-				0x99999999, 0x88888888, 0xeeeeeeee, 0xbbbbbbbb,
-			};
-
-			nv_wr32(pfb, 0x100538, 0x10001ff6); /*XXX*/
-			nv_wr32(pfb, 0x1005a8, 0x0000ffff);
-			nv_mask(pfb, 0x10f800, 0x00000001, 0x00000001);
-			for (i = 0; i < 0x30; i++) {
-				nv_wr32(pfb, 0x10f8c0, (i << 8) | i);
-				nv_wr32(pfb, 0x10f8e0, (i << 8) | i);
-				nv_wr32(pfb, 0x10f900, pattern[i % 16]);
-				nv_wr32(pfb, 0x10f920, pattern[i % 16]);
-			}
-		}
-	}
-		break;
-	default:
-		break;
-	}
+	nva3_link_train_init(pfb);
+
+	return 0;
+}
+
+static int
+nva3_ram_fini(struct nouveau_object *object, bool suspend)
+{
+	struct nouveau_fb *pfb = (void *)object->parent;
+
+	if (!suspend)
+		nva3_link_train_fini(pfb);
 
 	return 0;
 }
@@ -390,6 +650,8 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return 0;
 	}
 
+	ram->fuc.r_0x001610 = ramfuc_reg(0x001610);
+	ram->fuc.r_0x001700 = ramfuc_reg(0x001700);
 	ram->fuc.r_0x004000 = ramfuc_reg(0x004000);
 	ram->fuc.r_0x004004 = ramfuc_reg(0x004004);
 	ram->fuc.r_0x004018 = ramfuc_reg(0x004018);
@@ -438,6 +700,6 @@ nva3_ram_oclass = {
 		.ctor = nva3_ram_ctor,
 		.dtor = _nouveau_ram_dtor,
 		.init = nva3_ram_init,
-		.fini = _nouveau_ram_fini,
+		.fini = nva3_ram_fini,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
index e89789a..4d629dc 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
@@ -50,6 +50,7 @@ handler(WR32  , 0x0000, 0x0002, #memx_func_wr32)
 handler(WAIT  , 0x0004, 0x0000, #memx_func_wait)
 handler(DELAY , 0x0001, 0x0000, #memx_func_delay)
 handler(VBLANK, 0x0001, 0x0000, #memx_func_wait_vblank)
+handler(TRAIN , 0x0000, 0x0000, #memx_func_train)
 memx_func_tail:
 
 .equ #memx_func_size #memx_func_next - #memx_func_head
@@ -63,6 +64,10 @@ memx_ts_end:
 memx_data_head:
 .skip 0x0800
 memx_data_tail:
+
+memx_train_head:
+.skip 0x0100
+memx_train_tail:
 #endif
 
 /******************************************************************************
@@ -260,6 +265,101 @@ memx_func_delay:
 // description
 //
 // $r15 - current (memx)
+// $r4  - packet length
+// $r3  - opcode desciption
+// $r0  - zero
+memx_func_train:
+#if NVKM_PPWR_CHIPSET == GT215
+// $r5 - outer loop counter
+// $r6 - inner loop counter
+// $r7 - entry counter (#memx_train_head + $r7)
+	movw $r5 0x3
+	movw $r7 0x0
+
+// Read random memory to wake up... things
+	imm32($r9, 0x700000)
+	nv_rd32($r8,$r9)
+	movw $r14 0x2710
+	call(nsec)
+
+	memx_func_train_loop_outer:
+		mulu $r8 $r5 0x101
+		sethi $r8 0x02000000
+		imm32($r9, 0x1111e0)
+		nv_wr32($r9, $r8)
+		push $r5
+
+		movw $r6 0x0
+		memx_func_train_loop_inner:
+			movw $r8 0x1111
+			mulu $r9 $r6 $r8
+			shl b32 $r8 $r9 0x10
+			or $r8 $r9
+			imm32($r9, 0x100720)
+			nv_wr32($r9, $r8)
+
+			imm32($r9, 0x100080)
+			nv_rd32($r8, $r9)
+			or $r8 $r8 0x20
+			nv_wr32($r9, $r8)
+
+			imm32($r9, 0x10053c)
+			imm32($r8, 0x80003002)
+			nv_wr32($r9, $r8)
+
+			imm32($r14, 0x100560)
+			imm32($r13, 0x80000000)
+			add b32 $r12 $r13 0
+			imm32($r11, 0x001e8480)
+			call(wait)
+
+			// $r5 - inner inner loop counter
+			// $r9 - result
+			movw $r5 0
+			imm32($r9, 0x8300ffff)
+			memx_func_train_loop_4x:
+				imm32($r10, 0x100080)
+				nv_rd32($r8, $r10)
+				imm32($r11, 0xffffffdf)
+				and $r8 $r11
+				nv_wr32($r10, $r8)
+
+				imm32($r10, 0x10053c)
+				imm32($r8, 0x80003002)
+				nv_wr32($r10, $r8)
+
+				imm32($r14, 0x100560)
+				imm32($r13, 0x80000000)
+				mov b32 $r12 $r13
+				imm32($r11, 0x00002710)
+				call(wait)
+
+				nv_rd32($r13, $r14)
+				and $r9 $r9 $r13
+
+				add b32 $r5 1
+				cmp b16 $r5 0x4
+				bra l #memx_func_train_loop_4x
+
+			add b32 $r10 $r7 #memx_train_head
+			st b32 D[$r10 + 0] $r9
+			add b32 $r6 1
+			add b32 $r7 4
+
+			cmp b16 $r6 0x10
+			bra l #memx_func_train_loop_inner
+
+		pop $r5
+		add b32 $r5 1
+		cmp b16 $r5 7
+		bra l #memx_func_train_loop_outer
+
+#endif
+	ret
+
+// description
+//
+// $r15 - current (memx)
 // $r14 - sender process name
 // $r13 - message (exec)
 // $r12 - head of script
@@ -307,8 +407,19 @@ memx_exec:
 // $r11 - data1
 // $r0  - zero
 memx_info:
+	cmp b16 $r12 0x1
+	bra e #memx_info_train
+
+	memx_info_data:
 	mov $r12 #memx_data_head
 	mov $r11 #memx_data_tail - #memx_data_head
+	bra #memx_info_send
+	
+	memx_info_train:
+	mov $r12 #memx_train_head
+	mov $r11 #memx_train_tail - #memx_train_head
+
+	memx_info_send:
 	call(send)
 	ret
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
index 522e307..c8b06cb 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
@@ -18,6 +18,10 @@
 #define MEMX_MSG_INFO 0
 #define MEMX_MSG_EXEC 1
 
+/* MEMX: info types */
+#define MEMX_INFO_DATA  0
+#define MEMX_INFO_TRAIN 1
+
 /* MEMX: script opcode definitions */
 #define MEMX_ENTER  1
 #define MEMX_LEAVE  2
@@ -25,6 +29,7 @@
 #define MEMX_WAIT   4
 #define MEMX_DELAY  5
 #define MEMX_VBLANK 6
+#define MEMX_TRAIN  7
 
 /* I2C_: message identifiers */
 #define I2C__MSG_RD08 0
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
index 65eaa25..f6ce39d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
@@ -47,7 +47,8 @@ nouveau_memx_init(struct nouveau_pwr *ppwr, struct nouveau_memx **pmemx)
 	u32 reply[2];
 	int ret;
 
-	ret = ppwr->message(ppwr, reply, PROC_MEMX, MEMX_MSG_INFO, 0, 0);
+	ret = ppwr->message(ppwr, reply, PROC_MEMX, MEMX_MSG_INFO,
+					MEMX_INFO_DATA, 0);
 	if (ret)
 		return ret;
 
@@ -152,6 +153,38 @@ nouveau_memx_wait_vblank(struct nouveau_memx *memx)
 }
 
 void
+nouveau_memx_train(struct nouveau_memx *memx)
+{
+	nv_debug(memx->ppwr, "   MEM TRAIN\n");
+	memx_cmd(memx, MEMX_TRAIN, 0, NULL);
+}
+
+int
+nouveau_memx_train_result(struct nouveau_pwr *ppwr, u32 *res, int rsize)
+{
+	u32 reply[2], base, size, i;
+	int ret;
+
+	ret = ppwr->message(ppwr, reply, PROC_MEMX, MEMX_MSG_INFO,
+					MEMX_INFO_TRAIN, 0);
+	if (ret)
+		return ret;
+
+	base = reply[0];
+	size = reply[1] >> 2;
+	if (size > rsize)
+		return -ENOMEM;
+
+	/* read the packet */
+	nv_wr32(ppwr, 0x10a1c0, 0x02000000 | base);
+
+	for (i = 0; i < size; i++)
+		res[i] = nv_rd32(ppwr, 0x10a1c4);
+
+	return 0;
+}
+
+void
 nouveau_memx_block(struct nouveau_memx *memx)
 {
 	nv_debug(memx->ppwr, "   HOST BLOCKED\n");
-- 
1.9.3
