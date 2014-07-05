From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v4] nv50/ir: Handle OP_CVT when folding
	constant expressions
Date: Sat, 5 Jul 2014 19:36:51 -0400
Message-ID: <CAKb7Uvj3D6sYouqNWw+Sk6CeYWe0ULrqEwApOcygq4LD0USSuA@mail.gmail.com>
References: <1404603019-30266-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404603019-30266-1-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jul 5, 2014 at 7:30 PM, Tobias Klausmann
<tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
> Folding for conversions: F32/64->(U16/32, S16/32) and (U16/32, S16/32)->F32
> No piglit regressions observed on nv50 and nvc0!
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
> V2: fix usage of wrong variable
> V3: enable F64 support
> V4:
>  - disable F64 support again
>  - handle saturate flag: clamp to min/max if needed
>
>  .../drivers/nouveau/codegen/nv50_ir_peephole.cpp   | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index b89da43..c97f8f4 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -970,6 +970,127 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
>        i->op = OP_MOV;
>        break;
>     }
> +   case OP_CVT: {
> +      Storage res;
> +      bld.setPosition(i, true); /* make sure bld is init'ed */
> +      switch(i->dType) {
> +      case TYPE_U16:
> +         switch (i->sType) {
> +         case TYPE_F32:
> +            if (i->saturate) {
> +               int32_t conv = util_iround(imm0.reg.data.f32);

Pretty sure the clamp has to be applied before the conversion is done
-- f32's range is much higher than i32. For example if the f32 value
is like 10^50, we'd want the result here to be 65535. However it's
unclear to me what util_iround would do here -- would have to
double-check the standard on that. Or write a small program to see
what happens, should be pretty quick and easy :)

> +               res.data.u16 = (conv < 0) ? 0 : CLAMP((uint32_t)conv, 0,
> +                                                     UINT16_MAX);
> +            }
> +            else res.data.u16 = util_iround(imm0.reg.data.f32);
> +            break;
> +         case TYPE_F64:
> +            if (i->saturate) {
> +               int32_t conv = util_iround(imm0.reg.data.f64);
> +               res.data.u16 = (conv < 0) ? 0 : CLAMP((uint32_t)conv, 0,
> +                                                     UINT16_MAX);
> +            }
> +            else res.data.u16 = util_iround(imm0.reg.data.f64);
> +            break;
> +         default:
> +            return;
> +         }
> +         i->setSrc(0, bld.mkImm(res.data.u16));
> +         break;
> +      case TYPE_U32:
> +         switch (i->sType) {
> +         case TYPE_F32:
> +            if (i->saturate) {
> +               int32_t conv = util_iround(imm0.reg.data.f32);
> +               res.data.u32 = (conv < 0) ? 0 : CLAMP((uint32_t)conv, 0,
> +                                                     UINT32_MAX);
> +            }
> +            else res.data.u32 = util_iround(imm0.reg.data.f32);
> +            break;
> +         case TYPE_F64:
> +            if (i->saturate) {
> +               int32_t conv = util_iround(imm0.reg.data.f64);
> +               res.data.u32 = (conv < 0) ? 0 : CLAMP((uint32_t)conv, 0,
> +                                                     UINT32_MAX);
> +            }
> +         else res.data.u32 = util_iround(imm0.reg.data.f64);
> +         break;
> +         default:
> +            return;
> +         }
> +         i->setSrc(0, bld.mkImm(res.data.u32));
> +         break;
> +      case TYPE_S16:
> +         switch (i->sType) {
> +         case TYPE_F32:
> +            if (i->saturate)
> +               res.data.s16 = CLAMP(util_iround(imm0.reg.data.f32), INT16_MIN,
> +                                    INT16_MAX);
> +            else res.data.s16 = util_iround(imm0.reg.data.f32);
> +            break;
> +         case TYPE_F64:
> +            if (i->saturate)
> +               res.data.s16 = CLAMP(util_iround(imm0.reg.data.f64), INT16_MIN,
> +                                    INT16_MAX);
> +            else res.data.s16 = util_iround(imm0.reg.data.f64);
> +         break;
> +         default:
> +            return;
> +         }
> +         i->setSrc(0, bld.mkImm(res.data.s16));
> +         break;
> +      case TYPE_S32:
> +         switch (i->sType) {
> +         case TYPE_F32:
> +            if (i->saturate)
> +               res.data.s32 = CLAMP(util_iround(imm0.reg.data.f32), INT32_MIN,
> +                                    INT32_MAX);
> +            else res.data.s32 = util_iround(imm0.reg.data.f32);
> +            break;
> +         case TYPE_F64:
> +            if (i->saturate)
> +               res.data.s32 = CLAMP(util_iround(imm0.reg.data.f64), INT32_MIN,
> +                                    INT32_MAX);
> +            else res.data.s32 = util_iround(imm0.reg.data.f64);
> +            break;
> +         default:
> +            return;
> +         }
> +         i->setSrc(0, bld.mkImm(res.data.s32));
> +         break;
> +      case TYPE_F32:
> +         switch (i->sType) {
> +         case TYPE_U16: res.data.f32 = (float) imm0.reg.data.u16; break;
> +         case TYPE_U32: res.data.f32 = (float) imm0.reg.data.u32; break;
> +         case TYPE_S16: res.data.f32 = (float) imm0.reg.data.s16; break;
> +         case TYPE_S32: res.data.f32 = (float) imm0.reg.data.s32; break;
> +         default:
> +            return;
> +         }
> +         i->setSrc(0, bld.mkImm(res.data.f32));
> +         break;
> +      /* TODO: Check if this works, after F64 support is available */
> +      /*case TYPE_F64:
> +         switch (i->sType) {
> +         case TYPE_U16: res.data.f64 = (double) imm0.reg.data.u16; break;
> +         case TYPE_U32: res.data.f64 = (double) imm0.reg.data.u32; break;
> +         case TYPE_S16: res.data.f64 = (double) imm0.reg.data.s16; break;
> +         case TYPE_S32: res.data.f64 = (double) imm0.reg.data.s32; break;
> +         default:
> +            return;
> +         }
> +         i->setSrc(0, bld.mkImm(res.data.f64));
> +         break;*/
> +      default:
> +         return;
> +      }
> +      i->setType(i->dType); /* Remove i->sType, which we don't need anymore */
> +      i->setSrc(1, NULL);
> +      i->op = OP_MOV;
> +
> +      i->src(0).mod = Modifier(0); /* Clear the already applied modifier */
> +      break;
> +   }
>     default:
>        return;
>     }
> --
> 1.8.4.5
>
