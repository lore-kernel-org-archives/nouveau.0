From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/nouveau/bios/dp: make array vsoff static, shrinks
 object size
Date: Thu, 24 Jan 2019 17:26:17 +0000
Message-ID: <2d84fcfa-67af-ec76-5821-162004113bf3@canonical.com>
References: <20180904152333.21640-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904152333.21640-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

ping?

On 04/09/2018 16:23, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array vsoff on the stack but instead make it
> static. Makes the object code smaller by 67 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    5753	    112	      0	   5865	   16e9	.../nouveau/nvkm/subdev/bios/dp.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    5622	    176	      0	   5798	   16a6	.../nouveau/nvkm/subdev/bios/dp.o
> 
> (gcc version 8.2.0 x86_64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c
> index 3133b28f849c..b099d1209be8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c
> @@ -212,7 +212,7 @@ nvbios_dpcfg_match(struct nvkm_bios *bios, u16 outp, u8 pc, u8 vs, u8 pe,
>  	u16 data;
>  
>  	if (*ver >= 0x30) {
> -		const u8 vsoff[] = { 0, 4, 7, 9 };
> +		static const u8 vsoff[] = { 0, 4, 7, 9 };
>  		idx = (pc * 10) + vsoff[vs] + pe;
>  		if (*ver >= 0x40 && *ver <= 0x41 && *hdr >= 0x12)
>  			idx += nvbios_rd08(bios, outp + 0x11) * 40;
> 
