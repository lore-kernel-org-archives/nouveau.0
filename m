From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mesa: Patch that fix/add missing WAIT_RING calls
Date: Sun, 19 Dec 2010 14:32:10 +0100
Message-ID: <AANLkTikmqfYmmNqrNxYAn9f2KiP6V2fk01uCLuOnGZSj@mail.gmail.com>
References: <AANLkTinj4TObB1Mb9mG3T74OQiyKd+vK1Dk-WYuT6=Qc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinj4TObB1Mb9mG3T74OQiyKd+vK1Dk-WYuT6=Qc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Dec 16, 2010 at 12:22 PM, Michel Hermier
<michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
> While trying to run a 3D app I needed to modify/add some WAIT_RING
> calls so the push buffer is properly checked, before we try to blindly
> push to it (sine OUT_RING don't perform this checks yet, I have a
> small patch for that for libdrm).
> I allready discussed about it with lynxeye and shining on IRC.
>

As calim already said (and I again yesterday evening), it seems you
failed to account all the existing WAIT_RING already in place.

Either someone wants to revert Luca's change and replace back all the
WAIT_RING/OUT_RING by BEGIN_RING (which means having to compute the
required size once per method, so the size check would be closer to
the OUT_RING calls and easier to follow)...

... or we need to actually figure out where the current code exactly
fails and why. IE which WAIT_RING is missing or which size is wrongly
computed.

I think we should try the second path in any case just to see.

So please provide us with a precise test-case (like hardware, libdrm
assert patch, backtrace of the triggered assert, game used, ...)
Thanks :)

12:19 < calim> also, you realize that the WAIT_RINGs already in the
code are supposed to do all the waiting required, right ?
12:19 < hermier> calim, yes, but some of them have broken or missing values
12:20 < calim> but it is likely there are counting mistakes and
forgotten waits - I was just wondering which if the changes in your
patch actually change something
12:20 < calim> *of the changes
12:20 < hermier> yes, it changes things
12:21 < hermier> I have a patch here in libdrm that check the buffer
before OUT_RING is successfull
12:22 < hermier> and it shows that WAIT_RING don't reserve/wait for
enought buffer, leading to buffer corruptions
12:24 < calim> and in which places ? e.g. emit_vertices_* are supposed
to work without WAIT_RINGs because the maximum amount of vertices that
can be written with the available space has been calculated in advance
12:25 < hermier> calim, and it failed
12:25 < hermier> calim, you can't predict that easily
12:26 < hermier> unless you have the data in your hands
12:26 < calim> well, then the calculation should be fixed; also, I'd
prefer to reintroduce BEGIN_RING in nvfx instead of calling WAIT_RING
for single method packets
12:27 < calim> hermier: you can predict it, the size of a vertex is
known, and thus you can derive how many vertices fit into
AVAIL_RING(chan) wors
12:28 < calim> *words
12:28 < curro> indeed, all those WAIT_RING+OUT_RING's should really be
BEGIN_RING's
12:28 < curro> hermier: ^
12:29 < calim> hm, oh - p_overhead in the vertex count calculation has
+ 64 with the comment "magic fix"
12:30 < calim> highly suspicious
