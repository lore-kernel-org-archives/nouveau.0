From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: use nv_debug for NV_DEBUG
Date: Thu, 13 Feb 2014 03:39:51 -0500
Message-ID: <1392280791-7579-2-git-send-email-imirkin@alum.mit.edu>
References: <1392280791-7579-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392280791-7579-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

It's really confusing for NV_DEBUG's printing to be controlled via
drm.debug while everything else is controlled via nouveau.debug. These
messages can be turned on with nouveau.debug=CLIENT=debug.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

It's a bit annoying that the DRM messages are conflated with the various
clients. Perhaps we should add some code to make the DRM messages use "DRM"
instead?

 drivers/gpu/drm/nouveau/nouveau_drm.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
index 23ca7a5..7efbafa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
@@ -161,10 +161,7 @@ int nouveau_pmops_resume(struct device *);
 #define NV_ERROR(cli, fmt, args...) nv_error((cli), fmt, ##args)
 #define NV_WARN(cli, fmt, args...) nv_warn((cli), fmt, ##args)
 #define NV_INFO(cli, fmt, args...) nv_info((cli), fmt, ##args)
-#define NV_DEBUG(cli, fmt, args...) do {                                       \
-	if (drm_debug & DRM_UT_DRIVER)                                         \
-		nv_info((cli), fmt, ##args);                                   \
-} while (0)
+#define NV_DEBUG(cli, fmt, args...) nv_debug((cli), fmt, ##args)
 
 extern int nouveau_modeset;
 
-- 
1.8.3.2
