From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: mark expected switch fall-through
Date: Tue, 29 Jan 2019 21:03:44 -0600
Message-ID: <f57bdbe8-5096-f36c-4997-9200847449f5@embeddedor.com>
References: <20190129203046.GA28384@embeddedor>
 <CACAvsv7KU_fyyvAW3L6aCXPon599=tC4CyXdCF6sVOqqOu3SDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACAvsv7KU_fyyvAW3L6aCXPon599=tC4CyXdCF6sVOqqOu3SDA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Ben,

I wonder if you can take this too:

https://lore.kernel.org/patchwork/patch/1001180/

Thanks
--
Gustavo

On 1/29/19 8:51 PM, Ben Skeggs wrote:
> Got it, thanks.
> 
> On Wed, 30 Jan 2019 at 06:55, Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
>>
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
>>
>> This patch fixes the following warning:
>>
>> drivers/gpu/drm/nouveau/nouveau_bo.c:1434:53: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>
>> Warning level 3 was used: -Wimplicit-fallthrough=3
>>
>> This patch is part of the ongoing efforts to enabling
>> -Wimplicit-fallthrough.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 73eff52036d2..a72be71c45b4 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -1434,7 +1434,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
>>                 if (drm->client.mem->oclass < NVIF_CLASS_MEM_NV50 || !mem->kind)
>>                         /* untiled */
>>                         break;
>> -               /* fallthrough, tiled memory */
>> +               /* fall through - tiled memory */
>>         case TTM_PL_VRAM:
>>                 reg->bus.offset = reg->start << PAGE_SHIFT;
>>                 reg->bus.base = device->func->resource_addr(device, 1);
>> --
>> 2.20.1
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
