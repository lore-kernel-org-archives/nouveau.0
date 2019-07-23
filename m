From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Date: Tue, 23 Jul 2019 14:17:31 -0300
Message-ID: <20190723171731.GD15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
 <20190723151824.GL15331@mellanox.com>
 <20190723163048.GD1655@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723163048.GD1655@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 23, 2019 at 06:30:48PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 23, 2019 at 03:18:28PM +0000, Jason Gunthorpe wrote:
> > Hum..
> > 
> > The caller does this:
> > 
> > again:
> > 		ret = nouveau_range_fault(&svmm->mirror, &range);
> > 		if (ret == 0) {
> > 			mutex_lock(&svmm->mutex);
> > 			if (!nouveau_range_done(&range)) {
> > 				mutex_unlock(&svmm->mutex);
> > 				goto again;
> > 
> > And we can't call nouveau_range_fault() -> hmm_range_fault() without
> > holding the mmap_sem, so we can't allow nouveau_range_fault to unlock
> > it.
> 
> Goto again can only happen if nouveau_range_fault was successful,
> in which case we did not drop mmap_sem.

Oh, right we switch from success = number of pages to success =0..

However the reason this looks so weird to me is that the locking
pattern isn't being followed, any result of hmm_range_fault should be
ignored until we enter the svmm->mutex and check if there was a
colliding invalidation.

So the 'goto again' *should* be possible even if range_fault failed.

But that is not for this patch..

> >  	ret = hmm_range_fault(range, true);
> >  	if (ret <= 0) {
> >  		if (ret == 0)
> >  			ret = -EBUSY;
> > -		up_read(&range->vma->vm_mm->mmap_sem);
> >  		hmm_range_unregister(range);
> 
> This would hold mmap_sem over hmm_range_unregister, which can lead
> to deadlock if we call exit_mmap and then acquire mmap_sem again.

That reminds me, this code is also leaking hmm_range_unregister() in
the success path, right?

I think the right way to structure this is to move the goto again and
related into the nouveau_range_fault() so the whole retry algorithm is
sensibly self contained.

Jason
