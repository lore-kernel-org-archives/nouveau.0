From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 09/10] pwr/fuc: make $r1-$r10 registers
	callee-saved in kernel.fuc
Date: Sun, 17 Aug 2014 17:33:14 +0200
Message-ID: <1408289594-28587-9-git-send-email-martin.peres@free.fr>
References: <1408289594-28587-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408289594-28587-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

---
 nvkm/subdev/pwr/fuc/kernel.fuc  | 13 +++++++++++++
 nvkm/subdev/pwr/fuc/nv108.fuc.h | 25 +++++++++++--------------
 nvkm/subdev/pwr/fuc/nva3.fuc.h  | 23 ++++++++++-------------
 nvkm/subdev/pwr/fuc/nvc0.fuc.h  | 23 ++++++++++-------------
 nvkm/subdev/pwr/fuc/nvd0.fuc.h  | 23 ++++++++++-------------
 5 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/nvkm/subdev/pwr/fuc/kernel.fuc b/nvkm/subdev/pwr/fuc/kernel.fuc
index 54276c9..5cf5be6 100644
--- a/nvkm/subdev/pwr/fuc/kernel.fuc
+++ b/nvkm/subdev/pwr/fuc/kernel.fuc
@@ -98,12 +98,16 @@ wr32:
 // $r14 - ns
 // $r0  - zero
 nsec:
+	push $r9
+	push $r8
 	nv_iord($r8, NV_PPWR_TIMER_LOW)
 	nsec_loop:
 		nv_iord($r9, NV_PPWR_TIMER_LOW)
 		sub b32 $r9 $r8
 		cmp b32 $r9 $r14
 		bra l #nsec_loop
+	pop $r8
+	pop $r9
 	ret
 
 // busy-wait for a period of time
@@ -115,6 +119,8 @@ nsec:
 // $r11 - timeout (ns)
 // $r0  - zero
 wait:
+	push $r9
+	push $r8
 	nv_iord($r8, NV_PPWR_TIMER_LOW)
 	wait_loop:
 		nv_rd32($r10, $r14)
@@ -126,6 +132,8 @@ wait:
 		cmp b32 $r9 $r11
 		bra l #wait_loop
 	wait_done:
+	pop $r8
+	pop $r9
 	ret
 
 // $r15 - current (kern)
@@ -460,6 +468,9 @@ send:
 // $r14 - process
 // $r0  - zero
 recv:
+	push $r9
+	push $r8
+
 	ld b32 $r8 D[$r14 + #proc_qget]
 	ld b32 $r9 D[$r14 + #proc_qput]
 	bclr $flags $p1
@@ -492,6 +503,8 @@ recv:
 		bset $flags $p1
 		pop $r15
 	recv_done:
+	pop $r8
+	pop $r9
 	ret
 
 init:
diff --git a/nvkm/subdev/pwr/fuc/nv108.fuc.h b/nvkm/subdev/pwr/fuc/nv108.fuc.h
index fe8dd23..82d6bbc 100644
--- a/nvkm/subdev/pwr/fuc/nv108.fuc.h
+++ b/nvkm/subdev/pwr/fuc/nv108.fuc.h
@@ -812,15 +812,18 @@ uint32_t nv108_pwr_code[] = {
 	0x7000d4f1,
 	0xf8f61bf4,
 /* 0x005d: nsec */
-	0xcf2c0800,
-/* 0x0062: nsec_loop */
+	0xf990f900,
+	0xcf2c0880,
+/* 0x0066: nsec_loop */
 	0x2c090088,
 	0xbb0099cf,
 	0x9ea60298,
-	0xf8f61ef4,
-/* 0x0071: wait */
-	0xcf2c0800,
-/* 0x0076: wait_loop */
+	0xfcf61ef4,
+	0xf890fc80,
+/* 0x0079: wait */
+	0xf990f900,
+	0xcf2c0880,
+/* 0x0082: wait_loop */
 	0xeeb20088,
 	0x0000047e,
 	0xadfddab2,
@@ -865,13 +868,13 @@ uint32_t nv108_pwr_code[] = {
 	0xc40088cf,
 	0x0bf40289,
 	0x9b00b51f,
-	0x957e580e,
+	0xa57e580e,
 	0x09980000,
 	0x0096b09b,
 	0x000d0bf4,
 	0x0009f634,
 	0x09b504bd,
-/* 0x0125: intr_skip_watchdog */
+/* 0x0135: intr_skip_watchdog */
 	0x0089e49a,
 	0x360bf408,
 	0xcf068849,
@@ -1521,10 +1524,4 @@ uint32_t nv108_pwr_code[] = {
 	0x00000000,
 	0x00000000,
 	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
 };
diff --git a/nvkm/subdev/pwr/fuc/nva3.fuc.h b/nvkm/subdev/pwr/fuc/nva3.fuc.h
index 8e2ddd9..bf808e4 100644
--- a/nvkm/subdev/pwr/fuc/nva3.fuc.h
+++ b/nvkm/subdev/pwr/fuc/nva3.fuc.h
@@ -885,19 +885,22 @@ uint32_t nva3_pwr_code[] = {
 	0xd4f100dd,
 	0x1bf47000,
 /* 0x007f: nsec */
-	0xf000f8f2,
+	0xf900f8f2,
+	0xf080f990,
 	0x84b62c87,
 	0x0088cf06,
-/* 0x0088: nsec_loop */
+/* 0x008c: nsec_loop */
 	0xb62c97f0,
 	0x99cf0694,
 	0x0298bb00,
 	0xf4069eb8,
-	0x00f8f11e,
-/* 0x009c: wait */
+	0x80fcf11e,
+	0x00f890fc,
+/* 0x00a4: wait */
+	0x80f990f9,
 	0xb62c87f0,
 	0x88cf0684,
-/* 0x00a5: wait_loop */
+/* 0x00b1: wait_loop */
 	0x02eeb900,
 	0xb90421f4,
 	0xadfd02da,
@@ -948,13 +951,13 @@ uint32_t nva3_pwr_code[] = {
 	0xf40289c4,
 	0x0080230b,
 	0x58e7f09b,
-	0x98cb21f4,
+	0x98db21f4,
 	0x96b09b09,
 	0x110bf400,
 	0xb63407f0,
 	0x09d00604,
 	0x8004bd00,
-/* 0x016e: intr_skip_watchdog */
+/* 0x017e: intr_skip_watchdog */
 	0x89e49a09,
 	0x0bf40800,
 	0x8897f148,
@@ -1650,10 +1653,4 @@ uint32_t nva3_pwr_code[] = {
 	0x00000000,
 	0x00000000,
 	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
 };
diff --git a/nvkm/subdev/pwr/fuc/nvc0.fuc.h b/nvkm/subdev/pwr/fuc/nvc0.fuc.h
index a0bd2c1..2371284 100644
--- a/nvkm/subdev/pwr/fuc/nvc0.fuc.h
+++ b/nvkm/subdev/pwr/fuc/nvc0.fuc.h
@@ -885,19 +885,22 @@ uint32_t nvc0_pwr_code[] = {
 	0xd4f100dd,
 	0x1bf47000,
 /* 0x007f: nsec */
-	0xf000f8f2,
+	0xf900f8f2,
+	0xf080f990,
 	0x84b62c87,
 	0x0088cf06,
-/* 0x0088: nsec_loop */
+/* 0x008c: nsec_loop */
 	0xb62c97f0,
 	0x99cf0694,
 	0x0298bb00,
 	0xf4069eb8,
-	0x00f8f11e,
-/* 0x009c: wait */
+	0x80fcf11e,
+	0x00f890fc,
+/* 0x00a4: wait */
+	0x80f990f9,
 	0xb62c87f0,
 	0x88cf0684,
-/* 0x00a5: wait_loop */
+/* 0x00b1: wait_loop */
 	0x02eeb900,
 	0xb90421f4,
 	0xadfd02da,
@@ -948,13 +951,13 @@ uint32_t nvc0_pwr_code[] = {
 	0xf40289c4,
 	0x0080230b,
 	0x58e7f09b,
-	0x98cb21f4,
+	0x98db21f4,
 	0x96b09b09,
 	0x110bf400,
 	0xb63407f0,
 	0x09d00604,
 	0x8004bd00,
-/* 0x016e: intr_skip_watchdog */
+/* 0x017e: intr_skip_watchdog */
 	0x89e49a09,
 	0x0bf40800,
 	0x8897f148,
@@ -1650,10 +1653,4 @@ uint32_t nvc0_pwr_code[] = {
 	0x00000000,
 	0x00000000,
 	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
 };
diff --git a/nvkm/subdev/pwr/fuc/nvd0.fuc.h b/nvkm/subdev/pwr/fuc/nvd0.fuc.h
index 1cf8473..9e0f9b8 100644
--- a/nvkm/subdev/pwr/fuc/nvd0.fuc.h
+++ b/nvkm/subdev/pwr/fuc/nvd0.fuc.h
@@ -814,17 +814,20 @@ uint32_t nvd0_pwr_code[] = {
 	0xd4f100dd,
 	0x1bf47000,
 /* 0x0067: nsec */
-	0xf000f8f5,
+	0xf900f8f5,
+	0xf080f990,
 	0x88cf2c87,
-/* 0x006d: nsec_loop */
+/* 0x0071: nsec_loop */
 	0x2c97f000,
 	0xbb0099cf,
 	0x9eb80298,
 	0xf41ef406,
-/* 0x007e: wait */
-	0x87f000f8,
+	0x90fc80fc,
+/* 0x0086: wait */
+	0x90f900f8,
+	0x87f080f9,
 	0x0088cf2c,
-/* 0x0084: wait_loop */
+/* 0x0090: wait_loop */
 	0xf402eeb9,
 	0xdab90421,
 	0x04adfd02,
@@ -872,12 +875,12 @@ uint32_t nvd0_pwr_code[] = {
 	0x0bf40289,
 	0x9b008020,
 	0xf458e7f0,
-	0x0998a721,
+	0x0998b721,
 	0x0096b09b,
 	0xf00e0bf4,
 	0x09d03407,
 	0x8004bd00,
-/* 0x013e: intr_skip_watchdog */
+/* 0x014e: intr_skip_watchdog */
 	0x89e49a09,
 	0x0bf40800,
 	0x8897f13c,
@@ -1585,10 +1588,4 @@ uint32_t nvd0_pwr_code[] = {
 	0x00000000,
 	0x00000000,
 	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
 };
-- 
2.0.0
