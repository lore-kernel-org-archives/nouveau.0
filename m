From: Younes Manton <younes.m@gmail.com>
Subject: Re: [Nouveau] [BUG ?] Nouveau driver on 330M GT
Date: Fri, 11 Jun 2010 19:56:05 -0400
Message-ID: <AANLkTilGym6lbGnSKuahBvIAT7a2Wt405i_XZtd7FFwd@mail.gmail.com>
References: <201006111052.29187.goretux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201006111052.29187.goretux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Lacombe <goretux@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, Jun 11, 2010 at 4:52 AM, Eric Lacombe <goretux@gmail.com> wrote=
:
> Hi,
>
> I tested Nouveau with 2.6.34, and now with 2.6.35-rc2 and It does not=
 work
> with my laptop (chip NVIDIA GeForce 330M GT). (I give more informatio=
n of the
> nvidia chip below). I've seen an error message related to my nvidia c=
hip that
> may also be related to my problem :
>
> pci 0000:01:00.0: no compatible bridge window for [mem 0xfff80000-0xf=
fffffff pref]
>
> Thanks in advance for your response.
>
> Best regards
>
> =A0 =A0 =A0 =A0Eric
>
> Here more information :
>
> # dmesg |grep "01\:00\.0"
> [ =A0 =A00.933105] pci 0000:01:00.0: reg 10: [mem 0xd0000000-0xd0ffff=
ff]
> [ =A0 =A00.933122] pci 0000:01:00.0: reg 14: [mem 0xa0000000-0xafffff=
ff 64bit pref]
> [ =A0 =A00.933139] pci 0000:01:00.0: reg 1c: [mem 0xb0000000-0xb1ffff=
ff 64bit pref]
> [ =A0 =A00.933151] pci 0000:01:00.0: reg 24: [io =A00x6000-0x607f]
> [ =A0 =A00.933166] pci 0000:01:00.0: reg 30: [mem 0xfff80000-0xffffff=
ff pref]
> [ =A0 =A00.957777] vgaarb: device added:
> PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
> [ =A0 =A00.973672] pci 0000:01:00.0: no compatible bridge window for =
[mem
> 0xfff80000-0xffffffff pref]
> [ =A0 =A00.973800] pci 0000:01:00.0: BAR 6: assigned [mem 0xd1080000-=
0xd10fffff
> pref]
> [ =A0 13.092806] vgaarb: transferring owner from PCI:0000:00:02.0 to
> PCI:0000:01:00.0

This is not enough information. Most of the useful information is
prefixed with [drm], but generally a full log from boot to fail is
best.

>
> # sudo lspci -v -s 0000:01:00.0
> 01:00.0 VGA compatible controller: nVidia Corporation Device 0a2b (re=
v a2)
> =A0 =A0 =A0 =A0Subsystem: Sony Corporation Device 905a
> =A0 =A0 =A0 =A0Flags: fast devsel, IRQ 5
> =A0 =A0 =A0 =A0Memory at d0000000 (32-bit, non-prefetchable) [disable=
d] [size=3D16M]
> =A0 =A0 =A0 =A0Memory at a0000000 (64-bit, prefetchable) [disabled] [=
size=3D256M]
> =A0 =A0 =A0 =A0Memory at b0000000 (64-bit, prefetchable) [disabled] [=
size=3D32M]
> =A0 =A0 =A0 =A0I/O ports at 6000 [disabled] [size=3D128]
> =A0 =A0 =A0 =A0Expansion ROM at d1080000 [disabled] [size=3D512K]
> =A0 =A0 =A0 =A0Capabilities: [60] Power Management version 3
> =A0 =A0 =A0 =A0Capabilities: [68] Message Signalled Interrupts: Mask-=
 64bit+
> Queue=3D0/0 Enable-
> =A0 =A0 =A0 =A0Capabilities: [78] Express Endpoint, MSI 00
> =A0 =A0 =A0 =A0Capabilities: [b4] Vendor Specific Information <?>
> =A0 =A0 =A0 =A0Capabilities: [100] Virtual Channel <?>
> =A0 =A0 =A0 =A0Capabilities: [128] Power Budgeting <?>
> =A0 =A0 =A0 =A0Capabilities: [600] Vendor Specific Information <?>
> =A0 =A0 =A0 =A0Kernel modules: nouveau, nvidiafb

Please make sure nvidiafb is not loaded. If you still have issues
after making sure that nouveau is the only kernel module running for
this device please attach a full log.
