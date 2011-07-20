From: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] g3dvl: update for compatibility with latest
	pipe-video branch in Mesa
Date: Wed, 20 Jul 2011 13:48:36 -0500
Message-ID: <1311187717-3621-1-git-send-email-bryancain3@gmail.com>
References: <n>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <n>
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
 src/vl_hwmc.c |   37 +++++++++++++++++++++++++++++--------
 1 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/src/vl_hwmc.c b/src/vl_hwmc.c
index d8d8860..6e9e0c7 100644
--- a/src/vl_hwmc.c
+++ b/src/vl_hwmc.c
@@ -35,12 +35,14 @@
 
 static int subpicture_index_list[] =
 {
-	FOURCC_RGB
+	FOURCC_RGB,
+	FOURCC_IA44,
+	FOURCC_AI44
 };
 
 static XF86MCImageIDList subpicture_list =
 {
-	1,
+	3,
 	subpicture_index_list
 };
 
@@ -53,29 +55,48 @@ static XF86MCSurfaceInfoRec yv12_mpeg2_surface =
 	2048,
 	2048,
 	2048,
-	/*XVMC_IDCT*/ XVMC_MOCOMP | XVMC_MPEG_2,
-	XVMC_INTRA_UNSIGNED | XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
+	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
+	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
+	&subpicture_list
+};
+
+static XF86MCSurfaceInfoRec uyvy_mpeg2_surface =
+{
+	FOURCC_UYVY,
+	XVMC_CHROMA_FORMAT_422,
+	0,
+	2048,
+	2048,
+	2048,
+	2048,
+	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
+	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
 	&subpicture_list
 };
 
 static XF86MCSurfaceInfoPtr surfaces[] =
 {
-	(XF86MCSurfaceInfoPtr)&yv12_mpeg2_surface
+	(XF86MCSurfaceInfoPtr)&yv12_mpeg2_surface,
+	(XF86MCSurfaceInfoPtr)&uyvy_mpeg2_surface
 };
 
 static XF86ImageRec rgb_subpicture = XVIMAGE_RGB;
+static XF86ImageRec ia44_subpicture = XVIMAGE_IA44;
+static XF86ImageRec ai44_subpicture = XVIMAGE_AI44;
 
 static XF86ImagePtr subpictures[] =
 {
-	(XF86ImagePtr)&rgb_subpicture
+	(XF86ImagePtr)&rgb_subpicture,
+	(XF86ImagePtr)&ia44_subpicture,
+	(XF86ImagePtr)&ai44_subpicture
 };
 
 static XF86MCAdaptorRec adaptor_template =
 {
 	"",
-	1,
+	2,
 	surfaces,
-	1,
+	3,
 	subpictures,
 	(xf86XvMCCreateContextProcPtr)NULL,
 	(xf86XvMCDestroyContextProcPtr)NULL,
-- 
1.7.1
