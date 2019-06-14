From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/22] device-dax: use the dev_pagemap internal refcount
Date: Fri, 14 Jun 2019 08:35:49 +0200
Message-ID: <20190614063549.GK7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-14-hch@lst.de> <20190614002217.GB783@iweiny-DESK2.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190614002217.GB783@iweiny-DESK2.sc.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ira Weiny <ira.weiny@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Thu, Jun 13, 2019 at 05:22:17PM -0700, Ira Weiny wrote:
> > -	dev_dax->pgmap.ref = &dev_dax->ref;
> 
> I don't think this exactly correct.  pgmap.ref is a pointer to the dev_dax ref
> structure.  Taking it away will cause devm_memremap_pages() to fail AFAICS.
> 
> I think you need to change struct dev_pagemap as well:

Take a look at the previous patch, which adds an internal_ref field
to dev_pagemap that ->ref is set up to point to if not otherwise
initialized.
