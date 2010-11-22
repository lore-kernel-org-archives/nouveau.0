From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [Patch] Add a way to list the available voltages
Date: Mon, 22 Nov 2010 10:13:48 +0100
Message-ID: <4CEA344C.1050805@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090500090007030301010403"
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
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------090500090007030301010403
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch makes it easy for people to set their custom_voltage file. 
Previously, they had to guess what was the available voltages.

This patch depends on my previous patch to add a custom perflvl.

Martin


--------------090500090007030301010403
Content-Type: text/x-patch;
 name="0001-Add-a-way-to-list-the-available-voltages-through-sys.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Add-a-way-to-list-the-available-voltages-through-sys.pa";
 filename*1="tch"

From e9c880e0882bb609a9ce4ec0bf28ef99ea78714a Mon Sep 17 00:00:00 2001
From: Martin Peres <mupuf-IIUFz0z94vfYtjvyW6yDsg@public.gmane.org>
Date: Mon, 22 Nov 2010 09:59:16 +0100
Subject: [PATCH] Add a way to list the available voltages through sysfs

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 49d8a17..b0d0691 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -412,6 +412,33 @@ static DEVICE_ATTR(custom_voltage, S_IRUGO | S_IWUSR,
                    nouveau_pm_get_custom_voltage,
                    nouveau_pm_set_custom_voltage);
 
+static ssize_t
+nouveau_pm_get_voltages(struct device *d, struct device_attribute *a, char *buf)
+{
+	struct drm_device *dev = pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	struct nouveau_pm_voltage *volt = &pm->voltage;
+	int cur_voltage = nouveau_voltage_gpio_get(dev);
+	char *ptr = buf;
+	int len = PAGE_SIZE;
+	int i;
+
+	for (i = 0; i < volt->nr_level; i++) {
+		int size = snprintf(ptr, len, "%c %d [*10mV]\n",
+		                    cur_voltage == volt->level[i].voltage ? '*' : ' ',
+		                    volt->level[i].voltage
+		                   );
+
+		ptr += size;
+		len -= size;
+	}
+
+	return strlen(buf);
+}
+
+static DEVICE_ATTR(voltages, S_IRUGO, nouveau_pm_get_voltages, NULL);
+
 static int
 nouveau_sysfs_init(struct drm_device *dev)
 {
@@ -463,6 +490,10 @@ nouveau_sysfs_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
+	ret = device_create_file(d, &dev_attr_voltages);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -488,6 +519,7 @@ nouveau_sysfs_fini(struct drm_device *dev)
 	device_remove_file(d, &dev_attr_custom_shader);
 	device_remove_file(d, &dev_attr_custom_unk05);
 	device_remove_file(d, &dev_attr_custom_voltage);
+	device_remove_file(d, &dev_attr_voltages);
 }
 
 #ifdef CONFIG_HWMON
-- 
1.7.3.2



--------------090500090007030301010403
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------090500090007030301010403--
