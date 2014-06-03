From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2 4/4] nvc0/ir: Handle OP_POPCNT when
	folding constant expressions
Date: Tue, 3 Jun 2014 17:01:29 -0400
Message-ID: <CAKb7Uvia8B2vvX2=y6mvzdLY-0K8XiczpR4GS70KO6U7Skppmw@mail.gmail.com>
References: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401829084-4499-5-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401829084-4499-5-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
> V2: Add support for a single-argument version of POPCNT for Maxwell (SM5)
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index c497335..19767b4 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -548,6 +548,10 @@ ConstantFolding::expr(Instruction *i,
>        }
>        break;
>     }
> +   case OP_POPCNT: {
> +         res.data.u32 = util_bitcount(a->data.u32 & b->data.u32); break;
> +      break;

Do you really need 2 breaks here? Also, funy indentation.

> +   }
>     default:
>        return;
>     }
> @@ -966,6 +970,17 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
>        i->subOp = 0;
>        break;
>     }
> +   case OP_POPCNT: {
> +      uint32_t res;
> +      if (!i->srcExists(1)) {
> +         res = util_bitcount(imm0.reg.data.u32);
> +         i->setSrc(0, new_ImmediateValue(i->bb->getProgram(), res));
> +         i->setSrc(1, NULL);

A little overkill -- src(1) already doesn't exist... can get rid of
that, I think.

> +         i->op = OP_MOV;
> +         i->subOp = 0;
> +      }
> +      break;
> +   }
>     default:
>        return;
>     }
> --
> 1.8.4.5
>
