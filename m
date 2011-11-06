From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Default to 16bpp for low memory cards.
Date: Sun,  6 Nov 2011 20:32:10 +0100
Message-ID: <1320607930-21794-8-git-send-email-marcin.slusarz@gmail.com>
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

---
 src/nv_driver.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 3467dbe..651ee0e 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -603,6 +603,7 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	const char *reason;
 	uint64_t v;
 	int ret;
+	int defaultDepth = 0;
 
 	if (flags & PROBE_DETECT) {
 		EntityInfoPtr pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
@@ -701,7 +702,9 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	 * The first thing we should figure out is the depth, bpp, etc.
 	 */
 
-	if (!xf86SetDepthBpp(pScrn, 0, 0, 0, Support32bppFb)) {
+	if (dev->vm_vram_size <= 16 * 1024 * 1024)
+		defaultDepth = 16;
+	if (!xf86SetDepthBpp(pScrn, defaultDepth, 0, 0, Support32bppFb)) {
 		NVPreInitFail("\n");
 	} else {
 		/* Check that the returned depth is one we support */
-- 
1.7.7
