From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gk20a: add LTC device
Date: Wed, 13 Aug 2014 17:09:52 +1000
Message-ID: <CACAvsv5_0Aa-hpx-Mg7BLLW3Ubebfzq1Zq-dz7m_9cF4wu0bEQ@mail.gmail.com>
References: <1407881813-18713-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407881813-18713-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 13, 2014 at 8:16 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> LTC device is now required for PGRAPH to work, add it.
Applied.

I had no idea you didn't use it already.  Any particular reason?  It
provides a nice performance boost, so is good to have P  I'm fixing up
our implementation to not over-allocate vram so much, based on the
Android driver's calculations.  But generally, it looks like what we
have was "safe" and compatible anyways.

Thanks,
Ben.

>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  nvkm/engine/device/nve0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/nvkm/engine/device/nve0.c b/nvkm/engine/device/nve0.c
> index 54ec53bc6252..cdf9147f32a1 100644
> --- a/nvkm/engine/device/nve0.c
> +++ b/nvkm/engine/device/nve0.c
> @@ -163,6 +163,7 @@ nve0_identify(struct nouveau_device *device)
>                 device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
>                 device->oclass[NVDEV_SUBDEV_TIMER  ] = &gk20a_timer_oclass;
>                 device->oclass[NVDEV_SUBDEV_FB     ] =  gk20a_fb_oclass;
> +               device->oclass[NVDEV_SUBDEV_LTC    ] =  gk104_ltc_oclass;
>                 device->oclass[NVDEV_SUBDEV_IBUS   ] = &gk20a_ibus_oclass;
>                 device->oclass[NVDEV_SUBDEV_INSTMEM] = nv50_instmem_oclass;
>                 device->oclass[NVDEV_SUBDEV_VM     ] = &nvc0_vmmgr_oclass;
> --
> 2.0.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
