From: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling
 in hmm_range_fault
Date: Fri, 20 Mar 2020 09:58:13 -0300
Message-ID: <20200320125813.GQ20941@ziepe.ca>
References: <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
 <24fca825-3b0f-188f-bcf2-fadcf3a9f05a@nvidia.com>
 <20200320001428.GA9199@ziepe.ca>
 <8d549ef6-14ae-7055-58c8-d56de8bf4ba6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8d549ef6-14ae-7055-58c8-d56de8bf4ba6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Mar 19, 2020 at 06:33:04PM -0700, Ralph Campbell wrote:

> > > +		.default_flags = dmirror_hmm_flags[HMM_PFN_VALID] |
> > > +				(write ? dmirror_hmm_flags[HMM_PFN_WRITE] : 0),
> > > +		.dev_private_owner = dmirror->mdevice,
> > > +	};
> > > +	int ret = 0;
> > 
> > > +static int dmirror_snapshot(struct dmirror *dmirror,
> > > +			    struct hmm_dmirror_cmd *cmd)
> > > +{
> > > +	struct mm_struct *mm = dmirror->mm;
> > > +	unsigned long start, end;
> > > +	unsigned long size = cmd->npages << PAGE_SHIFT;
> > > +	unsigned long addr;
> > > +	unsigned long next;
> > > +	uint64_t pfns[64];
> > > +	unsigned char perm[64];
> > > +	char __user *uptr;
> > > +	struct hmm_range range = {
> > > +		.pfns = pfns,
> > > +		.flags = dmirror_hmm_flags,
> > > +		.values = dmirror_hmm_values,
> > > +		.pfn_shift = DPT_SHIFT,
> > > +		.pfn_flags_mask = ~0ULL,
> > 
> > Same here, especially since this is snapshot
> > 
> > Jason
> 
> Actually, snapshot ignores pfn_flags_mask and default_flags.

Yes, so no reason to set them to not 0..

Jason
