From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm v2 5/5] mm/hmm: remove the customizable pfn format
 from hmm_range_fault
Date: Wed, 6 May 2020 13:21:03 -0300
Message-ID: <20200506162103.GH26002@ziepe.ca>
References: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
 <c0d02b98-c356-60b1-6043-5b8d1a9be19a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c0d02b98-c356-60b1-6043-5b8d1a9be19a@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Hubbard <jhubbard@nvidia.com>
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>
List-Id: nouveau.vger.kernel.org

On Mon, May 04, 2020 at 06:30:00PM -0700, John Hubbard wrote:
> On 2020-05-01 11:20, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > Presumably the intent here was that hmm_range_fault() could put the data
> > into some HW specific format and thus avoid some work. However, nothing
> > actually does that, and it isn't clear how anything actually could do that
> > as hmm_range_fault() provides CPU addresses which must be DMA mapped.
> > 
> > Perhaps there is some special HW that does not need DMA mapping, but we
> > don't have any examples of this, and the theoretical performance win of
> > avoiding an extra scan over the pfns array doesn't seem worth the
> > complexity. Plus pfns needs to be scanned anyhow to sort out any
> > DEVICE_PRIVATE pages.
> > 
> > This version replaces the uint64_t with an usigned long containing a pfn
> > and fixed flags. On input flags is filled with the HMM_PFN_REQ_* values,
> > on successful output it is filled with HMM_PFN_* values, describing the
> > state of the pages.
> > 
> 
> Just some minor stuff below. I wasn't able to spot any errors in the code,
> though, so these are just documentation nits.
> 
> 
> ...
> 
> > 
> > diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> > index 9924f2caa0184c..c9f2329113a47f 100644
> > +++ b/Documentation/vm/hmm.rst
> > @@ -185,9 +185,6 @@ The usage pattern is::
> >         range.start = ...;
> >         range.end = ...;
> >         range.pfns = ...;
> 
> That should be:
> 
>           range.hmm_pfns = ...;

Yep

> 
> > -      range.flags = ...;
> > -      range.values = ...;
> > -      range.pfn_shift = ...;
> >         if (!mmget_not_zero(interval_sub->notifier.mm))
> >             return -EFAULT;
> > @@ -229,15 +226,10 @@ The hmm_range struct has 2 fields, default_flags and pfn_flags_mask, that specif
> >   fault or snapshot policy for the whole range instead of having to set them
> >   for each entry in the pfns array.
> > -For instance, if the device flags for range.flags are::
> > +For instance if the device driver wants pages for a range with at least read
> > +permission, it sets::
> > -    range.flags[HMM_PFN_VALID] = (1 << 63);
> > -    range.flags[HMM_PFN_WRITE] = (1 << 62);
> > -
> > -and the device driver wants pages for a range with at least read permission,
> > -it sets::
> > -
> > -    range->default_flags = (1 << 63);
> > +    range->default_flags = HMM_PFN_REQ_FAULT;
> >       range->pfn_flags_mask = 0;
> >   and calls hmm_range_fault() as described above. This will fill fault all pages
> > @@ -246,18 +238,18 @@ in the range with at least read permission.
> >   Now let's say the driver wants to do the same except for one page in the range for
> >   which it wants to have write permission. Now driver set::
> > -    range->default_flags = (1 << 63);
> > -    range->pfn_flags_mask = (1 << 62);
> > -    range->pfns[index_of_write] = (1 << 62);
> > +    range->default_flags = HMM_PFN_REQ_FAULT;
> > +    range->pfn_flags_mask = HMM_PFN_REQ_WRITE;
> > +    range->pfns[index_of_write] = HMM_PFN_REQ_WRITE;
> 
> 
> All these choices for _WRITE behavior make it slightly confusing. I mean, it's
> better than it was, but there are default flags, a mask, and an index as well,
> and it looks like maybe we have a little more power and flexibility than
> desirable? Nouveau for example is now just setting the mask only:

The example is showing how to fault all pages but request write for
only certain pages, ie it shows how to use default_flags and pfn_flags
together in probably the only way that could make any sense

> > @@ -542,12 +564,15 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >   			return -EBUSY;
> >   		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > -		range.default_flags = 0;
> > -		range.pfn_flags_mask = -1UL;
> >   		down_read(&mm->mmap_sem);
> >   		ret = hmm_range_fault(&range);
> >   		up_read(&mm->mmap_sem);
> >   		if (ret) {
> > +			/*
> > +			 * FIXME: the input PFN_REQ flags are destroyed on
> > +			 * -EBUSY, we need to regenerate them, also for the
> > +			 * other continue below
> > +			 */
> 
> How serious is this FIXME? It seems like we could get stuck in a loop here,
> if we're not issuing a new REQ, right?

Serious enough someone should fix it and not copy it into other
drivers..
 
> >   			if (ret == -EBUSY)
> >   				continue;
> >   			return ret;
> > @@ -562,7 +587,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >   		break;
> >   	}
> > -	nouveau_dmem_convert_pfn(drm, &range);
> > +	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
> >   	svmm->vmm->vmm.object.client->super = true;
> >   	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
> > @@ -589,6 +614,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
> >   		} i;
> >   		u64 phys[16];
> >   	} args;
> > +	unsigned long hmm_pfns[ARRAY_SIZE(args.phys)];
> 
> 
> Is there a risk of blowing up the stack here?

16*8 is pretty small, but the call stack is very long sadly, since
Ralph succeed it seems OK

> >    */
> > -enum hmm_pfn_flag_e {
> > -	HMM_PFN_VALID = 0,
> > -	HMM_PFN_WRITE,
> > -	HMM_PFN_FLAG_MAX
> > +enum hmm_pfn_flags {
> 
> Let's add:
> 
>         /* Output flags: */
> 
> > +	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
> > +	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
> > +	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
> > +
> 
>         /* Input flags: */

Ok

Thanks,
Jason
