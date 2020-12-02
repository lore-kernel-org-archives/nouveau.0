From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: [PATCH v3 3/6] mm: support THP migration to device
 private memory
Date: Wed, 2 Dec 2020 11:08:54 +0100
Message-ID: <20201202100854.GB7597@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
 <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
 <20201120200133.GH917484@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201120200133.GH917484-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Roger Pau Monne <roger.pau-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Nov 20, 2020 at 04:01:33PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 11, 2020 at 03:38:42PM -0800, Ralph Campbell wrote:
> 
> > MEMORY_DEVICE_GENERIC:
> > Struct pages are created in dev_dax_probe() and represent non-volatile memory.
> > The device can be mmap()'ed which calls dax_mmap() which sets
> > vma->vm_flags | VM_HUGEPAGE.
> > A CPU page fault will result in a PTE, PMD, or PUD sized page
> > (but not compound) to be inserted by vmf_insert_mixed() which will call either
> > insert_pfn() or insert_page().
> > Neither insert_pfn() nor insert_page() increments the page reference
> > count.
> 
> But why was this done? It seems very strange to put a pfn with a
> struct page into a VMA and then deliberately not take the refcount for
> the duration of that pfn being in the VMA?
> 
> What prevents memunmap_pages() from progressing while VMAs still point
> at the memory?

Agreed.  Adding Roger who added MEMORY_DEVICE_GENERIC and the only
user.

> > I think just leaving the page reference count at one is better than trying
> > to use the mmu_interval_notifier or changing vmf_insert_mixed() and
> > invalidations of pfn_t_devmap(pfn) to adjust the page reference count.
> 
> Why so? The entire point of getting struct page's for this stuff was
> to be able to follow the struct page flow. I never did learn a reason
> why there is devmap stuff all over the place in the page table code...

Exactly.
