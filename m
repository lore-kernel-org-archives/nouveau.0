From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 2/8] pwr/memx/nva3: Implement "wait for VBLANK"
Date: Thu,  4 Sep 2014 16:58:49 +0200
Message-ID: <1409842735-7361-3-git-send-email-rspliet@eclipso.eu>
References: <1409842735-7361-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409842735-7361-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/pwr.h  |  1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h    | 25 +++++----
 .../gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc   | 60 ++++++++++++++++++++--
 drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h   |  1 +
 drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c     | 35 ++++++++++++-
 5 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h b/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
index c5c92cb..b5286b3 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/pwr.h
@@ -76,5 +76,6 @@ void nouveau_memx_wr32(struct nouveau_memx *, u32 addr, u32 data);
 void nouveau_memx_wait(struct nouveau_memx *,
 		       u32 addr, u32 mask, u32 data, u32 nsec);
 void nouveau_memx_nsec(struct nouveau_memx *, u32 nsec);
+void nouveau_memx_wait_vblank(struct nouveau_memx *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
index 2af9cfd..76290bb 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramfuc.h
@@ -105,14 +105,21 @@ ramfuc_nsec(struct ramfuc *ram, u32 nsec)
 	nouveau_memx_nsec(ram->memx, nsec);
 }
 
-#define ram_init(s,p)       ramfuc_init(&(s)->base, (p))
-#define ram_exec(s,e)       ramfuc_exec(&(s)->base, (e))
-#define ram_have(s,r)       ((s)->r_##r.addr[0] != 0x000000)
-#define ram_rd32(s,r)       ramfuc_rd32(&(s)->base, &(s)->r_##r)
-#define ram_wr32(s,r,d)     ramfuc_wr32(&(s)->base, &(s)->r_##r, (d))
-#define ram_nuke(s,r)       ramfuc_nuke(&(s)->base, &(s)->r_##r)
-#define ram_mask(s,r,m,d)   ramfuc_mask(&(s)->base, &(s)->r_##r, (m), (d))
-#define ram_wait(s,r,m,d,n) ramfuc_wait(&(s)->base, (r), (m), (d), (n))
-#define ram_nsec(s,n)       ramfuc_nsec(&(s)->base, (n))
+static inline void
+ramfuc_wait_vblank(struct ramfuc *ram)
+{
+	nouveau_memx_wait_vblank(ram->memx);
+}
+
+#define ram_init(s,p)        ramfuc_init(&(s)->base, (p))
+#define ram_exec(s,e)        ramfuc_exec(&(s)->base, (e))
+#define ram_have(s,r)        ((s)->r_##r.addr[0] != 0x000000)
+#define ram_rd32(s,r)        ramfuc_rd32(&(s)->base, &(s)->r_##r)
+#define ram_wr32(s,r,d)      ramfuc_wr32(&(s)->base, &(s)->r_##r, (d))
+#define ram_nuke(s,r)        ramfuc_nuke(&(s)->base, &(s)->r_##r)
+#define ram_mask(s,r,m,d)    ramfuc_mask(&(s)->base, &(s)->r_##r, (m), (d))
+#define ram_wait(s,r,m,d,n)  ramfuc_wait(&(s)->base, (r), (m), (d), (n))
+#define ram_nsec(s,n)        ramfuc_nsec(&(s)->base, (n))
+#define ram_wait_vblank(s)   ramfuc_wait_vblank(&(s)->base)
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
index d43741e..228ee0d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
@@ -43,12 +43,13 @@ process(PROC_MEMX, #memx_init, #memx_recv)
 */	.b32 func
 
 memx_func_head:
-handler(ENTER , 0x0001, 0x0000, #memx_func_enter)
+handler(ENTER , 0x0000, 0x0000, #memx_func_enter)
 memx_func_next:
 handler(LEAVE , 0x0000, 0x0000, #memx_func_leave)
 handler(WR32  , 0x0000, 0x0002, #memx_func_wr32)
 handler(WAIT  , 0x0004, 0x0000, #memx_func_wait)
 handler(DELAY , 0x0001, 0x0000, #memx_func_delay)
+handler(VBLANK, 0x0001, 0x0000, #memx_func_wait_vblank)
 memx_func_tail:
 
 .equ #memx_func_size #memx_func_next - #memx_func_head
@@ -67,7 +68,6 @@ memx_data_tail:
 //
 // $r15 - current (memx)
 // $r4  - packet length
-//	+00: bitmask of heads to wait for vblank on
 // $r3  - opcode desciption
 // $r0  - zero
 memx_func_enter:
@@ -77,9 +77,7 @@ memx_func_enter:
 		nv_iord($r6, NV_PPWR_OUTPUT)
 		and $r6 NV_PPWR_OUTPUT_FB_PAUSE
 		bra z #memx_func_enter_wait
-	//XXX: TODO
-	ld b32 $r6 D[$r1 + 0x00]
-	add b32 $r1 0x04
+
 	ret
 
 // description
@@ -97,6 +95,58 @@ memx_func_leave:
 		bra nz #memx_func_leave_wait
 	ret
 
+#if NVKM_PPWR_CHIPSET < GF119
+// description
+//
+// $r15 - current (memx)
+// $r4  - packet length
+//	+00: head to wait for vblank on
+// $r3  - opcode desciption
+// $r0  - zero
+memx_func_wait_vblank:
+	ld b32 $r6 D[$r1 + 0x00]
+	cmp b32 $r6 0x0
+	bra z #memx_func_wait_vblank_head0
+	cmp b32 $r6 0x1
+	bra z #memx_func_wait_vblank_head1
+	bra #memx_func_wait_vblank_fini
+
+	memx_func_wait_vblank_head1:
+	movw $r7 0x20
+	bra #memx_func_wait_vblank_0
+
+	memx_func_wait_vblank_head0:
+	movw $r7 0x8
+
+	memx_func_wait_vblank_0:
+		nv_iord($r6, NV_PPWR_INPUT)
+		and $r6 $r7
+		bra nz #memx_func_wait_vblank_0
+
+	memx_func_wait_vblank_1:
+		nv_iord($r6, NV_PPWR_INPUT)
+		and $r6 $r7
+		bra z #memx_func_wait_vblank_1
+
+	memx_func_wait_vblank_fini:
+	add b32 $r1 0x4
+	ret
+
+#else
+
+// XXX: currently no-op
+//
+// $r15 - current (memx)
+// $r4  - packet length
+//	+00: head to wait for vblank on
+// $r3  - opcode desciption
+// $r0  - zero
+memx_func_wait_vblank:
+	add b32 $r1 0x4
+	ret
+
+#endif
+
 // description
 //
 // $r15 - current (memx)
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
index 574acfa..80f8328 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/os.h
@@ -24,6 +24,7 @@
 #define MEMX_WR32   2
 #define MEMX_WAIT   3
 #define MEMX_DELAY  4
+#define MEMX_VBLANK 5
 
 /* I2C_: message identifiers */
 #define I2C__MSG_RD08 0
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
index 03de310..bcdc00f 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
@@ -64,7 +64,7 @@ nouveau_memx_init(struct nouveau_pwr *ppwr, struct nouveau_memx **pmemx)
 	} while (nv_rd32(ppwr, 0x10a580) != 0x00000003);
 	nv_wr32(ppwr, 0x10a1c0, 0x01000000 | memx->base);
 	nv_wr32(ppwr, 0x10a1c4, 0x00010000 | MEMX_ENTER);
-	nv_wr32(ppwr, 0x10a1c4, 0x00000000);
+
 	return 0;
 }
 
@@ -118,4 +118,37 @@ nouveau_memx_nsec(struct nouveau_memx *memx, u32 nsec)
 	memx_out(memx); /* fuc can't handle multiple */
 }
 
+void
+nouveau_memx_wait_vblank(struct nouveau_memx *memx)
+{
+	struct nouveau_pwr *ppwr = memx->ppwr;
+	u32 heads, x, y, px = 0;
+	int i, head_sync;
+
+	if (nv_device(ppwr)->chipset < 0xd0) {
+		heads = nv_rd32(ppwr, 0x610050);
+		for (i = 0; i < 2; i++) {
+			/* Heuristic: sync to head with biggest resolution */
+			if (heads & (2 << (i << 3))) {
+				x = nv_rd32(ppwr, 0x610b40 + (0x540 * i));
+				y = (x & 0xffff0000) >> 16;
+				x &= 0x0000ffff;
+				if ((x * y) > px) {
+					px = (x * y);
+					head_sync = i;
+				}
+			}
+		}
+	}
+
+	if (px == 0) {
+		nv_debug(memx->ppwr, "WAIT VBLANK !NO ACTIVE HEAD\n");
+		return;
+	}
+
+	nv_debug(memx->ppwr, "WAIT VBLANK HEAD%d\n", head_sync);
+	memx_cmd(memx, MEMX_VBLANK, 1, (u32[]){ head_sync });
+	memx_out(memx); /* fuc can't handle multiple */
+}
+
 #endif
-- 
1.9.3
