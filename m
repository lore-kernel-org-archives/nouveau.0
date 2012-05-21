From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 14/14] drm/nouveau/therm: Rework
	nouveau_therm_create()
Date: Mon, 21 May 2012 08:36:13 +0200
Message-ID: <CAGZ4FEQOd3E=RwZ8-Rr9NdM+gUoFnjC8bid2FbCCn=z72gqECw@mail.gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
	<1337555703-18925-15-git-send-email-emil.l.velikov@gmail.com>
	<20120521063032.GC10508@nisroch.bne.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120521063032.GC10508-7ZJhIA9XobDzA+JJ9lL7d4GKTjYczspe@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, May 21, 2012 at 8:30 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, May 21, 2012 at 12:15:03AM +0100, Emil Velikov wrote:
>> It contains a few changes mainly targeting the following
>> =A0* Therm table is present in BIT vbios
>> =A0* Parse the vbios table before hooking temp_get(), as it contains the=
 therm
>> sensor calibration data
>> =A0* Add dummy_therm_temp_get() function to prevent multiple null dereff=
's
>
> I didn't take this patch at all yet. =A0I'll let Martin put his input into
> this instead. =A0I didn't really touch the thermal stuff aside from match=
ing
> APIs because he's got an overhaul pending anyway.
>
> Comments on specific pieces inline as they may be useful.
>
>>
>> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nouveau_pm.c =A0 =A0| =A0 =A02 +-
>> =A0drivers/gpu/drm/nouveau/nouveau_therm.c | =A0 63 ++++++++++++++++++++=
++++-------
>> =A02 files changed, 50 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouv=
eau/nouveau_pm.c
>> index 9dd34fe..1b4422b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_pm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
>> @@ -693,7 +693,7 @@ nouveau_hwmon_init(struct nouveau_device *ndev)
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 /* if the card can read the fan rpm */
>> - =A0 =A0 if (nouveau_gpio_func_valid(ndev, DCB_GPIO_FAN_SENSE)) {
>> + =A0 =A0 if (pfan && pfan->sense(pfan) >=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D sysfs_create_group(&dev->pdev->dev.k=
obj,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0&hwmon_fan_rpm_attrgroup);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_therm.c b/drivers/gpu/drm/n=
ouveau/nouveau_therm.c
>> index acf81a9..91095be 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_therm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_therm.c
>> @@ -30,6 +30,12 @@
>> =A0#include "nouveau_pm.h"
>> =A0#include "nouveau_therm.h"
>>
>> +static inline int
>> +dummy_therm_temp_get(struct nouveau_therm *ptherm)
>> +{
>> + =A0 =A0 return 0;
>> +}
>> +
> I don't really like this, if we can't expose any thermal data I think we
> just shouldn't create a thermal subdev?
>
>> =A0static int
>> =A0nv40_sensor_setup(struct nouveau_therm *ptherm)
>> =A0{
>> @@ -181,7 +187,7 @@ nouveau_therm_vbios_parse(struct nouveau_therm *pthe=
rm, u8 *temp)
>> =A0 =A0 =A0 temp =3D temp + headerlen;
>>
>> =A0 =A0 =A0 /* Read the entries from the table */
>> - =A0 =A0 for (i =3D 0; i < entries; i++) {
>> + =A0 =A0 for (i =3D 0; i < entries; i++, temp +=3D recordlen) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s16 value =3D ROM16(temp[1]);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (temp[0]) {
>> @@ -228,7 +234,6 @@ nouveau_therm_vbios_parse(struct nouveau_therm *pthe=
rm, u8 *temp)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ptherm->fan.pwm_freq =3D val=
ue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 =A0 =A0 =A0 =A0 temp +=3D recordlen;
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 nouveau_therm_safety_checks(ptherm);
>> @@ -299,6 +304,12 @@ nouveau_therm_probe_i2c(struct nouveau_device *ndev)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0probe_monitoring_=
device, NV_I2C_DEFAULT(0));
>> =A0}
>>
>> +static void
>> +nouveau_ptherm_destroy(struct nouveau_device *ndev, int subdev)
>> +{
>> +// XXX: Undo probe_monitoring_device
>> +}
>> +
>> =A0int
>> =A0nouveau_therm_create(struct nouveau_device *ndev, int subdev)
>> =A0{
>> @@ -307,29 +318,53 @@ nouveau_therm_create(struct nouveau_device *ndev, =
int subdev)
>> =A0 =A0 =A0 u8 *temp =3D NULL;
>> =A0 =A0 =A0 int ret;
>>
>> - =A0 =A0 ret =3D nouveau_subdev_create(ndev, subdev, "THERM", "thermal"=
, &ptherm);
>> - =A0 =A0 if (ret)
>> - =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 if (bios->type =3D=3D NVBIOS_BIT) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (bit_table(ndev, 'P', &P))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> The BIT check isn't necessary, bit_table() will fail if it's not a BIT BI=
OS.
>
>>
>> - =A0 =A0 if (ndev->chipset >=3D 0x40 && ndev->chipset < 0x84)
>> - =A0 =A0 =A0 =A0 =A0 =A0 ptherm->temp_get =3D nv40_therm_temp_get;
>> - =A0 =A0 else
>> - =A0 =A0 if (ndev->chipset <=3D 0xd9)
>> - =A0 =A0 =A0 =A0 =A0 =A0 ptherm->temp_get =3D nv84_therm_temp_get;
>> -
>> - =A0 =A0 if (bit_table(ndev, 'P', &P) =3D=3D 0) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (P.version =3D=3D 1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 temp =3D ROMPTR(ndev, P.data=
[12]);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (P.version =3D=3D 2)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 temp =3D ROMPTR(ndev, P.data=
[16]);
>> - =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 else {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_WARN(ndev, "unknown temp =
for BIT P %d\n", P.version);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> + =A0 =A0 }
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 nouveau_therm_vbios_parse(ptherm, temp);
>> + =A0 =A0 if (!temp) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 NV_DEBUG(ndev, "temp table pointer invalid\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 ret =3D nouveau_subdev_create(ndev, subdev, "THERM", "thermal"=
, &ptherm);
>> + =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> +
>> + =A0 =A0 nouveau_therm_vbios_parse(ptherm, temp);
>> =A0 =A0 =A0 nouveau_therm_probe_i2c(ndev);
>>
>> + =A0 =A0 ptherm->base.destroy =3D nouveau_ptherm_destroy;
>> + =A0 =A0 switch (ndev->card_type) {
>> + =A0 =A0 case NV_40:
>> + =A0 =A0 case NV_50:
>> + =A0 =A0 case NV_C0:
>> + =A0 =A0 case NV_D0:
>> + =A0 =A0 case NV_E0:
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ndev->chipset < 0x84) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ptherm->temp_get =3D nv40_ther=
m_temp_get;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 } else
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ndev->chipset <=3D 0xd9) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ptherm->temp_get =3D nv84_ther=
m_temp_get;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 ptherm->temp_get =3D dummy_therm_temp_get;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 }
>> +
>> =A0 =A0 =A0 return nouveau_subdev_init(ndev, subdev, ret);
>> =A0}
>> --
>> 1.7.10.2
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

Does chipset 0x50 really use the NV40 function?

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
