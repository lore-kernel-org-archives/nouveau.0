From: Arnout Engelen <nouveau-xdCxd1SecUs@public.gmane.org>
Subject: [PATCH] More explicit error message when the kernel
 module has been configured 'noaccel' but the xorg configuration doesn't
 disable accelleration
Date: Sun, 10 Jun 2012 14:49:32 +0200
Message-ID: <20120610124932.GA2822@bzzt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

I ran into this the other day - this more explicit error message might save someone some
head-scratching ;).
---
 src/nv_dma.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/nv_dma.c b/src/nv_dma.c
index d2a6d00..339b4fe 100644
--- a/src/nv_dma.c
+++ b/src/nv_dma.c
@@ -53,8 +53,13 @@ NVInitDma(ScrnInfoPtr pScrn)
 	ret = nouveau_object_new(device, 0, NOUVEAU_FIFO_CHANNEL_CLASS,
 				 data, size, &pNv->channel);
 	if (ret) {
-		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
-			   "Error creating GPU channel: %d\n", ret);
+		if (ret == -ENODEV)
+			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+				   "'No such device' while creating GPU channel: perhaps you disabled "
+			           "accelleration in your module config but not in your X.Org config\n");
+		else
+			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+				   "Error creating GPU channel: %d, %s\n", ret, strerror(-ret));
 		return FALSE;
 	}
 
-- 
1.7.10
