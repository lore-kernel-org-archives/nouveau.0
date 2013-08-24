From: Martin Peres <martin.peres@free.fr>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: do not move buffers when not needed
Date: Sat, 24 Aug 2013 08:26:42 +0200
Message-ID: <52185222.3060009@free.fr>
References: <51DFFA52.6010102@canonical.com>
	<CACAvsv74X7xU0BkfhN0gXHvFG+Ooe=7wrFBzKnqUF7PMeB5wLw@mail.gmail.com>
	<51E3B55D.8080403@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51E3B55D.8080403@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 15/07/2013 10:39, Maarten Lankhorst wrote:
> Op 15-07-13 08:05, Ben Skeggs schreef:
>> On Fri, Jul 12, 2013 at 10:45 PM, Maarten Lankhorst
>> <maarten.lankhorst@canonical.com> wrote:
>>> I have no idea what this bogus restriction on placement is, but it breaks decoding 1080p
>>> VDPAU at boot speed. With this patch applied I only need to bump the vdec clock to
>>> get real-time 1080p decoding. It prevents a lot of VRAM <-> VRAM buffer moves.
>> It's not bogus, and is required for pre-GF8 boards with VRAM > BAR size.
>>
>> What configuration does the buffer that's getting moved here have
>> exactly?  The placement restriction isn't necessary on GF8, the rest
>> of the restrictions may currently be required still however.
>>
>> = vdpau on NVC0 with tiling. I upload the raw bitstream to a tiling bo. This is ok because
> the vm hides all the tiling translations, and the engines will read the raw bitstream correctly.
> 8<---
> This prevents buffer moves from being done on NV50+, where remapping is not needed because
> the bar has its own VM, instead of only having the first BAR1-size chunk of VRAM accessible.
> nouveau_bo_tile_layout is always 0 on < NV_50.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
There are still some rendering issues on my nvc4, but the framerate is 
much smoother than it was before this patch.

Tested-by: Martin Peres <martin.peres@labri.fr>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index d506da5..762bfcd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1346,14 +1361,13 @@ nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	struct nouveau_device *device = nv_device(drm->device);
>   	u32 mappable = pci_resource_len(device->pdev, 1) >> PAGE_SHIFT;
>   
> -	/* as long as the bo isn't in vram, and isn't tiled, we've got
> -	 * nothing to do here.
> +	/*
> +	 * if the bo is not in vram, or remapping can be done (nv50+)
> +	 * do not worry about placement, any location is valid
>   	 */
> -	if (bo->mem.mem_type != TTM_PL_VRAM) {
> -		if (nv_device(drm->device)->card_type < NV_50 ||
> -		    !nouveau_bo_tile_layout(nvbo))
> -			return 0;
> -	}
> +	if (nv_device(drm->device)->card_type >= NV_50 ||
> +	    bo->mem.mem_type != TTM_PL_VRAM)
> +		return 0;
>   
>   	/* make sure bo is in mappable vram */
>   	if (bo->mem.start + bo->mem.num_pages < mappable)
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
