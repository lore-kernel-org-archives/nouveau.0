From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] drm/nouveau/secboot/acr: fix memory leak
Date: Thu, 2 Aug 2018 14:51:32 -0500
Message-ID: <d9e87a82-f70f-3eca-5f63-2450863e7099@embeddedor.com>
References: <20180724132719.GA32237@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724132719.GA32237@embeddedor.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi all,

Friendly ping! Who can take this?

Thanks
--
Gustavo

On 07/24/2018 08:27 AM, Gustavo A. R. Silva wrote:
> In case memory resources for *bl_desc* were allocated, release
> them before return.
> 
> Addresses-Coverity-ID: 1472021 ("Resource leak")
> Fixes: 0d466901552a ("drm/nouveau/secboot/acr: Remove VLA usage")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> index d02e183..5c14d6a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> @@ -801,6 +801,7 @@ acr_r352_load(struct nvkm_acr *_acr, struct nvkm_falcon *falcon,
>  		bl = acr->hsbl_unload_blob;
>  	} else {
>  		nvkm_error(_acr->subdev, "invalid secure boot blob!\n");
> +		kfree(bl_desc);
>  		return -EINVAL;
>  	}
>  
> 
