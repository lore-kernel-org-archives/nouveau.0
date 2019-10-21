From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Mon, 21 Oct 2019 17:08:52 +0300
Message-ID: <20191021140852.GM2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 21, 2019 at 03:54:09PM +0200, Karol Herbst wrote:
> > I really would like to provide you more information about such
> > workaround but I'm not aware of any ;-) I have not seen any issues like
> > this when D3cold is properly implemented in the platform.  That's why
> > I'm bit skeptical that this has anything to do with specific Intel PCIe
> > ports. More likely it is some power sequence in the _ON/_OFF() methods
> > that is run differently on Windows.
> 
> yeah.. maybe. I really don't know what's the actual root cause. I just
> know that with this workaround it works perfectly fine on my and some
> other systems it was tested on. Do you know who would be best to
> approach to get proper documentation about those methods and what are
> the actual prerequisites of those methods?

Those should be documented in the ACPI spec. Chapter 7 should explain
power resources and the device power methods in detail.
