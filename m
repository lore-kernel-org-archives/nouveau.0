From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Wed, 27 Nov 2019 13:48:56 +0200
Message-ID: <20191127114856.GZ11621@lahna.fi.intel.com>
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Karol Herbst <kherbst@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Tue, Nov 26, 2019 at 06:10:36PM -0500, Lyude Paul wrote:
> Hey-this is almost certainly not the right place in this thread to respond,
> but this thread has gotten so deep evolution can't push the subject further to
> the right, heh. So I'll just respond here.

:)

> I've been following this and helping out Karol with testing here and there.
> They had me test Bjorn's PCI branch on the X1 Extreme 2nd generation, which
> has a turing GPU and 8086:1901 PCI bridge.
> 
> I was about to say "the patch fixed things, hooray!" but it seems that after
> trying runtime suspend/resume a couple times things fall apart again:

You mean $subject patch, no?

> [  686.883247] nouveau 0000:01:00.0: DRM: suspending object tree...
> [  752.866484] ACPI Error: Aborting method \_SB.PCI0.PEG0.PEGP.NVPO due to previous error (AE_AML_LOOP_TIMEOUT) (20190816/psparse-529)
> [  752.866508] ACPI Error: Aborting method \_SB.PCI0.PGON due to previous error (AE_AML_LOOP_TIMEOUT) (20190816/psparse-529)
> [  752.866521] ACPI Error: Aborting method \_SB.PCI0.PEG0.PG00._ON due to previous error (AE_AML_LOOP_TIMEOUT) (20190816/psparse-529)

This is probably the culprit. The same AML code fails to properly turn
on the device.

Is acpidump from this system available somewhere?
