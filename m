From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Fri, 24 Jul 2020 09:35:49 -0500
Message-ID: <20200724143549.GA1516749@bjorn-Precision-5520>
References: <20200724095751.GU1375436@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200724095751.GU1375436@lahna.fi.intel.com>
Sender: linux-pci-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Karol Herbst <kherbst@redhat.com>, Patrick Volkerding <volkerdi@gmail.com>, Lyude Paul <lyude@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Sasha Levin <sashal@kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 24, 2020 at 12:57:51PM +0300, Mika Westerberg wrote:
> On Thu, Jul 23, 2020 at 10:30:58PM +0200, Karol Herbst wrote:
> > On Wed, Jul 22, 2020 at 11:25 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > On Tue, Jul 21, 2020 at 01:37:12PM -0500, Patrick Volkerding wrote:
> > > > On 7/21/20 10:27 AM, Mika Westerberg wrote:
> > > > > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > > > >> Sure thing. Also, feel free to let me know if you'd like access to one of the
> > > > >> systems we saw breaking with this patch - I'm fairly sure I've got one of them
> > > > >> locally at my apartment and don't mind setting up AMT/KVM/SSH
> > > > > Probably no need for remote access (thanks for the offer, though). I
> > > > > attached a test patch to the bug report:
> > > > >
> > > > >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> > > > >
> > > > > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > > > > anyone would have time to try it out.
> > > >
> > > >
> > > > Hi Mika,
> > > >
> > > > I can confirm that this patch applied to 5.4.52 fixes the issue with
> > > > hybrid graphics on the Thinkpad X1 Extreme gen2.
> > >
> > > Great, thanks for testing!
> > 
> > yeah, works on the P1G2 as well.
> 
> Thanks for testing!
> 
> Since we have the revert queued for this release cycle, I think I will
> send an updated version of "PCI/PM: Assume ports without DLL Link Active
> train links in 100 ms" after v5.9-rc1 is released that has this
> workaround in place.
> 
> (I'm continuing my vacation so will be offline next week).

Sounds fine, sorry for interrupting your vacation!
