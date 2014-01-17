From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nv50/graph: print mpc trap name when it's not
	an mp trap
Date: Fri, 17 Jan 2014 00:13:05 -0500
Message-ID: <1389935585-18465-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 0f8d18a..30ed19c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -315,6 +315,20 @@ static const struct nouveau_bitfield nv50_mp_exec_errors[] = {
 	{}
 };
 
+static const struct nouveau_bitfield nv50_mpc_traps[] = {
+	{ 0x0000001, "LOCAL_LIMIT_READ" },
+	{ 0x0000010, "LOCAL_LIMIT_WRITE" },
+	{ 0x0000040, "STACK_LIMIT" },
+	{ 0x0000100, "GLOBAL_LIMIT_READ" },
+	{ 0x0001000, "GLOBAL_LIMIT_WRITE" },
+	{ 0x0010000, "MP0" },
+	{ 0x0020000, "MP1" },
+	{ 0x0040000, "GLOBAL_LIMIT_RED" },
+	{ 0x0400000, "GLOBAL_LIMIT_ATOM" },
+	{ 0x4000000, "MP2" },
+	{}
+};
+
 static const struct nouveau_bitfield nv50_graph_trap_m2mf[] = {
 	{ 0x00000001, "NOTIFY" },
 	{ 0x00000002, "IN" },
@@ -524,6 +538,12 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
 				nv50_priv_mp_trap(priv, i, display);
 				ustatus &= ~0x04030000;
 			}
+			if (ustatus && display) {
+				nv_error("%s - TP%d:", name, i);
+				nouveau_bitfield_print(nv50_mpc_traps, ustatus);
+				pr_cont("\n");
+				ustatus = 0;
+			}
 			break;
 		case 8: /* PROP error */
 			if (display)
-- 
1.8.3.2
