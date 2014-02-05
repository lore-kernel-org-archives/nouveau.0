From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nouveau/codegen: allow tex offsets on non-TXF
 instructions (e.g. TXL)
Date: Wed, 5 Feb 2014 00:46:37 -0500
Message-ID: <CAKb7UvhgXxKiyHGVFX0Q7UgwGitdzar74D7=D4vufkhqNrDxgQ@mail.gmail.com>
References: <1391500708-13881-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1391500708-13881-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 4, 2014 at 2:58 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> This fixes the bin/fs-textureOffset-2D piglit test on nv50. Have yet to re-run
> the full piglit suite with this change in place, but it seems pretty obvious.

BTW, I re-ran the gpu piglits and no regressions with this change.

>
>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> index 51d3d08..b078f2e 100644
> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
> @@ -1729,6 +1729,14 @@ Converter::handleTEX(Value *dst[4], int R, int S, int L, int C, int Dx, int Dy)
>     if (tgsi.getOpcode() == TGSI_OPCODE_SAMPLE_C_LZ)
>        texi->tex.levelZero = true;
>
> +   for (s = 0; s < tgsi.getNumTexOffsets(); ++s) {
> +      for (c = 0; c < 3; ++c) {
> +         texi->tex.offset[s][c] = tgsi.getTexOffset(s).getValueU32(c, info);
> +         if (texi->tex.offset[s][c])
> +            texi->tex.useOffsets = s + 1;
> +      }
> +   }
> +
>     bb->insertTail(texi);
>  }
>
> --
> 1.8.3.2
>
