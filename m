From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [BUG/PATCH] x86 mmiotrace: dynamically disable
	non-boot CPUs
Date: Wed, 16 Apr 2008 23:42:09 +0300
Message-ID: <20080416234209.221b7fae@daedalus.pq.iki.fi>
References: <20080413224207.4430a09c@daedalus.pq.iki.fi>
	<20080413230552.33ca587a@daedalus.pq.iki.fi>
	<20080414065713.GB16163@elte.hu>
	<20080414210242.2329997d@daedalus.pq.iki.fi>
	<20080416114609.GA20054@elte.hu>
	<20080416205902.6186d349@daedalus.pq.iki.fi>
	<20080416183258.GA30490@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080416183258.GA30490-X9Un+BFzKDI@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Cc: vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 16 Apr 2008 20:32:58 +0200
Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org> wrote:

> 
> * Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
> 
> > > yeah - it looks complex. Not a showstopper for now :-)
> > > 
> > > but given that Xorg is usually just a single task, do we _really_ 
> > > need this?
> > 
> > We're not tracing Xorg at all. Mmiotrace still cannot catch accesses 
> > originating in user space. It is tracing MMIO accesses from within the 
> > kernel, and this means that IRQ services and device syscalls may be 
> > accessing the hardware at the same time. Vblank interrupts happen 
> > quite often, some GPU commands are actually emulated in kernel via 
> > interrupts and whatnot. [...]
> 
> ok, understood - i forgot about IRQ generated GPU accesses. In fact UP 
> probably generates a more readable trace because DRM accesses from one 
> CPU are not mixed up with IRQ completion from another CPU.

In the future, when things get more stable feature-wise, I will revise
the mmiotrace log format. One thing to add is cpu number, which will
then easily separate interleaved operations. Maybe I should also think
about if someone wants to trace things that are not in PCI bus address
space. If kmemcheck and mmiotrace could be unified somehow, it would
be a tool offering uninitialised memory access traps, MMIO tracing and
basically for watching almost any page and recording accesses to that
page. In a time far, far away...

> So i think we need to fix your automatic-cpudown/cpuup patch. I tried 
> that and it worked very intuitively and the cpus were disabled/enabled 
> without any trouble - with ftrace based mmiotrace we now basically have 
> something that most distros could enable by default without thinking 
> twice about it.

Without any trouble - you didn't hit the bug I did?

> But if it means an UP kernel has to be used then it will be turned off 
> immediately and the barrier to users will be huge again. I really 
> envision mmiotrace to be usable by default on _any_ generic distro, 
> without rebooting and without any hassle on the user's part.

UP kernel is not mandatory anyway, we just need only one cpu running,
which can be realised by maxcpus=1 kernel argument or hot-un-plugging it
by hand via sysfs.

> the automatic drop-to-single-CPU-when-tracing solution from you is OK - 
> it will also test our CPU hotplug primitives some more ;-) And it's not 
> like users expect a mmiotraced X session to be particularly fast, right?

They shouldn't, although in my experience X startup is slow but other
things after that work with only a minor slowdown. Btw. when I did that
SMP drop-to-UP tracing test, the resulting log was 63 MB and 'cat' process
was accounted for 24 seconds of cpu time. I will do comparisons some day,
but it sounds a lot. I guess optimising ftrace speed is not yet a
priority :-) (I'm not even sure if it's the framework or mmiotrace.)

> so lets fix those preemptability bugs. They show that the 
> cpu-up/cpu-down ops are called from atomic context - it should normally 
> be straightforward to sort out - there's no particular reason why the 
> ->open()/->close() methods of an ftrace plugin should run in atomic 
> context. Steve, any ideas where the atomicity might come from?

Since Steve says it should not be an ftrace issue, I'll dig in it myself.
Might be a weekend job, again. During the week I don't usually fancy
doing anything else than relax and write emails ;-)


Thanks!

-- 
Pekka Paalanen
http://www.iki.fi/pq/
