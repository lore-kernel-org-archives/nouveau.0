From: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/nouveau: Support NVIDIA format
 modifiers
Date: Wed, 11 Dec 2019 13:01:47 -0800
Message-ID: <e1e7ba4f-a88d-f451-217a-214cfff9541f@nvidia.com>
References: <20191211205922.7096-1-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20191211205922.7096-1-jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Please ignore the tegra diff on the bottom of this.  I never fail to 
find a way to mess up git-send-email.

-James

On 12/11/19 12:59 PM, James Jones wrote:
> This series modifies the NV5x+ nouveau display backends to advertise
> appropriate format modifiers on their display planes in atomic mode
> setting blobs.
> 
> Corresponding modifications to Mesa/userspace are available here:
> 
> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
> 
> But those need a bit of cleanup before they're ready to submit.
> 
> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
> using various formats and all the exposed format modifiers, plus some
> negative testing with invalid ones.
> 
> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
> Linear DRM format mod" patch submitted to dri-devel.
> 
> Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpu/drm/tegra/dc.c  | 10 ++++++++++
>   drivers/gpu/drm/tegra/fb.c  | 14 +++++++-------
>   drivers/gpu/drm/tegra/hub.c | 10 ++++++++++
>   3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index fbf57bc3cdab..a2cc687dc2d8 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -588,6 +588,16 @@ static const u32 tegra124_primary_formats[] = {
>   
>   static const u64 tegra124_modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
> +	/*
> +	 * For backwards compatibility with older userspace that may have
> +	 * baked in usage of the less-descriptive modifiers
> +	 */
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index e34325c83d28..d04e0b1c61ea 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
>   {
>   	uint64_t modifier = framebuffer->modifier;
>   
> -	switch (modifier) {
> +	switch (drm_fourcc_canonicalize_nvidia_format_mod(modifier)) {
>   	case DRM_FORMAT_MOD_LINEAR:
>   		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
>   		tiling->value = 0;
> @@ -55,32 +55,32 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
>   		tiling->value = 0;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 0;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 1;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 2;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 3;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 4;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 5;
>   		break;
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 839b49c40e51..03c97b10b122 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -49,6 +49,16 @@ static const u32 tegra_shared_plane_formats[] = {
>   
>   static const u64 tegra_shared_plane_modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
> +	/*
> +	 * For backwards compatibility with older userspace that may have
> +	 * baked in usage of the less-descriptive modifiers
> +	 */
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> 
