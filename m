From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
	(also NV44A)
Date: Tue, 02 Sep 2014 20:44:31 +0000
Message-ID: <bug-70388-8800-4LTRsqswNy@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0553982210=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0553982210==
Content-Type: multipart/alternative; boundary="1409690671.e5aDA3a1.16090"; charset="us-ascii"


--1409690671.e5aDA3a1.16090
Date: Tue, 2 Sep 2014 20:44:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #22 from Linas Vepstas <linasvepstas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I don't think I have AGP .. trying to figure this out.  The north/southbridge
is NVIDIA Corporation MCP55. 

Here is the PCIe bridge and the video cards:

lspci -vnn

00:0f.0 PCI bridge [0604]: NVIDIA Corporation MCP55 PCI Express bridge
[10de:0377] (rev a3) (prog-if 00 [Normal decode])
    Flags: bus master, fast devsel, latency 0
    Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
    Memory behind bridge: f7000000-f9ffffff
    Prefetchable memory behind bridge: 00000000e0000000-00000000efffffff
    Capabilities: [40] Subsystem: NVIDIA Corporation Device [10de:0000]
    Capabilities: [48] Power Management version 2
    Capabilities: [50] MSI: Enable+ Count=1/2 Maskable- 64bit+
    Capabilities: [60] HyperTransport: MSI Mapping Enable- Fixed-
    Capabilities: [80] Express Root Port (Slot+), MSI 00
    Capabilities: [100] Virtual Channel
    Kernel driver in use: pcieport

01:06.0 VGA compatible controller [0300]: NVIDIA Corporation NV44A [GeForce
6200] [10de:0221] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: eVga.com. Corp. Device [3842:b402]
    Flags: bus master, 66MHz, medium devsel, latency 32, IRQ 16
    Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (32-bit, prefetchable) [size=512M]
    Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at fc000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Kernel driver in use: nouveau

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G72 [GeForce 7300
LE] [10de:01d1] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device [1028:0405]
    Flags: bus master, fast devsel, latency 0, IRQ 42
    Memory at f7000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f8000000 (64-bit, non-prefetchable) [size=16M]
    Expansion ROM at f9fe0000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Kernel driver in use: nouveau

The only dmesg lines that mention AGP, agp or gart are:

[    0.000000] AGP: No AGP bridge found
[    0.000000] AGP: Node 0: aperture [bus addr 0xb4000000-0xb5ffffff]
(32MB)
[    0.000000] Aperture pointing to e820 RAM. Ignoring.
[    0.000000] AGP: Your BIOS doesn't leave a aperture memory hole
[    0.000000] AGP: Please enable the IOMMU option in the BIOS setup
[    0.000000] AGP: This costs you 64MB of RAM
[    0.000000] AGP: Mapping aperture over RAM [mem 0xb4000000-0xb7ffffff]
(65536KB)

[    0.256789] pci 0000:02:00.0: Boot video device
[    0.256791] PCI: CLS 32 bytes, default 64
[    0.256980] PCI-DMA: Disabling AGP.
[    0.257075] PCI-DMA: aperture base @ b4000000 size 65536 KB
[    0.257079] PCI-DMA: using GART IOMMU.
[    0.257083] PCI-DMA: Reserving 64MB of IOMMU area in the AGP aperture

[    0.284288] Linux agpgart interface v0.103

Should I try vram_pushbuf=1 anyway ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409690671.e5aDA3a1.16090
Date: Tue, 2 Sep 2014 20:44:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:linasvepstas&#64;gmail.com" title="Linas Vepstas &lt;linasvepstas&#64;gmail.com&gt;"> <span class="fn">Linas Vepstas</span></a>
</span></b>
        <pre>I don't think I have AGP .. trying to figure this out.  The north/southbridge
is NVIDIA Corporation MCP55. 

Here is the PCIe bridge and the video cards:

lspci -vnn

00:0f.0 PCI bridge [0604]: NVIDIA Corporation MCP55 PCI Express bridge
[10de:0377] (rev a3) (prog-if 00 [Normal decode])
    Flags: bus master, fast devsel, latency 0
    Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
    Memory behind bridge: f7000000-f9ffffff
    Prefetchable memory behind bridge: 00000000e0000000-00000000efffffff
    Capabilities: [40] Subsystem: NVIDIA Corporation Device [10de:0000]
    Capabilities: [48] Power Management version 2
    Capabilities: [50] MSI: Enable+ Count=1/2 Maskable- 64bit+
    Capabilities: [60] HyperTransport: MSI Mapping Enable- Fixed-
    Capabilities: [80] Express Root Port (Slot+), MSI 00
    Capabilities: [100] Virtual Channel
    Kernel driver in use: pcieport

01:06.0 VGA compatible controller [0300]: NVIDIA Corporation NV44A [GeForce
6200] [10de:0221] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: eVga.com. Corp. Device [3842:b402]
    Flags: bus master, 66MHz, medium devsel, latency 32, IRQ 16
    Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (32-bit, prefetchable) [size=512M]
    Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at fc000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Kernel driver in use: nouveau

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G72 [GeForce 7300
LE] [10de:01d1] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device [1028:0405]
    Flags: bus master, fast devsel, latency 0, IRQ 42
    Memory at f7000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f8000000 (64-bit, non-prefetchable) [size=16M]
    Expansion ROM at f9fe0000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Kernel driver in use: nouveau

The only dmesg lines that mention AGP, agp or gart are:

[    0.000000] AGP: No AGP bridge found
[    0.000000] AGP: Node 0: aperture [bus addr 0xb4000000-0xb5ffffff]
(32MB)
[    0.000000] Aperture pointing to e820 RAM. Ignoring.
[    0.000000] AGP: Your BIOS doesn't leave a aperture memory hole
[    0.000000] AGP: Please enable the IOMMU option in the BIOS setup
[    0.000000] AGP: This costs you 64MB of RAM
[    0.000000] AGP: Mapping aperture over RAM [mem 0xb4000000-0xb7ffffff]
(65536KB)

[    0.256789] pci 0000:02:00.0: Boot video device
[    0.256791] PCI: CLS 32 bytes, default 64
[    0.256980] PCI-DMA: Disabling AGP.
[    0.257075] PCI-DMA: aperture base &#64; b4000000 size 65536 KB
[    0.257079] PCI-DMA: using GART IOMMU.
[    0.257083] PCI-DMA: Reserving 64MB of IOMMU area in the AGP aperture

[    0.284288] Linux agpgart interface v0.103

Should I try vram_pushbuf=1 anyway ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409690671.e5aDA3a1.16090--

--===============0553982210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0553982210==--
