From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Mon, 16 Mar 2020 22:33:53 +0100
Message-ID: <20200316213353.GA28441@lst.de>
References: <20200316193216.920734-1-hch@lst.de> <20200316193216.920734-4-hch@lst.de> <20200316195923.GA26988@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316195923.GA26988@ziepe.ca>
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 04:59:23PM -0300, Jason Gunthorpe wrote:
> However, between patch 3 and 4 doesn't this break amd gpu as it will
> return device_private pages now if not requested? Squash the two?

No change in behavior in this patch as long as HMM_PFN_DEVICE_PRIVATE
isn't set in ->pfns or ->default_flags, which is the case for both
nouveau and amdgpu.  The existing behavior is broken for private
pages not known to the driver, but that is fixed in the next patch.
