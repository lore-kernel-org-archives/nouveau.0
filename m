From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Wed, 20 Nov 2019 23:29:33 +0100
Message-ID: <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
References: <20191120101816.GX11621@lahna.fi.intel.com> <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com> <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com> <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com> <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com> <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@intel.com>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Wed, Nov 20, 2019 at 10:40 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Nov 20, 2019 at 10:37 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Wed, Nov 20, 2019 at 4:53 PM Mika Westerberg
> > <mika.westerberg@intel.com> wrote:
> > >
> > > On Wed, Nov 20, 2019 at 04:37:14PM +0100, Karol Herbst wrote:
> > > > On Wed, Nov 20, 2019 at 4:15 PM Mika Westerberg
> > > > <mika.westerberg@intel.com> wrote:
> > > > >
> > > > > On Wed, Nov 20, 2019 at 01:11:52PM +0100, Karol Herbst wrote:
> > > > > > On Wed, Nov 20, 2019 at 1:09 PM Mika Westerberg
> > > > > > <mika.westerberg@intel.com> wrote:
> > > > > > >
> > > > > > > On Wed, Nov 20, 2019 at 12:58:00PM +0100, Karol Herbst wrote:
> > > > > > > > overall, what I really want to know is, _why_ does it work on windows?
> > > > > > >
> > > > > > > So do I ;-)
> > > > > > >
> > > > > > > > Or what are we doing differently on Linux so that it doesn't work? If
> > > > > > > > anybody has any idea on how we could dig into this and figure it out
> > > > > > > > on this level, this would probably allow us to get closer to the root
> > > > > > > > cause? no?
> > > > > > >
> > > > > > > Have you tried to use the acpi_rev_override parameter in your system and
> > > > > > > does it have any effect?
> > > > > > >
> > > > > > > Also did you try to trace the ACPI _ON/_OFF() methods? I think that
> > > > > > > should hopefully reveal something.
> > > > > > >
> > > > > >
> > > > > > I think I did in the past and it seemed to have worked, there is just
> > > > > > one big issue with this: it's a Dell specific workaround afaik, and
> > > > > > this issue plagues not just Dell, but we've seen it on HP and Lenovo
> > > > > > laptops as well, and I've heard about users having the same issues on
> > > > > > Asus and MSI laptops as well.
> > > > >
> > > > > Maybe it is not a workaround at all but instead it simply determines
> > > > > whether the system supports RTD3 or something like that (IIRC Windows 8
> > > > > started supporting it). Maybe Dell added check for Linux because at that
> > > > > time Linux did not support it.
> > > > >
> > > >
> > > > the point is, it's not checking it by default, so by default you still
> > > > run into the windows 8 codepath.
> > >
> > > Well you can add the quirk to acpi_rev_dmi_table[] so it goes to that
> > > path by default. There are a bunch of similar entries for Dell machines.
> >
> > OK, so the "Linux path" works and the other doesn't.
> >
> > I thought that this was the other way around, sorry for the confusion.
> >
> > > Of course this does not help the non-Dell users so we would still need
> > > to figure out the root cause.
> >
> > Right.
> >
> > Whatever it is, though, AML appears to be involved in it and AFAICS
> > there's no evidence that it affects any root ports that are not
> > populated with NVidia GPUs.
> >
>
> last week or so I found systems where the GPU was under the "PCI
> Express Root Port" (name from lspci) and on those systems all of that
> seems to work. So I am wondering if it's indeed just the 0x1901 one,
> which also explains Mikas case that Thunderbolt stuff works as devices
> never get populated under this particular bridge controller, but under
> those "Root Port"s

It always is a PCIe port, but its location within the SoC may matter.

Also some custom AML-based power management is involved and that may
be making specific assumptions on the configuration of the SoC and the
GPU at the time of its invocation which unfortunately are not known to
us.

However, it looks like the AML invoked to power down the GPU from
acpi_pci_set_power_state() gets confused if it is not in PCI D0 at
that point, so it looks like that AML tries to access device memory on
the GPU (beyond the PCI config space) or similar which is not
accessible in PCI power states below D0.
