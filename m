From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 6/8] pwr/memx: Match blobs behaviour
Date: Thu,  4 Sep 2014 16:58:53 +0200
Message-ID: <1409842735-7361-7-git-send-email-rspliet@eclipso.eu>
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
 drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
index 989fdc1..744f2e9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
@@ -76,6 +76,16 @@ memx_data_tail:
 // $r3  - opcode desciption
 // $r0  - zero
 memx_func_enter:
+#if NVKM_PPWR_CHIPSET == GT215
+	movw $r8 0x1610
+	nv_rd32($r7, $r8)
+	imm32($r6, 0xfffffffc)
+	and $r7 $r6
+	movw $r6 0x2
+	or $r7 $r6
+	nv_wr32($r8, $r7)
+#endif
+
 	mov $r6 NV_PPWR_OUTPUT_SET_FB_PAUSE
 	nv_iowr(NV_PPWR_OUTPUT_SET, $r6)
 	memx_func_enter_wait:
@@ -104,6 +114,15 @@ memx_func_leave:
 		nv_iord($r6, NV_PPWR_OUTPUT)
 		and $r6 NV_PPWR_OUTPUT_FB_PAUSE
 		bra nz #memx_func_leave_wait
+
+#if NVKM_PPWR_CHIPSET == GT215
+	movw $r8 0x1610
+	nv_rd32($r7, $r8)
+	imm32($r6, 0xffffffcc)
+	and $r7 $r6
+	nv_wr32($r8, $r7)
+#endif
+
 	ret
 
 #if NVKM_PPWR_CHIPSET < GF119
-- 
1.9.3
