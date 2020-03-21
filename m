From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Sat, 21 Mar 2020 09:20:41 +0100
Message-ID: <20200321082041.GA28613@lst.de>
References: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com> <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de> <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca> <20200317125955.GA12847@lst.de> <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com> <20200319181716.GK20941@ziepe.ca> <89e33770-a0ab-e1ec-d5e5-535edefd3fd3@nvidia.com> <20200320000345.GO20941@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200320000345.GO20941@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, Mar 19, 2020 at 09:03:45PM -0300, Jason Gunthorpe wrote:
> > Should tests enable the feature or the feature enable the test?
> > IMHO, if the feature is being compiled into the kernel, that should
> > enable the menu item for the test. If the feature isn't selected,
> > no need to test it :-)
> 
> I ment if DEVICE_PRIVATE should be a user selectable option at all, or
> should it be turned on when a driver like nouveau is selected.

I don't think it should be user selectable.  This is an implementation
detail users can't know about.

> Is there some downside to enabling DEVICE_PRIVATE?

The option itself adds a little more code to the core kernel, and
introduces a few additional branches in core mm code.

But more importantly it pulls in the whole pgmap infrastructure.
