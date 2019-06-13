From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 09/22] memremap: lift the devmap_enable manipulation into devm_memremap_pages
Date: Thu, 13 Jun 2019 13:13:41 -0700
Message-ID: <CAPcyv4iwVPm2XBviR8E32VJG+ZZTHZLGxDdXS3et22CTT_3qNA@mail.gmail.com>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-10-hch@lst.de>
 <20190613193427.GU22062@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613193427.GU22062@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jun 13, 2019 at 12:35 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Thu, Jun 13, 2019 at 11:43:12AM +0200, Christoph Hellwig wrote:
> > Just check if there is a ->page_free operation set and take care of the
> > static key enable, as well as the put using device managed resources.
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index c76a1b5defda..6dc769feb2e1 100644
> > +++ b/mm/hmm.c
> > @@ -1378,8 +1378,6 @@ struct hmm_devmem *hmm_devmem_add(const struct hmm_devmem_ops *ops,
> >       void *result;
> >       int ret;
> >
> > -     dev_pagemap_get_ops();
> > -
>
> Where was the matching dev_pagemap_put_ops() for this hmm case? This
> is a bug fix too?
>

It never existed. HMM turned on the facility and made everyone's
put_page() operations slower regardless of whether HMM was in active
use.

> The nouveau driver is the only one to actually call this hmm function
> and it does it as part of a probe function.
>
> Seems reasonable, however, in the unlikely event that it fails to init
> 'dmem' the driver will retain a dev_pagemap_get_ops until it unloads.
> This imbalance doesn't seem worth worrying about.

Right, unless/until the overhead of checking for put_page() callbacks
starts to hurt leaving pagemap_ops tied to lifetime of the driver load
seems acceptable because who unbinds their GPU device at runtime? On
the other hand it was simple enough for the pmem driver to drop the
reference each time a device was unbound just to close the loop.

>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

...minor typo.
