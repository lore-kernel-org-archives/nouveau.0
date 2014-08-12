From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/nouveau: Replaced copy-pasted nv_wait
 with nv50_wait_dpms_ctrl helper
Date: Tue, 12 Aug 2014 08:45:01 -0400
Message-ID: <CAKb7UviKyUOgeJtbOHtFrHk9ti6Y2wnoLEjx5yLMdGS8Y0TU=A@mail.gmail.com>
References: <1407834309-16817-1-git-send-email-joel@airwebreathe.org.uk>
 <1407834309-16817-4-git-send-email-joel@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407834309-16817-4-git-send-email-joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Joel Holdsworth <joel.holdsworth-EQPyqoE4rJiYoAmmQSGB5AC/G2K4zDHf@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Aug 12, 2014 at 5:05 AM, Joel Holdsworth
<joel.holdsworth-EQPyqoE4rJiYoAmmQSGB5AC/G2K4zDHf@public.gmane.org> wrote:
> ---
>  drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> index 61e29d6..98bded6 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> @@ -33,6 +33,12 @@
>  #include "nv50.h"
>  #include "nouveau_reg.h"
>
> +static void
> +nv50_wait_dpms_ctrl(struct nv50_disp_priv *priv, const u32 dpms_ctrl)
> +{
> +       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
> +}
> +
>  int
>  nv50_dac_power(NV50_DISP_MTHD_V1)
>  {
> @@ -56,10 +62,10 @@ nv50_dac_power(NV50_DISP_MTHD_V1)
>         } else
>                 return ret;
>
> -       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
> +       nv50_wait_dpms_ctrl(priv, dpms_ctrl);
>         nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x4000007f,
>                 NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | stat);
> -       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
> +       nv50_wait_dpms_ctrl(priv, dpms_ctrl);

This feels like it's hiding what's going on. If it was some complex
procedure done over and over -- fine, but in this case, it's just one
line...

>         return 0;
>  }
>
> @@ -86,7 +92,7 @@ nv50_dac_sense(NV50_DISP_MTHD_V1)
>
>         nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
>                 NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00150000);
> -       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
> +       nv50_wait_dpms_ctrl(priv, dpms_ctrl);
>
>         nv_wr32(priv, load_ctrl, 0x00100000 | loadval);
>         mdelay(9);
> @@ -95,7 +101,7 @@ nv50_dac_sense(NV50_DISP_MTHD_V1)
>
>         nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
>                 NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00550000);
> -       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
> +       nv50_wait_dpms_ctrl(priv, dpms_ctrl);
>
>         nv_debug(priv, "DAC%d sense: 0x%08x\n", outp->or, loadval);
>         if (!(loadval & 0x80000000))
> --
> 1.9.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
