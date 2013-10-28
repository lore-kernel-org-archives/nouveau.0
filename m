From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] drm/nouveau/agp: add a quirk list to limit agp modes
Date: Sun, 27 Oct 2013 23:12:47 -0400
Message-ID: <CAKb7UvjP2x0JePcEaVUOTaVAxAsU8aTK0qXt8m1pUOeFv+JdRw@mail.gmail.com>
References: <1382889249-6822-1-git-send-email-imirkin@alum.mit.edu>
	<526DD3A5.6080001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <526DD3A5.6080001@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Robert Hancock <hancockrwd@gmail.com>
Cc: Jason Detring <detringj@gmail.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sun, Oct 27, 2013 at 11:01 PM, Robert Hancock <hancockrwd@gmail.com> wrote:
> On 10/27/2013 09:54 AM, Ilia Mirkin wrote:
>>
>> Certain combinations of hardware can't actually support the maximum
>> detected speed. Add a quirk list that lists pairs of hostbridge/chip pci
>> ids and the mode that they should work with.
>>
>> See https://bugs.freedesktop.org/show_bug.cgi?id=20341
>
>
> It seems like this quirk is likely too specific. This almost certainly
> affects more than 5600 Ultra cards and probably not just NV cards either. It
> probably affects more VIA chipsets than this too.

Extremely likely. But I don't have any of the hardware to test. Note
that this quirk list is based on the radeon one (except the radeon one
also has subdevice id's).

>
> Given the amount of breakage that seems to exist with VIA AGP chipsets, I
> would think that being much more aggressive and forcing AGP mode to 2X
> maximum at the AGP driver level for all VIA chipsets doesn't seem like it
> would be a bad idea.

That's what I thought. However it has been suggested that the
incompatibilities are highly card/chipset combination-dependent.
Furthermore, in some instances, it _only_ works at the higher speeds,
so blanket "max" restrictions wouldn't work.

See http://lists.freedesktop.org/archives/dri-devel/2013-October/047117.html.
I seem to recall more to the discussion, perhaps it happened over IRC
in #dri-devel.

>
>
>>
>> Reported-by: Jason Detring <detringj@gmail.com>
>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>> ---
>>
>> I didn't go as far as subdevice matching... IMO that's overkill for now.
>>
>>   drivers/gpu/drm/nouveau/nouveau_agp.c | 44
>> +++++++++++++++++++++++++++++++----
>>   1 file changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_agp.c
>> b/drivers/gpu/drm/nouveau/nouveau_agp.c
>> index 6e7a55f..2953c4e 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_agp.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_agp.c
>> @@ -11,10 +11,28 @@ MODULE_PARM_DESC(agpmode, "AGP mode (0 to disable
>> AGP)");
>>   static int nouveau_agpmode = -1;
>>   module_param_named(agpmode, nouveau_agpmode, int, 0400);
>>
>> +struct nouveau_agpmode_quirk {
>> +       u16 hostbridge_vendor;
>> +       u16 hostbridge_device;
>> +       u16 chip_vendor;
>> +       u16 chip_device;
>> +       int mode;
>> +};
>> +
>> +static struct nouveau_agpmode_quirk nouveau_agpmode_quirk_list[] = {
>> +       /* VIA Apollo PRO133x / GeForce FX 5600 Ultra, max agpmode 2, fdo
>> #20341 */
>> +       { PCI_VENDOR_ID_VIA, 0x0691, PCI_VENDOR_ID_NVIDIA, 0x0311, 2 },
>> +
>> +       {},
>> +};
>> +
>>   static unsigned long
>> -get_agp_mode(struct nouveau_drm *drm, unsigned long mode)
>> +get_agp_mode(struct nouveau_drm *drm, const struct drm_agp_info *info)
>>   {
>>         struct nouveau_device *device = nv_device(drm->device);
>> +       struct nouveau_agpmode_quirk *quirk = nouveau_agpmode_quirk_list;
>> +       int agpmode = nouveau_agpmode;
>> +       unsigned long mode = info->mode;
>>
>>         /*
>>          * FW seems to be broken on nv18, it makes the card lock up
>> @@ -24,11 +42,27 @@ get_agp_mode(struct nouveau_drm *drm, unsigned long
>> mode)
>>                 mode &= ~PCI_AGP_COMMAND_FW;
>>
>>         /*
>> +        * Go through the quirks list and adjust the agpmode accordingly.
>> +        */
>> +       while (agpmode == -1 && quirk->hostbridge_vendor) {
>> +               if (info->id_vendor == quirk->hostbridge_vendor &&
>> +                   info->id_device == quirk->hostbridge_device &&
>> +                   device->pdev->vendor == quirk->chip_vendor &&
>> +                   device->pdev->device == quirk->chip_device) {
>> +                       agpmode = quirk->mode;
>> +                       nv_info(device, "Forcing agp mode to %dX. Use
>> agpmode to override.\n",
>> +                               agpmode);
>> +                       break;
>> +               }
>> +               ++quirk;
>> +       }
>> +
>> +       /*
>>          * AGP mode set in the command line.
>>          */
>> -       if (nouveau_agpmode > 0) {
>> +       if (agpmode > 0) {
>>                 bool agpv3 = mode & 0x8;
>> -               int rate = agpv3 ? nouveau_agpmode / 4 : nouveau_agpmode;
>> +               int rate = agpv3 ? agpmode / 4 : agpmode;
>>
>>                 mode = (mode & ~0x7) | (rate & 0x7);
>>         }
>> @@ -90,7 +124,7 @@ nouveau_agp_reset(struct nouveau_drm *drm)
>>                 if (ret)
>>                         return;
>>
>> -               mode.mode  = get_agp_mode(drm, info.mode);
>> +               mode.mode  = get_agp_mode(drm, &info);
>>                 mode.mode &= ~PCI_AGP_COMMAND_FW;
>>
>>                 ret = drm_agp_enable(dev, mode);
>> @@ -139,7 +173,7 @@ nouveau_agp_init(struct nouveau_drm *drm)
>>         }
>>
>>         /* see agp.h for the AGPSTAT_* modes available */
>> -       mode.mode = get_agp_mode(drm, info.mode);
>> +       mode.mode = get_agp_mode(drm, &info);
>>
>>         ret = drm_agp_enable(dev, mode);
>>         if (ret) {
>>
>
