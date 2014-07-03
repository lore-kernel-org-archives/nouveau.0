From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: How to check for proper MSI support?
Date: Wed, 2 Jul 2014 23:20:52 -0400
Message-ID: <CAKb7UviGCtebGwyHbXRLZhDOiDAez+eKkxPe9jz5kc-3R1kUvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, brian.johnathan.b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,

A user (cc'd) reported that nouveau's enabling of MSI causes the card
to not work on his setup [1]. I think the situation is that MSI is
just not supported by the underlying motherboard, even though the
card, and probably bridge, support it just fine. It's a very old
board. The nouveau code does:

pmc->use_msi = pci_enable_msi(device->pdev) == 0;

Does it need to do more checking than that before trying to enable MSI
on the device? Could it be that the linux pci subsystem is missing on
inheriting MSI capabilities somewhere?

Thanks,

  -ilia

[1]

00:00.0 Host bridge [0600]: Intel Corporation 430FX - 82437FX TSC
[Triton I] [8086:122d] (rev 01)
        Flags: bus master, medium devsel, latency 64

00:0e.0 PCI bridge [0604]: PLX Technology, Inc. PEX8112 x1 Lane PCI
Express-to-PCI Bridge [10b5:8112] (rev aa) (prog-if 00 [Normal
decode])
        Flags: bus master, 66MHz, medium devsel, latency 66
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 0000f000-0000ffff
        Memory behind bridge: f5e00000-fbffffff
        Prefetchable memory behind bridge: d5d00000-f5dfffff
        Capabilities: [40] Power Management version 2
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [60] Express PCI/PCI-X to PCI-Express Bridge, MSI 00

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96
[GeForce 9400 GT] [10de:0641] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Jaton Corp Device [1b13:0641]
        Flags: bus master, fast devsel, latency 0, IRQ 11
        Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at fc80 [size=128]
        [virtual] Expansion ROM at d5d00000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: nouveau
