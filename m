From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 3/4] nvc0/ir: Handle OP_POPCNT when folding
	constant expressions
Date: Thu, 29 May 2014 15:53:41 -0400
Message-ID: <CAKb7UvgshCGkA+a1Ne1ZXCmpA9fzwG4POnLBEAScnsieOSM5kw@mail.gmail.com>
References: <53878DE4.4010005@mni.thm.de>
 <1401392636-17704-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401392636-17704-3-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401392636-17704-3-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

On Thu, May 29, 2014 at 3:43 PM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index 93f7c2a..68b9a6d 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -546,6 +546,16 @@ ConstantFolding::expr(Instruction *i,
>        }
>        break;
>     }
> +   case OP_POPCNT: {
> +      switch (i->dType) {
> +      case TYPE_S32:
> +      case TYPE_U32:
> +         res.data.u32 = util_bitcount(a->data.u32 & b->data.u32); break;
> +      default:
> +        return;
> +      }
> +      break;
> +   }

Why does the data type matter? I think you can handle this like AND is
handled -- just always do it.

Also, please add support for a single-argument version of POPCNT. This
will happen as a result of lowering for sm50 (maxwell), for which it's
a 1-arg instruction. Basically you need to add a case to opnd() which
checks that there's only one argument and does it accordingly. [The
existing function assumes a float op, and it'd be a pain to modify
it.]

>     default:
>        return;
>     }
> --
> 1.8.4.5
>
