From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mm: remove extra ZONE_DEVICE struct page
 refcount
Date: Mon, 14 Sep 2020 16:10:38 -0700
Message-ID: <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200914224509.17699-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Paul Mackerras <paulus-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Linux MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2020 at 3:45 PM Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
>
> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>
> Matthew Wilcox, Ira Weiny, and others have complained that ZONE_DEVICE
> struct page reference counting is ugly/broken. This is my attempt to
> fix it and it works for the HMM migration self tests.

Can you link to a technical description of what's broken? Or better
yet, summarize that argument in the changelog?

> I'm only sending this out as a RFC since I'm not that familiar with the
> DAX, PMEM, XEN, and other uses of ZONE_DEVICE struct pages allocated
> with devm_memremap_pages() or memremap_pages() but my best reading of
> the code looks like it might be OK. I could use help testing these
> configurations.

Back in the 4.15 days I could not convince myself that some code paths
blindly assumed that pages with refcount==0 were on an lru list. Since
then, struct page has been reorganized to not collide the ->pgmap back
pointer with the ->lru list and there have been other cleanups for
page pinning that might make this incremental cleanup viable.

You also need to fix up ext4_break_layouts() and
xfs_break_dax_layouts() to expect ->_refcount is 0 instead of 1. This
also needs some fstests exposure.

> I have a modified THP migration patch series that applies on top of
> this one and is cleaner since I don't have to add code to handle the
> +1 reference count. The link below is for the earlier v2:
> ("mm/hmm/nouveau: add THP migration to migrate_vma_*")
> https://lore.kernel.org/linux-mm/20200902165830.5367-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
>
>
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  1 -
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 -
>  include/linux/memremap.h               |  6 +--
>  include/linux/mm.h                     | 39 ---------------
>  lib/test_hmm.c                         |  1 -
>  mm/gup.c                               | 44 -----------------
>  mm/memremap.c                          | 20 ++++----
>  mm/migrate.c                           |  5 --
>  mm/swap.c                              | 66 +++++++++++---------------
>  9 files changed, 41 insertions(+), 142 deletions(-)

This diffstat is indeed appealing.

>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 84e5a2dc8be5..00d97050d7ff 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -711,7 +711,6 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>
>         dpage = pfn_to_page(uvmem_pfn);
>         dpage->zone_device_data = pvt;
> -       get_page(dpage);
>         lock_page(dpage);
>         return dpage;
>  out_clear:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index a13c6215bba8..2a4bbe01a455 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -324,7 +324,6 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>                         return NULL;
>         }
>
> -       get_page(page);
>         lock_page(page);
>         return page;
>  }
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4e9c738f4b31..7dd9802d2612 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -67,9 +67,9 @@ enum memory_type {
>
>  struct dev_pagemap_ops {
>         /*
> -        * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
> -        * reach 0 refcount unless there is a refcount bug. This allows the
> -        * device driver to implement its own memory management.)
> +        * Called once the page refcount reaches 0. The reference count is
> +        * reset to 1 before calling page_free(). This allows the
> +        * device driver to implement its own memory management.

I'd clarify the order events / responsibility of the common core
page_free() and the device specific page_free(). At the same time, why
not update drivers to expect that the page is already refcount==0 on
entry? Seems odd to go through all this trouble to make the reference
count appear to be zero to the wider kernel but expect that drivers
get a fake reference on entry to their ->page_free() callbacks.
