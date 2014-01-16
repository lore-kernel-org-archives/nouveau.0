From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] drm/nv50/graph: add more trap names to print
	on error
Date: Thu, 16 Jan 2014 02:14:15 -0500
Message-ID: <CAKb7Uvi6w-CH8TAQnZEy9Hx+5DTMCNL9DrAMTvmBN4dPVm5hgQ@mail.gmail.com>
References: <1389852838-7947-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389852838-7947-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 16, 2014 at 1:13 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> I made the assumption that showing the address is generally useful. Worst
> case, it won't make sense but still be displayed. Seems simpler than
> special-casing things.

Erm, I have a better version of this coming that uses
nouveau_bitfield_print. Ignore this.

>
>  drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 117 ++++++++++++-----------
>  1 file changed, 63 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> index 03de517..3bdb158 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> @@ -396,6 +396,63 @@ static const struct nouveau_bitfield nv50_graph_intr_name[] = {
>         {}
>  };
>
> +static const struct nouveau_bitfield nv50_graph_trap_prop[] = {
> +       { 0x00000004, "SURF_WIDTH_OVERRUN" },
> +       { 0x00000008, "SURF_HEIGHT_OVERRUN" },
> +       { 0x00000010, "DST2D_FAULT" },
> +       { 0x00000020, "ZETA_FAULT" },
> +       { 0x00000040, "RT_FAULT" },
> +       { 0x00000080, "CUDA_FAULT" },
> +       { 0x00000100, "DST2D_STORAGE_TYPE_MISMATCH" },
> +       { 0x00000200, "ZETA_STORAGE_TYPE_MISMATCH" },
> +       { 0x00000400, "RT_STORAGE_TYPE_MISMATCH" },
> +       { 0x00000800, "DST2D_LINEAR_MISMATCH" },
> +       { 0x00001000, "RT_LINEAR_MISMATCH" },
> +       {}
> +};
> +
> +static u32
> +nv50_priv_prop_trap(struct nv50_graph_priv *priv,
> +                   u32 ustatus_addr, u32 ustatus, u32 tp)
> +{
> +       u32 e0c = nv_rd32(priv, ustatus_addr + 0x04);
> +       u32 e10 = nv_rd32(priv, ustatus_addr + 0x08);
> +       u32 e14 = nv_rd32(priv, ustatus_addr + 0x0c);
> +       u32 e18 = nv_rd32(priv, ustatus_addr + 0x10);
> +       u32 e1c = nv_rd32(priv, ustatus_addr + 0x14);
> +       u32 e20 = nv_rd32(priv, ustatus_addr + 0x18);
> +       u32 e24 = nv_rd32(priv, ustatus_addr + 0x1c);
> +       int i;
> +
> +       /* CUDA memory: l[], g[] or stack. */
> +       if (ustatus & 0x00000080) {
> +               if (e18 & 0x80000000) {
> +                       /* g[] read fault? */
> +                       nv_error(priv, "TRAP_PROP - TP %d - CUDA_FAULT - Global read fault at address %02x%08x\n",
> +                                        tp, e14, e10 | ((e18 >> 24) & 0x1f));
> +                       e18 &= ~0x1f000000;
> +               } else if (e18 & 0xc) {
> +                       /* g[] write fault? */
> +                       nv_error(priv, "TRAP_PROP - TP %d - CUDA_FAULT - Global write fault at address %02x%08x\n",
> +                                tp, e14, e10 | ((e18 >> 7) & 0x1f));
> +                       e18 &= ~0x00000f80;
> +               } else {
> +                       nv_error(priv, "TRAP_PROP - TP %d - Unknown CUDA fault at address %02x%08x\n",
> +                                tp, e14, e10);
> +               }
> +               ustatus &= ~0x00000080;
> +       }
> +       for (i = 0; nv50_graph_trap_prop[i].mask && ustatus; i++) {
> +               if (ustatus & nv50_graph_trap_prop[i].mask)
> +                       nv_error(priv, "TRAP_PROP - TP %d - %s - Address %02x%08x\n",
> +                                tp, nv50_graph_trap_prop[i].name, e14, e10);
> +               ustatus &= ~nv50_graph_trap_prop[i].mask;
> +       }
> +       nv_error(priv, "TRAP_PROP - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
> +                tp, e0c, e18, e1c, e20, e24);
> +       return ustatus;
> +}
> +
>  static void
>  nv50_priv_mp_trap(struct nv50_graph_priv *priv, int tpid, int display)
>  {
> @@ -469,58 +526,10 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
>                                 ustatus &= ~0x04030000;
>                         }
>                         break;
> -               case 8: /* TPDMA error */
> -                       {
> -                       u32 e0c = nv_rd32(priv, ustatus_addr + 4);
> -                       u32 e10 = nv_rd32(priv, ustatus_addr + 8);
> -                       u32 e14 = nv_rd32(priv, ustatus_addr + 0xc);
> -                       u32 e18 = nv_rd32(priv, ustatus_addr + 0x10);
> -                       u32 e1c = nv_rd32(priv, ustatus_addr + 0x14);
> -                       u32 e20 = nv_rd32(priv, ustatus_addr + 0x18);
> -                       u32 e24 = nv_rd32(priv, ustatus_addr + 0x1c);
> -                       /* 2d engine destination */
> -                       if (ustatus & 0x00000010) {
> -                               if (display) {
> -                                       nv_error(priv, "TRAP_TPDMA_2D - TP %d - Unknown fault at address %02x%08x\n",
> -                                                       i, e14, e10);
> -                                       nv_error(priv, "TRAP_TPDMA_2D - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
> -                                                       i, e0c, e18, e1c, e20, e24);
> -                               }
> -                               ustatus &= ~0x00000010;
> -                       }
> -                       /* Render target */
> -                       if (ustatus & 0x00000040) {
> -                               if (display) {
> -                                       nv_error(priv, "TRAP_TPDMA_RT - TP %d - Unknown fault at address %02x%08x\n",
> -                                                       i, e14, e10);
> -                                       nv_error(priv, "TRAP_TPDMA_RT - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
> -                                                       i, e0c, e18, e1c, e20, e24);
> -                               }
> -                               ustatus &= ~0x00000040;
> -                       }
> -                       /* CUDA memory: l[], g[] or stack. */
> -                       if (ustatus & 0x00000080) {
> -                               if (display) {
> -                                       if (e18 & 0x80000000) {
> -                                               /* g[] read fault? */
> -                                               nv_error(priv, "TRAP_TPDMA - TP %d - Global read fault at address %02x%08x\n",
> -                                                               i, e14, e10 | ((e18 >> 24) & 0x1f));
> -                                               e18 &= ~0x1f000000;
> -                                       } else if (e18 & 0xc) {
> -                                               /* g[] write fault? */
> -                                               nv_error(priv, "TRAP_TPDMA - TP %d - Global write fault at address %02x%08x\n",
> -                                                               i, e14, e10 | ((e18 >> 7) & 0x1f));
> -                                               e18 &= ~0x00000f80;
> -                                       } else {
> -                                               nv_error(priv, "TRAP_TPDMA - TP %d - Unknown CUDA fault at address %02x%08x\n",
> -                                                               i, e14, e10);
> -                                       }
> -                                       nv_error(priv, "TRAP_TPDMA - TP %d - e0c: %08x, e18: %08x, e1c: %08x, e20: %08x, e24: %08x\n",
> -                                                       i, e0c, e18, e1c, e20, e24);
> -                               }
> -                               ustatus &= ~0x00000080;
> -                       }
> -                       }
> +               case 8: /* PROP error */
> +                       if (display)
> +                               ustatus = nv50_priv_prop_trap(
> +                                               priv, ustatus_addr, ustatus, i);
>                         break;
>                 }
>                 if (ustatus) {
> @@ -727,11 +736,11 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
>                 status &= ~0x080;
>         }
>
> -       /* TPDMA:  Handles TP-initiated uncached memory accesses:
> +       /* PROP:  Handles TP-initiated uncached memory accesses:
>          * l[], g[], stack, 2d surfaces, render targets. */
>         if (status & 0x100) {
>                 nv50_priv_tp_trap(priv, 8, 0x408e08, 0x408708, display,
> -                                   "TRAP_TPDMA");
> +                                   "TRAP_PROP");
>                 nv_wr32(priv, 0x400108, 0x100);
>                 status &= ~0x100;
>         }
> --
> 1.8.3.2
>
