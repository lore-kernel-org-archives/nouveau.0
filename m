From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: always do buffer object moves on
	bo->channel
Date: Mon, 21 Dec 2009 14:44:33 +0100
Message-ID: <6d4bc9fc0912210544i726b3cfcj812eac9fb86519ec@mail.gmail.com>
References: <1261402742-7992-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261402742-7992-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

This should also avoid being able to dma into ramin, which was the
primary concern darktama had about this patch. Actually this could
already be done on the user channel, because the vm contained all the
vram pages. Makes me wonder why we weren't overwriting ramin
sometimes.

On Mon, Dec 21, 2009 at 2:39 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> - Use the "direct" objects that previously only the kernel fifo had.
> - This avoids corruption on some buffer moves.
> - Prevent dma access to ramin, we never use dma there anyway and it's an
> exploit waiting to happen.
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_bo.c =A0 =A0 | =A0 27 ++++------------=
-----
> =A0drivers/gpu/drm/nouveau/nouveau_mem.c =A0 =A0| =A0 =A07 ++++-
> =A0drivers/gpu/drm/nouveau/nouveau_object.c | =A0 36 ++++++++++++++++++++=
++++++++
> =A0drivers/gpu/drm/nouveau/nouveau_state.c =A0| =A0 38 +-----------------=
------------
> =A0drivers/gpu/drm/nouveau/nv50_display.c =A0 | =A0 =A06 ++--
> =A0drivers/gpu/drm/nouveau/nv50_instmem.c =A0 | =A0 =A04 ++-
> =A06 files changed, 53 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index e18d7fc..89c17d4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -389,8 +389,8 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, =
uint32_t type,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0man->io_addr =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0man->io_offset =3D drm_get_resource_start(=
dev, 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0man->io_size =3D drm_get_resource_len(dev,=
 1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (man->io_size > nouveau_mem_fb_amount(de=
v))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 man->io_size =3D nouveau_me=
m_fb_amount(dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (man->io_size > dev_priv->fb_available_s=
ize)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 man->io_size =3D dev_priv->=
fb_available_size;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0man->gpu_offset =3D dev_priv->vm_vram_base;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> @@ -471,15 +471,9 @@ static inline uint32_t
> =A0nouveau_bo_mem_ctxdma(struct nouveau_bo *nvbo, struct nouveau_channel =
*chan,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct ttm_mem_reg *mem)
> =A0{
> - =A0 =A0 =A0 if (chan =3D=3D nouveau_bdev(nvbo->bo.bdev)->channel) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mem->mem_type =3D=3D TTM_PL_TT)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NvDmaGART;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NvDmaVRAM;
> - =A0 =A0 =A0 }
> -
> =A0 =A0 =A0 =A0if (mem->mem_type =3D=3D TTM_PL_TT)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return chan->gart_handle;
> - =A0 =A0 =A0 return chan->vram_handle;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NvDmaGART;
> + =A0 =A0 =A0 return NvDmaVRAM;
> =A0}
>
> =A0static int
> @@ -495,22 +489,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, =
int evict, bool intr,
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0chan =3D nvbo->channel;
> - =A0 =A0 =A0 if (!chan || nvbo->tile_flags || nvbo->no_vm)
> + =A0 =A0 =A0 if (!chan)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chan =3D dev_priv->channel;
>
> =A0 =A0 =A0 =A0src_offset =3D old_mem->mm_node->start << PAGE_SHIFT;
> =A0 =A0 =A0 =A0dst_offset =3D new_mem->mm_node->start << PAGE_SHIFT;
> - =A0 =A0 =A0 if (chan !=3D dev_priv->channel) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (old_mem->mem_type =3D=3D TTM_PL_TT)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src_offset +=3D dev_priv->v=
m_gart_base;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src_offset +=3D dev_priv->v=
m_vram_base;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (new_mem->mem_type =3D=3D TTM_PL_TT)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst_offset +=3D dev_priv->v=
m_gart_base;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dst_offset +=3D dev_priv->v=
m_vram_base;
> - =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0ret =3D RING_SPACE(chan, 3);
> =A0 =A0 =A0 =A0if (ret)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouv=
eau/nouveau_mem.c
> index fb9bdd6..f5c6ef5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -610,8 +610,11 @@ nouveau_mem_init(struct drm_device *dev)
>
> =A0 =A0 =A0 =A0NV_INFO(dev, "%d MiB VRAM\n", (int)(dev_priv->fb_available=
_size >> 20));
>
> - =A0 =A0 =A0 /* remove reserved space at end of vram from available amou=
nt */
> - =A0 =A0 =A0 dev_priv->fb_available_size -=3D dev_priv->ramin_rsvd_vram;
> + =A0 =A0 =A0 /* Normal users have no reason to be anywhere near the rami=
n memory.
> + =A0 =A0 =A0 =A0* This also includes the smaller reserved ramin for spec=
ial purposes.
> + =A0 =A0 =A0 =A0* We don't do dma transfers with ramin memory.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 dev_priv->fb_available_size -=3D dev_priv->ramin_size;
> =A0 =A0 =A0 =A0dev_priv->fb_aper_free =3D dev_priv->fb_available_size;
>
> =A0 =A0 =A0 =A0/* mappable vram */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/n=
ouveau/nouveau_object.c
> index 93379bb..d18c95c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_object.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_object.c
> @@ -33,6 +33,7 @@
> =A0#include "drmP.h"
> =A0#include "drm.h"
> =A0#include "nouveau_drv.h"
> +#include "nouveau_dma.h"
> =A0#include "nouveau_drm.h"
>
> =A0/* NVidia uses context objects to drive drawing operations.
> @@ -1099,6 +1100,41 @@ nouveau_gpuobj_channel_init(struct nouveau_channel=
 *chan,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* Two objects for kernel consumption, on nv50 they allow d=
irect access
> + =A0 =A0 =A0 =A0* to vram. This is needed because we don't know the tili=
ng layout.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 vram =3D NULL;
> + =A0 =A0 =A0 ret =3D nouveau_gpuobj_dma_new(chan, NV_CLASS_DMA_IN_MEMORY,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0, dev_priv=
->fb_available_size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_DMA_ACCE=
SS_RW, NV_DMA_TARGET_VIDMEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &vram);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Error creating direct VRAM c=
txdma: %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D nouveau_gpuobj_ref_add(dev, chan, NvDmaVRAM, vram, =
NULL);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Error referencing direct VRA=
M ctxdma:" \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 tt =3D NULL;
> + =A0 =A0 =A0 ret =3D nouveau_gpuobj_gart_dma_new(chan, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 dev_priv->gart_info.aper_size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 NV_DMA_ACCESS_RW, &tt, NULL);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Error creating GART ctxdma: =
%d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D nouveau_gpuobj_ref_add(dev, chan, NvDmaGART, tt, NU=
LL);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NV_ERROR(dev, "Error referencing GART ctxdm=
a: %d\n", ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/no=
uveau/nouveau_state.c
> index 6a45913..c9757f2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -321,46 +321,10 @@ static int
> =A0nouveau_card_init_channel(struct drm_device *dev)
> =A0{
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> - =A0 =A0 =A0 struct nouveau_gpuobj *gpuobj;
> - =A0 =A0 =A0 int ret;
>
> - =A0 =A0 =A0 ret =3D nouveau_channel_alloc(dev, &dev_priv->channel,
> + =A0 =A0 =A0 return nouveau_channel_alloc(dev, &dev_priv->channel,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(s=
truct drm_file *)-2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Nv=
DmaFB, NvDmaTT);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> -
> - =A0 =A0 =A0 gpuobj =3D NULL;
> - =A0 =A0 =A0 ret =3D nouveau_gpuobj_dma_new(dev_priv->channel, NV_CLASS_=
DMA_IN_MEMORY,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
0, nouveau_mem_fb_amount(dev),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
&gpuobj);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_err;
> -
> - =A0 =A0 =A0 ret =3D nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDm=
aVRAM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
gpuobj, NULL);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_err;
> -
> - =A0 =A0 =A0 gpuobj =3D NULL;
> - =A0 =A0 =A0 ret =3D nouveau_gpuobj_gart_dma_new(dev_priv->channel, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 dev_priv->gart_info.aper_size,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 NV_DMA_ACCESS_RW, &gpuobj, NULL);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_err;
> -
> - =A0 =A0 =A0 ret =3D nouveau_gpuobj_ref_add(dev, dev_priv->channel, NvDm=
aGART,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
gpuobj, NULL);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_err;
> -
> - =A0 =A0 =A0 return 0;
> -out_err:
> - =A0 =A0 =A0 nouveau_gpuobj_del(dev, &gpuobj);
> - =A0 =A0 =A0 nouveau_channel_free(dev_priv->channel);
> - =A0 =A0 =A0 dev_priv->channel =3D NULL;
> - =A0 =A0 =A0 return ret;
> =A0}
>
> =A0int
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nou=
veau/nv50_display.c
> index a9263d9..6e5a4ff 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -127,7 +127,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct n=
ouveau_channel **pchan)
>
> =A0 =A0 =A0 =A0if (dev_priv->chipset !=3D 0x50) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D nv50_evo_dmaobj_new(chan, 0x3d, Nv=
EvoFB16, 0x70, 0x19,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 0, 0xffffffff);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 0, dev_priv->fb_available_size);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_evo_channel_del(pchan=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> @@ -135,7 +135,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct n=
ouveau_channel **pchan)
>
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D nv50_evo_dmaobj_new(chan, 0x3d, Nv=
EvoFB32, 0x7a, 0x19,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 0, 0xffffffff);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 0, dev_priv->fb_available_size);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_evo_channel_del(pchan=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> @@ -143,7 +143,7 @@ nv50_evo_channel_new(struct drm_device *dev, struct n=
ouveau_channel **pchan)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0ret =3D nv50_evo_dmaobj_new(chan, 0x3d, NvEvoVRAM, 0, 0x19,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0, nouv=
eau_mem_fb_amount(dev));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0, dev_=
priv->fb_available_size);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_evo_channel_del(pchan);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> diff --git a/drivers/gpu/drm/nouveau/nv50_instmem.c b/drivers/gpu/drm/nou=
veau/nv50_instmem.c
> index 94400f7..9667276 100644
> --- a/drivers/gpu/drm/nouveau/nv50_instmem.c
> +++ b/drivers/gpu/drm/nouveau/nv50_instmem.c
> @@ -101,7 +101,9 @@ nv50_instmem_init(struct drm_device *dev)
> =A0 =A0 =A0 =A0dev_priv->vm_gart_size =3D NV50_VM_BLOCK;
>
> =A0 =A0 =A0 =A0dev_priv->vm_vram_base =3D dev_priv->vm_gart_base + dev_pr=
iv->vm_gart_size;
> - =A0 =A0 =A0 dev_priv->vm_vram_size =3D nouveau_mem_fb_amount(dev);
> + =A0 =A0 =A0 /* fb_available_size is not yet set. */
> + =A0 =A0 =A0 dev_priv->vm_vram_size =3D nouveau_mem_fb_amount(dev) -
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 dev_priv->ramin_size;
> =A0 =A0 =A0 =A0if (dev_priv->vm_vram_size > NV50_VM_MAX_VRAM)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_priv->vm_vram_size =3D NV50_VM_MAX_VRA=
M;
> =A0 =A0 =A0 =A0dev_priv->vm_vram_size =3D roundup(dev_priv->vm_vram_size,=
 NV50_VM_BLOCK);
> --
> 1.6.5.4
>
>
