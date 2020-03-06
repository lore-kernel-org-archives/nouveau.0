From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v6] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Fri, 6 Mar 2020 07:40:06 +0200
Message-ID: <20200306054006.GZ2540@lahna.fi.intel.com>
References: <20200303101052.133631-1-kherbst@redhat.com>
 <20200304093324.GI2540@lahna.fi.intel.com>
 <CACO55ts7VGUJoSM_X_huZ0o68+P6SaWgFKbQzkw=-F+Kh5WfcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55ts7VGUJoSM_X_huZ0o68+P6SaWgFKbQzkw=-F+Kh5WfcA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Mar 05, 2020 at 05:11:57PM +0100, Karol Herbst wrote:
> On Wed, Mar 4, 2020 at 10:33 AM Mika Westerberg
> <mika.westerberg@intel.com> wrote:
> >
> > Hi,
> >
> > On Tue, Mar 03, 2020 at 11:10:52AM +0100, Karol Herbst wrote:
> > > Fixes state transitions of Nvidia Pascal GPUs from D3cold into higher device
> > > states.
> >
> > I think it is good to explain bit more here why this fix is needed.
> >
> 
> is something like this fine?
> 
> Fixes the infamous 'runpm' bug many users are facing on Laptops with Nvidia
> Pascal GPUs by skipping PCI power state changes on the GPU.

I would open up 'runpm' -> runtime PM.

> It's still unknown why this issue exists, but this is a reliable workaround
> and solves a very annoying issue for user having to choose between a
> crashing kernel or higher power consumption of their Laptops.

Also I think it would be good to include a short log snippet how this
manifests and in what kind of scenario it happens.
