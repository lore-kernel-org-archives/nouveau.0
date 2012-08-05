From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nvc0: Add and enable vblank support
Date: Sun, 5 Aug 2012 12:43:58 +1000
Message-ID: <CACAvsv5O76G2iSz-76boTPcpQ3gBa612urdhHiUD_x5ibt_yFQ@mail.gmail.com>
References: <50128BD1.2020903@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50128BD1.2020903-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 27, 2012 at 10:38 PM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> Based on the original patch by Christoph Bumiller, but since
> it depends on kernel support patched I cannot push it yet.
Hey Maarten,

I've pushed support for sync-to-vblank on fermi and up (tested on
NVC0, NVD9 and NVE7) to the DRM (in the rework code) and the DDX.

There's a few differences to your code, mostly for NVC0 where we use
PFIFO SWMTHD rather than PGRAPH ILLEGAL_CLASS for the software traps.

Also, I tracked down (on NVD9) an issue where we get far more vblank
interrupts than expected, turns out vblank is a sub-status of what you
were using.

Let me know if there's any issues.

Ben.

>
> The changes are that I enable vblank by default, and offset
> takes OFFSET_HIGH/LOW instead of something relative to notifier_bo.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>
> ---
> diff --git a/man/nouveau.man b/man/nouveau.man
> index 7c72907..8765569 100644
> --- a/man/nouveau.man
> +++ b/man/nouveau.man
> @@ -79,7 +79,7 @@ Enable or disable wfb, only affects nv50+. Useful for some legacy configurations
>  .BI "Option \*qGLXVBlank\*q \*q" boolean \*q
>  Synchronize GLX clients to VBlank. Useful where tearing is a problem,
>  harmful if the GPU isn't fast enough to keep up with the monitor
> -refresh rate. Default: off.
> +refresh rate. Default: on.
>  .TP
>  .BI "Option \*qZaphodHeads\*q \*q" string \*q
>  Specify the randr output(s) to use with zaphod mode for a particular driver
> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> index 0b3cc38..62333b1 100644
> --- a/src/nouveau_dri2.c
> +++ b/src/nouveau_dri2.c
> @@ -316,6 +316,9 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
>                                            NOUVEAU_BO_VRAM | NOUVEAU_BO_RD
>                                      }, 1);
>
> +               if (pNv->Architecture >= NV_ARCH_C0)
> +                       NVC0SyncToVBlank(dst_pix, REGION_EXTENTS(0, &reg));
> +               else
>                 if (pNv->Architecture >= NV_ARCH_50)
>                         NV50SyncToVBlank(dst_pix, REGION_EXTENTS(0, &reg));
>                 else
> diff --git a/src/nv_dma.c b/src/nv_dma.c
> index d2a6d00..47c7e12 100644
> --- a/src/nv_dma.c
> +++ b/src/nv_dma.c
> @@ -63,6 +63,18 @@ NVInitDma(ScrnInfoPtr pScrn)
>         xf86DrvMsg(pScrn->scrnIndex, X_INFO,
>                    "Opened GPU channel %d\n", fifo->channel);
>
> +       if (pNv->Architecture >= NV_ARCH_C0) {
> +               struct nvc0_fifo *data = (struct nvc0_fifo *)fifo;
> +               ret = nouveau_bo_wrap(pNv->dev, data->notify,
> +                                     &pNv->notifier_bo);
> +               if (ret) {
> +                       xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
> +                                  "Failed to obtain notifier bo: %d\n", ret);
> +                       NVTakedownDma(pScrn);
> +                       return FALSE;
> +               }
> +       }
> +
>         ret = nouveau_pushbuf_new(pNv->client, pNv->channel, 4, 32 * 1024,
>                                   true, &pNv->pushbuf);
>         if (ret) {
> diff --git a/src/nv_driver.c b/src/nv_driver.c
> index beef789..dd6f005 100644
> --- a/src/nv_driver.c
> +++ b/src/nv_driver.c
> @@ -815,6 +815,7 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
>
>         if (!pNv->NoAccel && pNv->dev->chipset >= 0x11) {
>                 from = X_DEFAULT;
> +               pNv->glx_vblank = TRUE;
>                 if (xf86GetOptValBool(pNv->Options, OPTION_GLX_VBLANK,
>                                       &pNv->glx_vblank))
>                         from = X_CONFIG;
> diff --git a/src/nv_proto.h b/src/nv_proto.h
> index b546ebd..bcf927d 100644
> --- a/src/nv_proto.h
> +++ b/src/nv_proto.h
> @@ -149,6 +149,7 @@ Bool NVAccelInit2D_NV50(ScrnInfoPtr pScrn);
>  Bool NVAccelInitNV50TCL(ScrnInfoPtr pScrn);
>
>  /* in nvc0_accel.c */
> +void NVC0SyncToVBlank(PixmapPtr ppix, BoxPtr box);
>  Bool NVAccelInitM2MF_NVC0(ScrnInfoPtr pScrn);
>  Bool NVAccelInitCopy_NVC0(ScrnInfoPtr pScrn);
>  Bool NVAccelInitP2MF_NVE0(ScrnInfoPtr pScrn);
> diff --git a/src/nv_type.h b/src/nv_type.h
> index e1ea494..272e34f 100644
> --- a/src/nv_type.h
> +++ b/src/nv_type.h
> @@ -102,6 +102,7 @@ typedef struct _NVRec {
>         struct nouveau_object *Nv2D;
>         struct nouveau_object *Nv3D;
>         struct nouveau_object *NvSW;
> +       struct nouveau_bo *notifier_bo;
>         struct nouveau_bo *scratch;
>
>         Bool ce_enabled;
> diff --git a/src/nvc0_accel.c b/src/nvc0_accel.c
> index c5da0cd..4cae0d2 100644
> --- a/src/nvc0_accel.c
> +++ b/src/nvc0_accel.c
> @@ -25,6 +25,36 @@
>  #include "nvc0_shader.h"
>  #include "nve0_shader.h"
>
> +void
> +NVC0SyncToVBlank(PixmapPtr ppix, BoxPtr box)
> +{
> +       ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
> +       NVPtr pNv = NVPTR(pScrn);
> +       struct nouveau_pushbuf *push = pNv->pushbuf;
> +       int crtcs;
> +
> +       if (!nouveau_exa_pixmap_is_onscreen(ppix))
> +               return;
> +
> +       crtcs = nv_window_belongs_to_crtc(pScrn, box->x1, box->y1,
> +                                         box->x2 - box->x1,
> +                                         box->y2 - box->y1);
> +       if (!crtcs)
> +               return;
> +
> +       BEGIN_NVC0(push, SUBC_NVSW(NV84_SUBCHAN_SEMAPHORE_ADDRESS_HIGH), 4);
> +       PUSH_DATA (push, pNv->notifier_bo->offset >> 32);
> +       PUSH_DATA (push, pNv->notifier_bo->offset);
> +       PUSH_DATA (push, 0x22222222);
> +       PUSH_DATA (push, NV84_SUBCHAN_SEMAPHORE_TRIGGER_WRITE_LONG);
> +       BEGIN_NVC0(push, SUBC_NVSW(0x0208), 2);
> +       PUSH_DATA (push, 0x11111111);
> +       PUSH_DATA (push, ffs(crtcs) - 1);
> +       BEGIN_NVC0(push, SUBC_NVSW(NV84_SUBCHAN_SEMAPHORE_SEQUENCE), 2);
> +       PUSH_DATA (push, 0x11111111);
> +       PUSH_DATA (push, NV84_SUBCHAN_SEMAPHORE_TRIGGER_ACQUIRE_EQUAL);
> +}
> +
>  Bool
>  NVAccelInitM2MF_NVC0(ScrnInfoPtr pScrn)
>  {
> @@ -153,12 +183,27 @@ NVAccelInit3D_NVC0(ScrnInfoPtr pScrn)
>         if (ret)
>                 return FALSE;
>
> +       ret = nouveau_object_new(pNv->channel, 0x906e, 0x906e,
> +                                NULL, 0, &pNv->NvSW);
> +
>         if (nouveau_pushbuf_space(push, 512, 0, 0) ||
>             nouveau_pushbuf_refn (push, &(struct nouveau_pushbuf_refn) {
>                                         pNv->scratch, NOUVEAU_BO_VRAM |
>                                         NOUVEAU_BO_WR }, 1))
>                 return FALSE;
>
> +       if (!ret) {
> +               BEGIN_NVC0(push, NV01_SUBC(NVSW, OBJECT), 1);
> +               PUSH_DATA (push, pNv->NvSW->handle);
> +               BEGIN_NVC0(push, SUBC_NVSW(0x0200), 2); /* VBLSEM_OFFSET */
> +               PUSH_DATA (push, pNv->notifier_bo->offset >> 32);
> +               PUSH_DATA (push, pNv->notifier_bo->offset);
> +       } else if (pNv->glx_vblank) {
> +               xf86DrvMsg(pScrn->scrnIndex, X_WARNING,
> +                          "No kernel support for GLX sync to VBlank.\n");
> +               pNv->glx_vblank = false;
> +       }
> +
>         BEGIN_NVC0(push, NV01_SUBC(3D, OBJECT), 1);
>         PUSH_DATA (push, pNv->Nv3D->handle);
>         BEGIN_NVC0(push, NVC0_3D(COND_MODE), 1);
> diff --git a/src/nvc0_xv.c b/src/nvc0_xv.c
> index 3b6d01f..86b7948 100644
> --- a/src/nvc0_xv.c
> +++ b/src/nvc0_xv.c
> @@ -221,9 +221,8 @@ nvc0_xv_image_put(ScrnInfoPtr pScrn,
>         PUSH_DATAf(push, 1.0 / width);
>         PUSH_DATAf(push, 1.0 / height);
>
> -       if (0 && pPriv->SyncToVBlank) {
> -               NV50SyncToVBlank(ppix, dstBox);
> -       }
> +       if (pPriv->SyncToVBlank)
> +               NVC0SyncToVBlank(ppix, dstBox);
>
>         /* These are fixed point values in the 16.16 format. */
>         X1 = (float)(x1>>16)+(float)(x1&0xFFFF)/(float)0x10000;
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
