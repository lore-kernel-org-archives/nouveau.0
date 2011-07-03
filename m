From: Ken Milmore <ken.milmore-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] Enable hwmon support when both nouveau and hwmon
 are built as modules.
Date: Sun, 03 Jul 2011 19:54:28 +0100
Message-ID: <4E10BAE4.8000506@googlemail.com>
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

The nouveau hwmon temperature support currently only functions when hwmon is
compiled into the kernel. There's no reason why this shouldn't also work when
both hwmon and nouveau are modularised (as is the case with Slackware's stock
kernels). The patch below worked for me on 2.6.38.7.

BTW, I notice that nouveau idles my 8600GT at around 71C, which is 18C hotter
than the Nvidia blob driver. Running some intensive OpenGL (Sauerbraten) caused
the temperature to reach 85C in a few minutes. The blob rarely goes above 80C,
even after extended use.

---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index db68531..a539fd2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -312,7 +312,7 @@ nouveau_sysfs_fini(struct drm_device *dev)
 	}
 }
 -#ifdef CONFIG_HWMON
+#if defined(CONFIG_HWMON) || (defined(MODULE) && defined(CONFIG_HWMON_MODULE))
 static ssize_t
 nouveau_hwmon_show_temp(struct device *d, struct device_attribute *a, char *buf)
 {
@@ -429,7 +429,7 @@ static const struct attribute_group hwmon_attrgroup = {
 static int
 nouveau_hwmon_init(struct drm_device *dev)
 {
-#ifdef CONFIG_HWMON
+#if defined(CONFIG_HWMON) || (defined(MODULE) && defined(CONFIG_HWMON_MODULE))
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
 	struct device *hwmon_dev;
@@ -462,7 +462,7 @@ nouveau_hwmon_init(struct drm_device *dev)
 static void
 nouveau_hwmon_fini(struct drm_device *dev)
 {
-#ifdef CONFIG_HWMON
+#if defined(CONFIG_HWMON) || (defined(MODULE) && defined(CONFIG_HWMON_MODULE))
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
 -- 1.7.4.4
