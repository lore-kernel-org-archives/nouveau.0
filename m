From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/nv50-/disp: Use output specific mask in interrupt
Date: Tue, 16 Jul 2013 12:04:40 +0100
Message-ID: <51E528C8.3030403@gmail.com>
References: <1372772652-3154-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1372772652-3154-1-git-send-email-emil.l.velikov@gmail.com>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


Glad to see that the patch has been included in the 3.11 branch,
although as Yves-Alexis mentioned in the bugreport it does not seem to
be part of 3.9 or 3.10

Is there any issues in the patch, or did it simply got lost in the queue ?

Regards
Emil

On 02/07/13 14:44, Emil Velikov wrote:
> The commit
> 
>    commit 476e84e126171d809f9c0b5d97137f5055f95ca8
>    Author: Ben Skeggs <bskeggs@redhat.com>
>    Date:   Mon Feb 11 09:24:23 2013 +1000
> 
>        drm/nv50-/disp: initial supervisor support for off-chip encoders
> 
> changed the write mask in one of the interrupt functions for on-chip encoders,
> causing a regression in certain VGA dual-head setups. This commit reintroduces
> the mask thus resolving the regression
> 
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=66129
> Reported-and-Tested-by: Yves-Alexis <corsac@debian.org>
> Cc: stable@vger.kernel.org [3.9+]
> CC: Ben Skeggs <bskeggs@redhat.com>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/core/engine/disp/nv50.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> index 8b42f45..7ffe2f3 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> @@ -1107,6 +1107,7 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
>  	u32 pclk = nv_rd32(priv, 0x610ad0 + (head * 0x540)) & 0x3fffff;
>  	u32 hval, hreg = 0x614200 + (head * 0x800);
>  	u32 oval, oreg;
> +	u32 mask;
>  	u32 conf = exec_clkcmp(priv, head, 0xff, pclk, &outp);
>  	if (conf != ~0) {
>  		if (outp.location == 0 && outp.type == DCB_OUTPUT_DP) {
> @@ -1133,6 +1134,7 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
>  			oreg = 0x614280 + (ffs(outp.or) - 1) * 0x800;
>  			oval = 0x00000000;
>  			hval = 0x00000000;
> +			mask = 0xffffffff;
>  		} else
>  		if (!outp.location) {
>  			if (outp.type == DCB_OUTPUT_DP)
> @@ -1140,14 +1142,16 @@ nv50_disp_intr_unk20_2(struct nv50_disp_priv *priv, int head)
>  			oreg = 0x614300 + (ffs(outp.or) - 1) * 0x800;
>  			oval = (conf & 0x0100) ? 0x00000101 : 0x00000000;
>  			hval = 0x00000000;
> +			mask = 0x00000707;
>  		} else {
>  			oreg = 0x614380 + (ffs(outp.or) - 1) * 0x800;
>  			oval = 0x00000001;
>  			hval = 0x00000001;
> +			mask = 0x00000707;
>  		}
>  
>  		nv_mask(priv, hreg, 0x0000000f, hval);
> -		nv_mask(priv, oreg, 0x00000707, oval);
> +		nv_mask(priv, oreg, mask, oval);
>  	}
>  }
>  
> 
