From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 20:00:22 +0200
Message-ID: <20190724180022.GD6410@dhcp22.suse.cz>
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed 24-07-19 17:33:05, Christoph Hellwig wrote:
> On Wed, Jul 24, 2019 at 12:28:58PM -0300, Jason Gunthorpe wrote:
> > Humm. Actually having looked this some more, I wonder if this is a
> > problem:
> 
> What a mess.
> 
> Question: do we even care for the non-blocking events?  The only place
> where mmu_notifier_invalidate_range_start_nonblock is called is the oom
> killer, which means the process is about to die and the pagetable will
> get torn down ASAP.  Should we just skip them unconditionally?

How do you tell whether they are going to block or not without trying?
-- 
Michal Hocko
SUSE Labs
