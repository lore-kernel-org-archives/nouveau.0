From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: always do buffer object moves on
 bo->channel
Date: Tue, 22 Dec 2009 08:26:33 +1000
Message-ID: <1261434393.3398.1.camel@nisroch>
References: <1261402742-7992-1-git-send-email-madman2003@gmail.com>
	<6d4bc9fc0912210544i726b3cfcj812eac9fb86519ec@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0912210544i726b3cfcj812eac9fb86519ec-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Mon, 2009-12-21 at 14:44 +0100, Maarten Maathuis wrote:
> This should also avoid being able to dma into ramin, which was the
> primary concern darktama had about this patch. Actually this could
> already be done on the user channel, because the vm contained all the
> vram pages. Makes me wonder why we weren't overwriting ramin
> sometimes.
PRAMIN on G8x isn't fixed at the end of VRAM like it is on earlier
chips.  We allocate it (essentially) per-channel, and it's *not* mapped
into the VM.

Ben.
> 
> On Mon, Dec 21, 2009 at 2:39 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > - Use the "direct" objects that previously only the kernel fifo had.
> > - This avoids corruption on some buffer moves.
> > - Prevent dma access to ramin, we never use dma there anyway and it's an
> > exploit waiting to happen.
> >
> > Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c     |   27 ++++-----------------
> >  drivers/gpu/drm/nouveau/nouveau_mem.c    |    7 ++++-
> >  drivers/gpu/drm/nouveau/nouveau_object.c |   36 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_state.c  |   38 +-----------------------------
> >  drivers/gpu/drm/nouveau/nv50_display.c   |    6 ++--
> >  drivers/gpu/drm/nouveau/nv50_instmem.c   |    4 ++-
> >  6 files changed, 53 insertions(+), 65 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index e18d7fc..89c17d4 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -389,8 +389,8 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
> >                man->io_addr = NULL;
> >                man->io_offset = drm_get_resource_start(dev, 1);
> >                man->io_size = drm_get_resource_len(dev, 1);
> > -               if (man->io_size > nouveau_mem_fb_amount(dev))
> > -                       man->io_size = nouveau_mem_fb_amount(dev);
> > +               if (man->io_size > dev_priv->fb_available_size)
> > +                       man->io_size = dev_priv->fb_available_size;
> >
> >                man->gpu_offset = dev_priv->vm_vram_base;
> >                break;
> > @@ -471,15 +471,9 @@ static inline uint32_t
> >  nouveau_bo_mem_ctxdma(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
> >                      struct ttm_mem_reg *mem)
> >  {
> > -       if (chan == nouveau_bdev(nvbo->bo.bdev)->channel) {
> > -               if (mem->mem_type == TTM_PL_TT)
> > -                       return NvDmaGART;
> > -               return NvDmaVRAM;
> > -       }
> > -
> >        if (mem->mem_type == TTM_PL_TT)
> > -               return chan->gart_handle;
> > -       return chan->vram_handle;
> > +               return NvDmaGART;
> > +       return NvDmaVRAM;
> >  }
> >
> >  static int
> > @@ -495,22 +489,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> >        int ret;
> >
> >        chan = nvbo->channel;
> > -       if (!chan || nvbo->tile_flags || nvbo->no_vm)
> > +       if (!chan)
> >                chan = dev_priv->channel;
> >
> >        src_offset = old_mem->mm_node->start << PAGE_SHIFT;
> >        dst_offset = new_mem->mm_node->start << PAGE_SHIFT;
> > -       if (chan != dev_priv->channel) {
> > -               if (old_mem->mem_type == TTM_PL_TT)
> > -                       src_offset += dev_priv->vm_gart_base;
> > -               else
> > -                       src_offset += dev_priv->vm_vram_base;
> > -
> > -               if (new_mem->mem_type == TTM_PL_TT)
> > -                       dst_offset += dev_priv->vm_gart_base;
> > -               else
> > -                       dst_offset += dev_priv->vm_vram_base;
> > -       }
> >
> >        ret = RING_SPACE(chan, 3);
> >        if (ret)
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> > index fb9bdd6..f5c6ef5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> > @@ -610,8 +610,11 @@ nouveau_mem_init(struct drm_device *dev)
> >
> >        NV_INFO(dev, "%d MiB VRAM\n", (int)(dev_priv->fb_available_size >> 20));
> >
> > -       /* remove reserved space at end of vram from available amount */
> > -       dev_priv->fb_available_size -= dev_priv->ramin_rsvd_vram;
> > +       /* Normal users have no reason to be anywhere near the ramin memory.
> > +        * This also includes the smaller reserved ramin for special purposes.
> > +        * We don't do dma transfers with ramin memory.
> > +        */
> > +       dev_priv->fb_available_size -= dev_priv->ramin_size;
> >        dev_priv->fb_aper_free = dev_priv->fb_available_size;
> >
> >        /* mappable vram */
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
> > index 93379bb..d18c95c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_object.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_object.c
> > @@ -33,6 +33,7 @@
> >  #include "drmP.h"
> >  #include "drm.h"
> >  #include "nouveau_drv.h"
> > +#include "nouveau_dma.h"
> >  #include "nouveau_drm.h"
> >
> >  /* NVidia uses context objects to drive drawing operations.
> > @@ -1099,6 +1100,41 @@ nouveau_gpuobj_channel_init(struct nouveau_channel *chan,
> >                return ret;
> >        }
> >
> > +       /* Two objects for kernel consumption, on nv50 they allow direct access
> > +        * to vram. This is needed because we don't know the tiling layout.
> > +        */
> > +       vram = NULL;
> > +       ret = nouveau_gpuobj_dma_new(chan, NV_CLASS_DMA_IN_MEMORY,
> > +                               0, dev_priv->fb_available_size,
> > +                               NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
> > +                               &vram);
> > +       if (ret) {
> > +               NV_ERROR(dev, "Error creating direct VRAM ctxdma: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = nouveau_gpuobj_ref_add(dev, chan, NvDmaVRAM, vram, NULL);
> > +       if (ret) {
> > +               NV_ERROR(dev, "Error referencing direct VRAM ctxdma:" \
> > +                       " %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       tt = NULL;
> > +       ret = nouveau_gpuobj_gart_dma_new(chan, 0,
> > +                                                 dev_priv->gart_info.aper_size,
> > +                                                 NV_DMA_ACCESS_RW, &tt, NULL);
> > +       if (ret) {
> > +               NV_ERROR(dev, "Error creating GART ctxdma: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = nouveau_gpuobj_ref_add(dev, chan, NvDmaGART, tt, NULL);
> > +       if (ret) {
> > +               NV_ERROR(dev, "Error referencing GART ctxdma: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> >        return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
> > index 6a45913..c9757f2 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> > @@ -321,46 +321,10 @@ static int
> >  nouveau_card_init_channel(struct drm_device *dev)
> >  {
> >        struct drm_nouveau_private *dev_priv = dev->dev_private;
> > -       struct nouveau_gpuobj *gpuobj;
> > -       int ret;
> >
> > -       ret = nouveau_channel_alloc(dev, &dev_priv->channel,
> > +       return nouveau_channel_alloc(dev, &dev_priv->channel,
> >                                    (struct drm_file *)-2,
> >                                    NvDmaFB, NvDmaTT);
> > -       if (ret)
> > -               return ret;
> > -
> > -       gpuobj = NULL;
> > -       ret = nouveau_gpuobj_dma_new(dev_priv->channel, NV_CLASS_DMA_IN_MEMORY,
> > -                                    0, nouveau_mem_fb_amount(dev),
> > -                                    NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
> > -                                    &gpuobj);
> > -       if (ret)
> > -               goto out_err;
> > -
> > -       ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaVRAM,
> > -                                    gpuobj, NULL);
> > -       if (ret)
> > -               goto out_err;
> > -
> > -       gpuobj = NULL;
> > -       ret = nouveau_gpuobj_gart_dma_new(dev_priv->channel, 0,
> > -                                         dev_priv->gart_info.aper_size,
> > -                                         NV_DMA_ACCESS_RW, &gpuobj, NULL);
> > -       if (ret)
> > -               goto out_err;
> > -
> > -       ret = nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDmaGART,
> > -                                    gpuobj, NULL);
> > -       if (ret)
> > -               goto out_err;
> > -
> > -       return 0;
> > -out_err:
> > -       nouveau_gpuobj_del(dev, &gpuobj);
> > -       nouveau_channel_free(dev_priv->channel);
> > -       dev_priv->channel = NULL;
> > -       return ret;
> >  }
> >
> >  int
> > diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> > index a9263d9..6e5a4ff 100644
> > --- a/drivers/gpu/drm/nouveau/nv50_display.c
> > +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> > @@ -127,7 +127,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct nouveau_channel **pchan)
> >
> >        if (dev_priv->chipset != 0x50) {
> >                ret = nv50_evo_dmaobj_new(chan, 0x3d, NvEvoFB16, 0x70, 0x19,
> > -                                         0, 0xffffffff);
> > +                                         0, dev_priv->fb_available_size);
> >                if (ret) {
> >                        nv50_evo_channel_del(pchan);
> >                        return ret;
> > @@ -135,7 +135,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct nouveau_channel **pchan)
> >
> >
> >                ret = nv50_evo_dmaobj_new(chan, 0x3d, NvEvoFB32, 0x7a, 0x19,
> > -                                         0, 0xffffffff);
> > +                                         0, dev_priv->fb_available_size);
> >                if (ret) {
> >                        nv50_evo_channel_del(pchan);
> >                        return ret;
> > @@ -143,7 +143,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct nouveau_channel **pchan)
> >        }
> >
> >        ret = nv50_evo_dmaobj_new(chan, 0x3d, NvEvoVRAM, 0, 0x19,
> > -                                 0, nouveau_mem_fb_amount(dev));
> > +                                 0, dev_priv->fb_available_size);
> >        if (ret) {
> >                nv50_evo_channel_del(pchan);
> >                return ret;
> > diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nouveau/nv50_instmem.c
> > index 94400f7..9667276 100644
> > --- a/drivers/gpu/drm/nouveau/nv50_instmem.c
> > +++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
> > @@ -101,7 +101,9 @@ nv50_instmem_init(struct drm_device *dev)
> >        dev_priv->vm_gart_size = NV50_VM_BLOCK;
> >
> >        dev_priv->vm_vram_base = dev_priv->vm_gart_base + dev_priv->vm_gart_size;
> > -       dev_priv->vm_vram_size = nouveau_mem_fb_amount(dev);
> > +       /* fb_available_size is not yet set. */
> > +       dev_priv->vm_vram_size = nouveau_mem_fb_amount(dev) -
> > +                                               dev_priv->ramin_size;
> >        if (dev_priv->vm_vram_size > NV50_VM_MAX_VRAM)
> >                dev_priv->vm_vram_size = NV50_VM_MAX_VRAM;
> >        dev_priv->vm_vram_size = roundup(dev_priv->vm_vram_size, NV50_VM_BLOCK);
> > --
> > 1.6.5.4
> >
> >
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
