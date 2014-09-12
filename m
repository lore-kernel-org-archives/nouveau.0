From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 5/6] fb/ramnva3: Per-partition regs
Date: Fri, 12 Sep 2014 18:00:16 +0200
Message-ID: <1410537617-8269-6-git-send-email-rspliet@eclipso.eu>
References: <1410537617-8269-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410537617-8269-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index b3c53d6..c2037b9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -405,11 +405,11 @@ nva3_ram_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	ram->fuc.r_0x100714 = ramfuc_reg(0x100714);
 	ram->fuc.r_0x100718 = ramfuc_reg(0x100718);
 	ram->fuc.r_0x10071c = ramfuc_reg(0x10071c);
-	ram->fuc.r_0x100760 = ramfuc_reg(0x100760);
-	ram->fuc.r_0x1007a0 = ramfuc_reg(0x1007a0);
-	ram->fuc.r_0x1007e0 = ramfuc_reg(0x1007e0);
+	ram->fuc.r_0x100760 = ramfuc_stride(0x100760, 4, ram->base.part_mask);
+	ram->fuc.r_0x1007a0 = ramfuc_stride(0x1007a0, 4, ram->base.part_mask);
+	ram->fuc.r_0x1007e0 = ramfuc_stride(0x1007e0, 4, ram->base.part_mask);
 	ram->fuc.r_0x10f804 = ramfuc_reg(0x10f804);
-	ram->fuc.r_0x1110e0 = ramfuc_reg(0x1110e0);
+	ram->fuc.r_0x1110e0 = ramfuc_stride(0x1110e0, 4, ram->base.part_mask);
 	ram->fuc.r_0x111100 = ramfuc_reg(0x111100);
 	ram->fuc.r_0x111104 = ramfuc_reg(0x111104);
 	ram->fuc.r_0x611200 = ramfuc_reg(0x611200);
-- 
1.9.3
