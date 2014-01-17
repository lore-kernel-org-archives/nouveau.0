From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm/nv50/graph: update list of mp errors,
	make it a bitfield
Date: Fri, 17 Jan 2014 06:19:46 -0500
Message-ID: <1389957586-7373-1-git-send-email-imirkin@alum.mit.edu>
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

The names come from envytools, of course. I'm a little concerned that
STACK_UNDERFLOW was wrong before, but perhaps it's because it was both an
underflow and a mismatch in whoever's test program?

 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index a489ac2..0f8d18a 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -304,12 +304,14 @@ nv84_graph_tlb_flush(struct nouveau_engine *engine)
 	return timeout ? -EBUSY : 0;
 }
 
-static const struct nouveau_enum nv50_mp_exec_error_names[] = {
-	{ 3, "STACK_UNDERFLOW", NULL },
-	{ 4, "QUADON_ACTIVE", NULL },
-	{ 8, "TIMEOUT", NULL },
-	{ 0x10, "INVALID_OPCODE", NULL },
-	{ 0x40, "BREAKPOINT", NULL },
+static const struct nouveau_bitfield nv50_mp_exec_errors[] = {
+	{ 0x01, "STACK_UNDERFLOW" },
+	{ 0x02, "STACK_MISMATCH" },
+	{ 0x04, "QUADON_ACTIVE" },
+	{ 0x08, "TIMEOUT" },
+	{ 0x10, "INVALID_OPCODE" },
+	{ 0x20, "PM_OVERFLOW" },
+	{ 0x40, "BREAKPOINT" },
 	{}
 };
 
@@ -474,8 +476,8 @@ nv50_priv_mp_trap(struct nv50_graph_priv *priv, int tpid, int display)
 			oplow = nv_rd32(priv, addr + 0x70);
 			ophigh = nv_rd32(priv, addr + 0x74);
 			nv_error(priv, "TRAP_MP_EXEC - "
-					"TP %d MP %d: ", tpid, i);
-			nouveau_enum_print(nv50_mp_exec_error_names, status);
+					"TP %d MP %d:", tpid, i);
+			nouveau_bitfield_print(nv50_mp_exec_errors, status);
 			pr_cont(" at %06x warp %d, opcode %08x %08x\n",
 					pc&0xffffff, pc >> 24,
 					oplow, ophigh);
-- 
1.8.3.2
