From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 08/10] pwr/fuc: add ld/st macros
Date: Sun, 17 Aug 2014 17:33:13 +0200
Message-ID: <1408289594-28587-8-git-send-email-martin.peres@free.fr>
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

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 nvkm/subdev/pwr/fuc/macros.fuc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/nvkm/subdev/pwr/fuc/macros.fuc b/nvkm/subdev/pwr/fuc/macros.fuc
index 9707e3f..96fc984 100644
--- a/nvkm/subdev/pwr/fuc/macros.fuc
+++ b/nvkm/subdev/pwr/fuc/macros.fuc
@@ -251,6 +251,16 @@
 */	clear b32 $r0
 #endif
 
+#define st(size, addr, reg) /*
+*/	movw $r0 addr /*
+*/	st size D[$r0] reg /*
+*/	clear b32 $r0
+
+#define ld(size, reg, addr) /*
+*/	movw $r0 addr /*
+*/	ld size reg D[$r0] /*
+*/	clear b32 $r0
+
 // does a 64+64 -> 64 unsigned addition (C = A + B)
 #define addu64(reg_a_c_hi, reg_a_c_lo, b_hi, b_lo) /*
 */    add b32 reg_a_c_lo b_lo /*
-- 
2.0.0
