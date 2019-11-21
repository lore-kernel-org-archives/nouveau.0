From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Thu, 21 Nov 2019 13:17:39 +0200
Message-ID: <20191121111739.GT11621@lahna.fi.intel.com>
References: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 21, 2019 at 12:03:52PM +0100, Rafael J. Wysocki wrote:
> On Thu, Nov 21, 2019 at 11:14 AM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > On Wed, Nov 20, 2019 at 10:36:31PM +0100, Karol Herbst wrote:
> > > with the branch and patch applied:
> > > https://gist.githubusercontent.com/karolherbst/03c4c8141b0fa292d781badfa186479e/raw/5c62640afbc57d6e69ea924c338bd2836e770d02/gistfile1.txt
> >
> > Thanks for testing. Too bad it did not help :( I suppose there is no
> > change if you increase the delay to say 1s?
> 
> Well, look at the original patch in this thread.
> 
> What it does is to prevent the device (GPU in this particular case)
> from going into a PCI low-power state before invoking AML to power it
> down (the AML is still invoked after this patch AFAICS), so why would
> that have anything to do with the delays?

Yes, I know what it does :) I was just thinking that maybe it's still
the link that does not come up when we go back to D0 I guess that's not
the case here.

> The only reason would be the AML running too early, but that doesn't
> seem likely.  IMO more likely is that the AML does something which
> cannot be done to a device in a PCI low-power state.

It may very well be the case.
