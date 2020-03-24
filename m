From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v7] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Tue, 24 Mar 2020 12:48:30 -0500
Message-ID: <20200324174830.GA32194@google.com>
References: <CACO55tsamLG5WE16U=psJpRWfz=7Fy5K8haGKHnhic1h0WAmqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tsamLG5WE16U=psJpRWfz=7Fy5K8haGKHnhic1h0WAmqA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@intel.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: nouveau.vger.kernel.org

On Sat, Mar 21, 2020 at 02:02:22AM +0100, Karol Herbst wrote:
> On Fri, Mar 20, 2020 at 11:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> > > Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> > > Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> > >
> > > Depending on the used kernel there might be messages like those in demsg:
> > >
> > > "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> > > "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> > > space inaccessible)"
> > > followed by backtraces of kernel crashes or timeouts within nouveau.
> > >
> > > It's still unkown why this issue exists, but this is a reliable workaround
> > > and solves a very annoying issue for user having to choose between a
> > > crashing kernel or higher power consumption of their Laptops.
> >
> > Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
> > list discussion.  Can you include links to some of that?
> >
> > IIUC this basically just turns off PCI power management for the GPU.
> > Can you do that with something like the following?  I don't know
> > anything about DRM, so I don't know where you could save the pm_cap,
> > but I'm sure the driver could keep it somewhere.
> 
> Sure this would work? From a quick look over the pci code, it looks
> like a of code would be skipped we really need, like the platform
> code to turn off the GPU via ACPI. But I could also remember
> incorrectly on how all of that worked again. I can of course try and
> see what the effect of this patch would be. 

I'm not in a position to test this myself.  I would expect that if a
device lacks a PCI power management capability, we could still use
ACPI power management.  My idea with this patch was to simulate that
situation by clearing pdev->pm_cap so we treat the GPU as though it
had no PCI PM capability.

> And would the parent bus even go into D3hot if it knows one of its
> children is still at D0? Because that's what the result of that
> would be as well, no? And I know that if the bus stays in D0, that
> it has a negative impact on power consumption.

I don't understand this part.  Are you saying you want the GPU in D0
and the upstream component (root port or switch) in D3hot?

I think the rule for the upstream component (the root port or switch
leading to the GPU) is in PCIe spec 5.0, sec 5.3.2.  Basically it says
the upstream component cannot be in a lower power state than the GPU,
i.e.,

  - if the GPU is in D0, the upstream component must be in D0;
  - if the GPU is in D2, the upstream component can be in D0-D2;
  - if the GPU is in D3hot, the upstream component can be in D0-D3hot

So I don't understand how we *could* have the GPU in D0 and the
upstream component in D3hot.

> Anyway, I will try that out, I am just not seeing how that would help.
> 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > index b65ae817eabf..2ad825e8891c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -618,6 +618,23 @@ nouveau_drm_device_fini(struct drm_device *dev)
> >         kfree(drm);
> >  }
> >
> > +static void quirk_broken_nv_runpm(struct drm_device *drm_dev)
> > +{
> > +       struct pci_dev *pdev = drm_dev->pdev;
> > +       struct pci_dev *bridge = pci_upstream_bridge(pdev);
> > +
> > +       if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
> > +               return;
> > +
> > +       switch (bridge->device) {
> > +       case 0x1901:
> > +               STASH->pm_cap = pdev->pm_cap;
> > +               pdev->pm_cap = 0;
> > +               NV_INFO(drm_dev, "Disabling PCI power management to avoid bug\n");
> > +               break;
> > +       }
> > +}
> > +
> >  static int nouveau_drm_probe(struct pci_dev *pdev,
> >                              const struct pci_device_id *pent)
> >  {
> > @@ -699,6 +716,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >         if (ret)
> >                 goto fail_drm_dev_init;
> >
> > +       quirk_broken_nv_runpm(drm_dev);
> >         return 0;
> >
> >  fail_drm_dev_init:
> > @@ -735,6 +753,9 @@ nouveau_drm_remove(struct pci_dev *pdev)
> >  {
> >         struct drm_device *dev = pci_get_drvdata(pdev);
> >
> > +       /* If we disabled PCI power management, restore it */
> > +       if (STASH->pm_cap)
> > +               pdev->pm_cap = STASH->pm_cap;
> >         nouveau_drm_device_remove(dev);
> >         pci_disable_device(pdev);
> >  }
> >
> 
