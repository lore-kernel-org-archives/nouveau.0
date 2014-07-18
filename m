From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about the Nouveau VM subsystem
Date: Fri, 18 Jul 2014 10:06:24 +1000
Message-ID: <CACAvsv468wzX_swF7wAdS2ZsYNbe1WtFObhB-6hTnronwS=YTA@mail.gmail.com>
References: <53C635D8.8020604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53C635D8.8020604-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 16, 2014 at 6:20 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi everyone,
>
> I have been studing the VM code in order to come with a better
> implementation of my fix for large pages usage on GK20A
> (https://lkml.org/lkml/2014/6/3/375 ). Following some older threads about
> this code (http://marc.info/?l=dri-devel&m=137618326022935 ) also left me
> kind of puzzled, and I wonder if we could not simplify and improve things
> there.
The VM code is quite a bit unloved, and has lots of areas that
can/needs to be improved at some point.  Let me see if I can wrap my
head around / remember what/why some things are the way they are.

>
> It seems like arbitrary constant values for page_shifts (usually 12) are
> used where the vmm->spg_shift value should be used instead, and some other
> members are used out of place. Here are a few questions to start:
>
> - What is nouveau_mem::page_shift exactly used for? It is set here and there
> but never really used, and usually the value it is set to does not seem to
> bother how the memory is allocated. For instance nouveau_vram_manager_new()
> will set it to whatever page_shift the BO has. I *thought* it should
> indicate the size and alignment of the pages described in the nouveau_mem
> object. Is this definition correct? In that case, shouldn't the memory
> allocator be the one that sets that field, instead of the callers?
Firstly, the caller decides on whether or not it wants to use large
pages (currently the heuristic is "is the buffer >256KiB) instead of
the allocator because we have to keep the GPU virtual address of
buffers constant.  On Tesla, there's no dual page-tables like on Fermi
and up, one has do decide whether an entire range is going to be large
or small pages ahead of time.  The way things work currently is that
when userspace allocates a BO, it specifies the memory spaces where
it's OK to use the buffer from.  If the caller says (VRAM && GART) on
Tesla, then we will allocate small pages only so that if TTM kicks the
buffer out to system memory (which we probably can't guarantee we'll
get a whole heap of 64KiB pages), we can still render to/from it at
the same virtual address, without having to move it back to VRAM
first.  If (VRAM && size > 256KiB) we'll ask for large pages, but then
never be able to use it without migrating back to VRAM as necessary.

Ok. So.  A nouveau_bo generally has a single nouveau_mem associated
with it, *except* when TTM is doing a buffer move, a second one
appears for the destination of the move, and replaces the first when
it's finished.  Again, the source and destination page sizes may
differ, so the value can't be used from nouveau_bo.  You can think of
nouveau_bo::page_shift as being "the page size the buffer will have
when it's available to be used as a source/destination",
nouveau_mem::page_shift is the actual size for whatever allocation is
backing the nouveau_bo at that time.

I hope that made sense.  It's entirely possible I failed at explaining :P

>
> - In nouveau_vm_map*(), why are we using vma->node->type to decide whether
> to use the small or big pages table? It seems like this should rather be
> decided by mem->page_shift, and more generally by how contiguous the
> physical memory is, in order to maximize large pages use whenever possible.
> Right now the issue that we have is that if the memory allocator returns 4k
> pages, and the VMA used to map this memory uses 128k pages, we are mapping
> 4k pages at 128k interval, which cannot end well.
Because vma->node->type maps to what was requested in the
nouveau_vm_get() call to allocate address space.  We should, perhaps,
add assertions to make sure that when map() is called that the
nouveau_mem::page_shift does indeed match.  I did briefly think we
should just pass nouveau_mem into vm_get instead of size+page_shift,
but, there are cases where we want to allocate address space but don't
yet have memory to back it.  So, that's a non-starter.

Most, but not all of the "12" actually refers to the granularity of
the nouveau_mm that's created in vm_create(), and nothing to do with
either the system or gpu page size.  This was a very large fail on my
part to not use a define for it, and as noticed, there are a couple of
places where it's messed up..

Loads of stuff to be improved there.  It's been a matter of "there's
been worse stuff to get to first" until now, where it's actually a
problem for you guys.

Hopefully that helped somewhat,
Ben.

>
> Generally speaking it seems like the VM subsystem allows plenty of specific
> cases to fail silently, and since I need to fix a few to allow GK20A to
> operate I could as well try to fix them all. Answers to the questions above
> and general opinions about the state of this code would help me understand
> what needs to be done. :)
>
> Thanks,
> Alex.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
