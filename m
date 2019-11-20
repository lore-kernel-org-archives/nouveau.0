From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Wed, 20 Nov 2019 22:37:05 +0100
Message-ID: <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
References: <20191120101816.GX11621@lahna.fi.intel.com> <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com> <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com> <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com> <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191120155301.GL11621@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@intel.com>
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Wed, Nov 20, 2019 at 4:53 PM Mika Westerberg
<mika.westerberg@intel.com> wrote:
>
> On Wed, Nov 20, 2019 at 04:37:14PM +0100, Karol Herbst wrote:
> > On Wed, Nov 20, 2019 at 4:15 PM Mika Westerberg
> > <mika.westerberg@intel.com> wrote:
> > >
> > > On Wed, Nov 20, 2019 at 01:11:52PM +0100, Karol Herbst wrote:
> > > > On Wed, Nov 20, 2019 at 1:09 PM Mika Westerberg
> > > > <mika.westerberg@intel.com> wrote:
> > > > >
> > > > > On Wed, Nov 20, 2019 at 12:58:00PM +0100, Karol Herbst wrote:
> > > > > > overall, what I really want to know is, _why_ does it work on windows?
> > > > >
> > > > > So do I ;-)
> > > > >
> > > > > > Or what are we doing differently on Linux so that it doesn't work? If
> > > > > > anybody has any idea on how we could dig into this and figure it out
> > > > > > on this level, this would probably allow us to get closer to the root
> > > > > > cause? no?
> > > > >
> > > > > Have you tried to use the acpi_rev_override parameter in your system and
> > > > > does it have any effect?
> > > > >
> > > > > Also did you try to trace the ACPI _ON/_OFF() methods? I think that
> > > > > should hopefully reveal something.
> > > > >
> > > >
> > > > I think I did in the past and it seemed to have worked, there is just
> > > > one big issue with this: it's a Dell specific workaround afaik, and
> > > > this issue plagues not just Dell, but we've seen it on HP and Lenovo
> > > > laptops as well, and I've heard about users having the same issues on
> > > > Asus and MSI laptops as well.
> > >
> > > Maybe it is not a workaround at all but instead it simply determines
> > > whether the system supports RTD3 or something like that (IIRC Windows 8
> > > started supporting it). Maybe Dell added check for Linux because at that
> > > time Linux did not support it.
> > >
> >
> > the point is, it's not checking it by default, so by default you still
> > run into the windows 8 codepath.
>
> Well you can add the quirk to acpi_rev_dmi_table[] so it goes to that
> path by default. There are a bunch of similar entries for Dell machines.

OK, so the "Linux path" works and the other doesn't.

I thought that this was the other way around, sorry for the confusion.

> Of course this does not help the non-Dell users so we would still need
> to figure out the root cause.

Right.

Whatever it is, though, AML appears to be involved in it and AFAICS
there's no evidence that it affects any root ports that are not
populated with NVidia GPUs.

Now, one thing is still not clear to me from the discussion so far: is
the _PR3 method you mentioned defined under the GPU device object or
under the port device object?
