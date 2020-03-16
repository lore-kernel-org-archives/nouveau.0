From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Date: Mon, 16 Mar 2020 20:07:58 +0100
Message-ID: <20200316190758.GA25536@lst.de>
References: <20200316175259.908713-1-hch@lst.de> <20200316175259.908713-3-hch@lst.de> <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com> <20200316190443.GM20941@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316190443.GM20941@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 04:04:43PM -0300, Jason Gunthorpe wrote:
> > This is not actually true. OpenCL 2.x does support SVM with nouveau and
> > device private memory via clEnqueueSVMMigrateMem().
> > Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
> > migrated and this change would conflict with that.
> 
> Other than the page_to_dmem() possibly doing container_of on the wrong
> type pgmap, are there other bugs here to fix?

It fixes that bug, as well as making sure everyone gets this check
right by default.

> Something like this is probably close to the right thing to fix that
> and work with Christoph's 1/2 patch - Ralph can you check, test, etc?

I don't think we need the get_dev_pagemap.  For device private pages
we can derive the page using device_private_entry_to_page and just
use that.  Let me resend a proper series.
