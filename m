From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
Date: Fri, 28 Jun 2019 21:02:07 +0200
Message-ID: <20190628190207.GA9317@lst.de>
References: <20190626122724.13313-17-hch@lst.de> <20190628153827.GA5373@mellanox.com> <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com> <20190628170219.GA3608@mellanox.com> <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com> <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com> <20190628182922.GA15242@mellanox.com> <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com> <20190628185152.GA9117@lst.de> <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 28, 2019 at 11:59:19AM -0700, Dan Williams wrote:
> It's a bug that the call to put_devmap_managed_page() was gated by
> MEMORY_DEVICE_PUBLIC in release_pages(). That path is also applicable
> to MEMORY_DEVICE_FSDAX because it needs to trigger the ->page_free()
> callback to wake up wait_on_var() via fsdax_pagefree().
> 
> So I guess you could argue that the MEMORY_DEVICE_PUBLIC removal patch
> left the original bug in place. In that sense we're no worse off, but
> since we know about the bug, the fix and the patches have not been
> applied yet, why not fix it now?

The fix it now would simply be to apply Ira original patch now, but
given that we are at -rc6 is this really a good time?  And if we don't
apply it now based on the quilt based -mm worflow it just seems a lot
easier to apply it after my series.  Unless we want to include it in
the series, in which case I can do a quick rebase, we'd just need to
make sure Andrew pulls it from -mm.
