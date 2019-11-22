From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Fri, 22 Nov 2019 12:54:26 +0100
Message-ID: <CAJZ5v0igbrDecX=KEfNGKMhAdM=DtDK9D=+VbeHJqWRtUE672w@mail.gmail.com>
References: <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com> <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com> <20191121125236.GX11621@lahna.fi.intel.com>
 <CAJZ5v0iMwhudB7O0hR-6KfRfa+_iGOY=t0Zzeh6+9OiTzeYJfA@mail.gmail.com>
 <20191121194942.GY11621@lahna.fi.intel.com> <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
 <20191122103637.GA11621@lahna.fi.intel.com> <CAJZ5v0gifnGZcKr6mgc6C2EfqX13OyJnOac0uDxYNKN=A0cgMg@mail.gmail.com>
 <CACO55tsN_B4Apk1sgMipU5FHRJ1vSPm8HdonrKxqm8Uuo9=6rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55tsN_B4Apk1sgMipU5FHRJ1vSPm8HdonrKxqm8Uuo9=6rQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@intel.com>, Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
List-Id: nouveau.vger.kernel.org

On Fri, Nov 22, 2019 at 12:34 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Nov 22, 2019 at 12:30 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >

[cut]

> >
>
> the issue is not AML related at all as I am able to reproduce this
> issue without having to invoke any of that at all, I just need to poke
> into the PCI register directly to cut the power.

Since the register is not documented, you don't actually know what
exactly happens when it is written to.

You basically are saying something like "if I write a specific value
to an undocumented register, that makes things fail".  And yes,
writing things to undocumented registers is likely to cause failure to
happen, in general.

The point is that the kernel will never write into this register by itself.

> The register is not documented, but effectively what the AML code is writing to as well.

So that AML code is problematic.  It expects the write to do something
useful, but that's not the case.  Without the AML, the register would
not have been written to at all.

> Of course it might also be that the code I was testing it was doing
> things in a non conformant way and I just hit a different issue as
> well, but in the end I don't think that the AML code is the root cause
> of all of that.

If AML is not involved at all, things work.  You've just said so in
another message in this thread, quoting verbatim:

"yes. In my previous testing I was poking into the PCI registers of the
bridge controller and the GPU directly and that never caused any
issues as long as I limited it to putting the devices into D3hot."

You cannot claim a hardware bug just because a write to an
undocumented register from AML causes things to break.

First, that may be a bug in the AML (which is not unheard of).
Second, and that is more likely, the expectations of the AML code may
not be met at the time it is run.

Assuming the latter, the root cause is really that the kernel executes
the AML in a hardware configuration in which the expectations of that
AML are not met.

We are now trying to understand what those expectations may be and so
how to cause them to be met.

Your observation that the issue can be avoided if the GPU is not put
into D3hot by a PMCSR write is a step in that direction and it is a
good finding.  The information from Mika based on the ASL analysis is
helpful too.  Let's not jump to premature conclusions too quickly,
though.
