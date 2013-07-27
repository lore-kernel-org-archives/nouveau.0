From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] drm/nv50: include vp in the fb error
	reporting mask
Date: Sat, 27 Jul 2013 00:26:59 -0400
Message-ID: <1374899221-11511-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Not 100% sure that this is needed, but BSP/MPEG are in the mask.

 drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c
index 0cb322a..f25fc5f 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c
@@ -41,7 +41,7 @@ nv50_mc_intr[] = {
 	{ 0x04000000, NVDEV_ENGINE_DISP },
 	{ 0x10000000, NVDEV_SUBDEV_BUS },
 	{ 0x80000000, NVDEV_ENGINE_SW },
-	{ 0x0000d101, NVDEV_SUBDEV_FB },
+	{ 0x0002d101, NVDEV_SUBDEV_FB },
 	{},
 };
 
-- 
1.8.1.5
