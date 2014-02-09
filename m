From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nv50/gr: add missing nv_error parameter priv
Date: Sat,  8 Feb 2014 22:35:13 -0500
Message-ID: <1391916913-3985-1-git-send-email-imirkin@alum.mit.edu>
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

Commit ea7dce901 ("drm/nv50/gr: print mpc trap name when it's not an mp
trap") added an nv_error call that was missing the priv parameter. This
causes GPFs if the error is ever hit.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Sorry, my bad! But... I hit it and it killed my computer. So things are
probably even.

 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 6da473c..ef38320 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -540,7 +540,7 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
 				ustatus &= ~0x04030000;
 			}
 			if (ustatus && display) {
-				nv_error("%s - TP%d:", name, i);
+				nv_error(priv, "%s - TP%d:", name, i);
 				nouveau_bitfield_print(nv50_mpc_traps, ustatus);
 				pr_cont("\n");
 				ustatus = 0;
-- 
1.8.3.2
