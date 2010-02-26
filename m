From: soulpatch <l337_sp33k-FFYn/CNdgSA@public.gmane.org>
Subject: module parameter description fix
Date: Thu, 25 Feb 2010 21:36:57 -0700
Message-ID: <1267159017.7524.17.camel@Tachyon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

I found a bug in the nouveau kernel module. It looks like a cut and
paste error on the definitions of some module parameters in
nouveau_drv.c. The bug exhibits when displaying module parameter
information with the modinfo utility. Here's a patch:

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
 

Cheers,
	soulpatch
