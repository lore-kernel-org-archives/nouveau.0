From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/nouveau: Replaced magic numbers with
 defines from nouveau_reg
Date: Tue, 12 Aug 2014 08:43:57 -0400
Message-ID: <CAKb7UvhcQ5S+JD9qMCmQC_CMKgt24UJwSvoEiebkJx=APzR7qw@mail.gmail.com>
References: <1407834309-16817-1-git-send-email-joel@airwebreathe.org.uk>
 <1407834309-16817-3-git-send-email-joel@airwebreathe.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407834309-16817-3-git-send-email-joel-IJEoVVyKhCJXvIrf17iDB/XRex20P6io@public.gmane.org>
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

As you've no doubt noticed, using "magic" numbers is the convention
used throughout the driver (except dispnv04 which is in a world of its
own), rather than the (occasional) macros. It's a trade-off, since the
magic numbers are a little harder to read, but they're much easier to
match up in traces. Eventually you start to remember what the various
numbers mean... or you can look them up with the "lookup" utility in
envytools.

On Tue, Aug 12, 2014 at 5:05 AM, Joel Holdsworth
<joel.holdsworth-EQPyqoE4rJiYoAmmQSGB5AC/G2K4zDHf@public.gmane.org> wrote:
> ---
>  drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c | 27 +++++++++++++---------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> index b36addf..61e29d6 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c
> @@ -31,11 +31,12 @@
>  #include <subdev/timer.h>
>
>  #include "nv50.h"
> +#include "nouveau_reg.h"
>
>  int
>  nv50_dac_power(NV50_DISP_MTHD_V1)
>  {
> -       const u32 doff = outp->or * 0x800;
> +       const u32 dpms_ctrl = NV50_PDISPLAY_DAC_DPMS_CTRL(outp->or);
>         union {
>                 struct nv50_disp_dac_pwr_v0 v0;
>         } *args = data;
> @@ -55,19 +56,21 @@ nv50_dac_power(NV50_DISP_MTHD_V1)
>         } else
>                 return ret;
>
> -       nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
> -       nv_mask(priv, 0x61a004 + doff, 0xc000007f, 0x80000000 | stat);
> -       nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
> +       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
> +       nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x4000007f,
> +               NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | stat);
> +       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
>         return 0;
>  }
>
>  int
>  nv50_dac_sense(NV50_DISP_MTHD_V1)
>  {
> +       const u32 dpms_ctrl = NV50_PDISPLAY_DAC_DPMS_CTRL(outp->or);
> +       const u32 load_ctrl = NV50_PDISPLAY_DAC_LOAD_CTRL(outp->or);
>         union {
>                 struct nv50_disp_dac_load_v0 v0;
>         } *args = data;
> -       const u32 doff = outp->or * 0x800;
>         u32 loadval;
>         int ret;
>
> @@ -81,16 +84,18 @@ nv50_dac_sense(NV50_DISP_MTHD_V1)
>         } else
>                 return ret;
>
> -       nv_mask(priv, 0x61a004 + doff, 0x807f0000, 0x80150000);
> -       nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
> +       nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
> +               NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00150000);
> +       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
>
> -       nv_wr32(priv, 0x61a00c + doff, 0x00100000 | loadval);
> +       nv_wr32(priv, load_ctrl, 0x00100000 | loadval);
>         mdelay(9);
>         udelay(500);
> -       loadval = nv_mask(priv, 0x61a00c + doff, 0xffffffff, 0x00000000);
> +       loadval = nv_mask(priv, load_ctrl, 0xffffffff, 0x00000000);
>
> -       nv_mask(priv, 0x61a004 + doff, 0x807f0000, 0x80550000);
> -       nv_wait(priv, 0x61a004 + doff, 0x80000000, 0x00000000);
> +       nv_mask(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x007f0000,
> +               NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING | 0x00550000);
> +       nv_wait(priv, dpms_ctrl, NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING, 0);
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
