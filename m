From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
Date: Tue, 25 Aug 2020 08:28:56 +1000
Message-ID: <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
References: <20200824183253.826343-1-lyude@redhat.com> <20200824183253.826343-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200824183253.826343-2-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
>
> Not entirely sure why this never came up when I originally tested this
> (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> appears to cause the display engine to throw an exception on driver
> init, at least on my ThinkPad P72:
>
> nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b
>
> This is magic nvidia speak for "You need to have the DMA notifier offset
> programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> this by doing that, and also perform an update afterwards to prevent
> racing with the GPU when reading capabilities.
>
> Changes since v1:
> * Don't just program the DMA notifier offset, make sure to actually
>   perform an update
I'm not sure there's a need to send an Update() method here, I believe
GetCapabilities() is an action method on its own right?

Ben.

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support")
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> index e341f572c2696..5e86feec3b720 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
>  int
>  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
>  {
> -       u32 *push = evo_wait(&disp->core->chan, 2);
> +       struct nv50_core *core = disp->core;
> +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> +       u32 *push;
>
> -       if (push) {
> -               evo_mthd(push, 0x008c, 1);
> -               evo_data(push, 0x0);
> -               evo_kick(push, &disp->core->chan);
> -       }
> +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> +
> +       push = evo_wait(&core->chan, 4);
> +       if (!push)
> +               return 0;
> +
> +       evo_mthd(push, 0x0084, 1);
> +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> +       evo_mthd(push, 0x008c, 1);
> +       evo_data(push, 0x0);
> +       evo_kick(push, &core->chan);
> +
> +       core->func->update(core, interlock, false);
> +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> +                                      core->chan.base.device))
> +               NV_ERROR(drm, "core notifier timeout\n");
>
>         return 0;
>  }
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
