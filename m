From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] mm/hmm: replace hmm_update with mmu_notifier_range
Date: Wed, 24 Jul 2019 17:33:05 +0200
Message-ID: <20190724153305.GA10681@lst.de>
References: <20190723210506.25127-1-rcampbell@nvidia.com> <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724152858.GB28493@ziepe.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Michal Hocko <mhocko@suse.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2019 at 12:28:58PM -0300, Jason Gunthorpe wrote:
> Humm. Actually having looked this some more, I wonder if this is a
> problem:

What a mess.

Question: do we even care for the non-blocking events?  The only place
where mmu_notifier_invalidate_range_start_nonblock is called is the oom
killer, which means the process is about to die and the pagetable will
get torn down ASAP.  Should we just skip them unconditionally?  nouveau
already does so, but amdgpu currently tries to handle the non-blocking
notifications.
