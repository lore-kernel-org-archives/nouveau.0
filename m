From: Pekka Paalanen <pq@iki.fi>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Sat, 19 Oct 2013 10:14:17 +0300
Message-ID: <20131019101417.50a33eaf@farn.lan>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
	<CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Eugene Shatokhin <euspectre@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, 18 Oct 2013 00:11:15 +0400
Eugene Shatokhin <euspectre@gmail.com> wrote:

> Hi,
> 
> Good to know that!
> 
> Yes, it should be faster than page faulting, although I haven't done the
> benchmarking yet. And yes, it is not needed to disable all but one CPU. In
> my current implementation, I use an ordered workqueue to send the data to
> the mmapped output buffer (where they will be read from from the user
> space) and that ensures the order of events is kept. May be less than ideal
> but it currently works quite well with network drivers, the performance
> overhead is acceptable there.

Ah, you are not using the ftrace framework nor relayfs? Mmiotrace
used to be relayfs at one point and then converted to ftrace.

> A subtle drawback may be that the system sees the memory reads and writes
> made by the code of the driver directly but if the driver uses some other
> kernel functions, it needs to intercept these calls and determine how they
> access the memory of interest. Theoretically, it could be less accurate
> than page fault handling. A page fault happens no matter if the driver
> accesses the memory directly or via strcpy(), for example. I doubt this
> would be a big problem for tracking the accesses to ioremapped memory
> though.
> 
> Nevertheless, it is manageable, the system already handles string
> functions, for example, and reports appropriate events. The handlers for
> other functions could be added as well. So this just requires a bit more
> maintenance work.

Are you saying that you intercept function calls, and *never* rely
on page faulting?

Does that mean that if a driver does the ugly thing and
dereferences an iomem pointer directly, you won't catch that?
Unfortunately, I think proprietary drivers do such uglies, since
they are x86 and x86_64 only where it works. Or they might have the
iomem accessor functions inlined.

What I had in mind was to still use page faulting to catch the
memory accessing machine instructions, but then use emulation to
execute that instruction with the memory address diverted to the
real ioremapped region instead of the dummy region given to the driver.
Currently for each access, on the page fault, mmiotrace uses single
stepping and page table manipulation to let the instruction run for
real, and immediately afterwards set things back to page faulting.

Sorry, I see my terminology was wrong. I don't think we can avoid
the page faulting, but I'd like to avoid the single-stepping and
page table mangling on the fly. Heh, things are slowly coming back
to me.

What do you thing, would it still be interesting?

> > Unfortunately, my job exhausts my coding energy, and I haven't even
> touched mmiotrace in years.
> 
> I understand. I have many other responsibilities too. Code to write, bugs
> to fix, etc. ;-)
> 
> Well, then, when time permits, I'll try to prepare a prototype so that its
> performance and reliability could be evaluated. Hard to tell what the
> numbers will be before that.
> 
> Suggestions, comments and other feedback are welcome of course.
> 
> And, by the way, video drivers do not use SSE and similar instructions when
> accessing ioremapped memory, do they?
> Such things are rare in the kernel and usually frowned upon so I opted not
> to handle them so far in KernelStrider.

I don't really know. I guess everything could be possible in
proprietary drivers, but you can look at the instruction decoding
code in mmiotrace, which digs up the type and size of access and
the value. That has been enough so far.


Thanks,
pq

> 2013/10/17 Pekka Paalanen <pq@iki.fi>
> 
> > On Mon, 14 Oct 2013 22:45:09 +0400
> > Eugene Shatokhin <euspectre@gmail.com> wrote:
> >
> > > Hi,
> > >
> > > There is an interesting TODO item on MmioTraceDeveloper page:
> > > "kprobes has a generic instruction decoding facility, use that instead of
> > > homebrewn (or KVM), and use emulation instead of page faulting"
> > >
> > > Actually, I have done something similar in one of my systems,
> > KernelStrider
> > > (http://code.google.com/p/kernel-strider/). The system instruments a
> > kernel
> > > module when that module is being loaded. The instrumented code executes
> > > instead of the original one and provides information about the memory
> > > accesses it makes and the functions it calls. These data are sent to user
> > > space for further analysis.
> > >
> > > Currently, I use this system to detect data races in the Linux kernel
> > (and
> > > have found some). I suppose, it could probably be useful to MmioTrace as
> > > well.
> > >
> > > KernelStrider uses an enhanced version of the x86 instruction decoder
> > that
> > > Kprobes use and relies on binary instrumentation rather than on page
> > > faults. So, it can track:
> > > - memory accesses (address and size of the accessed memory as well as the
> > > access type are recorded)
> > > - function calls (exported functions and callbacks, one can setup pre-
> > and
> > > post- handlers for these)
> > >
> > > Is there any interest in trying this approach to the task of MmioTrace?
> > >
> > > If so, we can discuss it. When I have time, I could try to create a
> > > prototype based on KernelStrider's core that tracks the memory accesses
> > > Mmiotrace needs.
> > > What do you think?
> >
> > Hi Eugene,
> >
> > that is very interesting! I assume emulating the instructions is
> > not only cleaner, but also faster than page-faulting, right? Maybe
> > even more reliable, perhaps up to the point where we would not need
> > to disable all but one CPU.
> >
> > Unfortunately, my job exhausts my coding energy, and I haven't even
> > touched mmiotrace in years.
> >
> > However, let's see if there are interested people on the mailing
> > lists. I'm CC'ing nouveau, since that is where mmiotrace started,
> > and dri-devel in the hopes to catch other drivers' reverse
> > engineers.
> >
