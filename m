From: =?UTF-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] drm/nouveau: Add a module option to force card
	POST.
Date: Wed, 29 Sep 2010 11:15:01 +0000
Message-ID: <1285758901-2763-1-git-send-email-koriakin@0x04.net>
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
List-Id: nouveau.vger.kernel.org

---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    2 ++
 drivers/gpu/drm/nouveau/nouveau_drv.c  |    4 ++++
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    1 +
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 0b844ea..4df6898 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -6871,6 +6871,8 @@ nouveau_bios_init(struct drm_device *dev)
 			"running VBIOS init tables.\n");
 		bios->execute = true;
 	}
+	if (nouveau_force_post)
+		bios->execute = true;
 
 	ret = nouveau_run_vbios_init(dev);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index 39535c8..8006f30 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -80,6 +80,10 @@ MODULE_PARM_DESC(nofbaccel, "Disable fbcon acceleration");
 int nouveau_nofbaccel = 0;
 module_param_named(nofbaccel, nouveau_nofbaccel, int, 0400);
 
+MODULE_PARM_DESC(force_post, "Force POST");
+int nouveau_force_post = 0;
+module_param_named(force_post, nouveau_force_post, int, 0400);
+
 MODULE_PARM_DESC(override_conntype, "Ignore DCB connector type");
 int nouveau_override_conntype = 0;
 module_param_named(override_conntype, nouveau_override_conntype, int, 0400);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 591254e..6201c47 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -755,6 +755,7 @@ extern char *nouveau_vbios;
 extern int nouveau_ignorelid;
 extern int nouveau_nofbaccel;
 extern int nouveau_noaccel;
+extern int nouveau_force_post;
 extern int nouveau_override_conntype;
 extern char *nouveau_perflvl;
 extern int nouveau_perflvl_wr;
-- 
1.7.3
