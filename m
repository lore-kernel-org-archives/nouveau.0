From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Date: Wed, 19 Jun 2019 12:46:01 -0700
Message-ID: <CAPcyv4j+zk_5WvFXbUbQ7bWisjWSwzwLsXide1AuVL4kLX8iyQ@mail.gmail.com>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-19-hch@lst.de>
 <20190613194430.GY22062@mellanox.com> <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com> <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com> <20190619192719.GO9374@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619192719.GO9374@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: nouveau.vger.kernel.org

On Wed, Jun 19, 2019 at 12:42 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Thu, Jun 13, 2019 at 06:23:04PM -0700, John Hubbard wrote:
> > On 6/13/19 5:43 PM, Ira Weiny wrote:
> > > On Thu, Jun 13, 2019 at 07:58:29PM +0000, Jason Gunthorpe wrote:
> > >> On Thu, Jun 13, 2019 at 12:53:02PM -0700, Ralph Campbell wrote:
> > >>>
> > ...
> > >> Hum, so the only thing this config does is short circuit here:
> > >>
> > >> static inline bool is_device_public_page(const struct page *page)
> > >> {
> > >>         return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> > >>                 IS_ENABLED(CONFIG_DEVICE_PUBLIC) &&
> > >>                 is_zone_device_page(page) &&
> > >>                 page->pgmap->type == MEMORY_DEVICE_PUBLIC;
> > >> }
> > >>
> > >> Which is called all over the place..
> > >
> > > <sigh>  yes but the earlier patch:
> > >
> > > [PATCH 03/22] mm: remove hmm_devmem_add_resource
> > >
> > > Removes the only place type is set to MEMORY_DEVICE_PUBLIC.
> > >
> > > So I think it is ok.  Frankly I was wondering if we should remove the public
> > > type altogether but conceptually it seems ok.  But I don't see any users of it
> > > so...  should we get rid of it in the code rather than turning the config off?
> > >
> > > Ira
> >
> > That seems reasonable. I recall that the hope was for those IBM Power 9
> > systems to use _PUBLIC, as they have hardware-based coherent device (GPU)
> > memory, and so the memory really is visible to the CPU. And the IBM team
> > was thinking of taking advantage of it. But I haven't seen anything on
> > that front for a while.
>
> Does anyone know who those people are and can we encourage them to
> send some patches? :)

I expect marking it CONFIG_BROKEN with the threat of deleting it if no
patches show up *is* the encouragement.
