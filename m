From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Subject: Re: [Nouveau] [RFC PATCH] drm/nouveau: use vmalloc for pgt allocation
Date: Wed, 12 Jun 2013 22:15:33 +0200
Message-ID: <CA+GA0_u=TJ_=qeC7NO-eB6FXNBXGFujKjSu_EajGg-G0TGjVpg@mail.gmail.com>
References: <1362509833-28968-1-git-send-email-marcin.slusarz@gmail.com>
	<51B6E6C2.2090407@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <51B6E6C2.2090407@canonical.com>
Sender: stable-owner@vger.kernel.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

2013/6/11 Maarten Lankhorst <maarten.lankhorst@canonical.com>:
> Op 05-03-13 19:57, Marcin Slusarz schreef:
>> Page tables on nv50 take 48kB, which can be hard to allocate in one piece.
>> Let's use vmalloc.
>>
>> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
>> Cc: stable@vger.kernel.org [3.7+]
>> ---
>>  drivers/gpu/drm/nouveau/core/subdev/vm/base.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> index 77c67fc..e66fb77 100644
>> --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> @@ -362,7 +362,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
>>       vm->fpde = offset >> (vmm->pgt_bits + 12);
>>       vm->lpde = (offset + length - 1) >> (vmm->pgt_bits + 12);
>>
>> -     vm->pgt  = kcalloc(vm->lpde - vm->fpde + 1, sizeof(*vm->pgt), GFP_KERNEL);
>> +     vm->pgt  = vzalloc((vm->lpde - vm->fpde + 1) * sizeof(*vm->pgt));
>>       if (!vm->pgt) {
>>               kfree(vm);
>>               return -ENOMEM;
>> @@ -371,7 +371,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
>>       ret = nouveau_mm_init(&vm->mm, mm_offset >> 12, mm_length >> 12,
>>                             block >> 12);
>>       if (ret) {
>> -             kfree(vm->pgt);
>> +             vfree(vm->pgt);
>>               kfree(vm);
>>               return ret;
>>       }
>> @@ -446,7 +446,7 @@ nouveau_vm_del(struct nouveau_vm *vm)
>>       }
>>
>>       nouveau_mm_fini(&vm->mm);
>> -     kfree(vm->pgt);
>> +     vfree(vm->pgt);
>>       kfree(vm);
>>  }
> Could this patch be upstreamed?

Why do you ask me? I sent it to the Nouveau mailing list more than 3 months ago,
pinged Ben after 2 weeks, and as USUAL didn't get any response.
Have fun.

Marcin
