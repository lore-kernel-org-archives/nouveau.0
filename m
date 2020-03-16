From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Date: Mon, 16 Mar 2020 16:04:43 -0300
Message-ID: <20200316190443.GM20941@ziepe.ca>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
> 
> On 3/16/20 10:52 AM, Christoph Hellwig wrote:
> > No driver has actually used properly wire up and support this feature.
> > There is various code related to it in nouveau, but as far as I can tell
> > it never actually got turned on, and the only changes since the initial
> > commit are global cleanups.
> 
> This is not actually true. OpenCL 2.x does support SVM with nouveau and
> device private memory via clEnqueueSVMMigrateMem().
> Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
> migrated and this change would conflict with that.

Other than the page_to_dmem() possibly doing container_of on the wrong
type pgmap, are there other bugs here to fix?

Something like this is probably close to the right thing to fix that
and work with Christoph's 1/2 patch - Ralph can you check, test, etc?

diff --git a/mm/hmm.c b/mm/hmm.c
index 9e8f68eb83287a..9fa4748da1b779 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -300,6 +300,20 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 				range->flags[HMM_PFN_DEVICE_PRIVATE];
 			cpu_flags |= is_write_device_private_entry(entry) ?
 				range->flags[HMM_PFN_WRITE] : 0;
+
+			/*
+			 * If the caller understands this kind of device_private
+			 * page, then leave it as is, otherwise fault it.
+			 */
+			hmm_vma_walk->pgmap = get_dev_pagemap(
+				device_private_entry_to_pfn(entry),
+				hmm_vma_walk->pgmap);
+			if (!unlikely(!pgmap))
+				return -EBUSY;
+			if (hmm_vma_walk->pgmap->owner !=
+			    hmm_vma_walk->dev_private_owner)
+				cpu_flags = 0;
+
 			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
 					   &fault, &write_fault);
 			if (fault || write_fault)

Jason
