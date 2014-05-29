From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/4] nvc0/ir: Handle reverse subop for
 OP_EXTBF when folding constant expressions
Date: Thu, 29 May 2014 15:47:35 -0400
Message-ID: <CAKb7UvgLpfeM6HL7skM-OXCYjNz8=uD=1fhQb5xLndszw3u0zQ@mail.gmail.com>
References: <53878DE4.4010005@mni.thm.de>
 <1401392636-17704-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1401392636-17704-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401392636-17704-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

Can you verify that you tested how the HW handles this, as well as
exactly how you did it (i.e. how did you modify the code + piglit
test, what the results were, etc)

On Thu, May 29, 2014 at 3:43 PM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> index 58092f4..93f7c2a 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
> @@ -529,8 +529,18 @@ ConstantFolding::expr(Instruction *i,
>           lshift = 32 - width - offset;
>        }
>        switch (i->dType) {
> -      case TYPE_S32: res.data.s32 = (a->data.s32 << lshift) >> rshift; break;
> -      case TYPE_U32: res.data.u32 = (a->data.u32 << lshift) >> rshift; break;
> +      case TYPE_S32: {
> +         res.data.s32 = (res.data.s32 << lshift) >> rshift;
> +         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
> +            res.data.s32 = util_bitreverse(res.data.s32);
> +         break;
> +      }
> +      case TYPE_U32: {
> +         res.data.u32 = (res.data.u32 << lshift) >> rshift;
> +         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
> +            res.data.u32 = util_bitreverse(res.data.u32);
> +         break;
> +      }
>        default:
>           return;
>        }
> --
> 1.8.4.5
>
