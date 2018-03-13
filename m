From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] drm/nouveau/secboot: remove VLA usage
Date: Tue, 13 Mar 2018 11:18:05 -0500
Message-ID: <ba264656-6e56-e907-97c0-8cdd28ce8340@embeddedor.com>
References: <20180313144812.GA30043@embeddedgus>
 <6977788dfbac4b70b54fd56310cc27fe@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6977788dfbac4b70b54fd56310cc27fe@AcuMS.aculab.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi David,

On 03/13/2018 11:10 AM, David Laight wrote:
> From: Gustavo A. R. Silva
>> Sent: 13 March 2018 14:48
>> In preparation to enabling -Wvla, remove VLA. In this particular
>> case directly use macro NVKM_MSGQUEUE_CMDLINE_SIZE instead of local
>> variable cmdline_size. Also, remove cmdline_size as it is not
>> actually useful anymore.
> ...
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
>> index 6f10b09..2da147b 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
>> @@ -80,12 +80,12 @@ acr_ls_msgqueue_post_run(struct nvkm_msgqueue *queue,
>>   			 struct nvkm_falcon *falcon, u32 addr_args)
>>   {
>>   	struct nvkm_device *device = falcon->owner->device;
>> -	u32 cmdline_size = NVKM_MSGQUEUE_CMDLINE_SIZE;
>> -	u8 buf[cmdline_size];
>> +	u8 buf[NVKM_MSGQUEUE_CMDLINE_SIZE];
>>
>> -	memset(buf, 0, cmdline_size);
>> +	memset(buf, 0, NVKM_MSGQUEUE_CMDLINE_SIZE);
>>   	nvkm_msgqueue_write_cmdline(queue, buf);
>> -	nvkm_falcon_load_dmem(falcon, buf, addr_args, cmdline_size, 0);
>> +	nvkm_falcon_load_dmem(falcon, buf, addr_args,
>> +			      NVKM_MSGQUEUE_CMDLINE_SIZE, 0);
> 
> I think I'd use 'sizeof (buf)' in both those lines.
> 

Yeah. I like it.

I'll send v2 with that change shortly.

Thanks
--
Gustavo
