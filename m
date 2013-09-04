From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50-: make dma-objects read-only where
	appropriate
Date: Wed, 4 Sep 2013 13:23:37 +1000
Message-ID: <CACAvsv5X2N++A27rtMGw35O+D-LscBnfbKRDb9aGjaLeWUDd3w@mail.gmail.com>
References: <1378132283-19536-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378132283-19536-1-git-send-email-maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> I don't see why the display engine would need write access to the entirety of
> vram, when read-only access is enough.
Meh, this really doesn't matter... We're doing the same setup as
nvidia do here, and I see no good reason not to.

>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv50_display.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> index aab72f5..eac6b2a 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -159,7 +159,7 @@ nv50_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                      NV_DMA_IN_MEMORY_CLASS,
>                                      &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NV50_DMA_CONF0_ENABLE |
> @@ -172,7 +172,7 @@ nv50_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                  NV_DMA_IN_MEMORY_CLASS,
>                                  &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NV50_DMA_CONF0_ENABLE | 0x70 |
> @@ -185,7 +185,7 @@ nv50_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                  NV_DMA_IN_MEMORY_CLASS,
>                                  &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NV50_DMA_CONF0_ENABLE | 0x7a |
> @@ -204,7 +204,7 @@ nvc0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                      NV_DMA_IN_MEMORY_CLASS,
>                                      &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NVC0_DMA_CONF0_ENABLE,
> @@ -216,7 +216,7 @@ nvc0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                  NV_DMA_IN_MEMORY_CLASS,
>                                  &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NVC0_DMA_CONF0_ENABLE | 0xfe,
> @@ -228,7 +228,7 @@ nvc0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                  NV_DMA_IN_MEMORY_CLASS,
>                                  &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NVC0_DMA_CONF0_ENABLE | 0xfe,
> @@ -246,7 +246,7 @@ nvd0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                      NV_DMA_IN_MEMORY_CLASS,
>                                      &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NVD0_DMA_CONF0_ENABLE |
> @@ -259,7 +259,7 @@ nvd0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
>                                  NV_DMA_IN_MEMORY_CLASS,
>                                  &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                         .conf0 = NVD0_DMA_CONF0_ENABLE | 0xfe |
> @@ -316,7 +316,7 @@ nv50_dmac_create(struct nouveau_object *core, u32 bclass, u8 head,
>                                  NV_DMA_IN_MEMORY_CLASS,
>                                  &(struct nv_dma_class) {
>                                         .flags = NV_DMA_TARGET_VRAM |
> -                                                NV_DMA_ACCESS_RDWR,
> +                                                NV_DMA_ACCESS_RD,
>                                         .start = 0,
>                                         .limit = pfb->ram->size - 1,
>                                  }, sizeof(struct nv_dma_class), &object);
> --
> 1.8.3.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
