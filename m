From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] ddx: nv vpe
Date: Thu, 5 Aug 2010 22:41:16 -0400
Message-ID: <20100805224116.7bbb5336@amd64linuxmsi.rentzhouse.lan>
References: <20100805223618.1cdcbb08@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100805223618.1cdcbb08-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch includes all the relevant nv vpe ddx support.
This patch applies against the latest xf86-video-nouveau.

This is hooks up the XV blit adapter to be used for XvMC IDCT on
NV30/NV40 cards.  This makes it possible to fallback to g3dvl XvMC
if nv vpe is in use.

Signed-off-by: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
index d1f87c3..aa07193 100644
--- a/src/nouveau_xv.c
+++ b/src/nouveau_xv.c
@@ -2062,6 +2062,7 @@ NVInitVideo(ScreenPtr pScreen)
 	XF86VideoAdaptorPtr  blitAdaptor = NULL;
 	XF86VideoAdaptorPtr  textureAdaptor[2] = {NULL, NULL};
 	int                  num_adaptors;
+	bool                 create_vpe_xvmc = false;
 
 	/*
 	 * Driving the blitter requires the DMA FIFO. Using the FIFO
@@ -2140,14 +2141,28 @@ NVInitVideo(ScreenPtr pScreen)
 	 * associate with any/all adapters since VL doesn't depend on
Xv for color conversion. */
 	if (textureAdaptor[0]) {
-		XF86MCAdaptorPtr *adaptorsXvMC =
xalloc(sizeof(XF86MCAdaptorPtr));
+		if (blitAdaptor && ( (pNv->Architecture == NV_ARCH_30)
||
+		    (pNv->Architecture == NV_ARCH_40) ) ) {
+		    create_vpe_xvmc = true;
+		    num_adaptors = 2;
+		}
+		else
+			num_adaptors = 1;
+		    
+		XF86MCAdaptorPtr *adaptorsXvMC = xalloc(num_adaptors *
sizeof(XF86MCAdaptorPtr)); 
 		if (adaptorsXvMC) {
 			adaptorsXvMC[0] = vlCreateAdaptorXvMC(pScreen,
textureAdaptor[0]->name); 
+			if (create_vpe_xvmc)
+				adaptorsXvMC[1] =
vlCreateAdaptorXvMCVPE(pScreen, blitAdaptor->name);
+			
 			if (adaptorsXvMC[0]) {
-				vlInitXvMC(pScreen, 1, adaptorsXvMC);
+				vlInitXvMC(pScreen, num_adaptors,
adaptorsXvMC); vlDestroyAdaptorXvMC(adaptorsXvMC[0]);
+				
+				if (num_adaptors > 1)
+
vlDestroyAdaptorXvMC(adaptorsXvMC[1]); }
 			
 			xfree(adaptorsXvMC);
diff --git a/src/vl_hwmc.c b/src/vl_hwmc.c
index d8d8860..800fc88 100644
--- a/src/vl_hwmc.c
+++ b/src/vl_hwmc.c
@@ -58,11 +58,30 @@ static XF86MCSurfaceInfoRec yv12_mpeg2_surface =
 	&subpicture_list
 };
 
+static XF86MCSurfaceInfoRec yv12_mpeg2_vpe_surface =
+{
+	FOURCC_YV12,
+	XVMC_CHROMA_FORMAT_420,
+	0,
+	2032,
+	2032,
+	2048,
+	2048,
+	XVMC_IDCT  | XVMC_MPEG_2,
+	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
+	&subpicture_list
+};
+
 static XF86MCSurfaceInfoPtr surfaces[] =
 {
 	(XF86MCSurfaceInfoPtr)&yv12_mpeg2_surface
 };
 
+static XF86MCSurfaceInfoPtr vpe_surfaces[] =
+{
+	(XF86MCSurfaceInfoPtr)&yv12_mpeg2_vpe_surface
+};
+
 static XF86ImageRec rgb_subpicture = XVIMAGE_RGB;
 
 static XF86ImagePtr subpictures[] =
@@ -85,6 +104,21 @@ static XF86MCAdaptorRec adaptor_template =
 	(xf86XvMCDestroySubpictureProcPtr)NULL
 };
 
+static XF86MCAdaptorRec vpe_adaptor_template =
+{
+	"",
+	1,
+	vpe_surfaces,
+	1,
+	subpictures,
+	(xf86XvMCCreateContextProcPtr)NULL,
+	(xf86XvMCDestroyContextProcPtr)NULL,
+	(xf86XvMCCreateSurfaceProcPtr)NULL,
+	(xf86XvMCDestroySurfaceProcPtr)NULL,
+	(xf86XvMCCreateSubpictureProcPtr)NULL,
+	(xf86XvMCDestroySubpictureProcPtr)NULL
+};
+
 XF86MCAdaptorPtr vlCreateAdaptorXvMC(ScreenPtr pScreen, char
*xv_adaptor_name) {
 	XF86MCAdaptorPtr	adaptor;
@@ -110,6 +144,31 @@ XF86MCAdaptorPtr vlCreateAdaptorXvMC(ScreenPtr
pScreen, char *xv_adaptor_name) return adaptor;
 }
 
+XF86MCAdaptorPtr vlCreateAdaptorXvMCVPE(ScreenPtr pScreen, char
*xv_adaptor_name) +{
+	XF86MCAdaptorPtr	adaptor;
+	ScrnInfoPtr		pScrn;
+	
+	assert(pScreen);
+	assert(xv_adaptor_name);
+	
+	pScrn = xf86Screens[pScreen->myNum];
+	adaptor = xf86XvMCCreateAdaptorRec();
+	
+	if (!adaptor)
+	{
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "[XvMC.VPE]
Memory allocation failed.\n");
+		return NULL;
+	}
+	
+	*adaptor = vpe_adaptor_template;
+	adaptor->name = xv_adaptor_name;
+	
+	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "[XvMC.VPE] Associated
with %s.\n", xv_adaptor_name);
+	
+	return adaptor;
+}
+
 void vlDestroyAdaptorXvMC(XF86MCAdaptorPtr adaptor)
 {
 	assert(adaptor);
diff --git a/src/vl_hwmc.h b/src/vl_hwmc.h
index 715120d..efb2d56 100644
--- a/src/vl_hwmc.h
+++ b/src/vl_hwmc.h
@@ -4,6 +4,7 @@
 #include <xf86xvmc.h>
 
 XF86MCAdaptorPtr vlCreateAdaptorXvMC(ScreenPtr pScreen, char
*xv_adaptor_name); +XF86MCAdaptorPtr vlCreateAdaptorXvMCVPE(ScreenPtr
pScreen, char *xv_adaptor_name); void
vlDestroyAdaptorXvMC(XF86MCAdaptorPtr adaptor); void
vlInitXvMC(ScreenPtr pScreen, unsigned int num_adaptors,
XF86MCAdaptorPtr *adaptors);
