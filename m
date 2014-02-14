From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nv50/gr: decode texture trap status code
Date: Fri, 14 Feb 2014 14:28:36 -0500
Message-ID: <1392406116-1093-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Statuses derived from envytools, as usual. Not 100% sure about the "any"
thing, but it makes sense...

 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index ef38320..2c7809e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -330,6 +330,15 @@ static const struct nouveau_bitfield nv50_mpc_traps[] = {
 	{}
 };
 
+static const struct nouveau_bitfield nv50_tex_traps[] = {
+	{ 0x00000001, "" }, /* any bit set? */
+	{ 0x00000002, "FAULT" },
+	{ 0x00000004, "STORAGE_TYPE_MISMATCH" },
+	{ 0x00000008, "LINEAR_MISMATCH" },
+	{ 0x00000020, "WRONG_MEMTYPE" },
+	{}
+};
+
 static const struct nouveau_bitfield nv50_graph_trap_m2mf[] = {
 	{ 0x00000001, "NOTIFY" },
 	{ 0x00000002, "IN" },
@@ -532,6 +541,13 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
 				for (r = ustatus_addr + 4; r <= ustatus_addr + 0x10; r += 4)
 					nv_error(priv, "\t0x%08x: 0x%08x\n", r,
 						nv_rd32(priv, r));
+				if (ustatus) {
+					nv_error(priv, "%s - TP%d:", name, i);
+					nouveau_bitfield_print(nv50_tex_traps,
+							       ustatus);
+					pr_cont("\n");
+					ustatus = 0;
+				}
 			}
 			break;
 		case 7: /* MP error */
-- 
1.8.3.2
