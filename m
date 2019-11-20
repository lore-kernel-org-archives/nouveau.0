From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Wed, 20 Nov 2019 13:11:36 +0100
Message-ID: <CAJZ5v0hYLrmFup61kzQL_rUuRy9yb+3L-BdRUGfSKqkGpm-utw@mail.gmail.com>
References: <20191017121901.13699-1-kherbst@redhat.com> <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com> <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com> <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com> <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>, Mika Westerberg <mika.westerberg@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Wed, Nov 20, 2019 at 1:06 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Nov 20, 2019 at 12:51 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Wed, Nov 20, 2019 at 12:48 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Wed, Nov 20, 2019 at 12:22 PM Mika Westerberg
> > > <mika.westerberg@intel.com> wrote:
> > > >
> > > > On Wed, Nov 20, 2019 at 11:52:22AM +0100, Rafael J. Wysocki wrote:
> > > > > On Wed, Nov 20, 2019 at 11:18 AM Mika Westerberg
> > > > > <mika.westerberg@intel.com> wrote:
> > > > > >
>
> [cut]
>
> > > > >
> > > > > Oh, so does it look like we are trying to work around AML that tried
> > > > > to work around some problematic behavior in Linux at one point?
> > > >
> > > > Yes, it looks like so if I read the ASL right.
> > >
> > > OK, so that would call for a DMI-based quirk as the real cause for the
> > > issue seems to be the AML in question, which means a firmware problem.
> > >
> >
> > And I disagree as this is a linux specific workaround and windows goes
> > that path and succeeds. This firmware based workaround was added,
> > because it broke on Linux.
>
> Apparently so at the time it was added, but would it still break after
> the kernel changes made since then?
>
> Moreover, has it not become harmful now?  IOW, wouldn't it work after
> removing the "Linux workaround" from the AML?
>
> The only way to verify that I can see would be to run the system with
> custom ACPI tables without the "Linux workaround" in the AML in
> question.

Or running it with acpi_rev_override as suggested by Mika, which
effectively would be the same thing.
