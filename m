From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
Date: Fri, 8 May 2020 22:39:38 +0200
Message-ID: <CAK8P3a17yDS4EsSbNibYdhXm5qh=hRBqGx6eHH0bq_Wuv_GG0w@mail.gmail.com>
References: <20200508144017.3501418-1-arnd@arndb.de> <20200508144017.3501418-2-arnd@arndb.de>
 <20200508150041.GI19158@mellanox.com> <CAK8P3a1vCx=XibDdoDqG9obpCFx0JCibAvcKFh6E7_NR_hJ03A@mail.gmail.com>
 <20200508190439.GK19158@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200508190439.GK19158@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, John Hubbard <jhubbard@nvidia.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>, ML nouveau <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, May 8, 2020 at 9:04 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Fri, May 08, 2020 at 05:05:03PM +0200, Arnd Bergmann wrote:
> > On Fri, May 8, 2020 at 5:00 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
> > >
> > > On Fri, May 08, 2020 at 04:40:09PM +0200, Arnd Bergmann wrote:
> > > > CONFIG_DEVICE_PRIVATE cannot be selected in configurations
> > > > without ZONE_DEVICE:
> > >
> > > It is kind of unfortunate to lift dependencies from DEVICE_PRIVATE
> > > into the users, is this really how kconfig is supposed to work or is
> > > something else wrong here?
> >
> > Usually the problem is trying to use 'select' for something that can
> > be done with 'depends on'. I have actually no idea what
> > CONFIG_DEVICE_PRIVATE does, as it lacks a help text
> > and is a rather generic term.
>
> It is a sub mode of ZONE_DEVICE, ie DEVICE_PRIVATE turns on a certain
> kind of ZONE_DEVICE page.
>
> Both ZONE_DEVICE and DEVICE_PRIVATE are APIs families drivers use,
> there is no reason for a user to select either of these directly.

Ok, then how about making ZONE_DEVICE a hidden symbol and adding
something like

config ZONE_DEVICE_POSSIBLE
        def_bool y
        depends on MEMORY_HOTPLUG
        depends on MEMORY_HOTREMOVE
        depends on SPARSEMEM_VMEMMAP
        depends on ARCH_HAS_PTE_DEVMAP

then drivers that want it can do

config FOO
        tristate "user visible option"
        depends on ZONE_DEVICE_POSSIBLE
        select ZONE_DEVICE

      Arnd
