From: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Date: Tue, 9 Jul 2019 16:30:38 +0200
Message-ID: <20190709143038.GA3092@lst.de>
References: <20190703220214.28319-1-hch@lst.de> <20190705123336.GA31543@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705123336.GA31543@ziepe.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 05, 2019 at 09:33:36AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 03, 2019 at 03:02:08PM -0700, Christoph Hellwig wrote:
> > Hi Jérôme, Ben and Jason,
> > 
> > below is a series against the hmm tree which fixes up the mmap_sem
> > locking in nouveau and while at it also removes leftover legacy HMM APIs
> > only used by nouveau.
> 
> As much as I like this series, it won't make it to this merge window,
> sorry.

Note that patch 4 fixes a pretty severe locking bug, and 1-3 is just
preparation for that.  
