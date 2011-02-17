From: Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] Fix gcc 4.6.0 set but unused variable warnings
Date: Thu, 17 Feb 2011 03:48:16 +0100
Message-ID: <1297910903.31321.5.camel@ginzen>
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
To: nouveau ML <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francesco Marella <fmarl-XtQPfPCVGG7srOwW+9ziJQ@public.gmane.org>
---
 src/drmmode_display.c |    2 --
 src/nv_driver.c       |    3 +--
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index d14dd80..43a2672 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -1158,7 +1158,6 @@ static const xf86CrtcConfigFuncsRec drmmode_xf86crtc_config_funcs = {
 
 Bool drmmode_pre_init(ScrnInfoPtr pScrn, int fd, int cpp)
 {
-	xf86CrtcConfigPtr   xf86_config;
 	drmmode_ptr drmmode;
 	int i;
 
@@ -1167,7 +1166,6 @@ Bool drmmode_pre_init(ScrnInfoPtr pScrn, int fd, int cpp)
 	drmmode->fb_id = 0;
 
 	xf86CrtcConfigInit(pScrn, &drmmode_xf86crtc_config_funcs);
-	xf86_config = XF86_CRTC_CONFIG_PTR(pScrn);
 
 	drmmode->cpp = cpp;
 	drmmode->mode_res = drmModeGetResources(drmmode->fd);
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 523cab8..b959745 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -601,7 +601,7 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	MessageType from;
 	const char *reason;
 	uint64_t v;
-	int ret, i;
+	int ret;
 
 	if (flags & PROBE_DETECT) {
 		EntityInfoPtr pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
@@ -609,7 +609,6 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 		if (!pEnt)
 			return FALSE;
 
-		i = pEnt->index;
 		free(pEnt);
 
 		return TRUE;
-- 
1.7.4
