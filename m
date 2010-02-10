From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] Revert "kms: work around some bong hits with dpms"
Date: Wed, 10 Feb 2010 18:56:42 +0100
Message-ID: <1265824602-31549-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This reverts commit 98c9e4edb58374f18249e5c9c53b392fb8b4a1d1. AFAIK
it's no longer needed.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/drmmode_display.c |    3 ---
 src/nv_driver.c       |    2 --
 src/nv_type.h         |    1 -
 3 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 7c45d9c..a91741d 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -651,9 +651,6 @@ drmmode_output_dpms(xf86OutputPtr output, int mode)
 	drmmode_ptr drmmode = drmmode_output->drmmode;
 	int mode_id = -1, i;
 
-	if (!NVPTR(output->scrn)->allow_dpms)
-		return;
-
 	for (i = 0; i < koutput->count_props; i++) {
 		props = drmModeGetProperty(drmmode->fd, koutput->props[i]);
 		if (props && (props->flags && DRM_MODE_PROP_ENUM)) {
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 3908347..7149759 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -331,10 +331,8 @@ NVEnterVT(int scrnIndex, int flags)
 	if (ret)
 		ErrorF("Unable to get master: %d\n", ret);
 
-	pNv->allow_dpms = FALSE;
 	if (!xf86SetDesiredModes(pScrn))
 		return FALSE;
-	pNv->allow_dpms = TRUE;
 
 	if (pNv->overlayAdaptor && pNv->Architecture != NV_ARCH_04)
 		NV10WriteOverlayParameters(pScrn);
diff --git a/src/nv_type.h b/src/nv_type.h
index 989812b..18ea3bb 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -69,7 +69,6 @@ typedef struct _NVRec {
     drmVersionPtr       pKernelDRMVersion;
 
 	void *drmmode; /* for KMS */
-	Bool allow_dpms;
 
 	/* DRM interface */
 	struct nouveau_device *dev;
-- 
1.6.4.4
