From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 21:48:55 +0200
Message-ID: <20190724194855.GA15029@lst.de>
References: <20190723210506.25127-1-rcampbell@nvidia.com> <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca> <20190724175858.GC6410@dhcp22.suse.cz> <20190724180837.GF28493@ziepe.ca> <20190724185617.GE6410@dhcp22.suse.cz> <20190724185910.GF6410@dhcp22.suse.cz> <20190724192155.GG28493@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724192155.GG28493@ziepe.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Michal Hocko <mhocko@kernel.org>, Christoph Hellwig <hch@lst.de>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2019 at 04:21:55PM -0300, Jason Gunthorpe wrote:
> If we change the register to keep the hlist sorted by address then we
> can do a targetted 'undo' of past starts terminated by address
> less-than comparison of the first failing struct mmu_notifier.
> 
> It relies on the fact that rcu is only used to remove items, the list
> adds are all protected by mm locks, and the number of mmu notifiers is
> very small.
> 
> This seems workable and does not need more driver review/update...
> 
> However, hmm's implementation still needs more fixing.

Can we take one step back, please?  The only reason why drivers
implement both ->invalidate_range_start and ->invalidate_range_end and
expect them to be called paired is to keep some form of counter of
active invalidation "sections".  So instead of doctoring around
undo schemes the only sane answer is to take such a counter into the
core VM code instead of having each driver struggle with it.
