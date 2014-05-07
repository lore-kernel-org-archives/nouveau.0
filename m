From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] nv50/ir/gk110: fix set with f32
	dest
Date: Thu, 8 May 2014 09:57:18 +1000
Message-ID: <CACAvsv7PwmdqdiB0OaoRaUjLfCEou3AkKX7PWWxQ+SZAaTeSDg@mail.gmail.com>
References: <1399420649-15094-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1399420649-15094-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, May 7, 2014 at 9:57 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> Should fix SGE/SSG instructions, which were previously getting integer
> 0/-1 values.
I hit the same issue on Maxwell.  Soo...

>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> index 5992c54..b8d0d3e 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
> @@ -915,6 +915,9 @@ CodeEmitterGK110::emitSET(const CmpInstruction *i)
>           modNegAbsF32_3b(i, 1);
>        }
>        FTZ_(3a);
> +
> +      if (i->dType == TYPE_F32)
> +         code[1] |= 1 << 23;
>     }
>     if (i->sType == TYPE_S32)
>        code[1] |= 1 << 19;
> --
> 1.8.3.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
