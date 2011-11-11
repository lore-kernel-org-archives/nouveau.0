From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] drm/nvc0/gr: fix TP init for transform feedback
	offset queries
Date: Fri, 11 Nov 2011 20:47:58 +0100
Message-ID: <1321040878-5660-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Without this, they return bytes written since the last update of
the offset, but we want the full offset.

Trace shows setting this on GPC[0]/TP[0] is enough.
---
 drivers/gpu/drm/nouveau/nvc0_graph.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.c b/drivers/gpu/drm/nouveau/nvc0_graph.c
index d99b285..f6bc4a8 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.c
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.c
@@ -357,6 +357,8 @@ nvc0_graph_init_gpc_0(struct drm_device *dev)
 	u8  tpnr[GPC_MAX];
 	int i, gpc, tpc;
 
+	nv_wr32(dev, TP_UNIT(0, 0, 0x5c), 1); /* affects TFB offset queries */
+
 	/*
 	 *      TP      ROP UNKVAL(magic_not_rop_nr)
 	 * 450: 4/0/0/0 2        3
-- 
1.7.3.4
