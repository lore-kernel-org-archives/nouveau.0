From: Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm/nouveau/fb/nv50: Add PFB writes
Date: Sat, 04 Oct 2014 02:28:37 +0200
Message-ID: <542F3F35.70406@nimrod-online.com>
References: <1412346960-26876-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412346960-26876-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
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

I don't think I ever suggested removing the 100c18/100c24 writes, rather 
I tried to encourage you to figure out the meaning behind the values there.

Roy

Op 03-10-14 om 16:36 schreef Pierre Moreau:
> (This is a v2 of patch "drm/nouveau/disp/nv50: Add PFB writes")
>
> This fix a GPU lockup on 9400M (NVAC) when using acceleration, see
> https://bugs.freedesktop.org/show_bug.cgi?id=27501
>
> v2:
> - Move code to subdev/fb/nv50.c as suggested by Roy Spliet;
> - Remove arbitrary writes to 100c18/100c24 as suggested by Roy Spliet;
> - Replace write to 100c1c of arbitrary value by the address of a scratch page
>    as proposed by Ilia Mirkin;
> - Remove enabling of bits 16 and 0 as they don't yield in any changes.
>
> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> index 4150b0d..5c84d13 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> @@ -289,6 +289,17 @@ nv50_fb_init(struct nouveau_object *object)
>   	if (ret)
>   		return ret;
>   
> +	/* Not a clue what this is exactly. Without enabling bit 1 of
> +	 * 100c14, system will lockup while initialising the card
> +	 * (#27501)
> +	 */
> +	if (nv_device(priv)->chipset == 0xac) {
> +		if ((nv_rd32(priv, 0x100c14) & 0x00000002) == 0x00000000) {
> +			nv_wr32(priv, 0x100c1c, priv->r100c08 >> 8);
> +			nv_mask(priv, 0x100c14, 0x00000000, 0x00000002);
> +		}
> +	}
> +
>   	/* Not a clue what this is exactly.  Without pointing it at a
>   	 * scratch page, VRAM->GART blits with M2MF (as in DDX DFS)
>   	 * cause IOMMU "read from address 0" errors (rh#561267)
