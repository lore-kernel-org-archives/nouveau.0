From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] drm/nouveau/bo: mark expected switch fall-through
Date: Fri, 15 Feb 2019 10:02:16 -0600
Message-ID: <83ed0bf4-9833-8bf2-41ff-638035e71bd3@embeddedor.com>
References: <20190211185835.GA19174@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211185835.GA19174@embeddedor>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: nouveau.vger.kernel.org

Hi,

Please drop this, as I have included this fix into
the following patch, which addresses all the
expected fall-throughs in drivers/gpu/drm:

https://lore.kernel.org/patchwork/patch/1042856/

Thanks
--
Gustavo

On 2/11/19 12:58 PM, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
> 
> This patch fixes the following warning:
> 
> drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_io_mem_reserve’:
> drivers/gpu/drm/nouveau/nouveau_bo.c:1434:53: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (drm->client.mem->oclass < NVIF_CLASS_MEM_NV50 || !mem->kind)
>        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/nouveau_bo.c:1438:2: note: here
>   case TTM_PL_VRAM:
>   ^~~~
> 
> Warning level 3 was used: -Wimplicit-fallthrough=3
> 
> Notice that, in this particular case,  the code comment is modified
> in accordance with what GCC is expecting to find.
> 
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 73eff52036d2..a72be71c45b4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1434,7 +1434,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
>  		if (drm->client.mem->oclass < NVIF_CLASS_MEM_NV50 || !mem->kind)
>  			/* untiled */
>  			break;
> -		/* fallthrough, tiled memory */
> +		/* fall through - tiled memory */
>  	case TTM_PL_VRAM:
>  		reg->bus.offset = reg->start << PAGE_SHIFT;
>  		reg->bus.base = device->func->resource_addr(device, 1);
> 
