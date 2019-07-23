From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/6] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
Date: Tue, 23 Jul 2019 14:18:17 -0300
Message-ID: <20190723171817.GE15357@ziepe.ca>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-2-hch@lst.de>
 <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
 <20190723145441.GI15331@mellanox.com>
 <20190723161907.GB1655@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723161907.GB1655@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Souptick Joarder <jrdr.linux@gmail.com>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Linux-MM <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 23, 2019 at 06:19:07PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 23, 2019 at 02:54:45PM +0000, Jason Gunthorpe wrote:
> > I think without the commit message I wouldn't have been able to
> > understand that, so Christoph, could you also add the comment below
> > please?
> 
> I don't think this belongs into this patch.  I can add it as a separate
> patch under your name and with your signoff if you are ok with that.

Yep, thanks

Jason
