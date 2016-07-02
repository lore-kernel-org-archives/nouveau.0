From: Markus Mayer <markus.mayer@broadcom.com>
Subject: Re: [Nouveau] [PATCH 2/6] drm/nouveau/core: make use of new
 strtolower() function
Date: Sat, 2 Jul 2016 08:21:33 -0700
Message-ID: <CAGt4E5uusNK3vtBo5N9FyUTuWCpMtQS1KC1mHVCq5iFzFJpJFg@mail.gmail.com>
References: <1467330612-26242-1-git-send-email-mmayer@broadcom.com>
 <1467330612-26242-3-git-send-email-mmayer@broadcom.com> <CAAVeFuKabYS8s42GghnDSNe_AVa5v+1w_OHiR6cEgdU0_Dz7UA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKabYS8s42GghnDSNe_AVa5v+1w_OHiR6cEgdU0_Dz7UA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On 1 July 2016 at 18:18, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Jul 1, 2016 at 8:50 AM, Markus Mayer <mmayer@broadcom.com> wrote:
>> Call strtolower() rather than walking the string explicitly to convert
>> it to lowercase.
>>
>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>> ---
>>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> index 34ecd4a..c50594c 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
>> @@ -36,16 +36,11 @@ nvkm_firmware_get(struct nvkm_device *device, const char *fwname,
>>  {
>>         char f[64];
>>         char cname[16];
>> -       int i;
>>
>>         /* Convert device name to lowercase */
>>         strncpy(cname, device->chip->name, sizeof(cname));
>>         cname[sizeof(cname) - 1] = '\0';
>> -       i = strlen(cname);
>> -       while (i) {
>> -               --i;
>> -               cname[i] = tolower(cname[i]);
>> -       }
>> +       strtolower(cname);
>
> This function doesn't seem to exist as of next-20160701, where have
> you found it?

I didn't find it. I wrote it, because it didn't exist and I needed it.
See: https://lkml.org/lkml/2016/6/30/727 and
https://lkml.org/lkml/2016/6/30/733 (cover letter and first patch in
series).
