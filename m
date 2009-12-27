From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nv50: align size of buffer object to
 the	right boundaries.
Date: Sun, 27 Dec 2009 14:43:27 +0100
Message-ID: <4B37647F.9030402@student.tuwien.ac.at>
References: <1261914064-3535-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261914064-3535-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/27/2009 12:41 PM, Maarten Maathuis wrote:
> - Depth and stencil buffers are supposed to be large enough in general.
> 
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c |    9 ++++-----
>  1 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index e342a41..9fc4bd6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -65,8 +65,9 @@ nouveau_bo_fixup_align(struct drm_device *dev,
>  
>  	/*
>  	 * Some of the tile_flags have a periodic structure of N*4096 bytes,
> -	 * align to to that as well as the page size. Overallocate memory to
> -	 * avoid corruption of other buffer objects.
> +	 * align to to that as well as the page size. Align the size to the
> +	 * appropriate boundaries. This does imply that sizes are rounded up
> +	 * 3-7 pages, so make sure your "special" buffer sizes are large enough.
>  	 */
No - 16x16 depth textures or whatever crazy idea some app might have
won't be large enough.
Taking care of size in userspace and of alignment in kernel ... not nice
to split in my opinion.
>  	if (dev_priv->card_type == NV_50) {
>  		uint32_t block_size = nouveau_mem_fb_amount(dev) >> 15;
> @@ -77,22 +78,20 @@ nouveau_bo_fixup_align(struct drm_device *dev,
>  		case 0x2800:
>  		case 0x4800:
>  		case 0x7a00:
> -			*size = roundup(*size, block_size);
>  			if (is_power_of_2(block_size)) {
> -				*size += 3 * block_size;
>  				for (i = 1; i < 10; i++) {
>  					*align = 12 * i * block_size;
>  					if (!(*align % 65536))
>  						break;
>  				}
>  			} else {
> -				*size += 6 * block_size;
>  				for (i = 1; i < 10; i++) {
>  					*align = 8 * i * block_size;
>  					if (!(*align % 65536))
>  						break;
>  				}
>  			}
> +			*size = roundup(*size, *align);
>  			break;
>  		default:
>  			break;
