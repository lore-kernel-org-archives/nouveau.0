From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: remove dead/ums code from
	nouveau_ioc32.c
Date: Fri, 20 Sep 2013 22:17:17 +0100
Message-ID: <1379711837-12242-1-git-send-email-emil.l.velikov@gmail.com>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ever since the initial import of nouveau into upstream
kernel it has been a KMS only driver. Drop the old and
unused code, and update the comments while we're there.

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index c1a7e5a..58ba807 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -1,7 +1,7 @@
 /**
- * \file mga_ioc32.c
+ * \file nouveau_ioc32.c
  *
- * 32-bit ioctl compatibility routines for the MGA DRM.
+ * 32-bit ioctl compatibility routines for the NOUVEAU DRM.
  *
  * \author Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org> with code from patches by Egbert Eich
  *
@@ -50,20 +50,9 @@ long nouveau_compat_ioctl(struct file *filp, unsigned int cmd,
 			 unsigned long arg)
 {
 	unsigned int nr = DRM_IOCTL_NR(cmd);
-	drm_ioctl_compat_t *fn = NULL;
-	int ret;
 
 	if (nr < DRM_COMMAND_BASE)
 		return drm_compat_ioctl(filp, cmd, arg);
 
-#if 0
-	if (nr < DRM_COMMAND_BASE + DRM_ARRAY_SIZE(mga_compat_ioctls))
-		fn = nouveau_compat_ioctls[nr - DRM_COMMAND_BASE];
-#endif
-	if (fn != NULL)
-		ret = (*fn)(filp, cmd, arg);
-	else
-		ret = nouveau_drm_ioctl(filp, cmd, arg);
-
-	return ret;
+	return nouveau_drm_ioctl(filp, cmd, arg);
 }
-- 
1.8.4
