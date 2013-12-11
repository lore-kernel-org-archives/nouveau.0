From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Fixing nouveau for >4k PAGE_SIZE
Date: Wed, 11 Dec 2013 08:44:10 -0600
Message-ID: <CAEk2StnDn6KNK3zEkujkRP4jJd_gb_ec62qiyqzwDNUr-nHFMw@mail.gmail.com>
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
	<CACAvsv7L4qApEDGBLe7gCeivg0jCHE4sg4YUcX-z4vQya5fGyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0728733996=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv7L4qApEDGBLe7gCeivg0jCHE4sg4YUcX-z4vQya5fGyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, =?ISO-8859-1?Q?St=E9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0728733996==
Content-Type: multipart/alternative; boundary=047d7b676c90110b8c04ed4343ad

--047d7b676c90110b8c04ed4343ad
Content-Type: text/plain; charset=ISO-8859-1

I'm looking forward to something that fixes page size bugs. I still have
the SPARC box that I reported but #58984 [1] on and I'm ready to test
changes. Is there an easy way to apply these patches to nouveau master and
try it out? SPARC has (default) 8KB page size, though, not 64KB.



[1] https://bugs.freedesktop.org/show_bug.cgi?id=58984


On Tue, Dec 10, 2013 at 9:19 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Fri, Nov 29, 2013 at 4:01 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Thu, 2013-08-29 at 16:49 +1000, Ben Skeggs wrote:
> >
> >> > Additionally the current code is broken in that the upper layer in
> >> > vm/base.c doesn't increment "pte" by the right amount.
> >> >
> >> > Now, if those two assertions can be made always true:
> >> >
> >> >  - Those two functions (map_sg and map_sg_table) never deal with the
> >> > "big" case.
> >> >
> >> >  - An object is always mapped at a card address that is a multiple
> >> > of PAGE_SIZE (ie, invividual PAGE_SIZE pages don't cross pde
> boundaries
> >> > when mapped)
> >
> >> I think these two restrictions are reasonable to enforce, and we should
> do so.
> >>
> >> >
> >> > Then we can probably simplify the code significantly *and* go back to
> >> > handling PAGE_SIZE pages in the vmm->map_sg() instead of breaking them
> >> > up a level above like I do.
> >
> >> Sounds good!
> >
> > Ok so I experimented with that approach a bit. The code could probably
> > use further simplifications and cleanups but it seems to work. Note that
> > I haven't been able to test much more than the fbdev and the DDX without
> > 3d accel since GLX is currently broken on nouveau big endian for other
> > reasons (no visuals) since the Gallium BE rework by Ajax (plus the
> > nv30/40 merge also introduced artifacts and instabilities on BE which I
> > haven't tracked down either).
> >
> > The basic idea here is that the backend vmm->map_sg operates on system
> > PAGE_SIZE, which allows to continue passing a page array down as we do
> > today.
> >
> > That means however that only the nv04 and nv41 backends handle that case
> > right now, the other ones will have to be fixed eventually but the fix
> > is rather easy.
> >
> > Now it's possible that I've missed cases where card objects might be
> > allocated in vram that isn't system PAGE_SIZE aligned, in which case we
> > will have breakage due to having a single system PAGE crossing a PDE
> > boundary, you'll have to help me here figure that out though I haven't
> > hit any of my WARN_ON's so far :-)
> >
> > Patch isn't S-O-B yet, first let me know what you think of the approach
> > (and maybe check I didn't break x86 :-)
> Hey Ben,
>
> I definitely think the approach is the one that makes the most sense,
> for sure.  The patch so far looks fine also, minor comments inline,
> but nothing exciting to add really.
>
> >
> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> > index ef3133e..44dc050 100644
> > --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> > +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
> > @@ -82,55 +82,77 @@ void
> >  nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 length,
> >                         struct nouveau_mem *mem)
> >  {
> > +       /*
> > +        * XXX Should the "12" in a couple of places here be replaced
> > +        * with vmm->spg_shift for correctness ? Might help if we ever
> > +        * support 64k card pages on 64k PAGE_SIZE systems
> > +        */
> The only "12"s that were left (yes, i missed some too obviously) were
> intended to just be used to represent the smallest allocation unit for
> the address space allocator, and not necessarily related to the
> small/large page shift or the host page size.  However, it's probably
> completely useless to have an allocation unit smaller than the small
> page size anyway, so, go ahead.
>
> I didn't review the map_sg_table hunks explicitly, assuming just
> changes in similar spirit to map_sg.
>
> >         struct nouveau_vm *vm = vma->vm;
> >         struct nouveau_vmmgr *vmm = vm->vmm;
> > -       int big = vma->node->type != vmm->spg_shift;
> >         u32 offset = vma->node->offset + (delta >> 12);
> > -       u32 bits = vma->node->type - 12;
> > -       u32 num  = length >> vma->node->type;
> > +       u32 shift = vma->node->type;
> > +       u32 order = PAGE_SHIFT - shift;
> > +       u32 num  = length >> PAGE_SHIFT;
> >         u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
> > -       u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
> > -       u32 max  = 1 << (vmm->pgt_bits - bits);
> > -       unsigned m, sglen;
> > -       u32 end, len;
> > +       u32 pte  = offset & ((1 << vmm->pgt_bits) - 1);
> > +       u32 max  = 1 << vmm->pgt_bits;
> > +       u32 end, len, cardlen;
> >         int i;
> >         struct scatterlist *sg;
> >
> > -       for_each_sg(mem->sg->sgl, sg, mem->sg->nents, i) {
> > -               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
> > -               sglen = sg_dma_len(sg) >> PAGE_SHIFT;
> > +       /* We don't handle "big" pages here */
> > +       if (WARN_ON(shift != vmm->spg_shift || shift > PAGE_SHIFT))
> > +               return;
> >
> > -               end = pte + sglen;
> > -               if (unlikely(end >= max))
> > -                       end = max;
> > -               len = end - pte;
> > +       /* We dont' handle objects that aren't PAGE_SIZE aligned either
> */
> > +       if (WARN_ON((offset << 12) & ~PAGE_MASK))
> > +               return;
> >
> > -               for (m = 0; m < len; m++) {
> > -                       dma_addr_t addr = sg_dma_address(sg) + (m <<
> PAGE_SHIFT);
> > +       /* Iterate sglist elements */
> > +       for_each_sg(mem->sg->sgl, sg, mem->sg->nents, i) {
> > +               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[0];
> > +               unsigned long m, sglen;
> > +               dma_addr_t addr;
> >
> > -                       vmm->map_sg(vma, pgt, mem, pte, 1, &addr);
> > -                       num--;
> > -                       pte++;
> > +               /* Number of system pages and base address */
> > +               sglen = sg_dma_len(sg) >> PAGE_SHIFT;
> > +               addr = sg_dma_address(sg);
> > +
> > +               /* Iterate over system pages in the segment and
> > +                * covered PDEs
> > +                */
> > +               while(sglen) {
> > +                       /* Number of card PTEs */
> > +                       cardlen = sglen << order;
> > +                       end = pte + cardlen;
> > +                       if (unlikely(end > max))
> > +                               end = max;
> > +                       cardlen = end - pte;
> >
> > -                       if (num == 0)
> > -                               goto finish;
> > -               }
> > -               if (unlikely(end >= max)) {
> > -                       pde++;
> > -                       pte = 0;
> > -               }
> > -               if (m < sglen) {
> > -                       for (; m < sglen; m++) {
> > -                               dma_addr_t addr = sg_dma_address(sg) +
> (m << PAGE_SHIFT);
> > +                       /* Convert back to system pages after cropping */
> > +                       len = cardlen >> order;
> > +
> > +                       /* Ensure this fits system pages */
> > +                       if (WARN_ON((len << order) != cardlen))
> > +                               break;
> >
> > +                       /* For each system page in the segment */
> > +                       for (m = 0; m < len; m++) {
> >                                 vmm->map_sg(vma, pgt, mem, pte, 1,
> &addr);
> > +                               addr += PAGE_SIZE;
> >                                 num--;
> > -                               pte++;
> > +                               pte += (1u << order);
> >                                 if (num == 0)
> >                                         goto finish;
> >                         }
> > -               }
> > +                       sglen -= len;
> >
> > +                       /* Wrap to next PDE ? */
> > +                       if (unlikely(end >= max)) {
> > +                               pde++;
> > +                               pte = 0;
> > +                       }
> > +               }
> >         }
> >  finish:
> >         vmm->flush(vm);
> > @@ -143,28 +165,44 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64
> delta, u64 length,
> >         struct nouveau_vm *vm = vma->vm;
> >         struct nouveau_vmmgr *vmm = vm->vmm;
> >         dma_addr_t *list = mem->pages;
> > -       int big = vma->node->type != vmm->spg_shift;
> >         u32 offset = vma->node->offset + (delta >> 12);
> > -       u32 bits = vma->node->type - 12;
> > -       u32 num  = length >> vma->node->type;
> > +       u32 shift = vma->node->type;
> > +       u32 order = PAGE_SHIFT - shift;
> > +       u32 num  = length >> PAGE_SHIFT;
> >         u32 pde  = (offset >> vmm->pgt_bits) - vm->fpde;
> > -       u32 pte  = (offset & ((1 << vmm->pgt_bits) - 1)) >> bits;
> > -       u32 max  = 1 << (vmm->pgt_bits - bits);
> > -       u32 end, len;
> > +       u32 pte  = offset & ((1 << vmm->pgt_bits) - 1);
> > +       u32 max  = 1 << vmm->pgt_bits;
> > +       u32 end, len, cardlen;
> > +
> > +       /* We don't handle "big" pages here */
> > +       if (WARN_ON(shift != vmm->spg_shift || shift > PAGE_SHIFT))
> > +               return;
> > +
> > +       /* We dont' handle objects that aren't PAGE_SIZE aligned either
> */
> > +       if (WARN_ON((offset << 12) & ~PAGE_MASK))
> > +               return;
> >
> >         while (num) {
> > -               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];
> > +               struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[0];
> >
> > -               end = (pte + num);
> > -               if (unlikely(end >= max))
> > +               /* "num" is remaining system pages, check how many fit
> > +                * in the PDE
> > +                */
> > +               end = (pte + (num << order));
> > +               if (unlikely(end > max))
> >                         end = max;
> > -               len = end - pte;
> > +               cardlen = end - pte;
> > +               len = cardlen >> order;
> > +
> > +               /* Ensure this fits system pages */
> > +               if (WARN_ON((len << order) != cardlen))
> > +                       break;
> >
> >                 vmm->map_sg(vma, pgt, mem, pte, len, list);
> >
> >                 num  -= len;
> > -               pte  += len;
> >                 list += len;
> > +               pte  += cardlen;
> I think this all looks OK too.
>
> >                 if (unlikely(end >= max)) {
> >                         pde++;
> >                         pte = 0;
> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> > index ed45437..c1e7c11 100644
> > --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> > +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c
> > @@ -38,14 +38,13 @@ nv04_vm_map_sg(struct nouveau_vma *vma, struct
> nouveau_gpuobj *pgt,
> >                struct nouveau_mem *mem, u32 pte, u32 cnt, dma_addr_t
> *list)
> >  {
> >         pte = 0x00008 + (pte * 4);
> > -       while (cnt) {
> > +       while (cnt--) {
> >                 u32 page = PAGE_SIZE / NV04_PDMA_PAGE;
> >                 u32 phys = (u32)*list++;
> > -               while (cnt && page--) {
> > +               while (page--) {
> >                         nv_wo32(pgt, pte, phys | 3);
> >                         phys += NV04_PDMA_PAGE;
> >                         pte += 4;
> > -                       cnt -= 1;
> >                 }
> >         }
> >  }
> Ack
>
> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> > index 064c762..09570d7 100644
> > --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> > +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c
> > @@ -42,14 +42,13 @@ nv41_vm_map_sg(struct nouveau_vma *vma, struct
> nouveau_gpuobj *pgt,
> >                struct nouveau_mem *mem, u32 pte, u32 cnt, dma_addr_t
> *list)
> >  {
> >         pte = pte * 4;
> > -       while (cnt) {
> > +       while (cnt--) {
> >                 u32 page = PAGE_SIZE / NV41_GART_PAGE;
> >                 u64 phys = (u64)*list++;
> > -               while (cnt && page--) {
> > +               while (page--) {
> >                         nv_wo32(pgt, pte, (phys >> 7) | 1);
> >                         phys += NV41_GART_PAGE;
> >                         pte += 4;
> > -                       cnt -= 1;
> >                 }
> >         }
> >  }
> Ack
>
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index c0fde6b..16dce89 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -178,7 +178,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32
> flags,
> >                 *size = roundup(*size, (1 << nvbo->page_shift));
> >                 *align = max((1 <<  nvbo->page_shift), *align);
> >         }
> > -
> > +       *align = roundup(*align, PAGE_SIZE);
> >         *size = roundup(*size, PAGE_SIZE);
> >  }
> >
> > @@ -221,7 +221,7 @@ nouveau_bo_new(struct drm_device *dev, int size, int
> align,
> >         nvbo->page_shift = 12;
> >         if (drm->client.base.vm) {
> >                 if (!(flags & TTM_PL_FLAG_TT) && size > 256 * 1024)
> > -                       nvbo->page_shift =
> drm->client.base.vm->vmm->lpg_shift;
> > +                       nvbo->page_shift = lpg_shift;
> >         }
> Ack both hunks.
>
> >
> >         nouveau_bo_fixup_align(nvbo, flags, &align, &size);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > index 0843ebc..f255ff8 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > @@ -31,7 +31,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_reg
> *mem)
> >  {
> >         struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
> >         struct nouveau_mem *node = mem->mm_node;
> > -       u64 size = mem->num_pages << 12;
> > +       u64 size = mem->num_pages << PAGE_SHIFT;
> Ack.  However, a patch doing this already exists in the Nouveau kernel
> tree (
> http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=19ab15062b8fde70ff04784bd49abc330e92310d
> ).
>
>
> >
> >         if (ttm->sg) {
> >                 node->sg = ttm->sg;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > index 19e3757..b7fc456 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > @@ -252,8 +252,9 @@ nv04_gart_manager_new(struct ttm_mem_type_manager
> *man,
> >
> >         node->page_shift = 12;
> >
> > -       ret = nouveau_vm_get(man->priv, mem->num_pages << 12,
> node->page_shift,
> > -                            NV_MEM_ACCESS_RW, &node->vma[0]);
> > +       ret = nouveau_vm_get(man->priv, mem->num_pages << PAGE_SHIFT,
> > +                            node->page_shift, NV_MEM_ACCESS_RW,
> > +                            &node->vma[0]);
> Ack.
>
> >         if (ret) {
> >                 kfree(node);
> >                 return ret;
> >
> >
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--047d7b676c90110b8c04ed4343ad
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m looking forward to something that fixes page size =
bugs. I still have the SPARC box that I reported but #58984 [1] on and I&#3=
9;m ready to test changes. Is there an easy way to apply these patches to n=
ouveau master and try it out? SPARC has (default) 8KB page size, though, no=
t 64KB.<div>
<br></div><div><br></div><div><br></div><div>[1]=A0<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D58984">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D58984</a><br></div></div><div class=3D"gmail_extra"><br><br><d=
iv class=3D"gmail_quote">
On Tue, Dec 10, 2013 at 9:19 PM, Ben Skeggs <span dir=3D"ltr">&lt;<a href=
=3D"mailto:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
On Fri, Nov 29, 2013 at 4:01 PM, Benjamin Herrenschmidt<br>
&lt;<a href=3D"mailto:benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org">benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org</a=
>&gt; wrote:<br>
&gt; On Thu, 2013-08-29 at 16:49 +1000, Ben Skeggs wrote:<br>
&gt;<br>
&gt;&gt; &gt; Additionally the current code is broken in that the upper lay=
er in<br>
&gt;&gt; &gt; vm/base.c doesn&#39;t increment &quot;pte&quot; by the right =
amount.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Now, if those two assertions can be made always true:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =A0- Those two functions (map_sg and map_sg_table) never deal=
 with the<br>
&gt;&gt; &gt; &quot;big&quot; case.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =A0- An object is always mapped at a card address that is a m=
ultiple<br>
&gt;&gt; &gt; of PAGE_SIZE (ie, invividual PAGE_SIZE pages don&#39;t cross =
pde boundaries<br>
&gt;&gt; &gt; when mapped)<br>
&gt;<br>
&gt;&gt; I think these two restrictions are reasonable to enforce, and we s=
hould do so.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Then we can probably simplify the code significantly *and* go=
 back to<br>
&gt;&gt; &gt; handling PAGE_SIZE pages in the vmm-&gt;map_sg() instead of b=
reaking them<br>
&gt;&gt; &gt; up a level above like I do.<br>
&gt;<br>
&gt;&gt; Sounds good!<br>
&gt;<br>
&gt; Ok so I experimented with that approach a bit. The code could probably=
<br>
&gt; use further simplifications and cleanups but it seems to work. Note th=
at<br>
&gt; I haven&#39;t been able to test much more than the fbdev and the DDX w=
ithout<br>
&gt; 3d accel since GLX is currently broken on nouveau big endian for other=
<br>
&gt; reasons (no visuals) since the Gallium BE rework by Ajax (plus the<br>
&gt; nv30/40 merge also introduced artifacts and instabilities on BE which =
I<br>
&gt; haven&#39;t tracked down either).<br>
&gt;<br>
&gt; The basic idea here is that the backend vmm-&gt;map_sg operates on sys=
tem<br>
&gt; PAGE_SIZE, which allows to continue passing a page array down as we do=
<br>
&gt; today.<br>
&gt;<br>
&gt; That means however that only the nv04 and nv41 backends handle that ca=
se<br>
&gt; right now, the other ones will have to be fixed eventually but the fix=
<br>
&gt; is rather easy.<br>
&gt;<br>
&gt; Now it&#39;s possible that I&#39;ve missed cases where card objects mi=
ght be<br>
&gt; allocated in vram that isn&#39;t system PAGE_SIZE aligned, in which ca=
se we<br>
&gt; will have breakage due to having a single system PAGE crossing a PDE<b=
r>
&gt; boundary, you&#39;ll have to help me here figure that out though I hav=
en&#39;t<br>
&gt; hit any of my WARN_ON&#39;s so far :-)<br>
&gt;<br>
&gt; Patch isn&#39;t S-O-B yet, first let me know what you think of the app=
roach<br>
&gt; (and maybe check I didn&#39;t break x86 :-)<br>
Hey Ben,<br>
<br>
I definitely think the approach is the one that makes the most sense,<br>
for sure. =A0The patch so far looks fine also, minor comments inline,<br>
but nothing exciting to add really.<br>
<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/g=
pu/drm/nouveau/core/subdev/vm/base.c<br>
&gt; index ef3133e..44dc050 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c<br>
&gt; @@ -82,55 +82,77 @@ void<br>
&gt; =A0nouveau_vm_map_sg_table(struct nouveau_vma *vma, u64 delta, u64 len=
gth,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_mem *me=
m)<br>
&gt; =A0{<br>
&gt; + =A0 =A0 =A0 /*<br>
&gt; + =A0 =A0 =A0 =A0* XXX Should the &quot;12&quot; in a couple of places=
 here be replaced<br>
&gt; + =A0 =A0 =A0 =A0* with vmm-&gt;spg_shift for correctness ? Might help=
 if we ever<br>
&gt; + =A0 =A0 =A0 =A0* support 64k card pages on 64k PAGE_SIZE systems<br>
&gt; + =A0 =A0 =A0 =A0*/<br>
The only &quot;12&quot;s that were left (yes, i missed some too obviously) =
were<br>
intended to just be used to represent the smallest allocation unit for<br>
the address space allocator, and not necessarily related to the<br>
small/large page shift or the host page size. =A0However, it&#39;s probably=
<br>
completely useless to have an allocation unit smaller than the small<br>
page size anyway, so, go ahead.<br>
<br>
I didn&#39;t review the map_sg_table hunks explicitly, assuming just<br>
changes in similar spirit to map_sg.<br>
<br>
&gt; =A0 =A0 =A0 =A0 struct nouveau_vm *vm =3D vma-&gt;vm;<br>
&gt; =A0 =A0 =A0 =A0 struct nouveau_vmmgr *vmm =3D vm-&gt;vmm;<br>
&gt; - =A0 =A0 =A0 int big =3D vma-&gt;node-&gt;type !=3D vmm-&gt;spg_shift=
;<br>
&gt; =A0 =A0 =A0 =A0 u32 offset =3D vma-&gt;node-&gt;offset + (delta &gt;&g=
t; 12);<br>
&gt; - =A0 =A0 =A0 u32 bits =3D vma-&gt;node-&gt;type - 12;<br>
&gt; - =A0 =A0 =A0 u32 num =A0=3D length &gt;&gt; vma-&gt;node-&gt;type;<br=
>
&gt; + =A0 =A0 =A0 u32 shift =3D vma-&gt;node-&gt;type;<br>
&gt; + =A0 =A0 =A0 u32 order =3D PAGE_SHIFT - shift;<br>
&gt; + =A0 =A0 =A0 u32 num =A0=3D length &gt;&gt; PAGE_SHIFT;<br>
&gt; =A0 =A0 =A0 =A0 u32 pde =A0=3D (offset &gt;&gt; vmm-&gt;pgt_bits) - vm=
-&gt;fpde;<br>
&gt; - =A0 =A0 =A0 u32 pte =A0=3D (offset &amp; ((1 &lt;&lt; vmm-&gt;pgt_bi=
ts) - 1)) &gt;&gt; bits;<br>
&gt; - =A0 =A0 =A0 u32 max =A0=3D 1 &lt;&lt; (vmm-&gt;pgt_bits - bits);<br>
&gt; - =A0 =A0 =A0 unsigned m, sglen;<br>
&gt; - =A0 =A0 =A0 u32 end, len;<br>
&gt; + =A0 =A0 =A0 u32 pte =A0=3D offset &amp; ((1 &lt;&lt; vmm-&gt;pgt_bit=
s) - 1);<br>
&gt; + =A0 =A0 =A0 u32 max =A0=3D 1 &lt;&lt; vmm-&gt;pgt_bits;<br>
&gt; + =A0 =A0 =A0 u32 end, len, cardlen;<br>
&gt; =A0 =A0 =A0 =A0 int i;<br>
&gt; =A0 =A0 =A0 =A0 struct scatterlist *sg;<br>
&gt;<br>
&gt; - =A0 =A0 =A0 for_each_sg(mem-&gt;sg-&gt;sgl, sg, mem-&gt;sg-&gt;nents=
, i) {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_gpuobj *pgt =3D vm-&gt;pg=
t[pde].obj[big];<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sglen =3D sg_dma_len(sg) &gt;&gt; PAGE_S=
HIFT;<br>
&gt; + =A0 =A0 =A0 /* We don&#39;t handle &quot;big&quot; pages here */<br>
&gt; + =A0 =A0 =A0 if (WARN_ON(shift !=3D vmm-&gt;spg_shift || shift &gt; P=
AGE_SHIFT))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
&gt;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D pte + sglen;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt;=3D max))<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D max;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D end - pte;<br>
&gt; + =A0 =A0 =A0 /* We dont&#39; handle objects that aren&#39;t PAGE_SIZE=
 aligned either */<br>
&gt; + =A0 =A0 =A0 if (WARN_ON((offset &lt;&lt; 12) &amp; ~PAGE_MASK))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
&gt;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (m =3D 0; m &lt; len; m++) {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_addr_t addr =3D sg_d=
ma_address(sg) + (m &lt;&lt; PAGE_SHIFT);<br>
&gt; + =A0 =A0 =A0 /* Iterate sglist elements */<br>
&gt; + =A0 =A0 =A0 for_each_sg(mem-&gt;sg-&gt;sgl, sg, mem-&gt;sg-&gt;nents=
, i) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_gpuobj *pgt =3D vm-&gt;pg=
t[pde].obj[0];<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long m, sglen;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_addr_t addr;<br>
&gt;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vmm-&gt;map_sg(vma, pgt,=
 mem, pte, 1, &amp;addr);<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num--;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte++;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Number of system pages and base addre=
ss */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sglen =3D sg_dma_len(sg) &gt;&gt; PAGE_S=
HIFT;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr =3D sg_dma_address(sg);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Iterate over system pages in the segm=
ent and<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* covered PDEs<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while(sglen) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Number of card PTEs *=
/<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cardlen =3D sglen &lt;&l=
t; order;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D pte + cardlen;<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt; ma=
x))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D =
max;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cardlen =3D end - pte;<b=
r>
&gt;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (num =3D=3D 0)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto fin=
ish;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt;=3D max)) {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pde++;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte =3D 0;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (m &lt; sglen) {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (; m &lt; sglen; m++=
) {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_addr=
_t addr =3D sg_dma_address(sg) + (m &lt;&lt; PAGE_SHIFT);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Convert back to syste=
m pages after cropping */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D cardlen &gt;&gt;=
 order;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Ensure this fits syst=
em pages */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (WARN_ON((len &lt;&lt=
; order) !=3D cardlen))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<b=
r>
&gt;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* For each system page =
in the segment */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (m =3D 0; m &lt; len=
; m++) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vmm-&g=
t;map_sg(vma, pgt, mem, pte, 1, &amp;addr);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr +=
=3D PAGE_SIZE;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num--;=
<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte++;<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte +=3D=
 (1u &lt;&lt; order);<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (nu=
m =3D=3D 0)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 goto finish;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sglen -=3D len;<br>
&gt;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Wrap to next PDE ? */=
<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt;=3D=
 max)) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pde++;<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte =3D =
0;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; =A0 =A0 =A0 =A0 }<br>
&gt; =A0finish:<br>
&gt; =A0 =A0 =A0 =A0 vmm-&gt;flush(vm);<br>
&gt; @@ -143,28 +165,44 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 d=
elta, u64 length,<br>
&gt; =A0 =A0 =A0 =A0 struct nouveau_vm *vm =3D vma-&gt;vm;<br>
&gt; =A0 =A0 =A0 =A0 struct nouveau_vmmgr *vmm =3D vm-&gt;vmm;<br>
&gt; =A0 =A0 =A0 =A0 dma_addr_t *list =3D mem-&gt;pages;<br>
&gt; - =A0 =A0 =A0 int big =3D vma-&gt;node-&gt;type !=3D vmm-&gt;spg_shift=
;<br>
&gt; =A0 =A0 =A0 =A0 u32 offset =3D vma-&gt;node-&gt;offset + (delta &gt;&g=
t; 12);<br>
&gt; - =A0 =A0 =A0 u32 bits =3D vma-&gt;node-&gt;type - 12;<br>
&gt; - =A0 =A0 =A0 u32 num =A0=3D length &gt;&gt; vma-&gt;node-&gt;type;<br=
>
&gt; + =A0 =A0 =A0 u32 shift =3D vma-&gt;node-&gt;type;<br>
&gt; + =A0 =A0 =A0 u32 order =3D PAGE_SHIFT - shift;<br>
&gt; + =A0 =A0 =A0 u32 num =A0=3D length &gt;&gt; PAGE_SHIFT;<br>
&gt; =A0 =A0 =A0 =A0 u32 pde =A0=3D (offset &gt;&gt; vmm-&gt;pgt_bits) - vm=
-&gt;fpde;<br>
&gt; - =A0 =A0 =A0 u32 pte =A0=3D (offset &amp; ((1 &lt;&lt; vmm-&gt;pgt_bi=
ts) - 1)) &gt;&gt; bits;<br>
&gt; - =A0 =A0 =A0 u32 max =A0=3D 1 &lt;&lt; (vmm-&gt;pgt_bits - bits);<br>
&gt; - =A0 =A0 =A0 u32 end, len;<br>
&gt; + =A0 =A0 =A0 u32 pte =A0=3D offset &amp; ((1 &lt;&lt; vmm-&gt;pgt_bit=
s) - 1);<br>
&gt; + =A0 =A0 =A0 u32 max =A0=3D 1 &lt;&lt; vmm-&gt;pgt_bits;<br>
&gt; + =A0 =A0 =A0 u32 end, len, cardlen;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 /* We don&#39;t handle &quot;big&quot; pages here */<br>
&gt; + =A0 =A0 =A0 if (WARN_ON(shift !=3D vmm-&gt;spg_shift || shift &gt; P=
AGE_SHIFT))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 /* We dont&#39; handle objects that aren&#39;t PAGE_SIZE=
 aligned either */<br>
&gt; + =A0 =A0 =A0 if (WARN_ON((offset &lt;&lt; 12) &amp; ~PAGE_MASK))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 while (num) {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_gpuobj *pgt =3D vm-&gt;pg=
t[pde].obj[big];<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_gpuobj *pgt =3D vm-&gt;pg=
t[pde].obj[0];<br>
&gt;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D (pte + num);<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt;=3D max))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* &quot;num&quot; is remaining system p=
ages, check how many fit<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* in the PDE<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D (pte + (num &lt;&lt; order));<br=
>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt; max))<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end =3D max;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D end - pte;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cardlen =3D end - pte;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 len =3D cardlen &gt;&gt; order;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Ensure this fits system pages */<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (WARN_ON((len &lt;&lt; order) !=3D ca=
rdlen))<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vmm-&gt;map_sg(vma, pgt, mem, pte, len=
, list);<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num =A0-=3D len;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte =A0+=3D len;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list +=3D len;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte =A0+=3D cardlen;<br>
I think this all looks OK too.<br>
<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(end &gt;=3D max)) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pde++;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte =3D 0;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c b/drivers/g=
pu/drm/nouveau/core/subdev/vm/nv04.c<br>
&gt; index ed45437..c1e7c11 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv04.c<br>
&gt; @@ -38,14 +38,13 @@ nv04_vm_map_sg(struct nouveau_vma *vma, struct nou=
veau_gpuobj *pgt,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_mem *mem, u32 pte, u32 c=
nt, dma_addr_t *list)<br>
&gt; =A0{<br>
&gt; =A0 =A0 =A0 =A0 pte =3D 0x00008 + (pte * 4);<br>
&gt; - =A0 =A0 =A0 while (cnt) {<br>
&gt; + =A0 =A0 =A0 while (cnt--) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 page =3D PAGE_SIZE / NV04_PDMA_PAG=
E;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 phys =3D (u32)*list++;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (cnt &amp;&amp; page--) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (page--) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wo32(pgt, pte, phys=
 | 3);<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phys +=3D NV04_PDMA_PA=
GE;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte +=3D 4;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cnt -=3D 1;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; =A0 =A0 =A0 =A0 }<br>
&gt; =A0}<br>
Ack<br>
<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c b/drivers/g=
pu/drm/nouveau/core/subdev/vm/nv41.c<br>
&gt; index 064c762..09570d7 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv41.c<br>
&gt; @@ -42,14 +42,13 @@ nv41_vm_map_sg(struct nouveau_vma *vma, struct nou=
veau_gpuobj *pgt,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nouveau_mem *mem, u32 pte, u32 c=
nt, dma_addr_t *list)<br>
&gt; =A0{<br>
&gt; =A0 =A0 =A0 =A0 pte =3D pte * 4;<br>
&gt; - =A0 =A0 =A0 while (cnt) {<br>
&gt; + =A0 =A0 =A0 while (cnt--) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 page =3D PAGE_SIZE / NV41_GART_PAG=
E;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u64 phys =3D (u64)*list++;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (cnt &amp;&amp; page--) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (page--) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nv_wo32(pgt, pte, (phy=
s &gt;&gt; 7) | 1);<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 phys +=3D NV41_GART_PA=
GE;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte +=3D 4;<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cnt -=3D 1;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; =A0 =A0 =A0 =A0 }<br>
&gt; =A0}<br>
Ack<br>
<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/no=
uveau/nouveau_bo.c<br>
&gt; index c0fde6b..16dce89 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt; @@ -178,7 +178,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u3=
2 flags,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *size =3D roundup(*size, (1 &lt;&lt; n=
vbo-&gt;page_shift));<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *align =3D max((1 &lt;&lt; =A0nvbo-&gt=
;page_shift), *align);<br>
&gt; =A0 =A0 =A0 =A0 }<br>
&gt; -<br>
&gt; + =A0 =A0 =A0 *align =3D roundup(*align, PAGE_SIZE);<br>
&gt; =A0 =A0 =A0 =A0 *size =3D roundup(*size, PAGE_SIZE);<br>
&gt; =A0}<br>
&gt;<br>
&gt; @@ -221,7 +221,7 @@ nouveau_bo_new(struct drm_device *dev, int size, i=
nt align,<br>
&gt; =A0 =A0 =A0 =A0 nvbo-&gt;page_shift =3D 12;<br>
&gt; =A0 =A0 =A0 =A0 if (drm-&gt;client.base.vm) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(flags &amp; TTM_PL_FLAG_TT) &amp=
;&amp; size &gt; 256 * 1024)<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvbo-&gt;page_shift =3D =
drm-&gt;client.base.vm-&gt;vmm-&gt;lpg_shift;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvbo-&gt;page_shift =3D =
lpg_shift;<br>
&gt; =A0 =A0 =A0 =A0 }<br>
Ack both hunks.<br>
<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 nouveau_bo_fixup_align(nvbo, flags, &amp;align, &amp;s=
ize);<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm=
/nouveau/nouveau_sgdma.c<br>
&gt; index 0843ebc..f255ff8 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c<br>
&gt; @@ -31,7 +31,7 @@ nv04_sgdma_bind(struct ttm_tt *ttm, struct ttm_mem_r=
eg *mem)<br>
&gt; =A0{<br>
&gt; =A0 =A0 =A0 =A0 struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdm=
a_be *)ttm;<br>
&gt; =A0 =A0 =A0 =A0 struct nouveau_mem *node =3D mem-&gt;mm_node;<br>
&gt; - =A0 =A0 =A0 u64 size =3D mem-&gt;num_pages &lt;&lt; 12;<br>
&gt; + =A0 =A0 =A0 u64 size =3D mem-&gt;num_pages &lt;&lt; PAGE_SHIFT;<br>
Ack. =A0However, a patch doing this already exists in the Nouveau kernel<br=
>
tree (<a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=
=3D19ab15062b8fde70ff04784bd49abc330e92310d" target=3D"_blank">http://cgit.=
freedesktop.org/~darktama/nouveau/commit/?id=3D19ab15062b8fde70ff04784bd49a=
bc330e92310d</a>).<br>

<br>
<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 if (ttm-&gt;sg) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 node-&gt;sg =3D ttm-&gt;sg;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/n=
ouveau/nouveau_ttm.c<br>
&gt; index 19e3757..b7fc456 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c<br>
&gt; @@ -252,8 +252,9 @@ nv04_gart_manager_new(struct ttm_mem_type_manager =
*man,<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 node-&gt;page_shift =3D 12;<br>
&gt;<br>
&gt; - =A0 =A0 =A0 ret =3D nouveau_vm_get(man-&gt;priv, mem-&gt;num_pages &=
lt;&lt; 12, node-&gt;page_shift,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_MEM_ACCESS=
_RW, &amp;node-&gt;vma[0]);<br>
&gt; + =A0 =A0 =A0 ret =3D nouveau_vm_get(man-&gt;priv, mem-&gt;num_pages &=
lt;&lt; PAGE_SHIFT,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0node-&gt;page=
_shift, NV_MEM_ACCESS_RW,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&amp;node-&gt=
;vma[0]);<br>
Ack.<br>
<br>
&gt; =A0 =A0 =A0 =A0 if (ret) {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(node);<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt;<br>
&gt;<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</blockquote></div><br></div>

--047d7b676c90110b8c04ed4343ad--

--===============0728733996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0728733996==--
