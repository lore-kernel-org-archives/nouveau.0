From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Tue, 19 Nov 2019 16:57:21 -0600
Message-ID: <20191119225721.GA237491@google.com>
References: <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@intel.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Daniel Drake <drake@endlessm.com>, Vidya Sagar <vidyas@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: nouveau.vger.kernel.org

[+cc Daniel, Vidya, Thierry; thread starts at
https://lore.kernel.org/r/20191017121901.13699-1-kherbst@redhat.com]

On Tue, Nov 19, 2019 at 11:26:45PM +0100, Karol Herbst wrote:
> On Tue, Nov 19, 2019 at 10:50 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Thu, Oct 17, 2019 at 02:19:01PM +0200, Karol Herbst wrote:
> > > Fixes state transitions of Nvidia Pascal GPUs from D3cold into
> > > higher device states.
> > > ...

> > > + *  - kernel crashes, as all pci reads return -1, which most code
> > > + *    isn't able to handle well enough.
> >
> > More details about these crashes would be useful as we look at
> > places that *should* be able to handle errors like this.
> 
> makes sense, I could ,orthogonal to this, make the code more robust
> if we hit issues like this in the future. What I am mostly wondering
> about is, why pci core doesn't give up if the device doesn't come
> back from D3cold? It sounds like, that the most sane thing to do
> here is to just give up and fail runtime_resume and report errors
> back to userspace trying to make use of the devices.

It's possible there's something the core could do here.  It's
interesting that we have at least three issues in this area in this
release:

  1) This NVIDIA GPU issue
  2) Daniel's issue with AMD Ryzen5/7 XHCI power-on
     (https://lore.kernel.org/r/20191014061355.29072-1-drake@endlessm.com)
  3) Vidya's issue with Intel 750 NVMe power-on
     (https://lore.kernel.org/r/20191118172310.21373-1-vidyas@nvidia.com)

Vidya's current patch is the most generic (calling pci_dev_wait() from
pci_power_up()).  That will print a warning if the device doesn't
respond, but we still don't go as far as returning errors to
runtime_resume.

This is definitely something we should consider improving in the
future.

> > > + *  - sudden shutdowns, as the kernel identified an unrecoverable error after
> > > + *    userspace tries to access the GPU.
> >
> > This doesn't fit with the others and more details might be
> > informative here as well.
> 
> yeah.. I try to get more infos on that. But at least for me (and it
> might be a distribution thing) if I execute lspci, the system shuts
> down, or at least tries to and might fail.

The lspci doesn't need to be after the failure occurs.  You can do it
immediately after boot.

If you can capture any part of the dmesg or console log of these
sudden shutdowns, that's all I'm interested in at this point.

Bjorn
