From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/17] 53c700: improve non-coherent DMA handling
Date: Tue, 15 Sep 2020 08:27:38 +0200
Message-ID: <20200915062738.GA19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de> <20200914144433.1622958-8-hch@lst.de> <1600096818.4061.7.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-parisc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1600096818.4061.7.camel@HansenPartnership.com>
Sender: linux-parisc-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, netdev@vger.kernel.org, linux-scsi@vger.k
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2020 at 08:20:18AM -0700, James Bottomley wrote:
> If you're going to change the macros from taking a device to taking a
> hostdata structure then the descriptive argument name needs to change
> ... it can't be dev anymore.  I'm happy with it simply becoming 'h' if
> hostdata is too long.
> 
> I already asked for this on the first go around:

And I did rename them, those hunks just accidentally slipped into patch
12 instead of this one.  Fixed for the next versions.
