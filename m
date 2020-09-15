From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/17] sgiseeq: convert to dma_alloc_noncoherent
Date: Tue, 15 Sep 2020 08:32:24 +0200
Message-ID: <20200915063224.GB19113@lst.de>
References: <20200914151358.GQ6583@casper.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200914151358.GQ6583@casper.infradead.org>
Sender: linux-doc-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2020 at 04:13:58PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 04:44:27PM +0200, Christoph Hellwig wrote:
> >  drivers/net/ethernet/i825xx/lasi_82596.c |  25 ++---
> >  drivers/net/ethernet/i825xx/lib82596.c   | 114 ++++++++++++++---------
> >  drivers/net/ethernet/i825xx/sni_82596.c  |   4 -
> >  drivers/net/ethernet/seeq/sgiseeq.c      |  28 ++++--
> >  drivers/scsi/53c700.c                    |   9 +-
> >  5 files changed, 103 insertions(+), 77 deletions(-)
> 
> I think your patch slicing-and-dicing went wrong here ;-(

Pretty much..  Fixed up for the next version.
