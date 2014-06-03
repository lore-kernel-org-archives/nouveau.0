From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2 3/4] nvc0/ir: Handle OP_BFIND when folding
	constant expressions
Date: Tue, 3 Jun 2014 17:05:08 -0400
Message-ID: <CAKb7UvhyoxxoRKmSct+Rau5hGsgcaOUsWk5OmGWpgrmiy718xQ@mail.gmail.com>
References: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401829084-4499-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401829084-4499-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jun 3, 2014 at 4:58 PM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> ---
>  .../drivers/nouveau/codegen/nv50_ir_peephole.cpp       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index a214ffc..c497335 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -948,6 +948,24 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
>     case OP_EX2:
>        unary(i, imm0);
>        break;
> +   case OP_BFIND: {
> +      int32_t res;
> +      switch (i->dType) {
> +      case TYPE_S32:
> +         res = util_last_bit_signed(imm0.reg.data.s32) - 1; break;

The style elsewhere is to do

case TYPE_S32: foo; break;

if it fits. Otherwise put the break on a separate line.

> +      case TYPE_U32:
> +         res = util_last_bit(imm0.reg.data.u32) -1; break;

Missing space between "-" and "1".

> +      default:
> +         return;
> +      }
> +      if ((i->subOp ==  NV50_IR_SUBOP_BFIND_SAMT) && (res >= 0))

No need for the extra parens. && comes after ==.

> +         res = 31 - res;
> +      i->setSrc(0, new_ImmediateValue(i->bb->getProgram(), (uint32_t)res));

Why the typecast?

> +      i->setSrc(1, NULL);
> +      i->op = OP_MOV;
> +      i->subOp = 0;
> +      break;
> +   }
>     default:
>        return;
>     }
> --
> 1.8.4.5
>
