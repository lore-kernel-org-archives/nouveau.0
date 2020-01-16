From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v6 4/6] mm/mmu_notifier: add mmu_interval_notifier_find()
Date: Thu, 16 Jan 2020 10:11:40 -0400
Message-ID: <20200116141140.GA10759@ziepe.ca>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-5-rcampbell@nvidia.com>
 <20200114124956.GN20978@mellanox.com>
 <528c1cff-608c-d342-1e72-90d780555204@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <528c1cff-608c-d342-1e72-90d780555204@nvidia.com>
Sender: owner-linux-mm@kvack.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jan 15, 2020 at 02:05:24PM -0800, Ralph Campbell wrote:
> 
> On 1/14/20 4:49 AM, Jason Gunthorpe wrote:
> > On Mon, Jan 13, 2020 at 02:47:01PM -0800, Ralph Campbell wrote:
> > > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> > > index 47ad9cc89aab..4efecc0f13cb 100644
> > > +++ b/mm/mmu_notifier.c
> > > @@ -1171,6 +1171,39 @@ void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
> > >   }
> > >   EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
> > > +struct mmu_interval_notifier *mmu_interval_notifier_find(struct mm_struct *mm,
> > > +				const struct mmu_interval_notifier_ops *ops,
> > > +				unsigned long start, unsigned long last)
> > > +{
> > > +	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
> > > +	struct interval_tree_node *node;
> > > +	struct mmu_interval_notifier *mni;
> > > +	struct mmu_interval_notifier *res = NULL;
> > > +
> > > +	spin_lock(&mmn_mm->lock);
> > > +	node = interval_tree_iter_first(&mmn_mm->itree, start, last);
> > > +	if (node) {
> > > +		mni = container_of(node, struct mmu_interval_notifier,
> > > +				   interval_tree);
> > > +		while (true) {
> > > +			if (mni->ops == ops) {
> > > +				res = mni;
> > > +				break;
> > > +			}
> > > +			node = interval_tree_iter_next(&mni->interval_tree,
> > > +						       start, last);
> > > +			if (!node)
> > > +				break;
> > > +			mni = container_of(node, struct mmu_interval_notifier,
> > > +					   interval_tree);
> > > +		}
> > > +	}
> > > +	spin_unlock(&mmn_mm->lock);
> > 
> > This doesn't seem safe at all, here we are returning a pointer to
> > memory from the interval tree with out any kind of lifetime
> > protection.
> 
> It is memory that the driver has allocated and has full control over
> the lifetime since the driver does all the insertions and removals.
> The driver does have to hold the HW page table lock so lookups are
> synchronized with interval insertions and removals and page table
> entry insertions and removals.

No.. the ->release is async, so having the driver hold a lock around
all the mmu_interval_ APIS still doesn't make it safe. The element
could be on the defered list and it could become freed at any moment.

> > If the interval tree is read it must be left in the read lock state
> > until the caller is done with the pointer.
> > 
> > .. and this poses all sorts of questions about consistency with items
> > on the deferred list. Should find return an item undergoing deletion?
> 
> I don't think so. The deferred operations are all complete when
> mmu_interval_read_begin() returns, and the sequence number check
> with mmu_interval_read_retry() guarantees there have been no changes
> while not holding the driver page table lock and calling hmm_range_fault().

It seems very dangerous to say, on one hand, that the driver is
serialized because it holds a lock around all mmu_interval_* calls,
while on the other saying that on rare edge cases find does not return
a result that matches the serial-program-order sequence.

This seems like a way to create bugs.

For instance, if find is consistent with the defered list then it will
not return any element that has a pending deletion and the above issue
with lifetime wouldn't happen.

However, I'm still not sure that providing an API tha requires the
driver to provide tricky locking is the best idea. This basically says
that if a driver uses find then every single other call to
mmu_interval_* must be serialized with a single lock.

Jason
