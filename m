From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Thu, 21 Nov 2019 17:06:09 +0100
Message-ID: <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
References: <20191120120913.GE11621@lahna.fi.intel.com> <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com> <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com> <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com> <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com> <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mika Westerberg <mika.westerberg@intel.com>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 21, 2019 at 4:47 PM Rafael J. Wysocki <rafael@kernel.org> wrote=
:
>
> On Thu, Nov 21, 2019 at 1:53 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Thu, Nov 21, 2019 at 12:46 PM Mika Westerberg
> > <mika.westerberg@intel.com> wrote:
> > >
> > > On Thu, Nov 21, 2019 at 12:34:22PM +0100, Rafael J. Wysocki wrote:
> > > > On Thu, Nov 21, 2019 at 12:28 PM Mika Westerberg
> > > > <mika.westerberg@intel.com> wrote:
> > > > >
> > > > > On Wed, Nov 20, 2019 at 11:29:33PM +0100, Rafael J. Wysocki wrote=
:
> > > > > > > last week or so I found systems where the GPU was under the "=
PCI
> > > > > > > Express Root Port" (name from lspci) and on those systems all=
 of that
> > > > > > > seems to work. So I am wondering if it's indeed just the 0x19=
01 one,
> > > > > > > which also explains Mikas case that Thunderbolt stuff works a=
s devices
> > > > > > > never get populated under this particular bridge controller, =
but under
> > > > > > > those "Root Port"s
> > > > > >
> > > > > > It always is a PCIe port, but its location within the SoC may m=
atter.
> > > > >
> > > > > Exactly. Intel hardware has PCIe ports on CPU side (these are cal=
led
> > > > > PEG, PCI Express Graphics, ports), and the PCH side. I think the =
IP is
> > > > > still the same.
> > > > >
> >
> > yeah, I meant the bridge controller with the ID 0x1901 is on the CPU
> > side. And if the Nvidia GPU is on a port on the PCH side it all seems
> > to work just fine.
>
> But that may involve different AML too, may it not?
>
> > > > > > Also some custom AML-based power management is involved and tha=
t may
> > > > > > be making specific assumptions on the configuration of the SoC =
and the
> > > > > > GPU at the time of its invocation which unfortunately are not k=
nown to
> > > > > > us.
> > > > > >
> > > > > > However, it looks like the AML invoked to power down the GPU fr=
om
> > > > > > acpi_pci_set_power_state() gets confused if it is not in PCI D0=
 at
> > > > > > that point, so it looks like that AML tries to access device me=
mory on
> > > > > > the GPU (beyond the PCI config space) or similar which is not
> > > > > > accessible in PCI power states below D0.
> > > > >
> > > > > Or the PCI config space of the GPU when the parent root port is i=
n D3hot
> > > > > (as it is the case here). Also then the GPU config space is not
> > > > > accessible.
> > > >
> > > > Why would the parent port be in D3hot at that point?  Wouldn't that=
 be
> > > > a suspend ordering violation?
> > >
> > > No. We put the GPU into D3hot first, then the root port and then turn
> > > off the power resource (which is attached to the root port) resulting
> > > the topology entering D3cold.
> > >
> >
> > If the kernel does a D0 -> D3hot -> D0 cycle this works as well, but
> > the power savings are way lower, so I kind of prefer skipping D3hot
> > instead of D3cold. Skipping D3hot doesn't seem to make any difference
> > in power savings in my testing.
>
> OK
>
> What exactly did you do to skip D3cold in your testing?
>

For that I poked into the PCI registers directly and skipped doing the
ACPI calls and simply checked for the idle power consumption on my
laptop. But I guess I should retest with calling pci_d3cold_disable
from nouveau instead? Or is there a different preferable way of
testing this?
