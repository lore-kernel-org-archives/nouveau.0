From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Tue, 22 Oct 2019 15:44:53 +0300
Message-ID: <20191022124453.GK2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
 <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
 <20191021154606.GT2819@lahna.fi.intel.com>
 <CACO55tsGhvG1qapRkdu_j7R534cFa5o=Gv2s4VZDrWUrxjBFwA@mail.gmail.com>
 <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Oct 22, 2019 at 11:16:14AM +0200, Karol Herbst wrote:
> I think there is something I totally forgot about:
> 
> When there was never a driver bound to the GPU, and if runtime power
> management gets enabled on that device, runtime suspend/resume works
> as expected (I am not 100% sure on if that always works, but I will
> recheck that).

AFAIK, if there is no driver bound to the PCI device it is left to D0
regardless of the runtime PM state which could explain why it works in
that case (it is never put into D3hot).

I looked at the acpidump you sent and there is one thing that may
explain the differences between Windows and Linux. Not sure if you were
aware of this already, though. The power resource PGOF() method has
this:

   If (((OSYS <= 0x07D9) || ((OSYS == 0x07DF) && (_REV == 0x05)))) {
      ...
   }  

If I read it right, the later condition tries to detect Linux which
fails nowadays but if you have acpi_rev_override in the command line (or
the machine is listed in acpi_rev_dmi_table) this check passes and does
some magic which is not clear to me. There is similar in PGON() side
which is used to turn the device back on.

You can check what actually happens when _ON()/_OFF() is called by
passing something like below to the kernel command line:

  acpi.trace_debug_layer=0x80 acpi.trace_debug_level=0x10 acpi.trace_method_name=\_SB.PCI0.PEG0.PG00._ON acpi.trace_state=method

(See also Documentation/firmware-guide/acpi/method-tracing.rst).

Trace goes to system dmesg.
