From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Mon, 21 Oct 2019 16:33:28 +0300
Message-ID: <20191021133328.GI2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, Oct 16, 2019 at 11:48:22PM +0200, Karol Herbst wrote:
> On Wed, Oct 16, 2019 at 11:37 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc linux-acpi]
> >
> > On Wed, Oct 16, 2019 at 09:18:32PM +0200, Karol Herbst wrote:
> > > but setting the PCI_DEV_FLAGS_NO_D3 flag does prevent using the
> > > platform means of putting the device into D3cold, right? That's
> > > actually what should still happen, just the D3hot step should be
> > > skipped.
> >
> > If I understand correctly, when we put a device in D3cold on an ACPI
> > system, we do something like this:
> >
> >   pci_set_power_state(D3cold)
> >     if (PCI_DEV_FLAGS_NO_D3)
> >       return 0                                   <-- nothing at all if quirked
> >     pci_raw_set_power_state
> >       pci_write_config_word(PCI_PM_CTRL, D3hot)  <-- set to D3hot
> >     __pci_complete_power_transition(D3cold)
> >       pci_platform_power_transition(D3cold)
> >         platform_pci_set_power_state(D3cold)
> >           acpi_pci_set_power_state(D3cold)
> >             acpi_device_set_power(ACPI_STATE_D3_COLD)
> >               ...
> >                 acpi_evaluate_object("_OFF")     <-- set to D3cold
> >
> > I did not understand the connection with platform (ACPI) power
> > management from your patch.  It sounds like you want this entire path
> > except that you want to skip the PCI_PM_CTRL write?
> >
> 
> exactly. I am running with this workaround for a while now and never
> had any fails with it anymore. The GPU gets turned off correctly and I
> see the same power savings, just that the GPU can be powered on again.
> 
> > That seems like something Rafael should weigh in on.  I don't know
> > why we set the device to D3hot with PCI_PM_CTRL before using the ACPI
> > methods, and I don't know what the effect of skipping that is.  It
> > seems a little messy to slice out this tiny piece from the middle, but
> > maybe it makes sense.
> >
> 
> afaik when I was talking with others in the past about it, Windows is
> doing that before using ACPI calls, but maybe they have some similar
> workarounds for certain intel bridges as well? I am sure it affects
> more than the one I am blacklisting here, but I rather want to check
> each device before blacklisting all kabylake and sky lake bridges (as
> those are the ones were this issue can be observed).
> 
> Sadly we had no luck getting any information about such workaround out
> of Nvidia or Intel.

I really would like to provide you more information about such
workaround but I'm not aware of any ;-) I have not seen any issues like
this when D3cold is properly implemented in the platform.  That's why
I'm bit skeptical that this has anything to do with specific Intel PCIe
ports. More likely it is some power sequence in the _ON/_OFF() methods
that is run differently on Windows.
