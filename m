From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: kernel memory access tracer
Date: Sat, 28 Feb 2009 23:51:06 +0200
Message-ID: <20090228235106.108c0fae@daedalus.pq.iki.fi>
References: <20090227230203.1f8dad87@daedalus.pq.iki.fi>
	<19f34abd0902271339m2875321fi81dae8edd60e039e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <19f34abd0902271339m2875321fi81dae8edd60e039e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi

On Fri, 27 Feb 2009 22:39:06 +0100
Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I actually wanted to ask some questions about Nouveau and the NVIDIA
> drivers. I was wondering if there would be any point in extending
> kmemcheck to track this driver's use of kernel memory. We could quite
> easily make a "memory access tracer", which would show all the memory
> access patterns of the driver's allocated memory. Not just addresses,
> but also offsets into the objects (if it was allocated with slab),
> member sizes, and also the actual bytes written. This is for
> reverse-engineering the binary blob, obviously.

I don't think that would gain any more information about the hardware.
If we were to RE the proprietary driver, then yes, it would be useful,
but we're not. We're interested only in the hardware.

There's also the issue, that this might be considered RE'ing the
proprietary software, and that might have legal consequences in
some countries.

A nice idea, but IMHO not applicable.

Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
