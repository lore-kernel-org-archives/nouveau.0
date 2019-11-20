From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Wed, 20 Nov 2019 14:09:13 +0200
Message-ID: <20191120120913.GE11621@lahna.fi.intel.com>
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Wed, Nov 20, 2019 at 12:58:00PM +0100, Karol Herbst wrote:
> overall, what I really want to know is, _why_ does it work on windows?

So do I ;-)

> Or what are we doing differently on Linux so that it doesn't work? If
> anybody has any idea on how we could dig into this and figure it out
> on this level, this would probably allow us to get closer to the root
> cause? no?

Have you tried to use the acpi_rev_override parameter in your system and
does it have any effect?

Also did you try to trace the ACPI _ON/_OFF() methods? I think that
should hopefully reveal something.
