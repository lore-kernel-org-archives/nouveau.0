From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/25] memremap: lift the devmap_enable manipulation
 into devm_memremap_pages
Date: Thu, 27 Jun 2019 10:50:47 +0200
Message-ID: <20190627085047.GA11420@lst.de>
References: <20190626122724.13313-1-hch@lst.de> <20190626122724.13313-12-hch@lst.de> <20190626190445.GE4605@iweiny-DESK2.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626190445.GE4605@iweiny-DESK2.sc.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ira Weiny <ira.weiny@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Jun 26, 2019 at 12:04:46PM -0700, Ira Weiny wrote:
> > +static int devmap_managed_enable_get(struct device *dev, struct dev_pagemap *pgmap)
> > +{
> > +	if (!pgmap->ops->page_free) {
> 
> NIT: later on you add the check for pgmap->ops...  it should probably be here.
> 
> But not sure that bisection will be an issue here.

At this point we do not allow a NULL ops pointer.  That only becomes
a valid option one the internal refcount is added.  Until then a NULL
->ops pointer leads to an error return from devm_memremap_pages.
