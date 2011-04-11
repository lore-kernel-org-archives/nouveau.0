From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] pm: fix a compilation failure when
	CONFIG_POWER_SUPPLY is not set
Date: Tue, 12 Apr 2011 00:55:44 +0200
Message-ID: <1302562544-6793-1-git-send-email-martin.peres@free.fr>
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
Cc: psomas-CiBbMcFdDxlMo1R+fwTmgw@public.gmane.org, Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Reported-by: Stratos Psomadakis <psomas-CiBbMcFdDxlMo1R+fwTmgw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 0b1caeb..dc8a0cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -449,7 +449,7 @@ nouveau_hwmon_fini(struct drm_device *dev)
 #endif
 }
 
-#ifdef CONFIG_ACPI
+#if defined(CONFIG_ACPI) && defined(CONFIG_POWER_SUPPLY)
 static int
 nouveau_pm_acpi_event(struct notifier_block *nb, unsigned long val, void *data)
 {
@@ -508,7 +508,7 @@ nouveau_pm_init(struct drm_device *dev)
 
 	nouveau_sysfs_init(dev);
 	nouveau_hwmon_init(dev);
-#ifdef CONFIG_ACPI
+#if defined(CONFIG_ACPI) && defined(CONFIG_POWER_SUPPLY)
 	pm->acpi_nb.notifier_call = nouveau_pm_acpi_event;
 	register_acpi_notifier(&pm->acpi_nb);
 #endif
@@ -530,7 +530,7 @@ nouveau_pm_fini(struct drm_device *dev)
 	nouveau_perf_fini(dev);
 	nouveau_volt_fini(dev);
 
-#ifdef CONFIG_ACPI
+#if defined(CONFIG_ACPI) && defined(CONFIG_POWER_SUPPLY)
 	unregister_acpi_notifier(&pm->acpi_nb);
 #endif
 	nouveau_hwmon_fini(dev);
-- 
1.7.4.4
