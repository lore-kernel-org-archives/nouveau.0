From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUG/PATCH] x86 mmiotrace: dynamically disable non-boot CPUs
Date: Wed, 16 Apr 2008 20:32:58 +0200
Message-ID: <20080416183258.GA30490@elte.hu>
References: <20080413224207.4430a09c@daedalus.pq.iki.fi> <20080413230552.33ca587a@daedalus.pq.iki.fi> <20080414065713.GB16163@elte.hu> <20080414210242.2329997d@daedalus.pq.iki.fi> <20080416114609.GA20054@elte.hu> <20080416205902.6186d349@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756320AbYDPSdW@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080416205902.6186d349@daedalus.pq.iki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Pekka Paalanen <pq@iki.fi>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, vegard.nossum@gmail.com, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


* Pekka Paalanen <pq@iki.fi> wrote:

> > yeah - it looks complex. Not a showstopper for now :-)
> > 
> > but given that Xorg is usually just a single task, do we _really_ 
> > need this?
> 
> We're not tracing Xorg at all. Mmiotrace still cannot catch accesses 
> originating in user space. It is tracing MMIO accesses from within the 
> kernel, and this means that IRQ services and device syscalls may be 
> accessing the hardware at the same time. Vblank interrupts happen 
> quite often, some GPU commands are actually emulated in kernel via 
> interrupts and whatnot. [...]

ok, understood - i forgot about IRQ generated GPU accesses. In fact UP 
probably generates a more readable trace because DRM accesses from one 
CPU are not mixed up with IRQ completion from another CPU.

So i think we need to fix your automatic-cpudown/cpuup patch. I tried 
that and it worked very intuitively and the cpus were disabled/enabled 
without any trouble - with ftrace based mmiotrace we now basically have 
something that most distros could enable by default without thinking 
twice about it.

But if it means an UP kernel has to be used then it will be turned off 
immediately and the barrier to users will be huge again. I really 
envision mmiotrace to be usable by default on _any_ generic distro, 
without rebooting and without any hassle on the user's part.

the automatic drop-to-single-CPU-when-tracing solution from you is OK - 
it will also test our CPU hotplug primitives some more ;-) And it's not 
like users expect a mmiotraced X session to be particularly fast, right?

so lets fix those preemptability bugs. They show that the 
cpu-up/cpu-down ops are called from atomic context - it should normally 
be straightforward to sort out - there's no particular reason why the 
->open()/->close() methods of an ftrace plugin should run in atomic 
context. Steve, any ideas where the atomicity might come from?

	Ingo
