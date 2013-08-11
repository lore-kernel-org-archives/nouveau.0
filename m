From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Sun, 11 Aug 2013 08:17:32 +0200
Message-ID: <52072C7C.8040104@canonical.com>
References: <1372740099.4820.24.camel@pasglop>
	<CAPM=9txvRW5MM849FVqOoSL28g=+hTDiLWaMtn5Kj-X3h1kJ8g@mail.gmail.com>
	<1376175111.32100.53.camel@pasglop>
	<1376179046.32100.60.camel@pasglop>
	<1376181670.32100.77.camel@pasglop>
	<1376199396.32100.106.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1376199396.32100.106.camel@pasglop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, =?ISO-8859-1?Q?St=E9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Op 11-08-13 07:36, Benjamin Herrenschmidt schreef:
> On Sun, 2013-08-11 at 10:41 +1000, Benjamin Herrenschmidt wrote:
>> Now, to do that, I need a better understanding of the various things
>> in there since I'm not familiar with nouveau at all. What I think I've
>> figured out is with a few questions, it would be awesome if you could
>> answer them so I can have a shot at fixing it all :-)
> Ok, a few more questions :-)
>
>  - in struct nouveau_mm_node, what unit are "offset" and "length" ?
Depends on the context. It's re-used a few times. In case of nouveau_vm it's multiples of 1<<12, which is the smallest unit
a card can address.
> They *seem* to be hard wired to be in units of 4k (regardless of either
> of system page size) which I assume means card small page size, but
> "offset" is in bytes ? At least according to my parsing of the code in
> nouveau_vm_map_at().
Correct.
> The big question then is whether that represents card address space or
> system address space... I assume the former right ? So a function like
> nouveau_vm_map_at() is solely concerned with mapping a piece of card
> address space in the card VM and thus shouldn't be concerned by the
> system PAGE_SIZE at all, right ?
Former, but the code entangles system PAGE_SIZE and card PAGE_SIZE/SHIFT/MASK in some cases.

> IE. The only one we should actually care about here is
> nouveau_vm_map_sg_table() or am I missing an important piece of the
> puzzle ?
nouveau_vm_map_sg too.

nouveau_vm_map is special, and also used to map VRAM into BAR1/BAR3 by subdev/bar code.
> Additionally, nv41.c has only map_sg() callbacks, no map() callbacks,
> should I assume that means that nouveau_vm_map() and nouveau_vm_map_at()
> will never be called on these ?
Correct. all cards before the nv50 family have no real vm. the BAR used for vram is just an identity mapping,
not the entirety of VRAM may be accessible to the system.
>  - In vm/base.c this construct appears regulary:
>
>     struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
>
> Which makes me believe we have separate page tables for small vs. large
> pages (in card mmu) (though I assume big is always 0 on nv40 unless
> missed something, I want to make sure I'm not breaking everything
> else...).
>
> Thus I assume that each "pte" in a "big" page table maps a page size
> of 1 << vmm->lpg_shift, is that correct ?
Correct, nv50+ are the only ones that support large pages.
> vmm->pgt_bits is always the same however, thus I assume that PDEs always
> map the same amount of space, but regions for large pages just have
> fewer PTEs, which seem to correspond to what the code does here:
>
> 	u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
>
> - My basic idea is to move the card page vs system PAGE breakdown
> up into vm/base.c, which seems reasonably simple in the case of
> nouveau_vm_map_sg_table() since we only call vmm->map_sg for one PTE at
> a time, but things get a bit trickier with nouveau_vm_map_sg which
> passes the whole page list down.
>
> Following my idea would mean essentially also making it operate one PTE
> at a time, thus potentially reducing the performance of the map
> operations.
>
> One option is to special case the PAGE_SIZE==12 case to keep the
> existing behaviour and operate in "reduced" (one PTE per call)
> mode in the other case but I dislike special casing like that (bitrots,
> one code path gets untested/unfixed, etc...)
>
> Another option would be to make struct nouveau_mem *mem ->pages always
> be an array of 4k (ie, create a breakdown when constructing that list),
> but I have yet to figure out what the impact would be (where that stuff
> gets created) and whether this is realistic at all...
>
>  - struct nouveau_mem is called "node" in various places (in
> nouveau_ttm) which is confusing. What is the relationship between
> nouveau_mem, nouveau_mm and nouveau_mm_node ? nouveau_mem seems to be
> having things such as "offset" in multiple of PAGE_SIZE, but have a
> "page_shift" member that appears to match the buffer object page_shift,
> hence seem to indicate that it is a card page shift...
>
> Would it be possible, maybe, to add comments next to the fields in
> those various data structure indicating in which units they are ?
>
>  - Similar confusion arises with things like struct ttm_mem_reg *mem.
> For example, in nouveau_ttm.c, I see statements like:
>
> 	ret = nouveau_vm_get(man->priv, mem->num_pages << 12, node->page_shift,
> 			     NV_MEM_ACCESS_RW, &node->vma[0]);
>
> Which seems to indicate that mem->num_pages is in multiple of 4k always,
> though I would have though that a ttm object was in multiple of
> PAGE_SIZE, am I wrong ?
>
> Especially since the same object is later populated using:
>
> 	mem->start   = node->vma[0].offset >> PAGE_SHIFT;
>
> So the "start" member is in units of PAGE_SHIFT here, not 12.
>
> So I'm still a bit confused :-)
>
The fun has been doubled because TTM expects PAGE units, so some of the PAGE_SHIFT's are
genuine. Some may be a result of PAGE_SHIFT == 12, so honestly I don't know the specific ones.
