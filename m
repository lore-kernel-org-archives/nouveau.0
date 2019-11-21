From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Thu, 21 Nov 2019 12:15:17 +0100
Message-ID: <CAJZ5v0j515o9miy65MQkRURkw5bkFZxsva5pcgFW6Zfi+DE10Q@mail.gmail.com>
References: <20191120115127.GD11621@lahna.fi.intel.com> <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com> <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com> <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com> <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com> <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
 <CAJZ5v0jjwaQpYR0P0TPPTGM-1zObm7w1y4bj=7MDvPL78jOz5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0jjwaQpYR0P0TPPTGM-1zObm7w1y4bj=7MDvPL78jOz5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@intel.com>
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 21, 2019 at 12:08 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Nov 21, 2019 at 12:03 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Thu, Nov 21, 2019 at 11:14 AM Mika Westerberg
> > <mika.westerberg@intel.com> wrote:
> > >
> > > On Wed, Nov 20, 2019 at 10:36:31PM +0100, Karol Herbst wrote:
> > > > with the branch and patch applied:
> > > > https://gist.githubusercontent.com/karolherbst/03c4c8141b0fa292d781badfa186479e/raw/5c62640afbc57d6e69ea924c338bd2836e770d02/gistfile1.txt
> > >
> > > Thanks for testing. Too bad it did not help :( I suppose there is no
> > > change if you increase the delay to say 1s?
> >
> > Well, look at the original patch in this thread.
> >
> > What it does is to prevent the device (GPU in this particular case)
> > from going into a PCI low-power state before invoking AML to power it
> > down (the AML is still invoked after this patch AFAICS), so why would
> > that have anything to do with the delays?
> >
> > The only reason would be the AML running too early, but that doesn't
> > seem likely.  IMO more likely is that the AML does something which
> > cannot be done to a device in a PCI low-power state.
>
> BTW, I'm wondering if anyone has tried to skip the AML instead of
> skipping the PCI PM in this case (as of 5.4-rc that would be a similar
> patch to skip the invocations of
> __pci_start/complete_power_transition() in pci_set_power_state() for
> the affected device).

Moving the dev->broken_nv_runpm test into
pci_platform_power_transition() (also for transitions into D0) would
be sufficient for that test if I'm not mistaken.
