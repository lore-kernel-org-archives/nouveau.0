From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Wed, 11 Dec 2013 13:19:34 +1000
Message-ID: <CACAvsv7L4qApEDGBLe7gCeivg0jCHE4sg4YUcX-z4vQya5fGyw@mail.gmail.com>
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
	<CACAvsv41g-fXaUG168CJdETNkZzA2A5=L9Ri4gsmPaF6DsqkwQ@mail.gmail.com>
	<1385704897.9218.156.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1385704897.9218.156.camel@pasglop>
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

On Fri, Nov 29, 2013 at 4:01 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2013-08-29 at 16:49 +1000, Ben Skeggs wrote:
>
>> > Additionally the current code is broken in that the upper layer in
>> > vm/base.c doesn't increment "pte" by the right amount.
>> >
>> > Now, if those two assertions can be made always true:
>> >
>> >  - Those two functions (map_sg and map_sg_table) never deal with the
>> > "big" case.
>> >
>> >  - An object is always mapped at a card address that is a multiple
>> > of PAGE_SIZE (ie, invividual PAGE_SIZE pages don't cross pde boundaries
>> > when mapped)
>
>> I think these two restrictions are reasonable to enforce, and we should do so.
>>
>> >
>> > Then we can probably simplify the code significantly *and* go back to
>> > handling PAGE_SIZE pages in the vmm->map_sg() instead of breaking them
>> > up a level above like I do.
>
>> Sounds good!
>
> Ok so I experimented with that approach a bit. The code could probably
> use further simplifications and cleanups but it seems to work. Note that
> I haven't been able to test much more than the fbdev and the DDX without
> 3d accel since GLX is currently broken on nouveau big endian for other
> reasons (no visuals) since the Gallium BE rework by Ajax (plus the
> nv30/40 merge also introduced artifacts and instabilities on BE which I
> haven't tracked down either).
>
> The basic idea here is that the backend vmm->map_sg operates on system
> PAGE_SIZE, which allows to continue passing a page array down as we do
> today.
>
> That means however that only the nv04 and nv41 backends handle that case
> right now, the other ones will have to be fixed eventually but the fix
> is rather easy.
>
> Now it's possible that I've missed cases where card objects might be
> allocated in vram that isn't system PAGE_SIZE aligned, in which case we
> will have breakage due to having a single system PAGE crossing a PDE
> boundary, you'll have to help me here figure that out though I haven't
> hit any of my WARN_ON's so far :-)
>
> Patch isn't S-O-B yet, first let me know what you think of the approach
> (and maybe check I didn't break x86 :-)
Hey Ben,

I definitely think the approach is the one that makes the most sense,
for sure.  The patch so far looks fine also, minor comments inline,
but nothing exciting to add really.

>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> index ef3133e..44dc050 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> @@ -82,55 +82,77 @@ void
>  nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
>                         struct nouveau_mem *mem)
>  {
> +       /*
> +        * XXX Should the "12" in a couple of places here be replaced
> +        * with vmm->spg_shift for correctness ? Might help if we ever
> +        * support 64k card pages on 64k PAGE_SIZE systems
> +        */
The only "12"s that were left (yes, i missed some too obviously) were
intended to just be used to represent the smallest allocation unit for
the address space allocator, and not necessarily related to the
small/large page shift or the host page size.  However, it's probably
completely useless to have an allocation unit smaller than the small
page size anyway, so, go ahead.

I didn't review the map_sg_table hunks explicitly, assuming just
changes in similar spirit to map_sg.

>         struct nouveau_vm *vm = vma->vm;
>         struct nouveau_vmmgr *vmm = vm->vmm;
> -       int big = vma->node->type != vmm->spg_shift;
>         u32 offset = vma->node->offset + (delta >> 12);
> -       u32 bits = vma->node->type - 12;
> -       u32 num  = length >> vma->node->type;
> +       u32 shift = vma->node->type;
> +       u32 order = PAGE_SHIFT - shift;
> +       u32 num  = length >> PAGE_SHIFT;
>         u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
> -       u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
> -       u32 max  = 1 << (vmm->pgt_bits - bits);
> -       unsigned m, sglen;
> -       u32 end, len;
> +       u32 pte  = offset & ((1 << vmm->pgt_bits) - 1);
> +       u32 max  = 1 << vmm->pgt_bits;
> +       u32 end, len, cardlen;
>         int i;
>         struct scatterlist *sg;
>
> -       for_each_sg(mem->sg->sgl, sg, mem->sg->nents, i) {
> -               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
> -               sglen = sg_dma_len(sg) >> PAGE_SHIFT;
> +       /* We don't handle "big" pages here */
> +       if (WARN_ON(shift != vmm->spg_shift || shift > PAGE_SHIFT))
> +               return;
>
> -               end = pte + sglen;
> -               if (unlikely(end >= max))
> -                       end = max;
> -               len = end - pte;
> +       /* We dont' handle objects that aren't PAGE_SIZE aligned either */
> +       if (WARN_ON((offset << 12) & ~PAGE_MASK))
> +               return;
>
> -               for (m = 0; m < len; m++) {
> -                       dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);
> +       /* Iterate sglist elements */
> +       for_each_sg(mem->sg->sgl, sg, mem->sg->nents, i) {
> +               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[0];
> +               unsigned long m, sglen;
> +               dma_addr_t addr;
>
> -                       vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
> -                       num--;
> -                       pte++;
> +               /* Number of system pages and base address */
> +               sglen = sg_dma_len(sg) >> PAGE_SHIFT;
> +               addr = sg_dma_address(sg);
> +
> +               /* Iterate over system pages in the segment and
> +                * covered PDEs
> +                */
> +               while(sglen) {
> +                       /* Number of card PTEs */
> +                       cardlen = sglen << order;
> +                       end = pte + cardlen;
> +                       if (unlikely(end > max))
> +                               end = max;
> +                       cardlen = end - pte;
>
> -                       if (num == 0)
> -                               goto finish;
> -               }
> -               if (unlikely(end >= max)) {
> -                       pde++;
> -                       pte = 0;
> -               }
> -               if (m < sglen) {
> -                       for (; m < sglen; m++) {
> -                               dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);
> +                       /* Convert back to system pages after cropping */
> +                       len = cardlen >> order;
> +
> +                       /* Ensure this fits system pages */
> +                       if (WARN_ON((len << order) != cardlen))
> +                               break;
>
> +                       /* For each system page in the segment */
> +                       for (m = 0; m < len; m++) {
>                                 vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
> +                               addr += PAGE_SIZE;
>                                 num--;
> -                               pte++;
> +                               pte += (1u << order);
>                                 if (num == 0)
>                                         goto finish;
>                         }
> -               }
> +                       sglen -= len;
>
> +                       /* Wrap to next PDE ? */
> +                       if (unlikely(end >= max)) {
> +                               pde++;
> +                               pte = 0;
> +                       }
> +               }
>         }
>  finish:
>         vmm->flush(vm);
> @@ -143,28 +165,44 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
>         struct nouveau_vm *vm = vma->vm;
>         struct nouveau_vmmgr *vmm = vm->vmm;
>         dma_addr_t *list = mem->pages;
> -       int big = vma->node->type != vmm->spg_shift;
>         u32 offset = vma->node->offset + (delta >> 12);
> -       u32 bits = vma->node->type - 12;
> -       u32 num  = length >> vma->node->type;
> +       u32 shift = vma->node->type;
> +       u32 order = PAGE_SHIFT - shift;
> +       u32 num  = length >> PAGE_SHIFT;
>         u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
> -       u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
> -       u32 max  = 1 << (vmm->pgt_bits - bits);
> -       u32 end, len;
> +       u32 pte  = offset & ((1 << vmm->pgt_bits) - 1);
> +       u32 max  = 1 << vmm->pgt_bits;
> +       u32 end, len, cardlen;
> +
> +       /* We don't handle "big" pages here */
> +       if (WARN_ON(shift != vmm->spg_shift || shift > PAGE_SHIFT))
> +               return;
> +
> +       /* We dont' handle objects that aren't PAGE_SIZE aligned either */
> +       if (WARN_ON((offset << 12) & ~PAGE_MASK))
> +               return;
>
>         while (num) {
> -               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
> +               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[0];
>
> -               end = (pte + num);
> -               if (unlikely(end >= max))
> +               /* "num" is remaining system pages, check how many fit
> +                * in the PDE
> +                */
> +               end = (pte + (num << order));
> +               if (unlikely(end > max))
>                         end = max;
> -               len = end - pte;
> +               cardlen = end - pte;
> +               len = cardlen >> order;
> +
> +               /* Ensure this fits system pages */
> +               if (WARN_ON((len << order) != cardlen))
> +                       break;
>
>                 vmm->map_sg(vma, pgt, mem, pte, len, list);
>
>                 num  -= len;
> -               pte  += len;
>                 list += len;
> +               pte  += cardlen;
I think this all looks OK too.

>                 if (unlikely(end >= max)) {
>                         pde++;
>                         pte = 0;
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> index ed45437..c1e7c11 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> @@ -38,14 +38,13 @@ nv04_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
>                struct nouveau_mem *mem, u32 pte, u32 cnt, dma_addr_t *list)
>  {
>         pte = 0x00008 + (pte * 4);
> -       while (cnt) {
> +       while (cnt--) {
>                 u32 page = PAGE_SIZE / NV04_PDMA_PAGE;
>                 u32 phys = (u32)*list++;
> -               while (cnt && page--) {
> +               while (page--) {
>                         nv_wo32(pgt, pte, phys | 3);
>                         phys += NV04_PDMA_PAGE;
>                         pte += 4;
> -                       cnt -= 1;
>                 }
>         }
>  }
Ack

> diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> index 064c762..09570d7 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> @@ -42,14 +42,13 @@ nv41_vm_map_sg(struct nouveau_vma *vma, struct nouveau_gpuobj *pgt,
>                struct nouveau_mem *mem, u32 pte, u32 cnt, dma_addr_t *list)
>  {
>         pte = pte * 4;
> -       while (cnt) {
> +       while (cnt--) {
>                 u32 page = PAGE_SIZE / NV41_GART_PAGE;
>                 u64 phys = (u64)*list++;
> -               while (cnt && page--) {
> +               while (page--) {
>                         nv_wo32(pgt, pte, (phys >> 7) | 1);
>                         phys += NV41_GART_PAGE;
>                         pte += 4;
> -                       cnt -= 1;
>                 }
>         }
>  }
Ack

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index c0fde6b..16dce89 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -178,7 +178,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
>                 *size = roundup(*size, (1 << nvbo->page_shift));
>                 *align = max((1 <<  nvbo->page_shift), *align);
>         }
> -
> +       *align = roundup(*align, PAGE_SIZE);
>         *size = roundup(*size, PAGE_SIZE);
>  }
>
> @@ -221,7 +221,7 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
>         nvbo->page_shift = 12;
>         if (drm->client.base.vm) {
>                 if (!(flags & TTM_PL_FLAG_TT) && size > 256 * 1024)
> -                       nvbo->page_shift = drm->client.base.vm->vmm->lpg_shift;
> +                       nvbo->page_shift = lpg_shift;
>         }
Ack both hunks.

>
>         nouveau_bo_fixup_align(nvbo, flags, &align, &size);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> index 0843ebc..f255ff8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> @@ -31,7 +31,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg *mem)
>  {
>         struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
>         struct nouveau_mem *node = mem->mm_node;
> -       u64 size = mem->num_pages << 12;
> +       u64 size = mem->num_pages << PAGE_SHIFT;
Ack.  However, a patch doing this already exists in the Nouveau kernel
tree (http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=19ab15062b8fde70ff04784bd49abc330e92310d).


>
>         if (ttm->sg) {
>                 node->sg = ttm->sg;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 19e3757..b7fc456 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -252,8 +252,9 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
>
>         node->page_shift = 12;
>
> -       ret = nouveau_vm_get(man->priv, mem->num_pages << 12, node->page_shift,
> -                            NV_MEM_ACCESS_RW, &node->vma[0]);
> +       ret = nouveau_vm_get(man->priv, mem->num_pages << PAGE_SHIFT,
> +                            node->page_shift, NV_MEM_ACCESS_RW,
> +                            &node->vma[0]);
Ack.

>         if (ret) {
>                 kfree(node);
>                 return ret;
>
>
