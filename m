From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/3] gk110/ir: emit texbar the same
 way that the blob does
Date: Sat, 7 Jun 2014 08:20:53 +1000
Message-ID: <CACAvsv4bBp0DzyMFAq-Zd22hc-WNfgQYZhHnba1CK9RWbkhP7A@mail.gmail.com>
References: <1402083823-23828-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1402083823-23828-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "10.2" <mesa-stable@lists.freedestkop.org>, Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jun 7, 2014 at 5:43 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: "10.2" <mesa-stable@lists.freedestkop.org>
For the series:

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> index b8d0d3e..d566c99 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> @@ -967,7 +967,7 @@ void CodeEmitterGK110::emitSELP(const Instruction *i)
>
>  void CodeEmitterGK110::emitTEXBAR(const Instruction *i)
>  {
> -   code[0] = 0x00000002 | (i->subOp << 23);
> +   code[0] = 0x0000003e | (i->subOp << 23);
>     code[1] = 0x77000000;
>
>     emitPredicate(i);
> --
> 1.8.5.5
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
