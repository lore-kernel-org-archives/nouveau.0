From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2] nv04-nv40/exa: Match the blob behavior more
 closely on PrepareCopy.
Date: Mon, 09 Nov 2009 08:20:33 +1000
Message-ID: <1257718833.2216.4.camel@nisroch>
References: <1256171762-666-1-git-send-email-currojerez@riseup.net>
	<1257520480-18855-1-git-send-email-currojerez@riseup.net>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1257520480-18855-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2009-11-06 at 16:14 +0100, Francisco Jerez wrote:
> Fix a somewhat indeterministic corruption problem on nv17 when there
> is stuff going on the other fifos (e.g. gallium but I've also
> reproduced it with an app just SIFM-ing memory around): in some cases
> it made the blits the X server had scheduled fail corrupting the
> nearby screen areas.
> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  src/nv04_exa.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/src/nv04_exa.c b/src/nv04_exa.c
> index 71a4ac2..f4966a4 100644
> --- a/src/nv04_exa.c
> +++ b/src/nv04_exa.c
> @@ -209,10 +209,16 @@ NV04EXAPrepareCopy(PixmapPtr pSrcPixmap, PixmapPtr pDstPixmap, int dx, int dy,
>  			MARK_UNDO(chan);
>  			return FALSE;
>  		}
> +
> +		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_SURFACE, 1);
> +		OUT_RING  (chan, pNv->NvContextSurfaces->handle);
>  		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_OPERATION, 1);
>  		OUT_RING  (chan, 1); /* ROP_AND */
> +
>  		NV04EXASetROP(pScrn, alu, planemask);
>  	} else {
> +		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_SURFACE, 1);
> +		OUT_RING  (chan, pNv->NvContextSurfaces->handle);
>  		BEGIN_RING(chan, blit, NV04_IMAGE_BLIT_OPERATION, 1);
>  		OUT_RING  (chan, 3); /* SRCCOPY */
>  	}
