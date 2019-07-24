From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 16:21:55 -0300
Message-ID: <20190724192155.GG28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de>
 <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz>
 <20190724185910.GF6410@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724185910.GF6410@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2019 at 08:59:10PM +0200, Michal Hocko wrote:
> On Wed 24-07-19 20:56:17, Michal Hocko wrote:
> > On Wed 24-07-19 15:08:37, Jason Gunthorpe wrote:
> > > On Wed, Jul 24, 2019 at 07:58:58PM +0200, Michal Hocko wrote:
> > [...]
> > > > Maybe new users have started relying on a new semantic in the meantime,
> > > > back then, none of the notifier has even started any action in blocking
> > > > mode on a EAGAIN bailout. Most of them simply did trylock early in the
> > > > process and bailed out so there was nothing to do for the range_end
> > > > callback.
> > > 
> > > Single notifiers are not the problem. I tried to make this clear in
> > > the commit message, but lets be more explicit.
> > > 
> > > We have *two* notifiers registered to the mm, A and B:
> > > 
> > > A invalidate_range_start: (has no blocking)
> > >     spin_lock()
> > >     counter++
> > >     spin_unlock()
> > > 
> > > A invalidate_range_end:
> > >     spin_lock()
> > >     counter--
> > >     spin_unlock()
> > > 
> > > And this one:
> > > 
> > > B invalidate_range_start: (has blocking)
> > >     if (!try_mutex_lock())
> > >         return -EAGAIN;
> > >     counter++
> > >     mutex_unlock()
> > > 
> > > B invalidate_range_end:
> > >     spin_lock()
> > >     counter--
> > >     spin_unlock()
> > > 
> > > So now the oom path does:
> > > 
> > > invalidate_range_start_non_blocking:
> > >  for each mn:
> > >    a->invalidate_range_start
> > >    b->invalidate_range_start
> > >    rc = EAGAIN
> > > 
> > > Now we SKIP A's invalidate_range_end even though A had no idea this
> > > would happen has state that needs to be unwound. A is broken.
> > > 
> > > B survived just fine.
> > > 
> > > A and B *alone* work fine, combined they fail.
> > 
> > But that requires that they share some state, right?
> > 
> > > When the commit was landed you can use KVM as an example of A and RDMA
> > > ODP as an example of B
> > 
> > Could you point me where those two share the state please? KVM seems to
> > be using kvm->mmu_notifier_count but I do not know where to look for the
> > RDMA...
> 
> Scratch that. ELONGDAY... I can see your point. It is all or nothing
> that doesn't really work here. Looking back at your patch it seems
> reasonable but I am not sure what is supposed to be a behavior for
> notifiers that failed.

Okay, good to know I'm not missing something. The idea was the failed
notifier would have to handle the mandatory _end callback.

I've reflected on it some more, and I have a scheme to be able to
'undo' that is safe against concurrent hlist_del_rcu.

If we change the register to keep the hlist sorted by address then we
can do a targetted 'undo' of past starts terminated by address
less-than comparison of the first failing struct mmu_notifier.

It relies on the fact that rcu is only used to remove items, the list
adds are all protected by mm locks, and the number of mmu notifiers is
very small.

This seems workable and does not need more driver review/update...

However, hmm's implementation still needs more fixing.

Thanks,
Jason
