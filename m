From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] nv50/exa: use dual-source blending for
 component-alpha composite
Date: Mon, 31 May 2010 11:49:30 +1000
Message-ID: <1275270570.2797.4.camel@nisroch>
References: <1275270288-2764-1-git-send-email-skeggsb@gmail.com>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1275270288-2764-1-git-send-email-skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2010-05-31 at 11:44 +1000, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

This is the result of some playing around, thought it'd be useful so
sending to the list for some sanity checking first, particularly in the
shader setup.

I would assume we'd need to in the very least bump up FP_REG_ALLOC_TEMP
from its default?  I had to in a test, but this passes rendercheck etc
fine even without.

This removes the need for the two-pass CA Over rendering pass by EXA,
and allows us to accelerate a few other CA composite operations that we
couldn't previously.

Ben.

> 
> ---
>  src/nv50_accel.c |   38 ++++++++------------------------------
>  src/nv50_accel.h |    1 -
>  src/nv50_exa.c   |   45 ++++++++++++++++++++-------------------------
>  3 files changed, 28 insertions(+), 56 deletions(-)
> 
> diff --git a/src/nv50_accel.c b/src/nv50_accel.c
> index 1218e18..db8c744 100644
> --- a/src/nv50_accel.c
> +++ b/src/nv50_accel.c
> @@ -213,7 +213,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
>  	OUT_RING  (chan, (0 << NV50TCL_CB_DEF_SET_BUFFER_SHIFT) | 0x4000);
>  	BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
>  	OUT_RING  (chan, 0);
> -	BEGIN_RING_NI(chan, tesla, NV50TCL_CB_DATA(0), 16);
> +	BEGIN_RING_NI(chan, tesla, NV50TCL_CB_DATA(0), 22);
>  	OUT_RING  (chan, 0x80000000);
>  	OUT_RING  (chan, 0x90000004);
>  	OUT_RING  (chan, 0x82030210);
> @@ -228,36 +228,14 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
>  	OUT_RING  (chan, 0xc0050204);
>  	OUT_RING  (chan, 0xc0060409);
>  	OUT_RING  (chan, 0x00000780);
> -	OUT_RING  (chan, 0xc007060d);
> -	OUT_RING  (chan, 0x00000781);
> -	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
> -	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_CCASA,
> -		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
> -	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_CCASA,
> -		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
> -		MARK_UNDO(chan);
> -		return FALSE;
> -	}
> -	OUT_RING  (chan, (0 << NV50TCL_CB_DEF_SET_BUFFER_SHIFT) | 0x4000);
> -	BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
> -	OUT_RING  (chan, 0);
> -	BEGIN_RING_NI(chan, tesla, NV50TCL_CB_DATA(0), 16);
> -	OUT_RING  (chan, 0x80000000);
> -	OUT_RING  (chan, 0x90000004);
> -	OUT_RING  (chan, 0x82030200);
> -	OUT_RING  (chan, 0x82040204);
> -	OUT_RING  (chan, 0x82010210);
> -	OUT_RING  (chan, 0x82020214);
> -	OUT_RING  (chan, 0xf6400201);
> -	OUT_RING  (chan, 0x0000c784);
> -	OUT_RING  (chan, 0xf0400011);
> -	OUT_RING  (chan, 0x00008784);
> -	OUT_RING  (chan, 0xc0040000);
> -	OUT_RING  (chan, 0xc0040204);
> -	OUT_RING  (chan, 0xc0040409);
> +	OUT_RING  (chan, 0xc0040610);
> +	OUT_RING  (chan, 0xc0050614);
> +	OUT_RING  (chan, 0xc0060619);
>  	OUT_RING  (chan, 0x00000780);
> -	OUT_RING  (chan, 0xc004060d);
> -	OUT_RING  (chan, 0x00000781);
> +	OUT_RING  (chan, 0xc007061d);
> +	OUT_RING  (chan, 0x00000780);
> +	OUT_RING  (chan, 0x10000e0d);
> +	OUT_RING  (chan, 0x0403c781);
>  	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
>  	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_S_A8,
>  		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
> diff --git a/src/nv50_accel.h b/src/nv50_accel.h
> index f5ccd92..4a885b5 100644
> --- a/src/nv50_accel.h
> +++ b/src/nv50_accel.h
> @@ -11,7 +11,6 @@
>  #define PFP_S     0x0000 /* (src) */
>  #define PFP_C     0x0100 /* (src IN mask) */
>  #define PFP_CCA   0x0200 /* (src IN mask) component-alpha */
> -#define PFP_CCASA 0x0300 /* (src IN mask) component-alpha src-alpha */
>  #define PFP_S_A8  0x0400 /* (src) a8 rt */
>  #define PFP_C_A8  0x0500 /* (src IN mask) a8 rt - same for CA and CA_SA */
>  #define PFP_NV12  0x0600 /* NV12 YUV->RGB */
> diff --git a/src/nv50_exa.c b/src/nv50_exa.c
> index e86f903..8bacdf0 100644
> --- a/src/nv50_exa.c
> +++ b/src/nv50_exa.c
> @@ -751,7 +751,7 @@ NV50EXABlend(PixmapPtr ppix, PicturePtr ppict, int op, int component_alpha)
>  	NV50EXA_LOCALS(ppix);
>  	struct nv50_blend_op *b = &NV50EXABlendOp[op];
>  	unsigned sblend = b->src_blend;
> -	unsigned dblend = b->dst_blend;
> +	unsigned dblend = b->dst_blend, dblend_a = b->dst_blend;
>  
>  	if (b->dst_alpha) {
>  		if (!PICT_FORMAT_A(ppict->format)) {
> @@ -764,11 +764,18 @@ NV50EXABlend(PixmapPtr ppix, PicturePtr ppict, int op, int component_alpha)
>  	}
>  
>  	if (b->src_alpha && component_alpha) {
> -		if (dblend == BF(SRC_ALPHA))
> -			dblend = BF(SRC_COLOR);
> -		else
> -		if (dblend == BF(ONE_MINUS_SRC_ALPHA))
> -			dblend = BF(ONE_MINUS_SRC_COLOR);
> +		switch (dblend) {
> +		case BF(SRC_ALPHA):
> +			dblend   = BF(SRC1_COLOR);
> +			dblend_a = BF(SRC1_ALPHA);
> +			break;
> +		case BF(ONE_MINUS_SRC_ALPHA):
> +			dblend   = BF(ONE_MINUS_SRC1_COLOR);
> +			dblend_a = BF(ONE_MINUS_SRC1_ALPHA);
> +			break;
> +		default:
> +			break;
> +		}
>  	}
>  
>  	if (sblend == BF(ONE) && dblend == BF(ZERO)) {
> @@ -784,7 +791,7 @@ NV50EXABlend(PixmapPtr ppix, PicturePtr ppict, int op, int component_alpha)
>  		OUT_RING  (chan, NV50TCL_BLEND_EQUATION_ALPHA_FUNC_ADD);
>  		OUT_RING  (chan, sblend);
>  		BEGIN_RING(chan, tesla, NV50TCL_BLEND_FUNC_DST_ALPHA, 1);
> -		OUT_RING  (chan, dblend);
> +		OUT_RING  (chan, dblend_a);
>  	}
>  }
>  
> @@ -802,12 +809,6 @@ NV50EXACheckComposite(int op,
>  		NOUVEAU_FALLBACK("src picture invalid\n");
>  
>  	if (pmpict) {
> -		if (pmpict->componentAlpha &&
> -		    PICT_FORMAT_RGB(pmpict->format) &&
> -		    NV50EXABlendOp[op].src_alpha &&
> -		    NV50EXABlendOp[op].src_blend != BF(ZERO))
> -			NOUVEAU_FALLBACK("component-alpha not supported\n");
> -
>  		if (!NV50EXACheckTexture(pmpict, pdpict, op))
>  			NOUVEAU_FALLBACK("mask picture invalid\n");
>  	}
> @@ -874,19 +875,13 @@ NV50EXAPrepareComposite(int op,
>  		state->have_mask = TRUE;
>  
>  		BEGIN_RING(chan, tesla, NV50TCL_FP_START_ID, 1);
> -		if (pdpict->format == PICT_a8) {
> +		if (pmpict->componentAlpha && PICT_FORMAT_RGB(pmpict->format))
> +			OUT_RING  (chan, PFP_CCA);
> +		else
> +		if (pdpict->format != PICT_a8)
> +			OUT_RING  (chan, PFP_C);
> +		else
>  			OUT_RING  (chan, PFP_C_A8);
> -		} else {
> -			if (pmpict->componentAlpha &&
> -			    PICT_FORMAT_RGB(pmpict->format)) {
> -				if (NV50EXABlendOp[op].src_alpha)
> -					OUT_RING  (chan, PFP_CCASA);
> -				else
> -					OUT_RING  (chan, PFP_CCA);
> -			} else {
> -				OUT_RING  (chan, PFP_C);
> -			}
> -		}
>  	} else {
>  		state->have_mask = FALSE;
>  
