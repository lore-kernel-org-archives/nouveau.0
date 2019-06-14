From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/22] mm: factor out a devm_request_free_mem_region
 helper
Date: Fri, 14 Jun 2019 08:24:55 +0200
Message-ID: <20190614062455.GH7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-7-hch@lst.de> <20190613191626.GR22062@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613191626.GR22062@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jun 13, 2019 at 07:16:35PM +0000, Jason Gunthorpe wrote:
> I wonder if IORES_DESC_DEVICE_PRIVATE_MEMORY should be a function
> argument?

No.  The only reason to use this function is to allocate the fake
physical address space for the device private memory case.  If you'd
deal with real resources you'd use the normal resource allocator.
