From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/10] nv50: also report errors in MP1/MP2 when
	they happen.
Date: Sun,  9 Oct 2011 22:58:32 +0200
Message-ID: <1318193920-27461-3-git-send-email-maximlevitsky@gmail.com>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_graph.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 8c979b3..63e0ccd 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -616,9 +616,9 @@ nv50_pgraph_tp_trap(struct drm_device *dev, int type, uint32_t ustatus_old,
 			}
 			break;
 		case 7: /* MP error */
-			if (ustatus & 0x00010000) {
+			if (ustatus & 0x04030000) {
 				nv50_pgraph_mp_trap(dev, i, display);
-				ustatus &= ~0x00010000;
+				ustatus &= ~0x04030000;
 			}
 			break;
 		case 8: /* TPDMA error */
-- 
1.7.4.1
