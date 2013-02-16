From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/7] nouveau: Do not load dri {sub,}module
Date: Sat, 16 Feb 2013 20:48:43 +0000
Message-ID: <1361047727-740-4-git-send-email-emil.l.velikov@gmail.com>
References: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1361047727-740-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Nouveau does not use dri1, thus loading XFree86-DRI is not needed
On the other hand, we do use dri2

As a side effect, purge the 'set-but-unused' variable pLibDRMVersion

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 19 +++----------------
 src/nv_type.h   |  2 --
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 2b2f698..f10da00 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -633,26 +633,13 @@ static Bool
 NVDRIGetVersion(ScrnInfoPtr pScrn)
 {
 	NVPtr pNv = NVPTR(pScrn);
-	int errmaj, errmin;
-	pointer ret;
 
-	ret = LoadSubModule(pScrn->module, "dri", NULL, NULL, NULL,
-			    NULL, &errmaj, &errmin);
-	if (!ret) {
-		xf86DrvMsg(pScrn->scrnIndex, X_INFO,
-				"error %d\n", errmaj);
-		LoaderErrorMsg(pScrn->name, "dri", errmaj, errmin);
-	}
-
-	if (!ret && errmaj != LDR_ONCEONLY)
+	if (!xf86LoadSubModule(pScrn, "dri2"))
 		return FALSE;
 
-	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Loaded DRI module\n");
-
 	/* Check the lib version */
-	if (xf86LoaderCheckSymbol("drmGetLibVersion"))
-		pNv->pLibDRMVersion = drmGetLibVersion(0);
-	if (pNv->pLibDRMVersion == NULL) {
+	if ((xf86LoaderCheckSymbol("drmGetLibVersion")) &&
+	    (drmGetLibVersion(pNv->dev->fd) == NULL)) {
 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
 		"NVDRIGetVersion failed because libDRM is really "
 		"way to old to even get a version number out of it.\n"
diff --git a/src/nv_type.h b/src/nv_type.h
index ed21c6d..5963cb6 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -69,8 +69,6 @@ typedef struct _NVRec {
 
     CARD32              currentRop;
 
-    drmVersionPtr       pLibDRMVersion;
-
 	void *drmmode; /* for KMS */
 
 	/* DRM interface */
-- 
1.8.1.3
