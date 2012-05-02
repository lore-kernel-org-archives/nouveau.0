From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Wed, 02 May 2012 21:28:57 +1000
Message-ID: <1335958137.1898.6.camel@nisroch>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
	<1335425549.27165.9.camel@nisroch> <20120428144956.GA10116@joi.lan>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120428144956.GA10116-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 2012-04-28 at 16:49 +0200, Marcin Slusarz wrote:
> On Thu, Apr 26, 2012 at 05:32:29PM +1000, Ben Skeggs wrote:
> > On Wed, 2012-04-25 at 23:20 +0200, Marcin Slusarz wrote:
> > > Overall idea:
> > > Detect lockups by watching for timeouts (vm flush / fence), return -EIOs,
> > > handle them at ioctl level, reset the GPU and repeat last ioctl.
> > > 
> > > GPU reset is done by doing suspend / resume cycle with few tweaks:
> > > - CPU-only bo eviction
> > > - ignoring vm flush / fence timeouts
> > > - shortening waits
> > Okay.  I've thought about this a bit for a couple of days and think I'll
> > be able to coherently share my thoughts on this issue now :)
> > 
> > Firstly, while I agree that we need to become more resilient to errors,
> > I don't think that following in the radeon/intel footsteps with
> > something (imo, hackish) like this is the right choice for us
> > necessarily.
> 
> This is not only radeon/intel way. Windows, since Vista SP1, does the
> same - see http://msdn.microsoft.com/en-us/windows/hardware/gg487368.
> It's funny how similar it is to this patch (I haven't seen this page earlier).
Yes, I am aware of this feature in Windows.  And I'm not arguing that
something like it isn't necessary.

> 
> If you fear people will stop reporting bugs - don't. GPU reset is painfully
> slow and can take up to 50 seconds (BO eviction is the most time consuming
> part), so people will be annoyed enough to report them.
> Currently, GPU lockups make users so angry, they frequently switch to blob
> without even thinking about reporting anything.
I'm not so concerned about the lost bug reports, I expect the same
people that are actually willing to report bugs now will continue to do
so :)

> 
> > The *vast* majority of "lockups" we have are as a result of us badly
> > mishandling exceptions reported to us by the GPU.  There are a couple of
> > exceptions, however, they're very rare..
> 
> > A very common example is where people gain DMA_PUSHERs for whatever
> > reason, and things go haywire eventually.
> 
> Nope, I had tens of lockups during testing, and only once I had DMA_PUSHER
> before detecting GPU lockup.
Out of curiosity, what were the lockup situations you were triggering
exactly?

> 
> > To handle a DMA_PUSHER
> > sanely, generally you have to drop all pending commands for the channel
> > (set GET=PUT, etc) and continue on.  However, this leaves us with fences
> > and semaphores unsignalled etc, causing issues further up the stack with
> > perfectly good channels hanging on attempting to sync with the crashed
> > channel etc.
> > 
> > The next most common example I can think of is nv4x hardware, getting a
> > LIMIT_COLOR/ZETA exception from PGRAPH, and then a hang.  The solution
> > is simple, learn how to handle the exception, log it, and PGRAPH
> > survives.
> > 
> > I strongly believe that if we focused our efforts on dealing with what
> > the GPU reports to us a lot better, we'll find we really don't need such
> > "lockup recovery".
> 
> While I agree we need to improve on error handling to make "lockup recovery"
> not needed, the reality is we can't predict everything and driver needs to
> cope with its own bugs.
Right, again, I don't disagree :)  I think we can improve a lot on the
big-hammer-suspend-the-gpu solution though, and instead reset only the
faulting engine.  It's (in theory) almost possible for us to do now, but
I have a couple of reworks to areas related to this pending (basically,
making the various driver subsystems more independent), which should be
ready soon.  This'll go a long way to making it very easy to reset a
single engine, and likely result in *far* faster recovery from hangs.

> 
> > I am, however, considering pulling the vm flush timeout error
> > propagation and break-out-of-waits-on-signals that builds on it.  As we
> > really do need to become better at having killable processes if things
> > go wrong :)
> 
> Good :)
> 
> Marcin
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
