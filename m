From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvc0/ir: Handle reverse subop for
 OP_EXTBF when folding constant expressions
Date: Tue, 3 Jun 2014 17:03:11 -0400
Message-ID: <CAKb7UvhiaBTyPaq9J0q=oyw=6kpQMsHAeNt1qKA4KWrzN=2+oA@mail.gmail.com>
References: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401829084-4499-3-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1401829084-4499-3-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jun 3, 2014 at 4:58 PM, Tobias Klausmann
<tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
> V2: Handle the instruction right (shift after reverse)
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index 58092f4..a214ffc 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -529,8 +529,20 @@ ConstantFolding::expr(Instruction *i,
>           lshift = 32 - width - offset;
>        }
>        switch (i->dType) {
> -      case TYPE_S32: res.data.s32 = (a->data.s32 << lshift) >> rshift; break;
> -      case TYPE_U32: res.data.u32 = (a->data.u32 << lshift) >> rshift; break;
> +      case TYPE_S32:
> +         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
> +            res.data.s32 = util_bitreverse(a->data.s32);
> +         else
> +            res.data.s32 = a->data.s32;

Why not do this once outside of the switch statement? The two are
actually the same -- util_bitreverse doesn't care about
signed/unsigned, and res.data is a union.

> +         res.data.s32 = (res.data.s32 << lshift) >> rshift;
> +         break;
> +      case TYPE_U32:
> +         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
> +            res.data.u32 = util_bitreverse(a->data.u32);
> +         else
> +            res.data.u32 = a->data.u32;
> +         res.data.u32 = (res.data.u32 << lshift) >> rshift;
> +         break;
>        default:
>           return;
>        }
> --
> 1.8.4.5
>
