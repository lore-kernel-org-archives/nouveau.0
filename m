From: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: PFIFO_DMA_PUSHER + Xen + NV30 + questions.
Date: Wed, 9 Jun 2010 09:47:20 -0400
Message-ID: <20100609134720.GA7131@phenom.dumpdata.com>
References: <20100604212455.GA7143@phenom.dumpdata.com>
	<AANLkTimyQzqCw1QnSNxmUvilOqaWe60twrNGo4n8BIcx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimyQzqCw1QnSNxmUvilOqaWe60twrNGo4n8BIcx-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> > I've fleshed out most of them (like GART had the wrong phys addresses,
> > ouch!), but the one that I am stumbling at is that I see the PFIFO_DMA_PUSHER,
> > which I am to understand means: "Oh, the GPU obj operation you stuck on the
> > RAMHT/RAMIN is busted."

.. snip ..
> buffer. Either you pointed the card at garbage instead of a sensible
> buffer (nv10_fifo_create_context for nv30 IIRC) or your initial
> pushbuf (submitted by nouveau_dma_init) contains garbage. Or maybe
> something else, but based on your log that would be my guess.

That was it. I had the physical addresses of the buffers properly put in
the GATT, but the physical address the GATT page directory that was programmed in
the GART was completly bogus. So the GART on behalf of the card, ended up reading
bogus addresses. Ouch.

Now of to fix vmap faults.
