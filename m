From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [Nouveau] [RFC PATCH] drm/nouveau: use vmalloc for pgt allocation
Date: Tue, 11 Jun 2013 10:58:42 +0200
Message-ID: <51B6E6C2.2090407@canonical.com>
References: <1362509833-28968-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1362509833-28968-1-git-send-email-marcin.slusarz@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Op 05-03-13 19:57, Marcin Slusarz schreef:
> Page tables on nv50 take 48kB, which can be hard to allocate in one piece.
> Let's use vmalloc.
>
> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> Cc: stable@vger.kernel.org [3.7+]
> ---
>  drivers/gpu/drm/nouveau/core/subdev/vm/base.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> index 77c67fc..e66fb77 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> @@ -362,7 +362,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
>  	vm->fpde = offset >> (vmm->pgt_bits + 12);
>  	vm->lpde = (offset + length - 1) >> (vmm->pgt_bits + 12);
>  
> -	vm->pgt  = kcalloc(vm->lpde - vm->fpde + 1, sizeof(*vm->pgt), GFP_KERNEL);
> +	vm->pgt  = vzalloc((vm->lpde - vm->fpde + 1) * sizeof(*vm->pgt));
>  	if (!vm->pgt) {
>  		kfree(vm);
>  		return -ENOMEM;
> @@ -371,7 +371,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
>  	ret = nouveau_mm_init(&vm->mm, mm_offset >> 12, mm_length >> 12,
>  			      block >> 12);
>  	if (ret) {
> -		kfree(vm->pgt);
> +		vfree(vm->pgt);
>  		kfree(vm);
>  		return ret;
>  	}
> @@ -446,7 +446,7 @@ nouveau_vm_del(struct nouveau_vm *vm)
>  	}
>  
>  	nouveau_mm_fini(&vm->mm);
> -	kfree(vm->pgt);
> +	vfree(vm->pgt);
>  	kfree(vm);
>  }
Could this patch be upstreamed?

I was hitting the same allocation failure on my fermi after keeping my system running for a
a week, and doing plenty of suspend/resume cycles (16+) in between it was failing an order 6
allocation, which I assume means it was attempting to allocate 256 kilobyte of physical memory
contiguously. My system has 16 gigabyte of ram, and had about 4 gb free afterwards when I
checked, so it wasn't like there was not enough memory. It was probably just too fragmented
to allocate with kmalloc, while vmalloc doesn't require the memory to be physicallly contiguous.

~Maarten
