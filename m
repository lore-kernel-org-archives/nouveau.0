From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs (attempt
 5)
Date: Mon, 14 Dec 2009 17:51:28 +0100
Message-ID: <4B266D10.8070703@student.tuwien.ac.at>
References: <1260716857-6599-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260716857-6599-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 13.12.2009 16:07, Maarten Maathuis wrote:
> - Added flush notify functions for NV30 and NV40.
> - NV30 and NV40 need testing (check for regressions).
> ---
>
> @@ -112,19 +112,29 @@ so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
>  {
>  	struct nouveau_pushbuf *pb = chan->pushbuf;
>  	unsigned nr, i;
> +	int ret = 0;
>  
>  	nr = so->cur - so->push;
> -	if (pb->remaining < nr)
> -		nouveau_pushbuf_flush(chan, nr);
> +	/* This will flush if we need space.
> +	 * We don't actually need the marker.
> +	 */
> +	if ((ret = nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc))) {
> +		debug_printf("so_emit failed marker emit with error %d\n", ret);
> +		return;
> +	}
>  	pb->remaining -= nr;
>  
>   
I'm not sure why flushing mid-frame would be bad as Ben said.
After all, if there's lots of stuff done during a frame, we will
inevitably flush at some point ...
> -		nouveau_pushbuf_emit_reloc(chan, pb->cur++, r->bo, r->data, 0,
> +					   NOUVEAU_BO_DUMMY, 0, 0))) {
> +			debug_printf("so_emit_reloc_markers failed reloc \
> +						with error %d\n", ret);
>   
Now these debug_printf "will probably give you unwanted"
                                          "extra space the way they are"

As for the interesting part, the too many relocs I got
in vegastrike (and which would need a LOT of NOPs)
are gone and nothing else seems to be broken.

At some point we'll probably want to know if buffer relocation
succeeded or not I guess, and fallback to software on failure.
But that still doesn't have a high priority for me personally.

Christoph
