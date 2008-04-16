From: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Subject: Re: [BUG/PATCH] x86 mmiotrace: dynamically disable
	non-boot CPUs
Date: Wed, 16 Apr 2008 22:47:03 +0200
Message-ID: <20080416204703.GD20762@elte.hu>
References: <20080413224207.4430a09c@daedalus.pq.iki.fi>
	<20080413230552.33ca587a@daedalus.pq.iki.fi>
	<20080414065713.GB16163@elte.hu>
	<20080414210242.2329997d@daedalus.pq.iki.fi>
	<20080416114609.GA20054@elte.hu>
	<20080416205902.6186d349@daedalus.pq.iki.fi>
	<20080416183258.GA30490@elte.hu>
	<20080416234209.221b7fae@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080416234209.221b7fae-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org


* Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:

> > So i think we need to fix your automatic-cpudown/cpuup patch. I 
> > tried that and it worked very intuitively and the cpus were 
> > disabled/enabled without any trouble - with ftrace based mmiotrace 
> > we now basically have something that most distros could enable by 
> > default without thinking twice about it.
> 
> Without any trouble - you didn't hit the bug I did?

i did get the warning both on enable/disable but it still worked.

	Ingo
