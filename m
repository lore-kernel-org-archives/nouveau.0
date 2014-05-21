From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 04/12] nv50/ir/tgsi: TGSI_OPCODE_POW
 replicates its result
Date: Wed, 21 May 2014 19:51:03 +0100
Message-ID: <537CF597.4080406@gmail.com>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
 <1400629206-4447-5-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1400629206-4447-5-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>, mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: "10.2" <mesa-stable@lists.freedesktop.org>, emil.l.velikov@gmail.com, Christoph Bumiller <christoph.bumiller@speed.at>
List-Id: nouveau.vger.kernel.org

On 21/05/14 00:39, Ilia Mirkin wrote:
> From: Christoph Bumiller <christoph.bumiller@speed.at>
> 
> Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: "10.2" <mesa-stable@lists.freedesktop.org>
> ---
>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index 3e44bf9..e24be51 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -2199,7 +2199,6 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
>     case TGSI_OPCODE_IMUL_HI:
>     case TGSI_OPCODE_UMUL_HI:
>     case TGSI_OPCODE_OR:
> -   case TGSI_OPCODE_POW:
>     case TGSI_OPCODE_SHL:
>     case TGSI_OPCODE_ISHR:
>     case TGSI_OPCODE_USHR:
> @@ -2254,6 +2253,11 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
>        FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
>           mkOp1(OP_MOV, TYPE_U32, dst0[c], fetchSrc(0, c));
>        break;
> +   case TGSI_OPCODE_POW:
> +      val0 = mkOp2v(op, TYPE_F32, getScratch(), fetchSrc(0, 0), fetchSrc(1, 0));
> +      FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
> +         mkOp1(OP_MOV, TYPE_F32, dst0[c], val0);
> +      break;
Can you use mkMov ? Pretty please :)

-Emil
>     case TGSI_OPCODE_EX2:
>     case TGSI_OPCODE_LG2:
>        val0 = mkOp1(op, TYPE_F32, getScratch(), fetchSrc(0, 0))->getDef(0);
> 
