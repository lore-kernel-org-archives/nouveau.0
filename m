From: Pekka Paalanen <pq@iki.fi>
Subject: Re: MmioTrace: Using the Instruction Decoder, etc.
Date: Thu, 17 Oct 2013 19:46:14 +0300
Message-ID: <20131017194614.64a6b70e@farn.lan>
References: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAL5fWtDBJUT0sK+rT9fD+BbFtwPuF4oBCUo8Gs+_aRMH4R_p=w@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Mon, 14 Oct 2013 22:45:09 +0400
Eugene Shatokhin <euspectre@gmail.com> wrote:

> Hi,
> 
> There is an interesting TODO item on MmioTraceDeveloper page:
> "kprobes has a generic instruction decoding facility, use that instead of
> homebrewn (or KVM), and use emulation instead of page faulting"
> 
> Actually, I have done something similar in one of my systems, KernelStrider
> (http://code.google.com/p/kernel-strider/). The system instruments a kernel
> module when that module is being loaded. The instrumented code executes
> instead of the original one and provides information about the memory
> accesses it makes and the functions it calls. These data are sent to user
> space for further analysis.
> 
> Currently, I use this system to detect data races in the Linux kernel (and
> have found some). I suppose, it could probably be useful to MmioTrace as
> well.
> 
> KernelStrider uses an enhanced version of the x86 instruction decoder that
> Kprobes use and relies on binary instrumentation rather than on page
> faults. So, it can track:
> - memory accesses (address and size of the accessed memory as well as the
> access type are recorded)
> - function calls (exported functions and callbacks, one can setup pre- and
> post- handlers for these)
> 
> Is there any interest in trying this approach to the task of MmioTrace?
> 
> If so, we can discuss it. When I have time, I could try to create a
> prototype based on KernelStrider's core that tracks the memory accesses
> Mmiotrace needs.
> What do you think?

Hi Eugene,

that is very interesting! I assume emulating the instructions is
not only cleaner, but also faster than page-faulting, right? Maybe
even more reliable, perhaps up to the point where we would not need
to disable all but one CPU.

Unfortunately, my job exhausts my coding energy, and I haven't even
touched mmiotrace in years.

However, let's see if there are interested people on the mailing
lists. I'm CC'ing nouveau, since that is where mmiotrace started,
and dri-devel in the hopes to catch other drivers' reverse
engineers.


Thanks,
pq
