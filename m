From: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/nouveau: Support NVIDIA format
 modifiers
Date: Thu, 12 Dec 2019 18:51:55 -0800
Message-ID: <a8b251ed-209c-dd11-b2e1-80077152f4ab@nvidia.com>
References: <20191211205922.7096-1-jajones@nvidia.com>
 <20191211205922.7096-4-jajones@nvidia.com>
 <CAKb7Uvg-_dPPoJvBx0OXtjQEg1fBFbdBXRqZez3VJMhxD-xQEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg-_dPPoJvBx0OXtjQEg1fBFbdBXRqZez3VJMhxD-xQEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 12/11/19 1:13 PM, Ilia Mirkin wrote:
> On Wed, Dec 11, 2019 at 4:04 PM James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> Allow setting the block layout of a nouveau FB
>> object using DRM format modifiers.  When
>> specified, the format modifier block layout and
>> kind overrides the GEM buffer's implicit layout
>> and kind.  The specified format modifier is
>> validated against he list of modifiers supported
>> by the target display hardware.
>>
>> Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/nouveau/dispnv50/wndw.c   |  8 +--
>>   drivers/gpu/drm/nouveau/nouveau_display.c | 65 ++++++++++++++++++++++-
>>   drivers/gpu/drm/nouveau/nouveau_display.h |  2 +
>>   3 files changed, 69 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> index 70ad64cb2d34..06c1b18479c1 100644
>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>> @@ -43,7 +43,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nouveau_framebuffer *fb)
>>   {
>>          struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
>>          struct nv50_wndw_ctxdma *ctxdma;
>> -       const u8    kind = fb->nvbo->kind;
>> +       const u8    kind = fb->kind;
>>          const u32 handle = 0xfb000000 | kind;
>>          struct {
>>                  struct nv_dma_v0 base;
>> @@ -243,7 +243,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
>>          if (asyw->state.fb != armw->state.fb || !armw->visible || modeset) {
>>                  asyw->image.w = fb->base.width;
>>                  asyw->image.h = fb->base.height;
>> -               asyw->image.kind = fb->nvbo->kind;
>> +               asyw->image.kind = fb->kind;
>>
>>                  ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
>>                  if (ret) {
>> @@ -255,9 +255,9 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
>>                  if (asyw->image.kind) {
>>                          asyw->image.layout = 0;
>>                          if (drm->client.device.info.chipset >= 0xc0)
>> -                               asyw->image.blockh = fb->nvbo->mode >> 4;
>> +                               asyw->image.blockh = fb->tile_mode >> 4;
>>                          else
>> -                               asyw->image.blockh = fb->nvbo->mode;
>> +                               asyw->image.blockh = fb->tile_mode;
>>                          asyw->image.blocks[0] = fb->base.pitches[0] / 64;
>>                          asyw->image.pitch[0] = 0;
>>                  } else {
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index f1509392d7b7..351b58410e1a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -224,6 +224,50 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
>>          .create_handle = nouveau_user_framebuffer_create_handle,
>>   };
>>
>> +static int
>> +nouveau_decode_mod(struct nouveau_drm *drm,
>> +                  uint64_t modifier,
>> +                  uint32_t *tile_mode,
>> +                  uint8_t *kind)
>> +{
>> +       struct nouveau_display *disp = nouveau_display(drm->dev);
>> +       int mod;
>> +
>> +       BUG_ON(!tile_mode || !kind);
>> +
>> +       if (drm->client.device.info.chipset < 0x50) {
> 
> Not a full review, but you want to go off the family (chip_class iirc?
> something like that, should be obvious). Sadly 0x67/0x68 are higher
> than 0x50 numerically, but are logically part of the nv4x generation.

Good catch.  I'll get this fixed and send out an updated patchset.

Thanks,
-James

>> +               return -EINVAL;
>> +       }
>> +
>> +       BUG_ON(!disp->format_modifiers);
>> +
>> +       for (mod = 0;
>> +            (disp->format_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
>> +            (disp->format_modifiers[mod] != modifier);
>> +            mod++);
>> +
>> +       if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
>> +               return -EINVAL;
>> +
>> +       if (modifier == DRM_FORMAT_MOD_LINEAR) {
>> +               /* tile_mode will not be used in this case */
>> +               *tile_mode = 0;
>> +               *kind = 0;
>> +       } else {
>> +               /*
>> +                * Extract the block height and kind from the corresponding
>> +                * modifier fields.  See drm_fourcc.h for details.
>> +                */
>> +               *tile_mode = (uint32_t)(modifier & 0xF);
>> +               *kind = (uint8_t)((modifier >> 12) & 0xFF);
>> +
>> +               if (drm->client.device.info.chipset >= 0xc0)
>> +                       *tile_mode <<= 4;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   static inline uint32_t
>>   nouveau_get_width_in_blocks(uint32_t stride)
>>   {
>> @@ -300,6 +344,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>          struct nouveau_framebuffer *fb;
>>          const struct drm_format_info *info;
>>          unsigned int width, height, i;
>> +       uint32_t tile_mode;
>> +       uint8_t kind;
>>          int ret;
>>
>>           /* YUV overlays have special requirements pre-NV50 */
>> @@ -322,6 +368,18 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>                  return -EINVAL;
>>          }
>>
>> +       if (mode_cmd->flags & DRM_MODE_FB_MODIFIERS) {
>> +               if (nouveau_decode_mod(drm, mode_cmd->modifier[0], &tile_mode,
>> +                                      &kind)) {
>> +                       DRM_DEBUG_KMS("Unsupported modifier: 0x%llx\n",
>> +                                     mode_cmd->modifier[0]);
>> +                       return -EINVAL;
>> +               }
>> +       } else {
>> +               tile_mode = nvbo->mode;
>> +               kind = nvbo->kind;
>> +       }
>> +
>>          info = drm_get_format_info(dev, mode_cmd);
>>
>>          for (i = 0; i < info->num_planes; i++) {
>> @@ -332,11 +390,11 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>                                                        mode_cmd->height,
>>                                                        i);
>>
>> -               if (nvbo->kind) {
>> +               if (kind) {
>>                          ret = nouveau_check_bl_size(drm, nvbo,
>>                                                      mode_cmd->offsets[i],
>>                                                      mode_cmd->pitches[i],
>> -                                                   height, nvbo->mode);
>> +                                                   height, tile_mode);
>>                          if (ret)
>>                                  return ret;
>>                  } else {
>> @@ -352,6 +410,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>
>>          drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
>>          fb->nvbo = nvbo;
>> +       fb->tile_mode = tile_mode;
>> +       fb->kind = kind;
>>
>>          ret = drm_framebuffer_init(dev, &fb->base, &nouveau_framebuffer_funcs);
>>          if (ret)
>> @@ -625,6 +685,7 @@ nouveau_display_create(struct drm_device *dev)
>>
>>          dev->mode_config.preferred_depth = 24;
>>          dev->mode_config.prefer_shadow = 1;
>> +       dev->mode_config.allow_fb_modifiers = true;
>>
>>          if (drm->client.device.info.chipset < 0x11)
>>                  dev->mode_config.async_page_flip = false;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
>> index c54682f00b01..0dad57b21983 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
>> @@ -15,6 +15,8 @@ struct nouveau_framebuffer {
>>          u32 r_handle;
>>          u32 r_format;
>>          u32 r_pitch;
>> +       u32 tile_mode;
>> +       u8 kind;
>>          struct nvif_object h_base[4];
>>          struct nvif_object h_core;
>>   };
>> --
>> 2.17.1
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
