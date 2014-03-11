From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv50/ir/gk110: fix some instruction emission
Date: Tue, 11 Mar 2014 19:57:42 +1000
Message-ID: <CACAvsv7kbDT+a+yKGRO=p1ScDMazPqXE=Bxjgd6cxQOzq-VK7A@mail.gmail.com>
References: <1394531221-7090-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1394531221-7090-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 11, 2014 at 7:47 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Information for this was gathered from nvdisasm.
>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> Entirely untested. Ben, do you think you'll be able to give this a shot?
I'll try and take a moment in the next couple of days to give it a go.

>
>  .../drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp | 33 +++++++++++-----------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> index fe428ca..84f4413 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> @@ -738,8 +738,7 @@ CodeEmitterGK110::emitSFnOp(const Instruction *i, uint8_t subOp)
>
>     NEG_(33, 0);
>     ABS_(31, 0);
> -
> -   // XXX: find saturate
> +   SAT_(35, 0);
>  }
>
>  void
> @@ -1073,32 +1072,32 @@ CodeEmitterGK110::emitFlow(const Instruction *i)
>
>     switch (i->op) {
>     case OP_BRA:
> -      code[1] = f->absolute ? 0x00000 : 0x12000000; // XXX
> -      // if (i->srcExists(0) && i->src(0).getFile() == FILE_MEMORY_CONST)
> -      //   code[0] |= 0x4000;
> +      code[1] = f->absolute ? 0x11000000 : 0x12000000;
> +      if (i->srcExists(0) && i->src(0).getFile() == FILE_MEMORY_CONST)
> +         code[0] |= 0x80;
>        mask = 3;
>        break;
>     case OP_CALL:
> -      code[1] = f->absolute ? 0x00000 : 0x13000000; // XXX
> -      // if (i->srcExists(0) && i->src(0).getFile() == FILE_MEMORY_CONST)
> -      //   code[0] |= 0x4000;
> +      code[1] = f->absolute ? 0x11000000 : 0x13000000;
> +      if (i->srcExists(0) && i->src(0).getFile() == FILE_MEMORY_CONST)
> +         code[0] |= 0x80;
>        mask = 2;
>        break;
>
>     case OP_EXIT:    code[1] = 0x18000000; mask = 1; break;
>     case OP_RET:     code[1] = 0x19000000; mask = 1; break;
> -   case OP_DISCARD: code[1] = 0x19800000; mask = 1; break; // XXX: guess
> -   case OP_BREAK:   code[1] = 0x1a800000; mask = 1; break; // XXX: guess
> -   case OP_CONT:    code[1] = 0x1b000000; mask = 1; break; // XXX: guess
> +   case OP_DISCARD: code[1] = 0x19800000; mask = 1; break;
> +   case OP_BREAK:   code[1] = 0x1a000000; mask = 1; break;
> +   case OP_CONT:    code[1] = 0x1a800000; mask = 1; break;
>
>     case OP_JOINAT:   code[1] = 0x14800000; mask = 2; break;
> -   case OP_PREBREAK: code[1] = 0x15000000; mask = 2; break; // XXX: guess
> -   case OP_PRECONT:  code[1] = 0x15800000; mask = 2; break; // XXX: guess
> -   case OP_PRERET:   code[1] = 0x16000000; mask = 2; break; // XXX: guess
> +   case OP_PREBREAK: code[1] = 0x15000000; mask = 2; break;
> +   case OP_PRECONT:  code[1] = 0x15800000; mask = 2; break;
> +   case OP_PRERET:   code[1] = 0x13800000; mask = 2; break;
>
> -   case OP_QUADON:  code[1] = 0x1c000000; mask = 0; break; // XXX: guess
> -   case OP_QUADPOP: code[1] = 0x1c800000; mask = 0; break; // XXX: guess
> -   case OP_BRKPT:   code[1] = 0x1d000000; mask = 0; break; // XXX: guess
> +   case OP_QUADON:  code[1] = 0x1b000000; mask = 0; break;
> +   case OP_QUADPOP: code[1] = 0x1c000000; mask = 0; break;
> +   case OP_BRKPT:   code[1] = 0x00000000; mask = 0; break;
>     default:
>        assert(!"invalid flow operation");
>        return;
> --
> 1.8.3.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
