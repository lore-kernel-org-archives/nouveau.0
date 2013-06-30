From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Nouveau] [PATCH] nv50: H.264/MPEG2 decoding support
 via VP2, available on NV84-NV96, NVA0
Date: Sun, 30 Jun 2013 01:33:54 +0100
Message-ID: <51CF7CF2.9070906@gmail.com>
References: <1372332404-16547-1-git-send-email-imirkin@alum.mit.edu>
	<51CF2256.1050205@gmail.com>
	<CAKb7Uvg6Dr5Uz0Bc3m0sbu5+8wrfYD7CFq+dc6ETfUpdBnFQ=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvg6Dr5Uz0Bc3m0sbu5+8wrfYD7CFq+dc6ETfUpdBnFQ=g@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Emil Velikov <emil.l.velikov@gmail.com>, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 29/06/13 21:21, Ilia Mirkin wrote:
> On Sat, Jun 29, 2013 at 2:07 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>> Hi Ilia,
>>
>> On 27/06/13 12:26, Ilia Mirkin wrote:
>>> Adds H.264 and MPEG2 codec support via VP2, using firmware from the
>>> blob. Acceleration is supported at the bitstream level for H.264 and
>>> IDCT level for MPEG2.
>>>
>>> Known issues:
>>>  - H.264 interlaced doesn't render properly
>>>  - H.264 shows very occasional artifacts on a small fraction of videos
>>>  - MPEG2 + VDPAU shows frequent but small artifacts, which aren't there
>>>    when using XvMC on the same videos
>>>
>>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>>
>>
>> Big thanks for working on this
>>
>> I believe the hardware is capable of accelerating IDCT for VC1. Do you
>> have any plans for it ?
> 
> Nope. With MPEG, there's XvMC, which sends the macroblocks directly.
> And there's an existing MPEG parser in gallium which can be used for
> VDPAU. With VC-1, no such thing as XvMC. Which means that I'd have to
> implement a bitstream parser in gallium. The spec is closed, and I'm
> not at all familiar with the concepts used in VC-1.
I thought that gallium already has a vc1 bitstream parser. Anyway if
anyone is interested the libavcodec project can be useful in that regard

> 
>>
>> As far as I know mesa in general is keen on keeping trailing statements
>> on the next line, as well as 78(80) characters line length.
> 
> I tried to do that... in the places where I violate that I felt that
> it enhanced readability. Feel free to point out places where you
> disagree. Also if it's a hard policy (e.g. as in the linux kernel), I
> can go through and reformat.
There is a document describing the Mesa Coding Style[1], although
enforcing it is another question

My main point was statements such as

   if (ret) return NULL

which are rather hard to see when surrounded by compact code.

[1] http://www.mesa3d.org/devinfo.html
> 
>>
>>> ---
>>>
>>> I did try to work out the known issues above, but so far to no avail.
>>>
>>> The kernel support for these engines is not in mainline yet, but it's likely
>>> going to appear in 3.11. I figured that there would be a bunch of feedback so
>>> I might as well send it out early.
>>>
>>> I played around a lot with XvMC performance, the mb function shows up as #1 in
>>> the profiles, with the SSE4.2 optimizations I put in, it drops to #2.
>>> Something clever can likely be done to improve VDPAU performance as well,
>>> e.g. using SSE to do the inverse quantization operations, but I've left that
>> Curious how many machines with vp2 card have a sse4.2 capable CPU? Mine
>> is only sse4.1 ;(
> 
> At least one (mine). SSE4.2 appeared on Core i7 (Nehalem), AFAIK.
> Other optimizations may be possible with just SSE2, but I couldn't
> think of anything particularly clever. Those PCMPESTRM instructions
> are _really_ useful to skip over the useless 0's. I guess something
> could be done with PCMPEQW and PMOVMSKB (wish there were a
> PMOVMSKW...). I'll play with it. But the plain-C loop isn't so bad
> either.
> 
>>
>>> out. (It gets tricky because a lot of the data is 0's, so it's unclear whether
>>> it's faster to use SSE to do operations on everything or one-at-a-time on the
>>> non-0's like I have it now.) Even with these, XvMC ends up ~20% faster than
>>> plain CPU decoding, and likely that percent improves on older CPUs that can't
>>> decode MPEG2 quite as quickly. VDPAU provides further improvements (likely
>>> because it is able to skip mb's while XvMC can't), but there are artifacts for
>>> reasons unknown.
>>>
>>> Note that in order to get XvMC to work, you need my previous patch (or
>>> something similar) since otherwise libXvMCnouveau can't be dlopen'd:
>>> http://lists.freedesktop.org/archives/mesa-dev/2013-June/040949.html
>>>
>>> If you want to test it out, the kernel patch:
>>> http://lists.freedesktop.org/archives/nouveau/2013-June/012821.html
>>>
>>> Firmware:
>>> https://github.com/imirkin/re-vp2/blob/master/extract_firmware.py
>>>
>>>  src/gallium/drivers/nv50/Makefile.sources |   5 +-
>>>  src/gallium/drivers/nv50/nv50_context.c   |  13 +-
>>>  src/gallium/drivers/nv50/nv50_context.h   |  24 +
>>>  src/gallium/drivers/nv50/nv50_miptree.c   |  27 ++
>>>  src/gallium/drivers/nv50/nv50_resource.h  |   1 +
>>>  src/gallium/drivers/nv50/nv50_screen.c    |  13 +-
>>>  src/gallium/drivers/nv50/nv50_winsys.h    |   4 +
>>>  src/gallium/drivers/nv50/nv84_video.c     | 778 ++++++++++++++++++++++++++++++
>>>  src/gallium/drivers/nv50/nv84_video.h     | 134 +++++
>>>  src/gallium/drivers/nv50/nv84_video_bsp.c | 251 ++++++++++
>>>  src/gallium/drivers/nv50/nv84_video_vp.c  | 521 ++++++++++++++++++++
>>>  11 files changed, 1768 insertions(+), 3 deletions(-)
>>>  create mode 100644 src/gallium/drivers/nv50/nv84_video.c
>>>  create mode 100644 src/gallium/drivers/nv50/nv84_video.h
>>>  create mode 100644 src/gallium/drivers/nv50/nv84_video_bsp.c
>>>  create mode 100644 src/gallium/drivers/nv50/nv84_video_vp.c
>>>
>> ...
>>> diff --git a/src/gallium/drivers/nv50/nv84_video.c b/src/gallium/drivers/nv50/nv84_video.c
>>> new file mode 100644
>>> index 0000000..064178c
>>> --- /dev/null
>>> +++ b/src/gallium/drivers/nv50/nv84_video.c
>>> @@ -0,0 +1,778 @@
>> ...
>>> +static int
>>> +nv84_copy_firmware(const char *path, void *dest, size_t len)
>>    ssize_t len
>> To prevent signed/unsigned issues in conditional below
>>
>>> +{
>>> +   int fd = open(path, O_RDONLY | O_CLOEXEC);
>>> +   ssize_t r;
>>> +   if (fd < 0) {
>>> +      fprintf(stderr, "opening firmware file %s failed: %m\n", path);
>>> +      return 1;
>>> +   }
>>> +   r = read(fd, dest, len);
>>> +   close(fd);
>>> +
>>> +   if (r != len) {
>> Here        ^^
> 
> Yes, in case that len is 2^64 - 1... but I'll change it :)
> 
>>
>>> +      fprintf(stderr, "reading firwmare file %s failed: %m\n", path);
>>> +      return 1;
>>> +   }
>>> +
>>> +   return 0;
>>> +}
>>> +
>> ...
>>> +static void
>>> +nv84_decoder_decode_bitstream_mpeg12(struct pipe_video_decoder *decoder,
>>> +                                     struct pipe_video_buffer *video_target,
>>> +                                     struct pipe_picture_desc *picture,
>>> +                                     unsigned num_buffers,
>>> +                                     const void *const *data,
>>> +                                     const unsigned *num_bytes)
>>> +{
>>> +   struct nv84_decoder *dec = (struct nv84_decoder *)decoder;
>>> +   struct nv84_video_buffer *target = (struct nv84_video_buffer *)video_target;
>>> +
>>> +   struct pipe_mpeg12_picture_desc *desc = (struct pipe_mpeg12_picture_desc *)picture;
>>> +
>>> +   assert(target->base.buffer_format == PIPE_FORMAT_NV12);
>> This can be written as
>>    assert(video_target->buffer_format == PIPE_FORMAT_NV12);
> 
> Good point. The code was a bit different at an earlier point.
> 
>>
>>> +
>>> +   vl_mpg12_bs_decode(dec->mpeg12_bs,
>>> +                      video_target,
>>> +                      desc,
>>> +                      num_buffers,
>>> +                      data,
>>> +                      num_bytes);
>> And then the temporary variables can be removed, as you've done in
>> nv84_decoder_end_frame_mpeg12()
>>
>>> +}
>>> +
>> ...
>>> +
>>> +struct pipe_video_decoder *
>>> +nv84_create_decoder(struct pipe_context *context,
>>> +                    enum pipe_video_profile profile,
>>> +                    enum pipe_video_entrypoint entrypoint,
>>> +                    enum pipe_video_chroma_format chroma_format,
>>> +                    unsigned width, unsigned height,
>>> +                    unsigned max_references,
>>> +                    bool chunked_decode)
>>> +{
>>> +   struct nv50_context *nv50 = (struct nv50_context *)context;
>>> +   struct nouveau_screen *screen = &nv50->screen->base;
>>> +   struct nv84_decoder *dec;
>>> +   struct nouveau_pushbuf *bsp_push, *vp_push;
>>> +   struct nv50_surface surf;
>>> +   struct nv50_miptree mip;
>>> +   union pipe_color_union color;
>>> +   struct nv04_fifo nv04_data = { .vram = 0xbeef0201, .gart = 0xbeef0202 };
>>> +   int ret, i;
>>> +   int is_h264 = u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG4_AVC;
>>> +   int is_mpeg12 = u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG12;
>>> +   struct nouveau_pushbuf_refn fence_ref[] = {
>>> +      { NULL, NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM },
>>> +   };
>>> +
>>> +
>>> +   if (getenv("XVMC_VL"))
>>> +      return vl_create_decoder(context, profile, entrypoint,
>>> +                               chroma_format, width, height,
>>> +                               max_references, chunked_decode);
>>> +
>>> +   if ((is_h264 && entrypoint != PIPE_VIDEO_ENTRYPOINT_BITSTREAM) ||
>>> +       (is_mpeg12 && entrypoint > PIPE_VIDEO_ENTRYPOINT_IDCT)) {
>>> +      debug_printf("%x\n", entrypoint);
>>> +      return NULL;
>>> +   }
>>> +
>>> +   if (!is_h264 && !is_mpeg12) {
>>> +      debug_printf("invalid profile: %x\n", profile);
>>> +      return NULL;
>>> +   }
>>> +
>>> +   dec = CALLOC_STRUCT(nv84_decoder);
>>> +   if (!dec) return NULL;
>>> +
>>> +   dec->base.context = context;
>>> +   dec->base.profile = profile;
>>> +   dec->base.entrypoint = entrypoint;
>>> +   dec->base.chroma_format = chroma_format;
>>> +   dec->base.width = width;
>>> +   dec->base.height = height;
>>> +   dec->base.max_references = max_references;
>>> +   dec->base.destroy = nv84_decoder_destroy;
>>> +   dec->base.flush = nv84_decoder_flush;
>>> +   if (is_h264) {
>>> +      dec->base.decode_bitstream = nv84_decoder_decode_bitstream_h264;
>>> +      dec->base.begin_frame = nv84_decoder_begin_frame_h264;
>>> +      dec->base.end_frame = nv84_decoder_end_frame_h264;
>>> +
>>> +      dec->frame_mbs = mb(dec->base.width) * mb_half(dec->base.height) * 2;
>>> +      dec->frame_size = dec->frame_mbs << 8;
>>> +      dec->vpring_deblock = align(0x30 * dec->frame_mbs, 0x100);
>>> +      dec->vpring_residual = 0x2000 + MAX2(0x32000, 0x600 * dec->frame_mbs);
>>> +      dec->vpring_ctrl = MAX2(0x10000, align(0x1080 + 0x144 * dec->frame_mbs, 0x100));
>>> +   } else if (is_mpeg12) {
>>> +      dec->base.decode_macroblock = nv84_decoder_decode_macroblock;
>>> +      dec->base.begin_frame = nv84_decoder_begin_frame_mpeg12;
>>> +      dec->base.end_frame = nv84_decoder_end_frame_mpeg12;
>>> +
>>> +      if (entrypoint == PIPE_VIDEO_ENTRYPOINT_BITSTREAM) {
>>> +         dec->mpeg12_bs = CALLOC_STRUCT(vl_mpg12_bs);
>>> +         if (!dec->mpeg12_bs)
>>> +            goto fail;
>>> +         vl_mpg12_bs_init(dec->mpeg12_bs, &dec->base);
>>> +         dec->base.decode_bitstream = nv84_decoder_decode_bitstream_mpeg12;
>>> +      }
>>> +   } else {
>>> +      goto fail;
>> Seems to be handled already by - if (!is_h264 && !is_mpeg12)...
> 
> Yes. But I disliked relying on that, so I decided to leave it in.
> 
>>
>>> +   }
>>> +
>>> +   ret = nouveau_client_new(screen->device, &dec->client);
>>> +   if (ret)
>>> +      goto fail;
>> Is there any particular reason for using a variable to store the return
>> value through this functions? Me thinks it can be safely purged, making
>> the code a bit cleaner
> 
> It was like that in nvc0_video and a lot of other code. I think the
> code looks a little odd when you have
> 
> if (super-long multi-line statement)
>   goto fail
There are cases where you've left the "super-long multi-line statement"
in the conditional and others where you did not. I suggested changing
the one that may produce smaller code and is more appealing imho

> 
>>
>>> +
>>> +   if (is_h264) {
>>> +      ret = nouveau_object_new(&screen->device->object, 0,
>>> +                               NOUVEAU_FIFO_CHANNEL_CLASS,
>>> +                               &nv04_data, sizeof(nv04_data), &dec->bsp_channel);
>> ...
>>
>>> +   if (is_h264) {
>>> +      /* Zero out some parts of mbring/vpring. there's gotta be some cleaner way
>>> +       * of doing this... perhaps makes sense to just copy the relevant logic
>>> +       * here. */
>>> +      color.f[0] = color.f[1] = color.f[2] = color.f[3] = 0;
>>> +      surf.offset = dec->frame_size;
>>> +      surf.width = 64;
>>> +      surf.height = (max_references + 1) * dec->frame_mbs / 4;
>>> +      surf.depth = 1;
>>> +      surf.base.format = PIPE_FORMAT_B8G8R8A8_UNORM;
>>> +      surf.base.u.tex.level = 0;
>>> +      surf.base.texture = &mip.base.base;
>>> +      mip.level[0].tile_mode = 0;
>>> +      mip.level[0].pitch = surf.width * 4;
>>> +      mip.base.domain = NOUVEAU_BO_VRAM;
>>> +      mip.base.bo = dec->mbring;
>>> +      context->clear_render_target(context, (struct pipe_surface *)&surf, &color, 0, 0, 64, 4760);
You can drop the typecast here
s/(struct pipe_surface *)&surf/&surf.base/

>>> +      surf.offset = dec->vpring->size / 2 - 0x1000;
>>> +      surf.width = 1024;
>>> +      surf.height = 1;
>>> +      mip.level[0].pitch = surf.width * 4;
>>> +      mip.base.bo = dec->vpring;
>>> +      context->clear_render_target(context, (struct pipe_surface *)&surf, &color, 0, 0, 1024, 1);
Ditto

>>> +      surf.offset = dec->vpring->size - 0x1000;
>>> +      context->clear_render_target(context, (struct pipe_surface *)&surf, &color, 0, 0, 1024, 1);
Ditto

>>> +
>>> +      PUSH_SPACE(screen->pushbuf, 5);
>>> +      fence_ref[0].bo = dec->fence;
>>> +      nouveau_pushbuf_refn(screen->pushbuf, fence_ref, 1);
>>> +      /* The clear_render_target is done via 3D engine, so use it to write to a
>>> +       * sempahore to indicate that it's done.
>>> +       */
>>> +      BEGIN_NV04(screen->pushbuf, SUBC_3D(0x1b00), 4);
>>> +      PUSH_DATAh(screen->pushbuf, dec->fence->offset);
>>> +      PUSH_DATA (screen->pushbuf, dec->fence->offset);
>>> +      PUSH_DATA (screen->pushbuf, 1);
>>> +      PUSH_DATA (screen->pushbuf, 0xf010);
>>> +      PUSH_KICK (screen->pushbuf);
>>> +
>>> +      PUSH_SPACE(bsp_push, 2 + 12 + 2 + 4 + 3);
>>> +
>>> +      BEGIN_NV04(bsp_push, SUBC_BSP(NV01_SUBCHAN_OBJECT), 1);
>>> +      PUSH_DATA (bsp_push, dec->bsp->handle);
>>> +
>>> +      BEGIN_NV04(bsp_push, SUBC_BSP(0x180), 11);
>>> +      for (i = 0; i < 11; i++)
>> Any idea where 11 comes from ? Is it related to some other parameter ?
> 
> These are the dma indices (e.g. when i use 0x654321, each nibble is a
> dmaidx, which is an offset into these 0x180 values). It's the part of
> the whole thing that I understand the least... in theory I should be
> able to just initialize one of them and use it throughout, but I
> haven't been brave enough to put that theory to the test. This is how
> the blob does it.
If it works don't break it ^_^

> 
>>
>>> +         PUSH_DATA(bsp_push, nv04_data.vram);
>>> +      BEGIN_NV04(bsp_push, SUBC_BSP(0x1b8), 1);
>>> +      PUSH_DATA (bsp_push, nv04_data.vram);
>>> +
>> ...
>>
>>> +struct pipe_video_buffer *
>>> +nv84_video_buffer_create(struct pipe_context *pipe,
>>> +                         const struct pipe_video_buffer *template)
>>> +{
>> ...
>>> +   buffer->base.buffer_format = template->buffer_format;
>>> +   buffer->base.context = pipe;
>>> +   buffer->base.destroy = nv84_video_buffer_destroy;
>>> +   buffer->base.chroma_format = template->chroma_format;
>>> +   buffer->base.width = template->width;
>>> +   buffer->base.height = template->height;
>>> +   buffer->base.get_sampler_view_planes = nv84_video_buffer_sampler_view_planes;
>>> +   buffer->base.get_sampler_view_components = nv84_video_buffer_sampler_view_components;
>>> +   buffer->base.get_surfaces = nv84_video_buffer_surfaces;
>>> +   buffer->base.interlaced = true;
>> By storing the number of planes, will be able to demagic some constants
>> later on
>>    buffer->num_planes = 2;
> 
> nvc0_video does that. I find that incredibly confusing. It's always 2,
> and they are of diff size. I prefer my bike-shed color :)
> 
>>
>>> +
>>> +   memset(&templ, 0, sizeof(templ));
>>> +   templ.target = PIPE_TEXTURE_2D_ARRAY;
>>> +   templ.depth0 = 1;
>>> +   templ.bind = PIPE_BIND_SAMPLER_VIEW | PIPE_BIND_RENDER_TARGET;
>>> +   templ.format = PIPE_FORMAT_R8_UNORM;
>>> +   templ.width0 = align(template->width, 2);
>>> +   templ.height0 = align(template->height, 4) / 2;
>>> +   templ.flags = NV50_RESOURCE_FLAG_VIDEO;
>>> +   templ.array_size = 2;
>>> +
>>> +   cfg.nv50.tile_mode = 0x20;
>>> +   cfg.nv50.memtype = 0x70;
>>> +
>>> +   buffer->resources[0] = pipe->screen->resource_create(pipe->screen, &templ);
>>> +   if (!buffer->resources[0])
>>> +      goto error;
>>> +
>>> +   templ.format = PIPE_FORMAT_R8G8_UNORM;
>>> +   templ.width0 /= 2;
>>> +   templ.height0 /= 2;
>>> +   buffer->resources[1] = pipe->screen->resource_create(pipe->screen, &templ);
>>> +   if (!buffer->resources[1])
>>> +      goto error;
>> I believe that the nvc0 version of the code is easier to read (bikeshed)
>>
>> for (i = 1; i < buffer->num_planes; ++i) {
> 
> num_planes is always 2. for (i = 1; i < 2; i++) seems like a waste...
> 
>>    buffer->resources[i] = pipe->screen->resource_create(pipe->screen,
>> &templ);
>>    if (!buffer->resources[i])
>>       goto error;
>> }
>>
>>> +
>>> +   mt0 = nv50_miptree(buffer->resources[0]);
>>> +   mt1 = nv50_miptree(buffer->resources[1]);
>>> +
>>> +   bo_size = mt0->total_size + mt1->total_size;
>>> +   if (nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP, 0,
>>> +                      bo_size, &cfg, &buffer->interlaced))
>>> +      goto error;
>>> +   /* XXX Change reference frame management so that this is only allocated in
>>> +    * the decoder when necessary. */
>>> +   if (nouveau_bo_new(screen->device, NOUVEAU_BO_VRAM | NOUVEAU_BO_NOSNOOP, 0,
>>> +                      bo_size, &cfg, &buffer->full))
>>> +      goto error;
>>> +
>>> +   mt0->base.bo = buffer->interlaced;
>>> +   mt0->base.domain = NOUVEAU_BO_VRAM;
>>> +   mt0->base.offset = 0;
>>> +   mt0->base.address = buffer->interlaced->offset;
>> IMHO this looks a bit easier to grasp
>>    mt0->base.address = buffer->interlaced->offset + mt0->base.offset;
> 
> Agreed.
> 
>>
>>> +   nouveau_bo_ref(buffer->interlaced, &empty);
>>> +
>>> +   mt1->base.bo = buffer->interlaced;
>>> +   mt1->base.domain = NOUVEAU_BO_VRAM;
>>> +   mt1->base.offset = mt0->layer_stride * 2;
>>> +   mt1->base.address = buffer->interlaced->offset + mt0->layer_stride * 2;
>> Similar
>>    mt1->base.address = buffer->interlaced->offset + mt1->base.offset;
> 
> Yep.
> 
>>
>>> +   nouveau_bo_ref(buffer->interlaced, &empty);
>>> +
>>> +   memset(&sv_templ, 0, sizeof(sv_templ));
>>> +   for (component = 0, i = 0; i < 2; ++i ) {
>>    for (component = 0, i = 0; i < buffer->num_planes; ++i ) {
>>
>>> +      struct pipe_resource *res = buffer->resources[i];
>>> +      unsigned nr_components = util_format_get_nr_components(res->format);
>>> +
>>> +      u_sampler_view_default_template(&sv_templ, res, res->format);
>>> +      buffer->sampler_view_planes[i] = pipe->create_sampler_view(pipe, res, &sv_templ);
>>> +      if (!buffer->sampler_view_planes[i])
>>> +         goto error;
>>> +
>>> +      for (j = 0; j < nr_components; ++j, ++component) {
>>> +         sv_templ.swizzle_r = sv_templ.swizzle_g = sv_templ.swizzle_b = PIPE_SWIZZLE_RED + j;
>>> +         sv_templ.swizzle_a = PIPE_SWIZZLE_ONE;
>>> +
>>> +         buffer->sampler_view_components[component] = pipe->create_sampler_view(pipe, res, &sv_templ);
>>> +         if (!buffer->sampler_view_components[component])
>>> +            goto error;
>>> +      }
>>> +   }
>>> +
>>> +   memset(&surf_templ, 0, sizeof(surf_templ));
>>> +   for (j = 0; j < 2; ++j) {
>>    for (j = 0; j < buffer->num_planes; ++j) {
>>
>>> +      surf_templ.format = buffer->resources[j]->format;
>>> +      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 0;
>>> +      buffer->surfaces[j * 2] = pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
>>> +      if (!buffer->surfaces[j * 2])
>>> +         goto error;
>>> +
>>> +      surf_templ.u.tex.first_layer = surf_templ.u.tex.last_layer = 1;
>>> +      buffer->surfaces[j * 2 + 1] = pipe->create_surface(pipe, buffer->resources[j], &surf_templ);
>>> +      if (!buffer->surfaces[j * 2 + 1])
>>> +         goto error;
>>> +   }
>>> +
>>> +   return &buffer->base;
>>> +
>>> +error:
>>> +   nv84_video_buffer_destroy(&buffer->base);
>>> +   return NULL;
>>> +}
>>> +
>>> +int
>>> +nv84_screen_get_video_param(struct pipe_screen *pscreen,
>>> +                            enum pipe_video_profile profile,
>>> +                            enum pipe_video_cap param)
>>> +{
>>> +   switch (param) {
>>> +   case PIPE_VIDEO_CAP_SUPPORTED:
>>> +      return u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG4_AVC ||
>>> +         u_reduce_video_profile(profile) == PIPE_VIDEO_CODEC_MPEG12;
>>       switch (u_reduce_video_profile(profile)) {
>>       case PIPE_VIDEO_CODEC_MPEG12:
>>       case PIPE_VIDEO_CODEC_MPEG4_AVC:
>>          return true;
>>       case PIPE_VIDEO_CODEC_VC1:
>>          /* TODO: Hardware is capable of IDCT acceleration for VC1*/
>>       case PIPE_VIDEO_CODEC_MPEG4:
>>       default:
>>          return false;
>>       }
> 
> Why? switch inside a switch is a bit ugly.
Few silly reasons
* u_reduce_video_profile() is a nice switch statement
* ^^ is inlined and executed twice
* adds a note about VC1 :P

> 
>>
>>> +   case PIPE_VIDEO_CAP_NPOT_TEXTURES:
>>> +      return 1;
>>> +   case PIPE_VIDEO_CAP_MAX_WIDTH:
>>> +   case PIPE_VIDEO_CAP_MAX_HEIGHT:
>>> +      return 2048;
>>> +   case PIPE_VIDEO_CAP_PREFERED_FORMAT:
>>> +      return PIPE_FORMAT_NV12;
>>> +   case PIPE_VIDEO_CAP_SUPPORTS_INTERLACED:
>>> +   case PIPE_VIDEO_CAP_PREFERS_INTERLACED:
>>> +      return true;
>>> +   case PIPE_VIDEO_CAP_SUPPORTS_PROGRESSIVE:
>>> +      return false;
>>> +   default:
>>> +      debug_printf("unknown video param: %d\n", param);
>>> +      return 0;
>>> +   }
>>> +}
>>> +
>>> +boolean
>>> +nv84_screen_video_supported(struct pipe_screen *screen,
>>> +                            enum pipe_format format,
>>> +                            enum pipe_video_profile profile)
>>> +{
>>> +   return format == PIPE_FORMAT_NV12;
>> Will this work when we have XVMC_VL set ?
> 
> Hm, well, XVMC_VL totally doesn't work for me... crashes in the shader
> somewhere. I just copied that logic from nvc0... If anything this
> would be too restrictive...
Hm... true, nouveau is quite restrictive. Radeons are handling it
nicely, with a fallback to vl if uvd is not avaiable. Not that it
matters here :)

> 
>>
>>> +}
>>> diff --git a/src/gallium/drivers/nv50/nv84_video.h b/src/gallium/drivers/nv50/nv84_video.h
>>> new file mode 100644
>>> index 0000000..4ff8cf3
>>> --- /dev/null
>>> +++ b/src/gallium/drivers/nv50/nv84_video.h
>> ...
>>> +struct nv84_video_buffer {
>>> +   struct pipe_video_buffer base;
>>    unsigned num_planes;
>>
>>> +   struct pipe_resource *resources[VL_NUM_COMPONENTS];
>>> +   struct pipe_sampler_view *sampler_view_planes[VL_NUM_COMPONENTS];
>>> +   struct pipe_sampler_view *sampler_view_components[VL_NUM_COMPONENTS];
>>> +   struct pipe_surface *surfaces[VL_NUM_COMPONENTS * 2];
>>> +
>>> +   struct nouveau_bo *interlaced, *full;
>>> +   int mvidx;
>>> +   unsigned frame_num, frame_num_max;
>>> +};
>>> +
>>
>> Looking at the params associated with each video engine, I was wondering
>> about compacting it into a struct (names chosen are the first thing that
>> came to mind)
>>
>> struct nv84_decoder_eng {
>>    struct nouveau_object *obj;
>>    struct nouveau_object *channel;
>>    struct nouveau_pushbuf *pushbuf;
>>    struct nouveau_bufctx *bufctx;
>>
>>    struct nouveau_bo *fw;
>>    struct nouveau_bo *data;
>> }
>>
>> and then having an enum for the different engine types
>>
>> enum nv84_decoder_eng_type
>> {
>>    BSP = 0,
>>    VP
>> };
>>
>> #define NV84_DECODER_ENG_NUM VP + 1
> 
> Hmmm.... it's a point... the downside is that things become a little
> more confusing. I think there's some clarity to just having variable
> names like "bsp_foo" and "vp_foo" instead of "engines[VP].foo". And
> there are only 2 engines.
When I came up with this I was looking at the nvc0 code, which was less
intuitive

   struct nouveau_object *channel[3], *bsp, *vp, *ppp;
   struct nouveau_pushbuf *pushbuf[3];

> 
> One advantage of your approach is that it'd save on some
> initialization code. I dunno. If someone else likes this approach too,
> I'll try it out.
> 
>>
>>> +struct nv84_decoder {
>>> +   struct pipe_video_decoder base;
>>> +   struct nouveau_client *client;
>>> +   struct nouveau_object *bsp_channel, *vp_channel, *bsp, *vp;
>>> +   struct nouveau_pushbuf *bsp_pushbuf, *vp_pushbuf;
>>> +   struct nouveau_bufctx *bsp_bufctx, *vp_bufctx;
>> Then the struct will look a bit cleaner
>> struct nv84_decoder {
>>    struct pipe_video_decoder base;
>>    struct nouveau_client *client;
>>    struct nv84_decoder_eng engs[NV84_DECODER_ENG_NUM];
>>
>>
>>> +
>>> +   struct nouveau_bo *bsp_fw, *bsp_data;
>>> +   struct nouveau_bo *vp_fw, *vp_data;
>>> +   struct nouveau_bo *mbring, *vpring;
>>> +
>>> +   /*
>>> +    * states:
>>> +    *  0: init
>>> +    *  1: vpring/mbring cleared, bsp is ready
>>> +    *  2: bsp is done, vp is ready
>>> +    * and then vp it back to 1
>>> +    */
>>> +   struct nouveau_bo *fence;
>>> +
>>> +   struct nouveau_bo *bitstream;
>>> +   struct nouveau_bo *vp_params;
>>> +
>>> +   size_t vp_fw2_offset;
>>> +
>>> +   unsigned frame_mbs, frame_size;
>>> +   /* VPRING layout:
>>> +        RESIDUAL
>>> +        CTRL
>>> +        DEBLOCK
>>> +        0x1000
>>> +   */
>>> +   unsigned vpring_deblock, vpring_residual, vpring_ctrl;
>>> +
>>> +
>>> +   struct vl_mpg12_bs *mpeg12_bs;
>>> +
>>> +   struct nouveau_bo *mpeg12_bo;
>>> +   void *mpeg12_mb_info;
>>> +   uint16_t *mpeg12_data;
>>> +   const int *zscan;
>>> +   uint8_t mpeg12_intra_matrix[64];
>>> +   uint8_t mpeg12_non_intra_matrix[64];
>>> +};
>>> +
>> ...
>>
>>> +static INLINE uint32_t mb(uint32_t coord)
>>> +{
>>> +   return (coord + 0xf)>>4;
>>> +}
>>> +
>>> +static INLINE uint32_t mb_half(uint32_t coord)
>>> +{
>>> +   return (coord + 0x1f)>>5;
>>> +}
>> How about moving these in nouveau_video.h ? (and removing the duplicate
>> copy from nvc0_video.h)
>>
>> Might be better as a follow on patch
> 
> Yeah. And as VP3/4 support comes out, I suspect a lot of nvc0_video
> will get refactored out since they're likely very similar.
> 
>>
>> ...
>>> diff --git a/src/gallium/drivers/nv50/nv84_video_vp.c b/src/gallium/drivers/nv50/nv84_video_vp.c
>>> new file mode 100644
>>> index 0000000..60c0848
>>> --- /dev/null
>>> +++ b/src/gallium/drivers/nv50/nv84_video_vp.c
>>> @@ -0,0 +1,521 @@
>>> +/*
>>> + * Copyright 2013 Ilia Mirkin
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>> + * copy of this software and associated documentation files (the "Software"),
>>> + * to deal in the Software without restriction, including without limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + */
>>> +
>>> +#include <immintrin.h>
>> Wrap this include in
>> #ifdef __SSE4_2__
>> #endif
>>
>> considering its definitions are used in a similar block
>> ...
> 
> I guess. There shouldn't be any harm to including it, but OK.
> 
>>
>>> +void
>>> +nv84_decoder_vp_h264(struct nv84_decoder *dec,
>>> +                     struct pipe_h264_picture_desc *desc,
>>> +                     struct nv84_video_buffer *dest)
>>> +{
>> ...
>>
>>> +   for (i = 0; i < 2; i++) {
>>    for (i = 0; i < dest->num_planes; i++) {
>>
>>> +      struct nv50_miptree *mt = nv50_miptree(dest->resources[i]);
>>> +      mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
>>> +   }
>>> +
>>> +   PUSH_KICK (push);
>>> +}
>>> +
>> ...
>>
>>> +void
>>> +nv84_decoder_vp_mpeg12_mb(struct nv84_decoder *dec,
>>> +                          struct pipe_mpeg12_picture_desc *desc,
>>> +                          const struct pipe_mpeg12_macroblock *macrob)
>>> +{
>> ...
>>
>>> +#ifdef __SSE4_2__
>> IMHO this may produce non portable binaries in case of aggressive
>> mtune/march flags. I'm not objecting against it just pointing out
> 
> mtune shouldn't cause it to be defined. if you're specifying it on
> march, then that's the target arch, so... the compiler is free to use
> corei7 instructions anyways. Although distros will (likely) never use
> this, but people on, say, gentoo, will get the benefits. A much better
> approach would be to build the code anyways, and then select the best
> version at runtime.
Ouch you got me there, I was not too sure which one was the correct gcc
flag. AFAIK mesa does have code detecting runtime cpu capabilities, but
that can follow on if anyone is interested

Cheers
Emil
> 
> $ gcc -dM -E - < /dev/null | grep SSE4
> $ gcc -mtune=corei7 -dM -E - < /dev/null | grep SSE4
> $ gcc -march=corei7 -dM -E - < /dev/null | grep SSE4
> #define __SSE4_1__ 1
> #define __SSE4_2__ 1
> 
> 
>>
>>> +void
>>> +nv84_decoder_vp_mpeg12(struct nv84_decoder *dec,
>>> +                       struct pipe_mpeg12_picture_desc *desc,
>>> +                       struct nv84_video_buffer *dest)
>>> +{
>> ...
>>
>>> +   for (i = 0; i < 2; i++) {
>>    for (i = 0; i < dest->num_planes; i++) {
>>
>>
>> Cheers
>> Emil
>>
>>> +      struct nv50_miptree *mt = nv50_miptree(dest->resources[i]);
>>> +      mt->base.status |= NOUVEAU_BUFFER_STATUS_GPU_WRITING;
>>> +   }
>>> +   PUSH_KICK (push);
>>> +}
>>>
>>
