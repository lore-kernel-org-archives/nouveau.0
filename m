From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 17:18:33 -0300
Message-ID: <20190724201833.GI28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de>
 <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz>
 <20190724185910.GF6410@dhcp22.suse.cz>
 <20190724192155.GG28493@ziepe.ca>
 <20190724194855.GA15029@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724194855.GA15029@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Michal Hocko <mhocko@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2019 at 09:48:55PM +0200, Christoph Hellwig wrote:
> On Wed, Jul 24, 2019 at 04:21:55PM -0300, Jason Gunthorpe wrote:
> > If we change the register to keep the hlist sorted by address then we
> > can do a targetted 'undo' of past starts terminated by address
> > less-than comparison of the first failing struct mmu_notifier.
> > 
> > It relies on the fact that rcu is only used to remove items, the list
> > adds are all protected by mm locks, and the number of mmu notifiers is
> > very small.
> > 
> > This seems workable and does not need more driver review/update...
> > 
> > However, hmm's implementation still needs more fixing.
> 
> Can we take one step back, please?  The only reason why drivers
> implement both ->invalidate_range_start and ->invalidate_range_end and
> expect them to be called paired is to keep some form of counter of
> active invalidation "sections".  So instead of doctoring around
> undo schemes the only sane answer is to take such a counter into the
> core VM code instead of having each driver struggle with it.

This might work as a hybrid sort of idea, like what HMM tried to do
with the counter and valid together.

If we keep the counter global and then provide an 'all invalidates
finished' callback then the driver could potentially still ignore
invalidates that do not touch its ranges during its page fault path.

I'd have to sketch it..

I agree it would solve this problem as well and better advance the
goal to make mmu notifiers simpler to use.. 

But I didn't audit all the invalidate_end users to be sure :)

Jason
