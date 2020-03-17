From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Tue, 17 Mar 2020 13:59:55 +0100
Message-ID: <20200317125955.GA12847@lst.de>
References: <20200316193216.920734-1-hch@lst.de> <20200316193216.920734-4-hch@lst.de> <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com> <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de> <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200317124755.GR20941@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Ralph Campbell <rcampbell@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 09:47:55AM -0300, Jason Gunthorpe wrote:
> I've been using v7 of Ralph's tester and it is working well - it has
> DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
> you able?
> 
> This hunk seems trivial enough to me, can we include it now?

I can send a separate patch for it once the tester covers it.  I don't
want to add it to the original patch as it is a significant behavior
change compared to the existing code.
