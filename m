From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [Patch] Add a custom power management perflvl
Date: Mon, 22 Nov 2010 00:50:16 +0100
Message-ID: <4CE9B038.5010707@free.fr>
References: <4CE8884F.10008@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030803020201020400020704"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CE8884F.10008-GANU6spQydw@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------030803020201020400020704
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 21/11/2010 03:47, Martin Peres a =E9crit :
> Hi everyone,
>
> Please comment on this patch allowing you to set all the PM-related=20
> clocks on the card. The patch is described in length in the commit log.
>
> There is something some of you will like and some won't. The custom_*=20
> files will always contain the values of the current perflvl unless the=20
> user changed them after the latest reclock.
> I may also add all the available voltage in sysfs in the same way Ben=20
> added all the available performance levels (performance_level_X).
>
> If you no-one has anything against it, please push it to master.
>
> Martin

An updated patch taking into account the critics I've got on IRC.

Martin

--------------030803020201020400020704
Content-Type: text/x-patch;
 name="0001-Add-a-custom-power-management-perflvl-v2.patch"
Content-Disposition: attachment;
 filename="0001-Add-a-custom-power-management-perflvl-v2.patch"
Content-Transfer-Encoding: quoted-printable

From 8b29c05beb74060a7441a94b269ccc7a2ecdf250 Mon Sep 17 00:00:00 2001
From: Martin Peres <mupuf-IIUFz0z94vfYtjvyW6yDsg@public.gmane.org>
Date: Sat, 20 Nov 2010 18:29:45 +0100
Subject: [PATCH] Add a custom power management perflvl v2
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

This is to allow people to tweak their clocks at will. Marcin asked for s=
omething like this to help him REing.

I was personnaly interested to see if openarena fps rate would scale with=
 the GPU clocks (it doesn't ... yet).
This patch will also allow overclockers to test their cards (On my NVS 14=
0M: Memory +66%, core: +66%, shader: +25%).

This patch introduces a few sysfs files:
- custom_*: Get/set the current clock/voltage value (kHz or *10mV)

Once you've set all the values you wanted to change, just echo "custom" i=
nto performance_level.

WARNINGS:
1) Pay attention to your current temperature, my card's temperature rose =
by 9=C2=B0C.
We'll need to use the thermal zones to be able to monitor that and downcl=
ock the card automatically (if someone wants to help here, he would be we=
lcome).

2) Changing clocks isn't safe at the moment, I'm working on this but the =
reclocking process is really different accross the boards.
So far, nv84 and nv86 work perfectly (as in no flicker and being able to =
reclock while playing games).

By the time I get this patch ready, please stop 3D applications, switch t=
o a tty, do the reclock and come back to X.

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h |    1 +
 drivers/gpu/drm/nouveau/nouveau_pm.c  |  207 +++++++++++++++++++++++++++=
+++++-
 2 files changed, 207 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
index a52b1da..5928301 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -463,6 +463,7 @@ struct nouveau_pm_engine {
 	struct nouveau_pm_threshold_temp threshold_temp;
=20
 	struct nouveau_pm_level boot;
+	struct nouveau_pm_level custom;
 	struct nouveau_pm_level *cur;
=20
 	struct device *hwmon;
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouve=
au/nouveau_pm.c
index d938141..49d8a17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -35,6 +35,10 @@
 #include <linux/hwmon-sysfs.h>
=20
 static int
+nouveau_pm_perflvl_get(struct drm_device *dev,
+                       struct nouveau_pm_level *perflvl);
+
+static int
 nouveau_pm_clock_set(struct drm_device *dev, struct nouveau_pm_level *pe=
rflvl,
 		     u8 id, u32 khz)
 {
@@ -61,7 +65,7 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct n=
ouveau_pm_level *perflvl)
 	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
 	int ret;
=20
-	if (perflvl =3D=3D pm->cur)
+	if (perflvl !=3D &pm->custom && perflvl =3D=3D pm->cur)
 		return 0;
=20
 	if (pm->voltage.supported && pm->voltage_set && perflvl->voltage) {
@@ -78,6 +82,10 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct =
nouveau_pm_level *perflvl)
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
=20
 	pm->cur =3D perflvl;
+
+	/* Copy the new profile to the custom profile */
+	nouveau_pm_perflvl_get(dev, &pm->custom);
+
 	return 0;
 }
=20
@@ -97,6 +105,8 @@ nouveau_pm_profile_set(struct drm_device *dev, const c=
har *profile)
=20
 	if (!strncmp(profile, "boot", 4))
 		perflvl =3D &pm->boot;
+	else if (!strncmp(profile, "custom", 6))
+		perflvl =3D &pm->custom;
 	else {
 		int pl =3D simple_strtol(profile, NULL, 10);
 		int i;
@@ -179,6 +189,45 @@ nouveau_pm_perflvl_info(struct nouveau_pm_level *per=
flvl, char *ptr, int len)
 }
=20
 static ssize_t
+nouveau_set_custom_clock(struct device *d, u32 id,
+                         const char *buf, size_t count)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+	u32 *custom_clock;
+	void *pre_state;
+	long sysfs_value;
+
+	if (id =3D=3D PLL_CORE)
+		custom_clock =3D &pm->custom.core;
+	else if(id =3D=3D PLL_MEMORY)
+		custom_clock =3D &pm->custom.memory;
+	else if(id =3D=3D PLL_SHADER)
+		custom_clock =3D &pm->custom.shader;
+	else if(id =3D=3D PLL_UNK05)
+		custom_clock =3D &pm->custom.unk05;
+	else
+		return -EINVAL;
+
+	if (strict_strtol(buf, 10, &sysfs_value) =3D=3D -EINVAL)
+		return -EINVAL;
+
+	if (sysfs_value < 5000)
+		return -EINVAL;
+
+	pre_state =3D pm->clock_pre(dev, &pm->custom, id, (u32) sysfs_value);
+	if (IS_ERR(pre_state))
+		return -ENOENT;
+	else
+		kfree(pre_state);
+
+	*custom_clock =3D (u32) sysfs_value;
+
+	return strlen(buf);
+}
+
+static ssize_t
 nouveau_pm_get_perflvl_info(struct device *d,
 			    struct device_attribute *a, char *buf)
 {
@@ -208,6 +257,8 @@ nouveau_pm_get_perflvl(struct device *d, struct devic=
e_attribute *a, char *buf)
 		snprintf(ptr, len, "setting: boot\n");
 	else if (pm->cur =3D=3D &pm->boot)
 		snprintf(ptr, len, "setting: boot\nc: ");
+	else if (pm->cur =3D=3D &pm->custom)
+		snprintf(ptr, len, "setting: custom\nclocks: ");
 	else
 		snprintf(ptr, len, "setting: static %d\nc: ", pm->cur->id);
 	ptr +=3D strlen(buf);
@@ -235,6 +286,132 @@ nouveau_pm_set_perflvl(struct device *d, struct dev=
ice_attribute *a,
 static DEVICE_ATTR(performance_level, S_IRUGO | S_IWUSR,
 		   nouveau_pm_get_perflvl, nouveau_pm_set_perflvl);
=20
+static ssize_t
+nouveau_pm_get_custom_core(struct device *d,
+                           struct device_attribute *a, char *buf)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+
+	snprintf(buf, PAGE_SIZE, "%d\n", pm->custom.core);
+	return strlen(buf);
+}
+
+static ssize_t
+nouveau_pm_set_custom_core(struct device *d, struct device_attribute *a,
+                           const char *buf, size_t count)
+{
+	return nouveau_set_custom_clock(d, PLL_CORE, buf, count);
+}
+
+static DEVICE_ATTR(custom_core, S_IRUGO | S_IWUSR,
+                   nouveau_pm_get_custom_core, nouveau_pm_set_custom_cor=
e);
+
+static ssize_t
+nouveau_pm_get_custom_memory(struct device *d,
+                             struct device_attribute *a, char *buf)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+
+	snprintf(buf, PAGE_SIZE, "%d\n", pm->custom.memory);
+	return strlen(buf);
+}
+
+static ssize_t
+nouveau_pm_set_custom_memory(struct device *d, struct device_attribute *=
a,
+                             const char *buf, size_t count)
+{
+	return nouveau_set_custom_clock(d, PLL_MEMORY, buf, count);
+}
+
+static DEVICE_ATTR(custom_memory, S_IRUGO | S_IWUSR,
+                   nouveau_pm_get_custom_memory, nouveau_pm_set_custom_m=
emory);
+
+static ssize_t
+nouveau_pm_get_custom_shader(struct device *d,
+                             struct device_attribute *a, char *buf)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+
+	snprintf(buf, PAGE_SIZE, "%d\n", pm->custom.shader);
+	return strlen(buf);
+}
+
+static ssize_t
+nouveau_pm_set_custom_shader(struct device *d, struct device_attribute *=
a,
+                             const char *buf, size_t count)
+{
+	return nouveau_set_custom_clock(d, PLL_SHADER, buf, count);
+}
+
+static DEVICE_ATTR(custom_shader, S_IRUGO | S_IWUSR,
+                   nouveau_pm_get_custom_shader, nouveau_pm_set_custom_s=
hader);
+
+static ssize_t
+nouveau_pm_get_custom_unk05(struct device *d,
+                            struct device_attribute *a, char *buf)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+	int len =3D PAGE_SIZE;
+	char *ptr =3D buf;
+
+	snprintf(ptr, len, "%d\n", pm->custom.unk05);
+	return strlen(buf);
+}
+
+static ssize_t
+nouveau_pm_set_custom_unk05(struct device *d, struct device_attribute *a=
,
+                            const char *buf, size_t count)
+{
+	return nouveau_set_custom_clock(d, PLL_UNK05, buf, count);
+}
+
+static DEVICE_ATTR(custom_unk05, S_IRUGO | S_IWUSR,
+                   nouveau_pm_get_custom_unk05, nouveau_pm_set_custom_un=
k05);
+
+static ssize_t
+nouveau_pm_get_custom_voltage(struct device *d,
+                              struct device_attribute *a, char *buf)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+
+	snprintf(buf, PAGE_SIZE, "%d\n", pm->custom.voltage);
+
+	return strlen(buf);
+}
+
+static ssize_t
+nouveau_pm_set_custom_voltage(struct device *d, struct device_attribute =
*a,
+                              const char *buf, size_t count)
+{
+	struct drm_device *dev =3D pci_get_drvdata(to_pci_dev(d));
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+	long voltage_sysfs;
+
+	if (strict_strtol(buf, 10, &voltage_sysfs) =3D=3D -EINVAL)
+		return -EINVAL;
+
+	if (nouveau_volt_vid_lookup(dev, voltage_sysfs) < 0)
+		return -ENOENT;
+
+	pm->custom.voltage =3D (u32) voltage_sysfs;
+	return strlen(buf);
+}
+
+static DEVICE_ATTR(custom_voltage, S_IRUGO | S_IWUSR,
+                   nouveau_pm_get_custom_voltage,
+                   nouveau_pm_set_custom_voltage);
+
 static int
 nouveau_sysfs_init(struct drm_device *dev)
 {
@@ -266,6 +443,26 @@ nouveau_sysfs_init(struct drm_device *dev)
 		}
 	}
=20
+	ret =3D device_create_file(d, &dev_attr_custom_core);
+	if (ret)
+		return ret;
+
+	ret =3D device_create_file(d, &dev_attr_custom_memory);
+	if (ret)
+		return ret;
+
+	ret =3D device_create_file(d, &dev_attr_custom_shader);
+	if (ret)
+		return ret;
+
+	ret =3D device_create_file(d, &dev_attr_custom_unk05);
+	if (ret)
+		return ret;
+
+	ret =3D device_create_file(d, &dev_attr_custom_voltage);
+	if (ret)
+		return ret;
+
 	return 0;
 }
=20
@@ -286,6 +483,11 @@ nouveau_sysfs_fini(struct drm_device *dev)
=20
 		device_remove_file(d, &pl->dev_attr);
 	}
+	device_remove_file(d, &dev_attr_custom_core);
+	device_remove_file(d, &dev_attr_custom_memory);
+	device_remove_file(d, &dev_attr_custom_shader);
+	device_remove_file(d, &dev_attr_custom_unk05);
+	device_remove_file(d, &dev_attr_custom_voltage);
 }
=20
 #ifdef CONFIG_HWMON
@@ -497,6 +699,9 @@ nouveau_pm_init(struct drm_device *dev)
 		NV_INFO(dev, "c: %s", info);
 	}
=20
+	/* set custom clocks to the boot performance level */
+	nouveau_pm_perflvl_get(dev, &pm->custom);
+
 	/* switch performance levels now if requested */
 	if (nouveau_perflvl !=3D NULL) {
 		ret =3D nouveau_pm_profile_set(dev, nouveau_perflvl);
--=20
1.7.3.2


--------------030803020201020400020704
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------030803020201020400020704--
