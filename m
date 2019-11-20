From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Wed, 20 Nov 2019 17:15:42 +0200
Message-ID: <20191120151542.GH11621@lahna.fi.intel.com>
References: <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Wed, Nov 20, 2019 at 01:11:52PM +0100, Karol Herbst wrote:
> On Wed, Nov 20, 2019 at 1:09 PM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > On Wed, Nov 20, 2019 at 12:58:00PM +0100, Karol Herbst wrote:
> > > overall, what I really want to know is, _why_ does it work on windows?
> >
> > So do I ;-)
> >
> > > Or what are we doing differently on Linux so that it doesn't work? If
> > > anybody has any idea on how we could dig into this and figure it out
> > > on this level, this would probably allow us to get closer to the root
> > > cause? no?
> >
> > Have you tried to use the acpi_rev_override parameter in your system and
> > does it have any effect?
> >
> > Also did you try to trace the ACPI _ON/_OFF() methods? I think that
> > should hopefully reveal something.
> >
> 
> I think I did in the past and it seemed to have worked, there is just
> one big issue with this: it's a Dell specific workaround afaik, and
> this issue plagues not just Dell, but we've seen it on HP and Lenovo
> laptops as well, and I've heard about users having the same issues on
> Asus and MSI laptops as well.

Maybe it is not a workaround at all but instead it simply determines
whether the system supports RTD3 or something like that (IIRC Windows 8
started supporting it). Maybe Dell added check for Linux because at that
time Linux did not support it.

In case RTD3 is supported it invokes LKDS() which probably does the L2
or L3 entry and this is for some reason does not work the same way in
Linux than it does with Windows 8+.

I don't remember if this happens only with nouveau or with the
proprietary driver as well but looking at the nouveau runtime PM suspend
hook (assuming I'm looking at the correct code):

static int
nouveau_pmops_runtime_suspend(struct device *dev)
{       
        struct pci_dev *pdev = to_pci_dev(dev);
        struct drm_device *drm_dev = pci_get_drvdata(pdev);
        int ret;

        if (!nouveau_pmops_runtime()) {
                pm_runtime_forbid(dev);
                return -EBUSY;
        }

        nouveau_switcheroo_optimus_dsm();
        ret = nouveau_do_suspend(drm_dev, true);
        pci_save_state(pdev);
        pci_disable_device(pdev);
        pci_ignore_hotplug(pdev);
        pci_set_power_state(pdev, PCI_D3cold);
        drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
        return ret;
}

Normally PCI drivers leave the PCI bus PM things to PCI core but here
the driver does these. So I wonder if it makes any difference if we let
the core handle all that:

static int
nouveau_pmops_runtime_suspend(struct device *dev)
{       
        struct pci_dev *pdev = to_pci_dev(dev);
        struct drm_device *drm_dev = pci_get_drvdata(pdev);
        int ret;

        if (!nouveau_pmops_runtime()) {
                pm_runtime_forbid(dev);
                return -EBUSY;
        }

        nouveau_switcheroo_optimus_dsm();
        ret = nouveau_do_suspend(drm_dev, true);
        pci_ignore_hotplug(pdev);
        drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
        return ret;
}

and similar for the nouveau_pmops_runtime_resume().
