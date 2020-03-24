From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v7] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Tue, 24 Mar 2020 12:50:54 -0500
Message-ID: <20200324175054.GA23029@google.com>
References: <CACO55ttvb5uC37ORiLuVBidhfSn-+WSReJ+aCfWR3k-fLtPBnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55ttvb5uC37ORiLuVBidhfSn-+WSReJ+aCfWR3k-fLtPBnA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@intel.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 24, 2020 at 06:31:08PM +0100, Karol Herbst wrote:
> On Sat, Mar 21, 2020 at 2:02 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Fri, Mar 20, 2020 at 11:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> > > > Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> > > > Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> > > >
> > > > Depending on the used kernel there might be messages like those in demsg:
> > > >
> > > > "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> > > > "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> > > > space inaccessible)"
> > > > followed by backtraces of kernel crashes or timeouts within nouveau.
> > > >
> > > > It's still unkown why this issue exists, but this is a reliable workaround
> > > > and solves a very annoying issue for user having to choose between a
> > > > crashing kernel or higher power consumption of their Laptops.
> > >
> > > Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
> > > list discussion.  Can you include links to some of that?
> > >
> > > IIUC this basically just turns off PCI power management for the GPU.
> > > Can you do that with something like the following?  I don't know
> > > anything about DRM, so I don't know where you could save the pm_cap,
> > > but I'm sure the driver could keep it somewhere.
> > >
> >
> > Sure this would work? From a quick look over the pci code, it looks
> > like a of code would be skipped we really need, like the platform code
> > to turn off the GPU via ACPI. But I could also remember incorrectly on
> > how all of that worked again. I can of course try and see what the
> > effect of this patch would be. And would the parent bus even go into
> > D3hot if it knows one of its children is still at D0? Because that's
> > what the result of that would be as well, no? And I know that if the
> > bus stays in D0, that it has a negative impact on power consumption.
> >
> > Anyway, I will try that out, I am just not seeing how that would help.
> 
> so it seems like that has worked unless I screwed up locally. Will do
> some proper testing and then I think we won't need to go through the
> pci tree anymore as no changes are required there with that.

Hehe, looks like our responses crossed in the mail :)  I hope further
testing is still positive; let me know if not.

Bjorn
