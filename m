From: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Date: Tue, 23 Jul 2019 18:32:44 +0200
Message-ID: <20190723163244.GE1655@lst.de>
References: <20190722094426.18563-1-hch@lst.de> <20190723152737.GO15331@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723152737.GO15331@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 23, 2019 at 03:27:41PM +0000, Jason Gunthorpe wrote:
> Ignoring the STAGING issue I've tried to use the same guideline as for
> -stable for -rc .. 
> 
> So this is a real problem, we definitely hit the locking bugs if we
> retry/etc under stress, so I would be OK to send it to Linus for
> early-rc.
> 
> However, it doesn't look like the 1st patch is fixing a current bug
> though, the only callers uses blocking = true, so just the middle
> three are -rc?

nonblocking isn't used anywher, but it is a major, major API bug.
Your call, but if it was my tree I'd probably send it to Linus.
