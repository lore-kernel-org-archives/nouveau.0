From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] fix drmSetMaster error reporting
Date: Sun, 13 Feb 2011 20:46:42 +0100
Message-ID: <1297626403-3349-3-git-send-email-marcin.slusarz@gmail.com>
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

On error, drmSetMaster returns -1 and sets errno.
---
 src/nv_driver.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 3e009fc..754739c 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -334,7 +334,7 @@ NVEnterVT(int scrnIndex, int flags)
 
 	ret = drmSetMaster(nouveau_device(pNv->dev)->fd);
 	if (ret)
-		ErrorF("Unable to get master: %d\n", ret);
+		ErrorF("Unable to get master: %s\n", strerror(errno));
 
 	if (!xf86SetDesiredModes(pScrn))
 		return FALSE;
-- 
1.7.4.rc3
