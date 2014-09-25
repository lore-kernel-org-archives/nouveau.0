From: Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/disp/nv50: Add PFB writes
Date: Thu, 25 Sep 2014 12:08:17 +0200
Message-ID: <5423E991.2040204@nimrod-online.com>
References: <1411637791-4274-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1411637791-4274-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

NACK as far as I'm concerned, PFB initialisation belongs in 
core/subdev/fb. Also, is this required for NVAA as well?

Op 25-09-14 om 11:36 schreef Pierre Moreau:
> This fix a GPU lockup on 9400M (NVAC) when using acceleration, see #27501.
>
> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/core/engine/disp/nv50.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> index a7efbff..e425604 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> @@ -1137,6 +1137,15 @@ nv50_disp_base_init(struct nouveau_object *object)
>   	if (ret)
>   		return ret;
>   
> +	if (nv_device(priv)->chipset == 0xac) {
> +		nv_mask(priv, 0x100c18, 0x00000000, 0x000027ff);
> +		nv_mask(priv, 0x100c14, 0x00000000, 0x00000001);
> +		nv_mask(priv, 0x100c1c, 0x00000000, 0x000027fc);
> +		nv_mask(priv, 0x100c14, 0x00000000, 0x00000002);
> +		nv_mask(priv, 0x100c24, 0x00000002, 0x000027fd);
> +		nv_mask(priv, 0x100c14, 0x00000000, 0x00010000);
> +	}
> +
>   	/* The below segments of code copying values from one register to
>   	 * another appear to inform EVO of the display capabilities or
>   	 * something similar.  NFI what the 0x614004 caps are for..
