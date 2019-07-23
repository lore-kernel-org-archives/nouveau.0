From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] nouveau: remove the block parameter to
 nouveau_range_fault
Date: Tue, 23 Jul 2019 18:23:38 +0200
Message-ID: <20190723162338.GC1655@lst.de>
References: <20190722094426.18563-1-hch@lst.de> <20190722094426.18563-4-hch@lst.de> <20190723145620.GK15331@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723145620.GK15331@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 23, 2019 at 02:56:24PM +0000, Jason Gunthorpe wrote:
> On Mon, Jul 22, 2019 at 11:44:23AM +0200, Christoph Hellwig wrote:
> > The parameter is always false, so remove it as well as the -EAGAIN
> > handling that can only happen for the non-blocking case.
> 
> ? Did the EAGAIN handling get removed in this patch?

No.  The next revision will remove it.
