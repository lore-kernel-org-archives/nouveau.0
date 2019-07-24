From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 15:01:53 -0300
Message-ID: <20190724180153.GE28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de>
 <20190724152858.GB28493@ziepe.ca>
 <20190724153305.GA10681@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724153305.GA10681@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Michal Hocko <mhocko@suse.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2019 at 05:33:05PM +0200, Christoph Hellwig wrote:
> On Wed, Jul 24, 2019 at 12:28:58PM -0300, Jason Gunthorpe wrote:
> > Humm. Actually having looked this some more, I wonder if this is a
> > problem:
> 
> What a mess.
> 
> Question: do we even care for the non-blocking events?  The only place
> where mmu_notifier_invalidate_range_start_nonblock is called is the oom
> killer, which means the process is about to die and the pagetable will
> get torn down ASAP.  Should we just skip them unconditionally?  nouveau
> already does so, but amdgpu currently tries to handle the non-blocking
> notifications.

I think the issue is the pages need to get freed to make the memory
available without becoming entangled in risky locks and deadlock.

Presumably if we go to the 'torn down ASAP' things get more risky that
the whole thing deadlocks?

I'm guessing a bit, but I *think* non-blocking here really means
something closer to WQ_MEM_RECLAIM, ie you can't do anything that would
become entangled with locks in the allocator that are pending on OOM??

(if so we really should call this reclaim not non-blocking)

ie for ODP umem_rwsem is held by threads while calling into kmalloc,
so when we go to do the exit_mmap we still do the
invalidate_range_start and can still end up blocked on a lock that is
held by a thread waiting for kmalloc to return.

Would be nice to know if this guess is right or not.

Jason
