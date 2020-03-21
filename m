From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
Date: Sat, 21 Mar 2020 09:22:36 +0100
Message-ID: <20200321082236.GB28613@lst.de>
References: <20200316193216.920734-1-hch@lst.de> <20200316193216.920734-5-hch@lst.de> <20200320134109.GA30230@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200320134109.GA30230@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Fri, Mar 20, 2020 at 10:41:09AM -0300, Jason Gunthorpe wrote:
> Thinking about this some more, does the locking work out here?
> 
> hmm_range_fault() runs with mmap_sem in read, and does not lock any of
> the page table levels.
> 
> So it relies on accessing stale pte data being safe, and here we
> introduce for the first time a page pointer dereference and a pgmap
> dereference without any locking/refcounting.
> 
> The get_dev_pagemap() worked on the PFN and obtained a refcount, so it
> created safety.
> 
> Is there some tricky reason this is safe, eg a DEVICE_PRIVATE page
> cannot be removed from the vma without holding mmap_sem in write or
> something?

I don't think there is any specific protection.  Let me see if we
can throw in a get_dev_pagemap here - note that current mainline doesn't
even use it for this path..
