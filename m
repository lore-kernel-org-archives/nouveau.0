From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 6/6] drm/nouveau: use MSI interrupts
Date: Wed, 28 Aug 2013 12:08:32 -0400
Message-ID: <20130828160832.GF16368@phenom.dumpdata.com>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
	<1377648050-6649-7-git-send-email-dev@lynxeye.de>
	<CACAvsv5shyLkE-WdJj6yDx1hhFtNRkuzujxQasWd2MAaVMjJ7A@mail.gmail.com>
	<1377674937.1624.2.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1377674937.1624.2.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 28, 2013 at 09:28:57AM +0200, Lucas Stach wrote:
> Am Mittwoch, den 28.08.2013, 17:09 +1000 schrieb Ben Skeggs:
> > On Wed, Aug 28, 2013 at 10:00 AM, Lucas Stach <dev@lynxeye.de> wrote:
> > > MSIs were only problematic on some old, broken chipsets. But now that we
> > > already see systems where PCI legacy interrupts are somewhat flaky, it's
> > > really time to move to MSIs.
> > >
> > > Signed-off-by: Lucas Stach <dev@lynxeye.de>
> > > ---
> > >  drivers/gpu/drm/nouveau/core/include/subdev/mc.h |  1 +
> > >  drivers/gpu/drm/nouveau/core/subdev/mc/base.c    | 17 +++++++++++++++++
> > >  2 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
> > > index 9d2cd20..ce6569f 100644
> > > --- a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
> > > +++ b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
> > > @@ -12,6 +12,7 @@ struct nouveau_mc_intr {
> > >  struct nouveau_mc {
> > >         struct nouveau_subdev base;
> > >         const struct nouveau_mc_intr *intr_map;
> > > +       bool use_msi;
> > >  };
> > >
> > >  static inline struct nouveau_mc *
> > > diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
> > > index ec9cd6f..02b337e 100644
> > > --- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
> > > +++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
> > > @@ -23,6 +23,7 @@
> > >   */
> > >
> > >  #include <subdev/mc.h>
> > > +#include <core/option.h>
> > >
> > >  static irqreturn_t
> > >  nouveau_mc_intr(int irq, void *arg)
> > > @@ -43,6 +44,9 @@ nouveau_mc_intr(int irq, void *arg)
> > >                 map++;
> > >         }
> > >
> > > +       if (pmc->use_msi)
> > > +               nv_wr08(pmc->base.base.parent, 0x00088068, 0xff);
> > Register not present everywhere.
> > 
> > At the very least, the enabling of MSI should be disallowed on the
> > earlier chipsets where it's not supported.  Though, it's perhaps
> > possible that the pci_enable_msi() call will fail in all of these
> > cases anyway.. I'm not certain.
> > 
> MSIs are required property for everything doing PCIe. So the only cases
> where this should fail is plain PCI/AGP devices. I don't really have a
> test system for those old cards set up.

That is not true. You can boot a machine with pci=nomsi that has PCIe and
it will work. Legacy interrupts still work on PCIe

> 
> But I remember Ilia having some legacy things plugged in, so maybe he
> could test this patch and see how it goes?
> 
> > > +
> > >         if (intr) {
> > >                 nv_error(pmc, "unknown intr 0x%08x\n", stat);
> > >         }
> > > @@ -75,6 +79,8 @@ _nouveau_mc_dtor(struct nouveau_object *object)
> > >         struct nouveau_device *device = nv_device(object);
> > >         struct nouveau_mc *pmc = (void *)object;
> > >         free_irq(device->pdev->irq, pmc);
> > > +       if (pmc->use_msi)
> > > +               pci_disable_msi(device->pdev);
> > >         nouveau_subdev_destroy(&pmc->base);
> > >  }
> > >
> > > @@ -96,6 +102,17 @@ nouveau_mc_create_(struct nouveau_object *parent, struct nouveau_object *engine,
> > >
> > >         pmc->intr_map = intr_map;
> > >
> > > +       pmc->use_msi = nouveau_boolopt(device->cfgopt, "NvMSI", true);
> > > +       if (pmc->use_msi) {
> > > +               ret = pci_enable_msi(device->pdev);
> > > +               if (ret) {
> > > +                       pmc->use_msi = false;
> > > +               } else {
> > > +                       nv_wr08(device, 0x00088068, 0xff);
> > > +                       nv_info(pmc, "MSI interrupts enabled\n");
> > > +               }
> > > +       }
> > > +
> > >         ret = request_irq(device->pdev->irq, nouveau_mc_intr,
> > >                           IRQF_SHARED, "nouveau", pmc);
> > >         if (ret < 0)
> > > --
> > > 1.8.3.1
> > >
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
