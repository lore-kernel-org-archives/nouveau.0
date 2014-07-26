From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/3] clk: make therm and volt devices optional
Date: Sat, 26 Jul 2014 18:41:39 +0900
Message-ID: <1406367701-9155-2-git-send-email-gnurou@gmail.com>
References: <1406367701-9155-1-git-send-email-gnurou@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1406367701-9155-1-git-send-email-gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Allow the clock subsystem to operate even if voltage and thermal devices
are not set for the device (for people with watercooling! ;))

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 nvkm/subdev/clock/base.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/nvkm/subdev/clock/base.c b/nvkm/subdev/clock/base.c
index 3ad848b..508639d 100644
--- a/nvkm/subdev/clock/base.c
+++ b/nvkm/subdev/clock/base.c
@@ -90,16 +90,20 @@ nouveau_cstate_prog(struct nouveau_clock *clk,
 		cstate = &pstate->base;
 	}
 
-	ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, +1);
-	if (ret && ret != -ENODEV) {
-		nv_error(clk, "failed to raise fan speed: %d\n", ret);
-		return ret;
+	if (ptherm) {
+		ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, +1);
+		if (ret && ret != -ENODEV) {
+			nv_error(clk, "failed to raise fan speed: %d\n", ret);
+			return ret;
+		}
 	}
 
-	ret = volt->set_id(volt, cstate->voltage, +1);
-	if (ret && ret != -ENODEV) {
-		nv_error(clk, "failed to raise voltage: %d\n", ret);
-		return ret;
+	if (volt) {
+		ret = volt->set_id(volt, cstate->voltage, +1);
+		if (ret && ret != -ENODEV) {
+			nv_error(clk, "failed to raise voltage: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = clk->calc(clk, cstate);
@@ -108,13 +112,17 @@ nouveau_cstate_prog(struct nouveau_clock *clk,
 		clk->tidy(clk);
 	}
 
-	ret = volt->set_id(volt, cstate->voltage, -1);
-	if (ret && ret != -ENODEV)
-		nv_error(clk, "failed to lower voltage: %d\n", ret);
+	if (volt) {
+		ret = volt->set_id(volt, cstate->voltage, -1);
+		if (ret && ret != -ENODEV)
+			nv_error(clk, "failed to lower voltage: %d\n", ret);
+	}
 
-	ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, -1);
-	if (ret && ret != -ENODEV)
-		nv_error(clk, "failed to lower fan speed: %d\n", ret);
+	if (ptherm) {
+		ret = nouveau_therm_cstate(ptherm, pstate->fanspeed, -1);
+		if (ret && ret != -ENODEV)
+			nv_error(clk, "failed to lower fan speed: %d\n", ret);
+	}
 
 	return 0;
 }
-- 
2.0.2
