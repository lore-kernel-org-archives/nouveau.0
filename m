From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 5/8] pwr/memx: Return debugging information
Date: Thu,  4 Sep 2014 16:58:52 +0200
Message-ID: <1409842735-7361-6-git-send-email-rspliet@eclipso.eu>
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

Time measured from disabling FB to re-enabling, PPWR_IN reveals status of heads at the end of script. Helps debug various issues (like flicker).

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
index 9f2f57c..989fdc1 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/fuc/memx.fuc
@@ -55,6 +55,11 @@ memx_func_tail:
 .equ #memx_func_size #memx_func_next - #memx_func_head
 .equ #memx_func_num (#memx_func_tail - #memx_func_head) / #memx_func_size
 
+memx_ts_start:
+.b32 0
+memx_ts_end:
+.b32 0
+
 memx_data_head:
 .skip 0x0800
 memx_data_tail:
@@ -78,6 +83,9 @@ memx_func_enter:
 		and $r6 NV_PPWR_OUTPUT_FB_PAUSE
 		bra z #memx_func_enter_wait
 
+	nv_iord($r6, NV_PPWR_TIMER_LOW)
+	st b32 D[$r0 + #memx_ts_start] $r6
+
 	ret
 
 // description
@@ -87,6 +95,9 @@ memx_func_enter:
 // $r3  - opcode desciption
 // $r0  - zero
 memx_func_leave:
+	nv_iord($r6, NV_PPWR_TIMER_LOW)
+	st b32 D[$r0 + #memx_ts_end] $r6
+
 	mov $r6 NV_PPWR_OUTPUT_CLR_FB_PAUSE
 	nv_iowr(NV_PPWR_OUTPUT_CLR, $r6)
 	memx_func_leave_wait:
@@ -210,6 +221,7 @@ memx_exec:
 	push $r13
 	mov b32 $r1 $r12
 	mov b32 $r2 $r11
+
 	memx_exec_next:
 		// fetch the packet header, and locate opcode info
 		ld b32 $r3 D[$r1]
@@ -226,6 +238,10 @@ memx_exec:
 		bra l #memx_exec_next
 
 	// send completion reply
+	ld b32 $r11 D[$r0 + #memx_ts_start]
+	ld b32 $r12 D[$r0 + #memx_ts_end]
+	sub b32 $r12 $r11
+	nv_iord($r11, NV_PPWR_INPUT)
 	pop $r13
 	pop $r14
 	call(send)
diff --git a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
index 060bbd2..c20669b9e 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/pwr/memx.c
@@ -87,6 +87,8 @@ nouveau_memx_fini(struct nouveau_memx **pmemx, bool exec)
 				 memx->base, finish);
 	}
 
+	nv_debug(memx->ppwr, "Exec took %uns, PPWR_IN %08x", reply[0], reply[1]);
+
 	kfree(memx);
 	return 0;
 }
-- 
1.9.3
