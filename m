From: Pekka Paalanen <pq@iki.fi>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Fri, 25 Oct 2013 12:08:46 +0300
Message-ID: <20131025120846.277e85aa@farn.lan>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
	<20131017194614.64a6b70e@farn.lan>
	<CAL5fWtBS88Ni3bUiUgmaj32PQ7QHTnnRd9GEKW5uRJycxYY4Hg@mail.gmail.com>
	<20131019101417.50a33eaf@farn.lan>
	<CAL5fWtCUEfSSY=i-50SfgmTeuKgEh28wz492Be1ORJPidj_CvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAL5fWtCUEfSSY=i-50SfgmTeuKgEh28wz492Be1ORJPidj_CvA@mail.gmail.com>
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

On Sat, 19 Oct 2013 17:12:20 +0400
Eugene Shatokhin <euspectre@gmail.com> wrote:

> Hi,
> 
> >  Ah, you are not using the ftrace framework nor relayfs? Mmiotrace
>  used to be relayfs at one point and then converted to ftrace.
> 
> Yes, I considered these when I started working on KernelStrider but finally
> borrowed ideas from Perf and implemented them. A mmapped ring buffer does
> its job well and has a higher throughput than Ftrace in my case.
> 
> > Are you saying that you intercept function calls, and *never* rely
> > on page faulting?
> 
> The system intercepts both function calls *and* memory operations made by
> the driver itself. Yes, it never relies on page faulting.
> 
>  > Does that mean that if a driver does the ugly thing and
>  > dereferences an iomem pointer directly, you won't catch that?
> 
> It will be caught.
> 
> What my system actually does is as follows.
> 
> When the target kernel module has been loaded into memory but before it has
> begun its initialization, KernelStrider processes it, function after
> function. It creates an instrumented variant of each function in the module
> mapping space and places a jump at the beginning of the original function
> to point to the instrumented one. After instrumentation is done, the target
> driver may start executing.

Oh, that works on a completely different way than I even imagined,
a whole another level of complexity.


<...snip code you corrected in another email>

> That is, the address which is about to be accessed is determined and stored
> in 'local_storage', a special memory structure. At the end of the block of
> instructions, the information from the local storage is sent to the output
> system. So the addresses and sizes of the accessed memory areas as well as
> the types of the accesses (read/write/update) will be available for reading
> from the user space.

Just curious, how do you detect interesting instructions to
instrument from uninteresting instructions that do not access mmio
areas?

Does it rely on post-processing, in that you instrument practically
everything, and then in post-processing you check if the accessed
memory address actually was interesting before sending the data to user
space?

> It is actually more complex than that (KernelStrider has to deal with
> register allocation, relocations and other things) but the principle is as
> I described.
> 
> The function calls are processed too so that we can set our own handlers to
> execute at the beginning of a function and right before its exit.
> 
> Yes, the functions like read[bwql]() and write[bwlq]() are usually inline
> but they pose no problem: on x86 they compile to ordinary MOV instructions
> and the like which are handled as I described above.
> 
> The instrumented code will access the ioremapped area the same way as the
> original code would, no need for single-stepping or emulation in this case.

That is very cool, the possibility never even occurred to me.

> What I wrote in my previous letter is that there is a special case when the
> target driver uses some non-inline function provided by the kernel proper
> or by another driver and that function accesses the ioremapped memory area
> of interest.
> 
> KernelStrider needs to track all such functions in order not to miss some
> memory accesses to that ioremapped area. Perhaps, that's manageable. There
> are not too many such functions, aren't they?

I don't really know, and personally I was never even interested,
since the page faulting approach was a catch-all method. We
could even detect when we hit some access we couldn't handle right
due to lacking instruction decoding.

I guess to be sure your approach does not miss anything, we'd still
need the page faulting setup as a safety net to know when or if
something is missed, right? And somehow have the instrumented code
circumvent it.

We could use some comments from the real reverse-engineers. I used
to be mostly a tool writer.


Thanks,
pq
