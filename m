From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
Date: Mon, 24 Jun 2019 11:24:48 -0700
Message-ID: <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
References: <20190613094326.24093-1-hch@lst.de> <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620191733.GH12083@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jun 20, 2019 at 12:17 PM Michal Hocko <mhocko@kernel.org> wrote:
>
> On Thu 13-06-19 11:43:08, Christoph Hellwig wrote:
> > noveau is currently using this through an odd hmm wrapper, and I plan
> > to switch it to the real thing later in this series.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  mm/mempolicy.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index 01600d80ae01..f9023b5fba37 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -2098,6 +2098,7 @@ alloc_pages_vma(gfp_t gfp, int order, struct vm_area_struct *vma,
> >  out:
> >       return page;
> >  }
> > +EXPORT_SYMBOL_GPL(alloc_pages_vma);
>
> All allocator exported symbols are EXPORT_SYMBOL, what is a reason to
> have this one special?

I asked for this simply because it was not exported historically. In
general I want to establish explicit export-type criteria so the
community can spend less time debating when to use EXPORT_SYMBOL_GPL
[1].

The thought in this instance is that it is not historically exported
to modules and it is safer from a maintenance perspective to start
with GPL-only for new symbols in case we don't want to maintain that
interface long-term for out-of-tree modules.

Yes, we always reserve the right to remove / change interfaces
regardless of the export type, but history has shown that external
pressure to keep an interface stable (contrary to
Documentation/process/stable-api-nonsense.rst) tends to be less for
GPL-only exports.

[1]: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2018-September/005688.html
