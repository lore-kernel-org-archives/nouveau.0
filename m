From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 12:28:58 -0300
Message-ID: <20190724152858.GB28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724070553.GA2523@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Michal Hocko <mhocko@suse.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2019 at 09:05:53AM +0200, Christoph Hellwig wrote:
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> One comment on a related cleanup:
> 
> >  	list_for_each_entry(mirror, &hmm->mirrors, list) {
> >  		int rc;
> >  
> > -		rc = mirror->ops->sync_cpu_device_pagetables(mirror, &update);
> > +		rc = mirror->ops->sync_cpu_device_pagetables(mirror, nrange);
> >  		if (rc) {
> > -			if (WARN_ON(update.blockable || rc != -EAGAIN))
> > +			if (WARN_ON(mmu_notifier_range_blockable(nrange) ||
> > +			    rc != -EAGAIN))
> >  				continue;
> >  			ret = -EAGAIN;
> >  			break;
> 
> This magic handling of error seems odd.  I think we should merge rc and
> ret into one variable and just break out if any error happens instead
> or claiming in the comments -EAGAIN is the only valid error and then
> ignoring all others here.

The WARN_ON is enforcing the rules already commented near
mmuu_notifier_ops.invalidate_start - we could break or continue, it
doesn't much matter how to recover from a broken driver, but since we
did the WARN_ON this should sanitize the ret to EAGAIN or 0

Humm. Actually having looked this some more, I wonder if this is a
problem:

I see in __oom_reap_task_mm():

			if (mmu_notifier_invalidate_range_start_nonblock(&range)) {
				tlb_finish_mmu(&tlb, range.start, range.end);
				ret = false;
				continue;
			}
			unmap_page_range(&tlb, vma, range.start, range.end, NULL);
			mmu_notifier_invalidate_range_end(&range);

Which looks like it creates an unbalanced start/end pairing if any
start returns EAGAIN?

This does not seem OK.. Many users require start/end to be paired to
keep track of their internal locking. Ie for instance hmm breaks
because the hmm->notifiers counter becomes unable to get to 0.

Below is the best idea I've had so far..

Michal, what do you think?

From 53638cd1cb02e65e670c5d4edfd36d067bb48912 Mon Sep 17 00:00:00 2001
From: Jason Gunthorpe <jgg@mellanox.com>
Date: Wed, 24 Jul 2019 12:15:40 -0300
Subject: [PATCH] mm/mmu_notifiers: ensure invalidate_start and invalidate_end
 occur in pairs

Many callers of mmu_notifiers invalidate_range callbacks maintain
locking/counters/etc on a paired basis and have long expected that
invalidate_range start/end are always paired.

The recent change to add non-blocking notifiers breaks this assumption as
an EAGAIN return from any notifier causes all notifiers to get their
invalidate_range_end() skipped.

If there is only a single mmu notifier in the list, this may work OK as
the single subscriber may assume that the end is not called when EAGAIN is
returned, however if there are multiple subcribers then there is no way
for a notifier that succeeds to recover if another in the list triggers
EAGAIN and causes the expected end to be skipped.

Due to the RCU locking we can't reliably generate a subset of the linked
list representing the notifiers already called, so the best option is to
call all notifiers in the start path (even if EAGAIN is detected), and
again in the error path to ensure there is proper pairing.

Users that care about start/end pairing must be (re)written so that an
EAGAIN return from their start method expects the end method to be called.

Since incorect return codes will now cause a functional problem, add a
WARN_ON to detect buggy users.

RFC: Need to audit/fix callers to ensure they order their EAGAIN returns
properly. hmm is OK, ODP is not.

Fixes: 93065ac753e4 ("mm, oom: distinguish blockable mode for mmu notifiers")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/mmu_notifier.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index b5670620aea0fc..7d8eca35f1627a 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -176,6 +176,7 @@ int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 		if (mn->ops->invalidate_range_start) {
 			int _ret = mn->ops->invalidate_range_start(mn, range);
 			if (_ret) {
+				WARN_ON(mmu_notifier_range_blockable(range) || rc != -EAGAIN);
 				pr_info("%pS callback failed with %d in %sblockable context.\n",
 					mn->ops->invalidate_range_start, _ret,
 					!mmu_notifier_range_blockable(range) ? "non-" : "");
@@ -183,6 +184,19 @@ int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 			}
 		}
 	}
+
+	if (unlikely(ret)) {
+		/*
+		 * If we hit an -EAGAIN then we have to create a paired
+		 * range_end for the above range_start. Callers must be
+		 * arranged so that they can handle the range_end even if the
+		 * range_start returns EAGAIN.
+		 */
+		hlist_for_each_entry_rcu(mn, &range->mm->mmu_notifier_mm->list, hlist)
+			if (mn->ops->invalidate_range_end)
+				mn->ops->invalidate_range_end(mn, range);
+	}
+
 	srcu_read_unlock(&srcu, id);
 
 	return ret;
-- 
2.22.0
