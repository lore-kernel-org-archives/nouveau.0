From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
Date: Fri, 28 Jun 2019 09:27:44 -0700
Message-ID: <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
References: <20190626122724.13313-1-hch@lst.de> <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628153827.GA5373@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 28, 2019 at 8:39 AM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Wed, Jun 26, 2019 at 02:27:15PM +0200, Christoph Hellwig wrote:
> > The functionality is identical to the one currently open coded in
> > device-dax.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  drivers/dax/dax-private.h |  4 ----
> >  drivers/dax/device.c      | 43 ---------------------------------------
> >  2 files changed, 47 deletions(-)
>
> DanW: I think this series has reached enough review, did you want
> to ack/test any further?
>
> This needs to land in hmm.git soon to make the merge window.

I was awaiting a decision about resolving the collision with Ira's
patch before testing the final result again [1]. You can go ahead and
add my reviewed-by for the series, but my tested-by should be on the
final state of the series.

[1]: https://lore.kernel.org/lkml/CAPcyv4gTOf+EWzSGrFrh2GrTZt5HVR=e+xicUKEpiy57px8J+w@mail.gmail.com/
