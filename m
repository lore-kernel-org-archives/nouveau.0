From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/nouveau: Check framebuffer size
 against bo
Date: Mon, 6 Jan 2020 11:25:09 +1000
Message-ID: <CACAvsv656x+PL7pP=_JVgkJXnLaoUJOD=-H_6k2-UVwXSsREnA@mail.gmail.com>
References: <20191217004520.2404-1-jajones@nvidia.com>
 <20191217004520.2404-3-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20191217004520.2404-3-jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 17 Dec 2019 at 10:45, James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Make sure framebuffer dimensions and tiling
> parameters will not result in accesses beyond the
> end of the GEM buffer they are bound to.
>
> Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 93 +++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 6f038511a03a..f1509392d7b7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -224,6 +224,72 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
>         .create_handle = nouveau_user_framebuffer_create_handle,
>  };
>
> +static inline uint32_t
> +nouveau_get_width_in_blocks(uint32_t stride)
> +{
> +       /* GOBs per block in the x direction is always one, and GOBs are
> +        * 64 bytes wide
> +        */
> +       static const uint32_t log_block_width = 6;
> +
> +       return (stride + (1 << log_block_width) - 1) >> log_block_width;
> +}
> +
> +static inline uint32_t
> +nouveau_get_height_in_blocks(struct nouveau_drm *drm,
> +                            uint32_t height,
> +                            uint32_t log_block_height_in_gobs)
> +{
> +       uint32_t log_gob_height;
> +       uint32_t log_block_height;
> +
> +       BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
> +
> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
> +               log_gob_height = 2;
> +       else
> +               log_gob_height = 3;
> +
> +       log_block_height = log_block_height_in_gobs + log_gob_height;
> +
> +       return (height + (1 << log_block_height) - 1) >> log_block_height;
> +}
> +
> +static int
> +nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
> +                     uint32_t offset, uint32_t stride, uint32_t h,
> +                     uint32_t tile_mode)
> +{
> +       uint32_t gob_size, bw, bh;
> +       uint64_t bl_size;
> +
> +       BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
> +
> +       if (drm->client.device.info.chipset >= 0xc0)
> +               tile_mode >>= 4;
> +
> +       BUG_ON(tile_mode & 0xFFFFFFF0);
As far as I can tell, tile_mode can be fed into this function
unsanitised from userspace, so we probably want something different to
a BUG_ON() here.

> +
> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
> +               gob_size = 256;
> +       else
> +               gob_size = 512;
> +
> +       bw = nouveau_get_width_in_blocks(stride);
> +       bh = nouveau_get_height_in_blocks(drm, h, tile_mode);
> +
> +       bl_size = bw * bh * (1 << tile_mode) * gob_size;
> +
> +       DRM_DEBUG_KMS("offset=%u stride=%u h=%u tile_mode=0x%02x bw=%u bh=%u gob_size=%u bl_size=%llu size=%lu\n",
> +                     offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
> +                     nvbo->bo.mem.size);
> +
> +       if (bl_size + offset > nvbo->bo.mem.size)
> +               return -ERANGE;
> +
> +       return 0;
> +}
> +
>  int
>  nouveau_framebuffer_new(struct drm_device *dev,
>                         const struct drm_mode_fb_cmd2 *mode_cmd,
> @@ -232,6 +298,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  {
>         struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nouveau_framebuffer *fb;
> +       const struct drm_format_info *info;
> +       unsigned int width, height, i;
>         int ret;
>
>          /* YUV overlays have special requirements pre-NV50 */
> @@ -254,6 +322,31 @@ nouveau_framebuffer_new(struct drm_device *dev,
>                 return -EINVAL;
>         }
>
> +       info = drm_get_format_info(dev, mode_cmd);
> +
> +       for (i = 0; i < info->num_planes; i++) {
> +               width = drm_format_info_plane_width(info,
> +                                                   mode_cmd->width,
> +                                                   i);
> +               height = drm_format_info_plane_height(info,
> +                                                     mode_cmd->height,
> +                                                     i);
> +
> +               if (nvbo->kind) {
> +                       ret = nouveau_check_bl_size(drm, nvbo,
> +                                                   mode_cmd->offsets[i],
> +                                                   mode_cmd->pitches[i],
> +                                                   height, nvbo->mode);
> +                       if (ret)
> +                               return ret;
> +               } else {
> +                       uint32_t size = mode_cmd->pitches[i] * height;
> +
> +                       if (size + mode_cmd->offsets[i] > nvbo->bo.mem.size)
> +                               return -ERANGE;
> +               }
> +       }
> +
>         if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>                 return -ENOMEM;
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
