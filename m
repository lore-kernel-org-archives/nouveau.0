From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Date: Mon, 16 Mar 2020 12:56:56 -0700
Message-ID: <7e9e22be-dea2-4862-1d05-5285bfc6c066@nvidia.com>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
 <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
 <20200316184935.GA25322@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200316184935.GA25322@lst.de>
Content-Language: en-US
Sender: kvm-ppc-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org


On 3/16/20 11:49 AM, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
>>
>> On 3/16/20 10:52 AM, Christoph Hellwig wrote:
>>> No driver has actually used properly wire up and support this feature.
>>> There is various code related to it in nouveau, but as far as I can tell
>>> it never actually got turned on, and the only changes since the initial
>>> commit are global cleanups.
>>
>> This is not actually true. OpenCL 2.x does support SVM with nouveau and
>> device private memory via clEnqueueSVMMigrateMem().
>> Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
>> migrated and this change would conflict with that.
> 
> Can you explain me how we actually invoke this code?

GPU memory is allocated when the device private memory "struct page" is
allocated. See where nouveau_dmem_chunk_alloc() calls nouveau_bo_new().
Then when a page is migrated to the GPU, the GPU memory physical address
is just the offset into the "fake" PFN range allocated by
devm_request_free_mem_region().

I'm looking into allocating GPU memory at the time of migration instead of when
the device private memory struct pages are allocated but that is a future
improvement.

System memory is migrated to GPU memory:
# mesa
clEnqueueSVMMigrateMem()
   svm_migrate_op()
     q.svm_migrate()
       pipe->svm_migrate() // really nvc0_svm_migrate()
         drmCommandWrite() // in libdrm
           drmIoctl()
             ioctl()
               nouveau_drm_ioctl() // nouveau_drm.c
                 drm_ioctl()
                   nouveau_svmm_bind()
                     nouveau_dmem_migrate_vma()
                       migrate_vma_setup()
                       nouveau_dmem_migrate_chunk()
                         nouveau_dmem_migrate_copy_one()
                           // allocate device private struct page
                           dpage = nouveau_dmem_page_alloc_locked()
                             dpage = nouveau_dmem_pages_alloc()
                             // Get GPU VRAM physical address
                             nouveau_dmem_page_addr(dpage)
                             // This does the DMA to GPU memory
                             drm->dmem->migrate.copy_func()
                       migrate_vma_pages()
                       migrate_vma_finalize()

Without my recent patch set, there is no GPU page table entry created for
this migrated memory so there will be a GPU fault which is handled in a
worker thread:
nouveau_svm_fault()
   // examine fault buffer entries and compute range of pages
   nouveau_range_fault()
     // This will fill in the pfns array with a device private entry PFN
     hmm_range_fault()
     // This sees the range->flags[HMM_PFN_DEVICE_PRIVATE] flag
     // and converts the HMM PFN to a GPU physical address
     nouveau_dmem_convert_pfn()
     // This sets up the GPU page tables
     nvif_object_ioctl()

> For that we'd need HMM_PFN_DEVICE_PRIVATE NVIF_VMM_PFNMAP_V0_VRAM
> set in ->pfns before calling hmm_range_fault, which isn't happening.
> 

It is set by hmm_range_fault() via the range->flags[HMM_PFN_DEVICE_PRIVATE] entry
when hmm_range_fault() sees a device private struct page. The call to
nouveau_dmem_convert_pfn() is just replacing the "fake" PFN with the real PFN
but not clearing/changing the read/write or VRAM/system memory PTE bits.
