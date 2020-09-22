From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 06/18] lib82596: move DMA allocation into the callers of
 i82596_probe
Date: Tue, 22 Sep 2020 10:48:48 +0200
Message-ID: <20200922084848.GA8477@alpha.franken.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-7-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-7-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mm@kvack
List-Id: nouveau.vger.kernel.org

On Tue, Sep 15, 2020 at 05:51:10PM +0200, Christoph Hellwig wrote:
> This allows us to get rid of the LIB82596_DMA_ATTR defined and prepare
> for untangling the coherent vs non-coherent DMA allocation API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/net/ethernet/i825xx/lasi_82596.c | 24 ++++++++++------
>  drivers/net/ethernet/i825xx/lib82596.c   | 36 ++++++++----------------
>  drivers/net/ethernet/i825xx/sni_82596.c  | 19 +++++++++----
>  3 files changed, 40 insertions(+), 39 deletions(-)

Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de> (SNI part)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
