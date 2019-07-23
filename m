From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Date: Tue, 23 Jul 2019 14:30:32 -0300
Message-ID: <20190723173032.GF15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
 <20190723151824.GL15331@mellanox.com>
 <20190723163048.GD1655@lst.de>
 <20190723171731.GD15357@ziepe.ca>
 <20190723172335.GA2846@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723172335.GA2846@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 23, 2019 at 07:23:35PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 23, 2019 at 02:17:31PM -0300, Jason Gunthorpe wrote:
> > That reminds me, this code is also leaking hmm_range_unregister() in
> > the success path, right?
> 
> No, that is done by hmm_vma_range_done / nouveau_range_done for the
> success path.

.. which is done with the mmap_sem held :(

> > I think the right way to structure this is to move the goto again and
> > related into the nouveau_range_fault() so the whole retry algorithm is
> > sensibly self contained.
> 
> Then we'd take svmm->mutex inside the helper and let the caller
> unlock that.  Either way it is a bit of a mess, and I'd rather prefer
> if someone has the hardware would do a grand rewrite of this path
> eventually.  Alternatively if no one signs up to mainain this code
> we should eventually drop it given the staging status.

I tend to agree with the sentiment, it just makes me sad that all the
examples we have of these APIs are so troubled.

Jason
