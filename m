From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Thu, 19 Mar 2020 21:14:28 -0300
Message-ID: <20200320001428.GA9199@ziepe.ca>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 04:14:31PM -0700, Ralph Campbell wrote:

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

Since pfns is not initialized pfn_flags_mask should be 0.

> +		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
> +				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
> +		.dev_private_owner = dmirror->mdevice,
> +	};
> +	int ret = 0;

> +static int dmirror_snapshot(struct dmirror *dmirror,
> +			    struct hmm_dmirror_cmd *cmd)
> +{
> +	struct mm_struct *mm = dmirror->mm;
> +	unsigned long start, end;
> +	unsigned long size = cmd->npages << PAGE_SHIFT;
> +	unsigned long addr;
> +	unsigned long next;
> +	uint64_t pfns[64];
> +	unsigned char perm[64];
> +	char __user *uptr;
> +	struct hmm_range range = {
> +		.pfns = pfns,
> +		.flags = dmirror_hmm_flags,
> +		.values = dmirror_hmm_values,
> +		.pfn_shift = DPT_SHIFT,
> +		.pfn_flags_mask = ~0ULL,

Same here, especially since this is snapshot

Jason
