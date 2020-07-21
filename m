From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Tue, 21 Jul 2020 16:08:47 +0300
Message-ID: <20200721130847.GK5180@lahna.fi.intel.com>
References: <20200716235440.GA675421@bjorn-Precision-5520>
 <ec6623032131fc3e656713b8ec644cdff89a8066.camel@redhat.com>
 <20200717195209.vmtyfmgweoo645lh@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200717195209.vmtyfmgweoo645lh@wunner.de>
Sender: linux-pci-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Lyude Paul <lyude@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>, Karol Herbst <kherbst@redhat.com>, Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>, Linux PCI <linux-pci@vger.kernel.org>, linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 17, 2020 at 09:52:09PM +0200, Lukas Wunner wrote:
> On Fri, Jul 17, 2020 at 03:04:10PM -0400, Lyude Paul wrote:
> > Isn't it possible to tell whether a PCI device is connected through
> > thunderbolt or not? We could probably get away with just defaulting
> > to 100ms for thunderbolt devices without DLL Link Active specified,
> > and then default to the old delay value for non-thunderbolt devices.
> 
> pci_is_thunderbolt_attached()

That only works with some devices. I think we should try to keep the
fact that some PCIe links may be tunneled over TBT/USB4 transparent to
the PCI core and try to treat them as "standard" PCIe links if possible
at all :)
