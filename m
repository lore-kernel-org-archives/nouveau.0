From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Sat, 28 Apr 2012 16:49:56 +0200
Message-ID: <20120428144956.GA10116@joi.lan>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
	<1335425549.27165.9.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335425549.27165.9.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 26, 2012 at 05:32:29PM +1000, Ben Skeggs wrote:
> On Wed, 2012-04-25 at 23:20 +0200, Marcin Slusarz wrote:
> > Overall idea:
> > Detect lockups by watching for timeouts (vm flush / fence), return -EIOs,
> > handle them at ioctl level, reset the GPU and repeat last ioctl.
> > 
> > GPU reset is done by doing suspend / resume cycle with few tweaks:
> > - CPU-only bo eviction
> > - ignoring vm flush / fence timeouts
> > - shortening waits
> Okay.  I've thought about this a bit for a couple of days and think I'll
> be able to coherently share my thoughts on this issue now :)
> 
> Firstly, while I agree that we need to become more resilient to errors,
> I don't think that following in the radeon/intel footsteps with
> something (imo, hackish) like this is the right choice for us
> necessarily.

This is not only radeon/intel way. Windows, since Vista SP1, does the
same - see http://msdn.microsoft.com/en-us/windows/hardware/gg487368.
It's funny how similar it is to this patch (I haven't seen this page earlier).

If you fear people will stop reporting bugs - don't. GPU reset is painfully
slow and can take up to 50 seconds (BO eviction is the most time consuming
part), so people will be annoyed enough to report them.
Currently, GPU lockups make users so angry, they frequently switch to blob
without even thinking about reporting anything.

> The *vast* majority of "lockups" we have are as a result of us badly
> mishandling exceptions reported to us by the GPU.  There are a couple of
> exceptions, however, they're very rare..

> A very common example is where people gain DMA_PUSHERs for whatever
> reason, and things go haywire eventually.

Nope, I had tens of lockups during testing, and only once I had DMA_PUSHER
before detecting GPU lockup.

> To handle a DMA_PUSHER
> sanely, generally you have to drop all pending commands for the channel
> (set GET=PUT, etc) and continue on.  However, this leaves us with fences
> and semaphores unsignalled etc, causing issues further up the stack with
> perfectly good channels hanging on attempting to sync with the crashed
> channel etc.
> 
> The next most common example I can think of is nv4x hardware, getting a
> LIMIT_COLOR/ZETA exception from PGRAPH, and then a hang.  The solution
> is simple, learn how to handle the exception, log it, and PGRAPH
> survives.
> 
> I strongly believe that if we focused our efforts on dealing with what
> the GPU reports to us a lot better, we'll find we really don't need such
> "lockup recovery".

While I agree we need to improve on error handling to make "lockup recovery"
not needed, the reality is we can't predict everything and driver needs to
cope with its own bugs.

> I am, however, considering pulling the vm flush timeout error
> propagation and break-out-of-waits-on-signals that builds on it.  As we
> really do need to become better at having killable processes if things
> go wrong :)

Good :)

Marcin
