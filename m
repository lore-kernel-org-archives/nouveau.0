From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Tue, 22 Oct 2019 14:51:53 +0200
Message-ID: <CACO55tvxvwUqzg=jLoO6bhmcaXQwRaTv9S4pt2t0V5TUi+HsEw@mail.gmail.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com> <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com> <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com> <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
 <20191021154606.GT2819@lahna.fi.intel.com> <CACO55tsGhvG1qapRkdu_j7R534cFa5o=Gv2s4VZDrWUrxjBFwA@mail.gmail.com>
 <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com> <20191022124453.GK2819@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191022124453.GK2819@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Oct 22, 2019 at 2:45 PM Mika Westerberg
<mika.westerberg@intel.com> wrote:
>
> On Tue, Oct 22, 2019 at 11:16:14AM +0200, Karol Herbst wrote:
> > I think there is something I totally forgot about:
> >
> > When there was never a driver bound to the GPU, and if runtime power
> > management gets enabled on that device, runtime suspend/resume works
> > as expected (I am not 100% sure on if that always works, but I will
> > recheck that).
>
> AFAIK, if there is no driver bound to the PCI device it is left to D0
> regardless of the runtime PM state which could explain why it works in
> that case (it is never put into D3hot).
>
> I looked at the acpidump you sent and there is one thing that may
> explain the differences between Windows and Linux. Not sure if you were
> aware of this already, though. The power resource PGOF() method has
> this:
>
>    If (((OSYS <= 0x07D9) || ((OSYS == 0x07DF) && (_REV == 0x05)))) {
>       ...
>    }
>

I think this is the fallback to some older method of runtime
suspending the device, and I think it will end up touching different
registers on the bridge controller which do not show the broken
behaviour.

You'll find references to following variables which all cause a link
to be powered down: Q0L2 (newest), P0L2, P0LD (oldest, I think).

Maybe I remember incorrectly and have to read the code again... okay,
the fallback path uses P0LD indeed. That's actually the only register
of those being documented by Intel afaik.

> If I read it right, the later condition tries to detect Linux which
> fails nowadays but if you have acpi_rev_override in the command line (or
> the machine is listed in acpi_rev_dmi_table) this check passes and does
> some magic which is not clear to me. There is similar in PGON() side
> which is used to turn the device back on.
>
> You can check what actually happens when _ON()/_OFF() is called by
> passing something like below to the kernel command line:
>
>   acpi.trace_debug_layer=0x80 acpi.trace_debug_level=0x10 acpi.trace_method_name=\_SB.PCI0.PEG0.PG00._ON acpi.trace_state=method
>
> (See also Documentation/firmware-guide/acpi/method-tracing.rst).
>
> Trace goes to system dmesg.

This sounds to be very helpful, I'll give it a try.
