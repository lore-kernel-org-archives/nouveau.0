From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Sun, 11 Aug 2013 15:36:36 +1000
Message-ID: <1376199396.32100.106.camel@pasglop>
References: <1372740099.4820.24.camel@pasglop>
	<CAPM=9txvRW5MM849FVqOoSL28g=+hTDiLWaMtn5Kj-X3h1kJ8g@mail.gmail.com>
	<1376175111.32100.53.camel@pasglop> <1376179046.32100.60.camel@pasglop>
	<1376181670.32100.77.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1376181670.32100.77.camel@pasglop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
List-Id: nouveau.vger.kernel.org

On Sun, 2013-08-11 at 10:41 +1000, Benjamin Herrenschmidt wrote:
> Now, to do that, I need a better understanding of the various things
> in there since I'm not familiar with nouveau at all. What I think I've
> figured out is with a few questions, it would be awesome if you could
> answer them so I can have a shot at fixing it all :-)

Ok, a few more questions :-)

 - in struct nouveau_mm_node, what unit are "offset" and "length" ?

They *seem* to be hard wired to be in units of 4k (regardless of either
of system page size) which I assume means card small page size, but
"offset" is in bytes ? At least according to my parsing of the code in
nouveau_vm_map_at().

The big question then is whether that represents card address space or
system address space... I assume the former right ? So a function like
nouveau_vm_map_at() is solely concerned with mapping a piece of card
address space in the card VM and thus shouldn't be concerned by the
system PAGE_SIZE at all, right ?

IE. The only one we should actually care about here is
nouveau_vm_map_sg_table() or am I missing an important piece of the
puzzle ?

Additionally, nv41.c has only map_sg() callbacks, no map() callbacks,
should I assume that means that nouveau_vm_map() and nouveau_vm_map_at()
will never be called on these ?

 - In vm/base.c this construct appears regulary:

    struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];

Which makes me believe we have separate page tables for small vs. large
pages (in card mmu) (though I assume big is always 0 on nv40 unless
missed something, I want to make sure I'm not breaking everything
else...).

Thus I assume that each "pte" in a "big" page table maps a page size
of 1 << vmm->lpg_shift, is that correct ?

vmm->pgt_bits is always the same however, thus I assume that PDEs always
map the same amount of space, but regions for large pages just have
fewer PTEs, which seem to correspond to what the code does here:

	u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;

- My basic idea is to move the card page vs system PAGE breakdown
up into vm/base.c, which seems reasonably simple in the case of
nouveau_vm_map_sg_table() since we only call vmm->map_sg for one PTE at
a time, but things get a bit trickier with nouveau_vm_map_sg which
passes the whole page list down.

Following my idea would mean essentially also making it operate one PTE
at a time, thus potentially reducing the performance of the map
operations.

One option is to special case the PAGE_SIZE==12 case to keep the
existing behaviour and operate in "reduced" (one PTE per call)
mode in the other case but I dislike special casing like that (bitrots,
one code path gets untested/unfixed, etc...)

Another option would be to make struct nouveau_mem *mem ->pages always
be an array of 4k (ie, create a breakdown when constructing that list),
but I have yet to figure out what the impact would be (where that stuff
gets created) and whether this is realistic at all...

 - struct nouveau_mem is called "node" in various places (in
nouveau_ttm) which is confusing. What is the relationship between
nouveau_mem, nouveau_mm and nouveau_mm_node ? nouveau_mem seems to be
having things such as "offset" in multiple of PAGE_SIZE, but have a
"page_shift" member that appears to match the buffer object page_shift,
hence seem to indicate that it is a card page shift...

Would it be possible, maybe, to add comments next to the fields in
those various data structure indicating in which units they are ?

 - Similar confusion arises with things like struct ttm_mem_reg *mem.
For example, in nouveau_ttm.c, I see statements like:

	ret = nouveau_vm_get(man->priv, mem->num_pages << 12, node->page_shift,
			     NV_MEM_ACCESS_RW, &node->vma[0]);

Which seems to indicate that mem->num_pages is in multiple of 4k always,
though I would have though that a ttm object was in multiple of
PAGE_SIZE, am I wrong ?

Especially since the same object is later populated using:

	mem->start   = node->vma[0].offset >> PAGE_SHIFT;

So the "start" member is in units of PAGE_SHIFT here, not 12.

So I'm still a bit confused :-)

Cheers,
Ben.
