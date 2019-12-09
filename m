From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Mon, 9 Dec 2019 12:17:10 +0100
Message-ID: <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com> <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com> <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com> <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: Mika Westerberg <mika.westerberg@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

anybody any other ideas? It seems that both patches don't really fix
the issue and I have no idea left on my side to try out. The only
thing left I could do to further investigate would be to reverse
engineer the Nvidia driver as they support runpm on Turing+ GPUs now,
but I've heard users having similar issues to the one Lyude told us
about... and I couldn't verify that the patches help there either in a
reliable way.

On Wed, Nov 27, 2019 at 8:55 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Wed, 2019-11-27 at 12:51 +0100, Karol Herbst wrote:
> > On Wed, Nov 27, 2019 at 12:49 PM Mika Westerberg
> > <mika.westerberg@intel.com> wrote:
> > > On Tue, Nov 26, 2019 at 06:10:36PM -0500, Lyude Paul wrote:
> > > > Hey-this is almost certainly not the right place in this thread to
> > > > respond,
> > > > but this thread has gotten so deep evolution can't push the subject
> > > > further to
> > > > the right, heh. So I'll just respond here.
> > >
> > > :)
> > >
> > > > I've been following this and helping out Karol with testing here an=
d
> > > > there.
> > > > They had me test Bjorn's PCI branch on the X1 Extreme 2nd generatio=
n,
> > > > which
> > > > has a turing GPU and 8086:1901 PCI bridge.
> > > >
> > > > I was about to say "the patch fixed things, hooray!" but it seems t=
hat
> > > > after
> > > > trying runtime suspend/resume a couple times things fall apart agai=
n:
> > >
> > > You mean $subject patch, no?
> > >
> >
> > no, I told Lyude to test the pci/pm branch as the runpm errors we saw
> > on that machine looked different. Some BAR error the GPU reported
> > after it got resumed, so I was wondering if the delays were helping
> > with that. But after some cycles it still caused the same issue, that
> > the GPU disappeared. Later testing also showed that my patch also
> > didn't seem to help with this error sadly :/
> >
> > > > [  686.883247] nouveau 0000:01:00.0: DRM: suspending object tree...
> > > > [  752.866484] ACPI Error: Aborting method \_SB.PCI0.PEG0.PEGP.NVPO=
 due
> > > > to previous error (AE_AML_LOOP_TIMEOUT) (20190816/psparse-529)
> > > > [  752.866508] ACPI Error: Aborting method \_SB.PCI0.PGON due to
> > > > previous error (AE_AML_LOOP_TIMEOUT) (20190816/psparse-529)
> > > > [  752.866521] ACPI Error: Aborting method \_SB.PCI0.PEG0.PG00._ON =
due
> > > > to previous error (AE_AML_LOOP_TIMEOUT) (20190816/psparse-529)
> > >
> > > This is probably the culprit. The same AML code fails to properly tur=
n
> > > on the device.
> > >
> > > Is acpidump from this system available somewhere?
>
> Attached it to this email
>
> > >
> --
> Cheers,
>         Lyude Paul
