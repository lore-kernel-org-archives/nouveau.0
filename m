From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [BUG/PATCH] x86 mmiotrace: dynamically disable non-boot CPUs
Date: Wed, 16 Apr 2008 15:07:25 -0400 (EDT)
Message-ID: <Pine.LNX.4.58.0804161506300.30154@gandalf.stny.rr.com>
References: <20080413224207.4430a09c@daedalus.pq.iki.fi>
 <20080413230552.33ca587a@daedalus.pq.iki.fi> <20080414065713.GB16163@elte.hu>
 <20080414210242.2329997d@daedalus.pq.iki.fi> <20080416114609.GA20054@elte.hu>
 <20080416205902.6186d349@daedalus.pq.iki.fi> <20080416183258.GA30490@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755604AbYDPTHh@vger.kernel.org>
In-Reply-To: <20080416183258.GA30490@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Pekka Paalanen <pq@iki.fi>, linux-kernel@vger.kernel.org, vegard.nossum@gmail.com, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org



On Wed, 16 Apr 2008, Ingo Molnar wrote:
>
> so lets fix those preemptability bugs. They show that the
> cpu-up/cpu-down ops are called from atomic context - it should normally
> be straightforward to sort out - there's no particular reason why the
> ->open()/->close() methods of an ftrace plugin should run in atomic
> context. Steve, any ideas where the atomicity might come from?
>

They shouldn't be called in an atomic section. The only thing I do to
protect them is call mutex_lock/unlock. Those should allow preemption to
take place.

-- Steve
