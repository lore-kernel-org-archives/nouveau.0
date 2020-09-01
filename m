From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 07/28] 53c700: improve non-coherent DMA handling
Date: Tue, 1 Sep 2020 16:05:54 +0100
Message-ID: <20200901150554.GN14765@casper.infradead.org>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
 <1598971960.4238.5.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-ia64-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1598971960.4238.5.camel@HansenPartnership.com>
Sender: linux-ia64-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org, Tom Lendacky <thomas.lendacky@amd.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, netdev@vger.ke
List-Id: nouveau.vger.kernel.org

On Tue, Sep 01, 2020 at 07:52:40AM -0700, James Bottomley wrote:
> I think this looks mostly OK, except for one misnamed parameter below. 
> Unfortunately, the last non-coherent parisc was the 700 series and I no
> longer own a box, so I can't test that part of it (I can fire up the
> C360 to test it on a coherent arch).

I have a 715/50 that probably hasn't been powered on in 15 years if you
need something that old to test on (I believe the 725/100 uses the 7100LC
and so is coherent).  I'll need to set up a cross-compiler ...
