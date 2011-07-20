From: Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] g3dvl: disable iDCT for now
Date: Wed, 20 Jul 2011 13:48:37 -0500
Message-ID: <1311187717-3621-2-git-send-email-bryancain3@gmail.com>
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
 src/vl_hwmc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/vl_hwmc.c b/src/vl_hwmc.c
index 6e9e0c7..8e24786 100644
--- a/src/vl_hwmc.c
+++ b/src/vl_hwmc.c
@@ -55,7 +55,7 @@ static XF86MCSurfaceInfoRec yv12_mpeg2_surface =
 	2048,
 	2048,
 	2048,
-	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
+	/*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,
 	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
 	&subpicture_list
 };
@@ -69,7 +69,7 @@ static XF86MCSurfaceInfoRec uyvy_mpeg2_surface =
 	2048,
 	2048,
 	2048,
-	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
+	/*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,
 	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
 	&subpicture_list
 };
-- 
1.7.1
