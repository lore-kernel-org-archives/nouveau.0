From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix noaccel/nofbaccel option
	descriptions.
Date: Wed, 27 Jan 2010 15:57:16 +0000
Message-ID: <1264607836-9183-1-git-send-email-koriakin@0x04.net>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index da3b93b..874adf5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -75,11 +75,11 @@ MODULE_PARM_DESC(ignorelid, "Ignore ACPI lid status");
 int nouveau_ignorelid = 0;
 module_param_named(ignorelid, nouveau_ignorelid, int, 0400);
 
-MODULE_PARM_DESC(noagp, "Disable all acceleration");
+MODULE_PARM_DESC(noaccel, "Disable all acceleration");
 int nouveau_noaccel = 0;
 module_param_named(noaccel, nouveau_noaccel, int, 0400);
 
-MODULE_PARM_DESC(noagp, "Disable fbcon acceleration");
+MODULE_PARM_DESC(nofbaccel, "Disable fbcon acceleration");
 int nouveau_nofbaccel = 0;
 module_param_named(nofbaccel, nouveau_nofbaccel, int, 0400);
 
-- 
1.6.4.1
