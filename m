From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Thu, 29 Aug 2013 16:49:46 +1000
Message-ID: <CACAvsv41g-fXaUG168CJdETNkZzA2A5=L9Ri4gsmPaF6DsqkwQ@mail.gmail.com>
References: <1372740099.4820.24.camel@pasglop>
	<CAPM=9txvRW5MM849FVqOoSL28g=+hTDiLWaMtn5Kj-X3h1kJ8g@mail.gmail.com>
	<1376175111.32100.53.camel@pasglop>
	<1376179046.32100.60.camel@pasglop>
	<1376181670.32100.77.camel@pasglop>
	<1376199396.32100.106.camel@pasglop>
	<52072C7C.8040104@canonical.com>
	<1376204790.32100.109.camel@pasglop>
	<1376208256.32100.117.camel@pasglop>
	<52075323.4010200@canonical.com>
	<1376213713.32100.135.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1376213713.32100.135.camel@pasglop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?ISO-8859-1?Q?St=E9phane_Marchesin?= <marcheu@chromium.org>
List-Id: nouveau.vger.kernel.org

On Sun, Aug 11, 2013 at 7:35 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Sun, 2013-08-11 at 11:02 +0200, Maarten Lankhorst wrote:
>
>> > diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c
>> > index 5c7433d..c314a5f 100644
>> > --- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c
>> > +++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv40.c
>> > @@ -190,8 +190,8 @@ nv40_fifo_chan_ctor(struct nouveau_object *parent,
>> >     if (size < sizeof(*args))
>> >             return -EINVAL;
>> >
>> > -   ret = nouveau_fifo_channel_create(parent, engine, oclass, 0, 0xc00000,
>> > -                                     0x1000, args->pushbuf,
>> > +   ret = nouveau_fifo_channel_create(parent, engine, oclass, 0, 0x800000,
>> > +                                     0x10000, args->pushbuf,
>> >                                       (1ULL << NVDEV_ENGINE_DMAOBJ) |
>> >                                       (1ULL << NVDEV_ENGINE_SW) |
>> >                                       (1ULL << NVDEV_ENGINE_GR) |
>> Why the size change?
>
> This reverts the value to older ones, however that patch might not be
> needed anymore (I was carrying it from Dave but if we don't map the
> registers into userspace we shouldn't need to force align them).
>
>> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> > index ef3133e..5833851 100644
>> > --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> > +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> > @@ -84,10 +84,11 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
>> >  {
>> >     struct nouveau_vm *vm = vma->vm;
>> >     struct nouveau_vmmgr *vmm = vm->vmm;
>> > -   int big = vma->node->type != vmm->spg_shift;
>> > +   u32 shift = vma->node->type;
>> > +   int big = shift != vmm->spg_shift;
>> >     u32 offset = vma->node->offset + (delta >> 12);
>> > -   u32 bits = vma->node->type - 12;
>> > -   u32 num  = length >> vma->node->type;
>> > +   u32 bits = shift - 12;
>> > +   u32 num  = length >> shift;
>> >     u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
>> >     u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
>> >     u32 max  = 1 << (vmm->pgt_bits - bits);
>> > @@ -98,7 +99,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
>> >
>> >     for_each_sg(mem->sg->sgl, sg, mem->sg->nents, i) {
>> >             struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
>> > -           sglen = sg_dma_len(sg) >> PAGE_SHIFT;
>> > +           sglen = sg_dma_len(sg) >> shift;
>> >
>> >             end = pte + sglen;
>> >             if (unlikely(end >= max))
>> Please add a WARN_ON(big); in map_sg and map_sg_table if you do this.
>
> So that's debatable :-)
>
> The above code is map_sg. Arguably my patch *fixes* using it with card
> large pages :-)
>
> IE, Look at the "usual" case (PAGE_SHIFT=12). Today, the above means
> sglen will be in units of small pages. But everything else in that loop
> operates in units of whatever is represented by the pte, which can
> either be 4k or larger.
>
> So adding "sglen" to "pte" was never right for shift != 12 before
> (regardless of PAGE_SHIFT).
>
> With my patch, it's more correct, so as such, adding a WARN_ON here
> wouldn't be "if I do this" :-)
>
> Now, the "big" case still cannot really work here with PAGE_SHIFT=12,
> because that would require the sg segments to be multiple of
> "shift" (the card large page) and that is not going to be the case.
>
> So funnily enough, we *could* use card large pages of 64k ("big") if ...
> we had PAGE_SHIFT=16 ... which we do on ppc64 :-) But not anywhere else.
>
> But yes, the point remains, in the general case, that function cannot
> work for the "big" case, so I wonder if we should catch it with a
> WARN_ON and maybe simplify the code a bunch while at it...
>
>> > @@ -106,7 +107,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
>> >             len = end - pte;
>> >
>> >             for (m = 0; m < len; m++) {
>> > -                   dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);
>> > +                   dma_addr_t addr = sg_dma_address(sg) + (m << shift);
>> >
>> >                     vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
>> >                     num--;
>> > @@ -121,7 +122,7 @@ nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
>> >             }
>> >             if (m < sglen) {
>> >                     for (; m < sglen; m++) {
>> > -                           dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);
>> > +                           dma_addr_t addr = sg_dma_address(sg) + (m << shift);
>> >
>> >                             vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
>> >                             num--;
>> > @@ -136,6 +137,7 @@ finish:
>> >     vmm->flush(vm);
>> >  }
>> >
>> > +#if PAGE_SHIFT == 12
>> >  void
>> >  nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
>> >               struct nouveau_mem *mem)
>> > @@ -143,10 +145,11 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
>> >     struct nouveau_vm *vm = vma->vm;
>> >     struct nouveau_vmmgr *vmm = vm->vmm;
>> >     dma_addr_t *list = mem->pages;
>> > -   int big = vma->node->type != vmm->spg_shift;
>> > +   u32 shift = vma->node->type;
>> > +   int big = shift != vmm->spg_shift;
>> >     u32 offset = vma->node->offset + (delta >> 12);
>> > -   u32 bits = vma->node->type - 12;
>> > -   u32 num  = length >> vma->node->type;
>> > +   u32 bits = shift - 12;
>> > +   u32 num  = length >> shift;
>> >     u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
>> >     u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
>> >     u32 max  = 1 << (vmm->pgt_bits - bits);
>> > @@ -173,6 +176,52 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
>
> So the above is the existing one which I kept mostly intact ... but
> cannot work for shift != 12 either for the same reasons so here too, if
> we could simplify that ...
>
>> >     vmm->flush(vm);
>> >  }
>> > +#else
>> > +void
>> > +nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
>> > +             struct nouveau_mem *mem)
>> > +{
>> > +   struct nouveau_vm *vm = vma->vm;
>> > +   struct nouveau_vmmgr *vmm = vm->vmm;
>> > +   dma_addr_t *list = mem->pages;
>> > +   u32 shift = vma->node->type;
>> > +   int big = shift != vmm->spg_shift;
>> > +   u32 offset = vma->node->offset + (delta >> 12);
>> > +   u32 bits = shift - 12;
>> > +   u32 num  = length >> shift;
>> > +   u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
>> > +   u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
>> > +   u32 max  = 1 << (vmm->pgt_bits - bits);
>> > +   u32 sub_cnt = 1 << (PAGE_SHIFT - shift);
>> > +   u32 sub_rem = 0;
>> > +   u64 phys = 0;
>> > +
>> > +
>> > +   /* XXX This will not work for a big mapping ! */
>> > +   WARN_ON_ONCE(big);
>> > +
>> > +   while (num) {
>> > +           struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
>> > +
>> > +           if (sub_rem == 0) {
>> > +                   phys = *(list++);
>> > +                   sub_rem = sub_cnt;
>> > +           }
>> > +           vmm->map_sg(vma, pgt, mem, pte, 1, &phys);
>> > +
>> > +           num  -= 1;
>> > +           pte  += 1;
>> > +           sub_rem -= 1;
>> > +           phys += 1 << shift;
>> > +           if (unlikely(pte >= max)) {
>> > +                   pde++;
>> > +                   pte = 0;
>> > +           }
>> > +   }
>> > +
>> > +   vmm->flush(vm);
>> > +}
>> > +#endif
>>
>> Considering that map_sg in nv04-50 takes PAGE_SIZE pages, it would be easier to fix
>> map_sg for nv50 and nvc0, this would mean less fixing in map_sg/map_sg_table.
>
> Sorry, I'm not sure what you mean exactly ... The code *today* tries to
> handle things at the low level (vmm->map_sg) and that cannot work the
> way it's done. I'm removing that. Or rather, that cannot work unless we
> can guarantee that there will be no crossing of PTE page boundary (no
> crossing of pde) by the PAGE_SIZE page, which I think we cannot (see my
> discussion in my email asking if we could enforce that somewhat).
>
> Additionally the current code is broken in that the upper layer in
> vm/base.c doesn't increment "pte" by the right amount.
>
> Now, if those two assertions can be made always true:
>
>  - Those two functions (map_sg and map_sg_table) never deal with the
> "big" case.
>
>  - An object is always mapped at a card address that is a multiple
> of PAGE_SIZE (ie, invividual PAGE_SIZE pages don't cross pde boundaries
> when mapped)
I think these two restrictions are reasonable to enforce, and we should do so.

>
> Then we can probably simplify the code significantly *and* go back to
> handling PAGE_SIZE pages in the vmm->map_sg() instead of breaking them
> up a level above like I do.
Sounds good!

>
>> I don't like the duplicate definition, and the extra for loop in map_sg will be compiled out when page_size == 12.
>
> Sort-of. Right now, my code prevents calling vmm->map_sg with more than
> "1" as len which reduces perf in the PAGE_SHIFT=12 case, which is why I
> did the duplication.
>
> However this is just an illustration. I'm fully aware that this is not
> good as-is, I'm just poking to see what you guys think is the best
> approach to *properly* fix it.
>
>> Oh fun fact:
>> on nv50 if PAGE_SIZE = 64K you should just use large pages on the nvidia card for everything. :D
>
> I don't think I care at this stage but heh ...
>
>> I have no idea if it works for bar, but you could test..
>> In subdev/bar/nv50.c kmap/umap change the 12 argument to 16, and change vm->pgt[0].obj[0] to vm->pgt[0].obj[1] and vm->pgt[0].refcount[0] to vm->pgt[0].refcount[1].
>>
>> for nvc0 that would require 128K pages, but I believe it should work too.
>
> I don't think we want to go there right now, there is little benefit for
> the vast majority of platforms (x86 and ARM). Let's stick to making
> ppc64 "work" and not bother too much with things that will never be used
> in practice :-)
>
> I'd rather make the code simpler by removing the "big" case from those
> functions if it's never going to be used.
Fully agreed!

Ben.

>
> Cheers,
> Ben.
>
>> >
>> >  void
>> >  nouveau_vm_unmap_at(struct nouveau_vma *vma, u64 delta, u64 length)
>> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
>> > index ed45437..f7e2311 100644
>> > --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
>> > +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
>> > @@ -39,14 +39,10 @@ nv04_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
>> >  {
>> >     pte = 0x00008 + (pte * 4);
>> >     while (cnt) {
>> > -           u32 page = PAGE_SIZE / NV04_PDMA_PAGE;
>> >             u32 phys = (u32)*list++;
>> > -           while (cnt && page--) {
>> > -                   nv_wo32(pgt, pte, phys | 3);
>> > -                   phys += NV04_PDMA_PAGE;
>> > -                   pte += 4;
>> > -                   cnt -= 1;
>> > -           }
>> > +           nv_wo32(pgt, pte, phys | 3);
>> > +           pte += 4;
>> > +           cnt -= 1;
>> >     }
>> >  }
>> >
>> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
>> > index 064c762..a78f624 100644
>> > --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
>> > +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
>> > @@ -43,14 +43,10 @@ nv41_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
>> >  {
>> >     pte = pte * 4;
>> >     while (cnt) {
>> > -           u32 page = PAGE_SIZE / NV41_GART_PAGE;
>> >             u64 phys = (u64)*list++;
>> > -           while (cnt && page--) {
>> > -                   nv_wo32(pgt, pte, (phys >> 7) | 1);
>> > -                   phys += NV41_GART_PAGE;
>> > -                   pte += 4;
>> > -                   cnt -= 1;
>> > -           }
>> > +           nv_wo32(pgt, pte, (phys >> 7) | 1);
>> > +           pte += 4;
>> > +           cnt -= 1;
>> >     }
>> >  }
>> See above^, it's better if you could fixup nv50/nvc0.c instead.
>> >
>> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > index af20fba..694024d 100644
>> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> > @@ -226,7 +226,7 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
>> >     nvbo->page_shift = 12;
>> >     if (drm->client.base.vm) {
>> >             if (!(flags & TTM_PL_FLAG_TT) && size > 256 * 1024)
>> > -                   nvbo->page_shift = drm->client.base.vm->vmm->lpg_shift;
>> > +                   nvbo->page_shift = lpg_shift;
>> >     }
>> >
>> >     nouveau_bo_fixup_align(nvbo, flags, &align, &size);
>> Hm.. I don't know if it will be an issue here. But I'm concerned about the cases where nouveau_vm can end up unaligned.
>> This will not be an issue for the bar mappings, because they map the entire bo, and bo's are always page aligned.
>> See nouveau_bo_fixup_align.
>>
>> But the channel vm mappings are no longer guaranteed to be page aligned. In fact it's very likely they are all misaligned due to some vm allocations
>> done when mapping a channel. This is only a problem on nv50+ though. Probably not an issue you're hitting.
>> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
>> > index ca5492a..494cf88 100644
>> > --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
>> > +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
>> > @@ -31,7 +31,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *mem)
>> >  {
>> >     struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
>> >     struct nouveau_mem *node = mem->mm_node;
>> > -   u64 size = mem->num_pages << 12;
>> > +   u64 size = mem->num_pages << PAGE_SHIFT;
>> >
>> >     if (ttm->sg) {
>> >             node->sg = ttm->sg;
>> > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> > index 19e3757..f0629de 100644
>> > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> > @@ -252,8 +252,8 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
>> >
>> >     node->page_shift = 12;
>> >
>> > -   ret = nouveau_vm_get(man->priv, mem->num_pages << 12, node->page_shift,
>> > -                        NV_MEM_ACCESS_RW, &node->vma[0]);
>> > +   ret = nouveau_vm_get(man->priv, mem->num_pages << PAGE_SHIFT,
>> > +                        node->page_shift, NV_MEM_ACCESS_RW, &node->vma[0]);
>> >     if (ret) {
>> >             kfree(node);
>> >             return ret;
>> >
>> >
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
