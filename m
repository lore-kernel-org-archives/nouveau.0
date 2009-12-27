From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV50: the tiled buffer object eviction problem
Date: Sun, 27 Dec 2009 10:45:17 +1000
Message-ID: <1261874717.7478.1.camel@nisroch>
References: <6d4bc9fc0912251813q720d26e6n79869f704238e7f6@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0912251813q720d26e6n79869f704238e7f6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Sat, 2009-12-26 at 03:13 +0100, Maarten Maathuis wrote:
> In short, we move out the low level content of a buffer object. In the
> case of textures and such this is utterly useless. Still it is
> accessed, because ttm sees no problem in using PL_SYSTEM or PL_TT
> memory. What is the best way to let ttm know we don't really
> appreciate that? A custom memory to evict to that cannot be mapped
> maybe. Or an extension of PL_SYSTEM or PL_TT. Share your ideas.
For GPU access it isn't an issue, userspace knows it needs to use VRAM
and won't set GART as an allowed memtype.

For CPU access, we should trap this in the fault handler and revalidate
the buffer into VRAM.

That's my thoughts :)

Merry Xmas!
Ben.
> 
> Maarten.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
