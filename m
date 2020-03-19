From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Thu, 19 Mar 2020 15:17:16 -0300
Message-ID: <20200319181716.GK20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca>
 <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de>
 <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
 <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 04:14:31PM -0700, Ralph Campbell wrote:
> 
> On 3/17/20 5:59 AM, Christoph Hellwig wrote:
> > On Tue, Mar 17, 2020 at 09:47:55AM -0300, Jason Gunthorpe wrote:
> > > I've been using v7 of Ralph's tester and it is working well - it has
> > > DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
> > > you able?
> > > 
> > > This hunk seems trivial enough to me, can we include it now?
> > 
> > I can send a separate patch for it once the tester covers it.  I don't
> > want to add it to the original patch as it is a significant behavior
> > change compared to the existing code.
> > 
> 
> Attached is an updated version of my HMM tests based on linux-5.6.0-rc6.
> I ran this OK with Jason's 8+1 HMM patches, Christoph's 1-5 misc HMM clean ups,
> and Christoph's 1-4 device private page changes applied.

I'd like to get this to mergable, it looks pretty good now, but I have
no idea about selftests - and I'm struggling to even compile the tools
dir

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 69def4a9df00..4d22ce7879a7 100644
> +++ b/lib/Kconfig.debug
> @@ -2162,6 +2162,18 @@ config TEST_MEMINIT
>  
>  	  If unsure, say N.
>  
> +config TEST_HMM
> +	tristate "Test HMM (Heterogeneous Memory Management)"
> +	depends on DEVICE_PRIVATE
> +	select HMM_MIRROR
> +        select MMU_NOTIFIER

extra spaces

In general I wonder if it even makes sense that DEVICE_PRIVATE is user
selectable?

> +static int dmirror_fops_open(struct inode *inode, struct file *filp)
> +{
> +	struct cdev *cdev = inode->i_cdev;
> +	struct dmirror *dmirror;
> +	int ret;
> +
> +	/* Mirror this process address space */
> +	dmirror = kzalloc(sizeof(*dmirror), GFP_KERNEL);
> +	if (dmirror == NULL)
> +		return -ENOMEM;
> +
> +	dmirror->mdevice = container_of(cdev, struct dmirror_device, cdevice);
> +	mutex_init(&dmirror->mutex);
> +	xa_init(&dmirror->pt);
> +
> +	ret = mmu_interval_notifier_insert(&dmirror->notifier, current->mm,
> +				0, ULONG_MAX & PAGE_MASK, &dmirror_min_ops);
> +	if (ret) {
> +		kfree(dmirror);
> +		return ret;
> +	}
> +
> +	/* Pairs with the mmdrop() in dmirror_fops_release(). */
> +	mmgrab(current->mm);
> +	dmirror->mm = current->mm;

The notifier holds a mmgrab, no need for another one

> +	/* Only the first open registers the address space. */
> +	filp->private_data = dmirror;

Not sure what this comment means

> +static inline struct dmirror_device *dmirror_page_to_device(struct page *page)
> +
> +{
> +	struct dmirror_chunk *devmem;
> +
> +	devmem = container_of(page->pgmap, struct dmirror_chunk, pagemap);
> +	return devmem->mdevice;
> +}

extra devmem var is not really needed

> +
> +static bool dmirror_device_is_mine(struct dmirror_device *mdevice,
> +				   struct page *page)
> +{
> +	if (!is_zone_device_page(page))
> +		return false;
> +	return page->pgmap->ops == &dmirror_devmem_ops &&
> +		dmirror_page_to_device(page) == mdevice;
> +}

Use new owner stuff, right? Actually this is redunant now, the check
should be just WARN_ON pageowner != self owner

> +static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
> +{
> +	uint64_t *pfns = range->pfns;
> +	unsigned long pfn;
> +
> +	for (pfn = (range->start >> PAGE_SHIFT);
> +	     pfn < (range->end >> PAGE_SHIFT);
> +	     pfn++, pfns++) {
> +		struct page *page;
> +		void *entry;
> +
> +		/*
> +		 * HMM_PFN_ERROR is returned if it is accessing invalid memory
> +		 * either because of memory error (hardware detected memory
> +		 * corruption) or more likely because of truncate on mmap
> +		 * file.
> +		 */
> +		if (*pfns == range->values[HMM_PFN_ERROR])
> +			return -EFAULT;

Unless that snapshot is use hmm_range_fault() never returns success
and sets PFN_ERROR, so this should be a WARN_ON

> +		if (!(*pfns & range->flags[HMM_PFN_VALID]))
> +			return -EFAULT;

Same with valid.

> +		page = hmm_device_entry_to_page(range, *pfns);
> +		/* We asked for pages to be populated but check anyway. */
> +		if (!page)
> +			return -EFAULT;

WARN_ON

> +		if (is_zone_device_page(page)) {
> +			/*
> +			 * TODO: need a way to ask HMM to fault foreign zone
> +			 * device private pages.
> +			 */
> +			if (!dmirror_device_is_mine(dmirror->mdevice, page))
> +				continue;

Actually re

> +static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
> +				const struct mmu_notifier_range *range,
> +				unsigned long cur_seq)
> +{
> +	struct dmirror *dmirror = container_of(mni, struct dmirror, notifier);
> +	struct mm_struct *mm = dmirror->mm;
> +
> +	/*
> +	 * If the process doesn't exist, we don't need to invalidate the
> +	 * device page table since the address space will be torn down.
> +	 */
> +	if (!mmget_not_zero(mm))
> +		return true;

Why? Don't the notifiers provide for this already. 

mmget_not_zero() is required before calling hmm_range_fault() though

> +static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
> +			 unsigned long end, bool write)
> +{
> +	struct mm_struct *mm = dmirror->mm;
> +	unsigned long addr;
> +	uint64_t pfns[64];
> +	struct hmm_range range = {
> +		.notifier = &dmirror->notifier,
> +		.pfns = pfns,
> +		.flags = dmirror_hmm_flags,
> +		.values = dmirror_hmm_values,
> +		.pfn_shift = DPT_SHIFT,
> +		.pfn_flags_mask = ~(dmirror_hmm_flags[HMM_PFN_VALID] |
> +				    dmirror_hmm_flags[HMM_PFN_WRITE]),
> +		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
> +				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
> +		.dev_private_owner = dmirror->mdevice,
> +	};
> +	int ret = 0;
> +
> +	/* Since the mm is for the mirrored process, get a reference first. */
> +	if (!mmget_not_zero(mm))
> +		return 0;

Right

> +	for (addr = start; addr < end; addr = range.end) {
> +		range.start = addr;
> +		range.end = min(addr + (ARRAY_SIZE(pfns) << PAGE_SHIFT), end);
> +
> +		ret = dmirror_range_fault(dmirror, &range);
> +		if (ret)
> +			break;
> +	}
> +
> +	mmput(mm);
> +	return ret;
> +}
> +
> +static int dmirror_do_read(struct dmirror *dmirror, unsigned long start,
> +			   unsigned long end, struct dmirror_bounce *bounce)
> +{
> +	unsigned long pfn;
> +	void *ptr;
> +
> +	ptr = bounce->ptr + ((start - bounce->addr) & PAGE_MASK);
> +
> +	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++) {
> +		void *entry;
> +		struct page *page;
> +		void *tmp;
> +
> +		entry = xa_load(&dmirror->pt, pfn);
> +		page = xa_untag_pointer(entry);
> +		if (!page)
> +			return -ENOENT;
> +
> +		tmp = kmap(page);
> +		memcpy(ptr, tmp, PAGE_SIZE);
> +		kunmap(page);
> +
> +		ptr += PAGE_SIZE;
> +		bounce->cpages++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dmirror_read(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
> +{
> +	struct dmirror_bounce bounce;
> +	unsigned long start, end;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	int ret;
> +
> +	start = cmd->addr;
> +	end = start + size;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	ret = dmirror_bounce_init(&bounce, start, size);
> +	if (ret)
> +		return ret;
> +
> +again:
> +	mutex_lock(&dmirror->mutex);
> +	ret = dmirror_do_read(dmirror, start, end, &bounce);
> +	mutex_unlock(&dmirror->mutex);
> +	if (ret == 0)
> +		ret = copy_to_user((void __user *)cmd->ptr, bounce.ptr,
> +					bounce.size);

Use u64_to_user_ptr() instead of the cast

> +static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
> +{
> +	struct dmirror_bounce bounce;
> +	unsigned long start, end;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	int ret;
> +
> +	start = cmd->addr;
> +	end = start + size;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	ret = dmirror_bounce_init(&bounce, start, size);
> +	if (ret)
> +		return ret;
> +	ret = copy_from_user(bounce.ptr, (void __user *)cmd->ptr,
> +				bounce.size);

ditto

> +	if (ret)
> +		return ret;
> +
> +again:
> +	mutex_lock(&dmirror->mutex);
> +	ret = dmirror_do_write(dmirror, start, end, &bounce);
> +	mutex_unlock(&dmirror->mutex);
> +	if (ret == -ENOENT) {
> +		start = cmd->addr + (bounce.cpages << PAGE_SHIFT);
> +		ret = dmirror_fault(dmirror, start, end, true);
> +		if (ret == 0) {
> +			cmd->faults++;
> +			goto again;

Use a loop instead of goto?

Also I get this:

lib/test_hmm.c: In function ‘dmirror_devmem_fault_alloc_and_copy’:
lib/test_hmm.c:1041:25: warning: unused variable ‘vma’ [-Wunused-variable]
 1041 |  struct vm_area_struct *vma = args->vma;

But this is a kernel bug, due to alloc_page_vma being a #define not a
static inline and me having CONFIG_NUMA off in this .config

Jason
