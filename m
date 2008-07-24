From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: [BUG/PATCH] x86 mmiotrace: dynamically disable
	non-boot CPUs
Date: Thu, 24 Jul 2008 16:34:51 +0100
Message-ID: <6a89f9d50807240834u1aa48a74jb9ec15ac34de3aca@mail.gmail.com>
References: <20080413224207.4430a09c@daedalus.pq.iki.fi>
	<20080413230552.33ca587a@daedalus.pq.iki.fi>
	<20080414065713.GB16163@elte.hu>
	<20080414210242.2329997d@daedalus.pq.iki.fi>
	<20080416114609.GA20054@elte.hu>
	<20080416205902.6186d349@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080416205902.6186d349-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
Content-Disposition: inline
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
Cc: vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 16, 2008 at 6:59 PM, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
> On Wed, 16 Apr 2008 13:46:09 +0200
> Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org> wrote:
>
>>
>> * Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
>>
>> > > we should fix this restriction ASAP. Forcibly dropping to UP will
>> > > cause mmiotrace to be much less useful for diagnostic purposes of
>> > > Linux
>> >
>> > Ok, how do you propose we solve this?
>> >
>> > I have asked the question before, and then I had two ideas. Well, the
>> > first one was actually your idea (so I hear) to solve the same problem for
>> > kmemcheck.
>> > - per-cpu page tables
>> > - instead of single-stepping, emulate the faulting instruction and never
>> > disarm pages during tracing. (Use and modify code from KVM.)
>> >
>> > I don't believe either of these is easy or fast to implement. Given
>> > some months, I might be able to achieve emulation. Page tables are
>> > still magic to me.
>>
>> yeah - it looks complex. Not a showstopper for now :-)
>>
>> but given that Xorg is usually just a single task, do we _really_ need
>> this?
>
> We're not tracing Xorg at all. Mmiotrace still cannot catch accesses
> originating in user space. It is tracing MMIO accesses from within
> the kernel, and this means that IRQ services and device syscalls
> may be accessing the hardware at the same time. Vblank interrupts
> happen quite often, some GPU commands are actually emulated in
> kernel via interrupts and whatnot. The nvidia proprietary kernel blob
> is many times bigger than my bzImage!
>
> (A simple X startup and quit creates in the order of 1-2 million
> MMIO events.)
>
> As do we really need this, I think it might save a lot of head
> scratching when someone is reverse engineering a feature and gets
> every time a different trace due to some events being missed.
> But this is theory. So far everyone has been tracing with UP,
> and this has not been a problem. I have no idea if it would make
> a real difference.
>
> [Recap for nouveau@ list:
> mmiotrace has a race on SMP, where during instruction single stepping
> other CPUs can run freely on the page which the faulted instruction
> accessed. This causes some of the simultaneous accesses to the same
> page of the same iomem-mapping to be missed.]
>
> It does sound very rare. Nouveau people, what do you think, can this
> be a problem?
>

In the nvidia case, I don't think this would happen. The register
ranges for different purposes are set apart by more than 1 page
usually, so the risk of accessing a page that's been faulted in is
probably extremely low. Not to mention that the design of the binary
module doesn't use threads currently (only tasklets for interrupt
handlers, this might be the corner case but again the interrupt
handler doesn't touch the same reg families).

Stephane
