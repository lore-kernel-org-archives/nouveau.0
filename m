From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Thu, 21 Nov 2019 13:56:57 +0100
Message-ID: <CACO55ttOgx=jyCh_uZLH4t8C5SW0f2u3BSrw93vPmusM98p0Mg@mail.gmail.com>
References: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com> <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com> <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com> <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com> <20191121125236.GX11621@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191121125236.GX11621@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 21, 2019 at 1:52 PM Mika Westerberg
<mika.westerberg@intel.com> wrote:
>
> On Thu, Nov 21, 2019 at 01:46:14PM +0200, Mika Westerberg wrote:
> > On Thu, Nov 21, 2019 at 12:34:22PM +0100, Rafael J. Wysocki wrote:
> > > On Thu, Nov 21, 2019 at 12:28 PM Mika Westerberg
> > > <mika.westerberg@intel.com> wrote:
> > > >
> > > > On Wed, Nov 20, 2019 at 11:29:33PM +0100, Rafael J. Wysocki wrote:
> > > > > > last week or so I found systems where the GPU was under the "PC=
I
> > > > > > Express Root Port" (name from lspci) and on those systems all o=
f that
> > > > > > seems to work. So I am wondering if it's indeed just the 0x1901=
 one,
> > > > > > which also explains Mikas case that Thunderbolt stuff works as =
devices
> > > > > > never get populated under this particular bridge controller, bu=
t under
> > > > > > those "Root Port"s
> > > > >
> > > > > It always is a PCIe port, but its location within the SoC may mat=
ter.
> > > >
> > > > Exactly. Intel hardware has PCIe ports on CPU side (these are calle=
d
> > > > PEG, PCI Express Graphics, ports), and the PCH side. I think the IP=
 is
> > > > still the same.
> > > >
> > > > > Also some custom AML-based power management is involved and that =
may
> > > > > be making specific assumptions on the configuration of the SoC an=
d the
> > > > > GPU at the time of its invocation which unfortunately are not kno=
wn to
> > > > > us.
> > > > >
> > > > > However, it looks like the AML invoked to power down the GPU from
> > > > > acpi_pci_set_power_state() gets confused if it is not in PCI D0 a=
t
> > > > > that point, so it looks like that AML tries to access device memo=
ry on
> > > > > the GPU (beyond the PCI config space) or similar which is not
> > > > > accessible in PCI power states below D0.
> > > >
> > > > Or the PCI config space of the GPU when the parent root port is in =
D3hot
> > > > (as it is the case here). Also then the GPU config space is not
> > > > accessible.
> > >
> > > Why would the parent port be in D3hot at that point?  Wouldn't that b=
e
> > > a suspend ordering violation?
> >
> > No. We put the GPU into D3hot first, then the root port and then turn
> > off the power resource (which is attached to the root port) resulting
> > the topology entering D3cold.
>
> I don't see that happening in the AML though.
>
> Basically the difference is that when Windows 7 or Linux (the _REV=3D=3D5
> check) then we directly do link disable whereas in Windows 8+ we invoke
> LKDS() method that puts the link into L2/L3. None of the fields they
> access seem to touch the GPU itself.
>
> LKDS() for the first PEG port looks like this:
>
>    P0L2 =3D One
>    Sleep (0x10)
>    Local0 =3D Zero
>    While (P0L2)
>    {
>         If ((Local0 > 0x04))
>         {
>             Break
>         }
>
>         Sleep (0x10)
>         Local0++
>    }
>
> One thing that comes to mind is that the loop can end even if P0L2 is
> not cleared as it does only 5 iterations with 16 ms sleep between. Maybe
> Sleep() is implemented differently in Windows? I mean Linux may be
> "faster" here and return prematurely and if we leave the port into D0
> this does not happen, or something. I'm just throwing out ideas :)
>

keep in mind, that I am able to hit this bug with my python script:
https://raw.githubusercontent.com/karolherbst/pci-stub-runpm/master/nv_runp=
m_bug_test.py
