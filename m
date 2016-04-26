From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Tue, 26 Apr 2016 10:56:19 +0000
Message-ID: <bug-89558-8800-H7zSBYRKFj@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1627892690=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1627892690==
Content-Type: multipart/alternative; boundary="14616681793.173e3.17987";
 charset="UTF-8"


--14616681793.173e3.17987
Date: Tue, 26 Apr 2016 10:56:19 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #49 from asad78611-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org ---
Not sure if correct bug bu
lspci:
07:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 840M] (rev a2)
    Subsystem: Hewlett-Packard Company Device 21a0
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at b5000000 (32-bit, non-prefetchable) [size=16M]
    Memory at a0000000 (64-bit, prefetchable) [size=256M]
    Memory at b0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 5000 [size=128]
    Expansion ROM at <ignored> [disabled]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [250] Latency Tolerance Reporting
    Capabilities: [258] L1 PM Substates
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Capabilities: [900] #19
    Kernel modules: nouveau

using rawhide, with nouveau skeggsb:master

insmod nouveau.ko runpm=0
sleep 10
rmmod nouveau.ko

dmesg:
[  154.072779] nouveau: module verification failed: signature and/or required
key missing - tainting kernel
[  154.186565] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.186825] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.187853] i915 0000:00:02.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[  154.187972] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.188213] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.189673] pci 0000:07:00.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[  154.189681] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP
handle
[  154.189777] nouveau 0000:07:00.0: enabling device (0006 -> 0007)
[  154.190144] nouveau 0000:07:00.0: NVIDIA GM108 (118010a2)
[  154.209966] nouveau 0000:07:00.0: bios: version 82.08.14.00.0e
[  154.301465] nouveau 0000:07:00.0: priv: HUB0: 6013d4 00005723 (1d408200)
[  154.301583] nouveau 0000:07:00.0: fb: 2048 MiB DDR3
[  154.301920] nouveau 0000:07:00.0: priv: HUB0: 10ecc0 ffffffff (1d40822c)
[  154.339347] vga_switcheroo: enabled
[  154.341211] [TTM] Zone  kernel: Available graphics memory: 4036698 kiB
[  154.341213] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  154.341215] [TTM] Initializing pool allocator
[  154.341267] [TTM] Initializing DMA pool allocator
[  154.341487] nouveau 0000:07:00.0: DRM: VRAM: 2048 MiB
[  154.341490] nouveau 0000:07:00.0: DRM: GART: 1048576 MiB
[  154.341493] nouveau 0000:07:00.0: DRM: Pointer to TMDS table invalid
[  154.341495] nouveau 0000:07:00.0: DRM: DCB version 4.0
[  154.341497] nouveau 0000:07:00.0: DRM: Pointer to flat panel table invalid
[  154.403182] nouveau 0000:07:00.0: fifo: write fault at 0000102000 engine 05
[BAR2] client 08 [HOST_CPU_NB] reason 02 [PTE] on channel -1 [007fd76000
unknown]
[  154.466319] nouveau 0000:07:00.0: fifo: read fault at 0000100000 engine 04
[BAR1] client 07 [HOST_CPU] reason 00 [PDE] on channel -1 [007fd5d000 unknown]
[  154.466333] nouveau 0000:07:00.0: fifo: PBDMA1: 80060000 [PBPTR PBENTRY
SIGNATURE] ch 0 [007fb84000 DRM] subc 0 mthd 0000 data 00000000
[  154.466439] nouveau 0000:07:00.0: fifo: PBDMA1: 00820000 [PBPTR DEVICE] ch 0
[007fb84000 DRM] subc 7 mthd 3bec data 03000302
[  154.466458] nouveau 0000:07:00.0: fifo: read fault at fffebf5000 engine 0b
[HOST4] client 06 [HOST] reason 03 [VA_LIMIT_VIOLATION] on channel 0
[007fb84000 DRM]
[  154.492673] nouveau 0000:07:00.0: fifo: PBDMA0: 80020000 [PBPTR SIGNATURE]
ch 0 [007fb84000 DRM] subc 7 mthd 3ffc data ffffdfff
[  154.492695] nouveau 0000:07:00.0: fifo: read fault at 0000100000 engine 04
[BAR1] client 07 [HOST_CPU] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  154.492705] nouveau 0000:07:00.0: fifo: PBDMA0: 00020000 [PBPTR] ch 0
[007fb84000 DRM] subc 0 mthd 0000 data 00000000
[  154.492720] nouveau 0000:07:00.0: fifo: read fault at fffebf5000 engine 07
[HOST0] client 06 [HOST] reason 03 [VA_LIMIT_VIOLATION] on channel 0
[007fb84000 DRM]
[  154.492966] nouveau 0000:07:00.0: DRM: MM: using COPY for buffer copies
[  154.492977] [drm] Initialized nouveau 1.3.1 20120801 for 0000:07:00.0 on
minor 1
[  154.492984] nouveau 0000:07:00.0: fifo: write fault at 0000000000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.555908] nouveau 0000:07:00.0: fifo: write fault at 0000000000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.556029] nouveau 0000:07:00.0: fifo: read fault at 0000100000 engine 04
[BAR1] client 07 [HOST_CPU] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.556068] nouveau 0000:07:00.0: fifo: write fault at 0000100000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.572192] nouveau 0000:07:00.0: fifo: write fault at 0000000000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.572210] nouveau 0000:07:00.0: fifo: DROPPED_MMU_FAULT 00000000
[  164.591364] [TTM] Finalizing pool allocator
[  164.591643] [TTM] Finalizing DMA pool allocator
[  164.593527] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[  164.593545] [TTM] Zone   dma32: Used memory at exit: 0 kiB
[  164.593570] vga_switcheroo: disabled
[  164.605845] [drm] Module unloaded
[  165.290184] irq 17: nobody cared (try booting with the "irqpoll" option)
[  165.290190] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           OE  
4.6.0-0.rc4.git3.1.fc25.x86_64 #1
[  165.290192] Hardware name: Hewlett-Packard HP ENVY TS 15 Notebook PC/1967,
BIOS F.66 09/22/2015
[  165.290194]  0000000000000086 41e7614639a7b651 ffff880255e03e38
ffffffff81459d15
[  165.290197]  ffff8802524eee00 ffff8802524eeea0 ffff880255e03e68
ffffffff8112b185
[  165.290200]  ffff8802524eee00 0000000000000000 0000000000000011
ffffffff81fb6980
[  165.290202] Call Trace:
[  165.290204]  <IRQ>  [<ffffffff81459d15>] dump_stack+0x86/0xc1
[  165.290212]  [<ffffffff8112b185>] __report_bad_irq+0x35/0xc0
[  165.290214]  [<ffffffff8112b504>] note_interrupt+0x234/0x270
[  165.290216]  [<ffffffff811285b3>] handle_irq_event_percpu+0x243/0x370
[  165.290218]  [<ffffffff81128719>] handle_irq_event+0x39/0x60
[  165.290220]  [<ffffffff8112bbaf>] handle_fasteoi_irq+0x8f/0x160
[  165.290223]  [<ffffffff81038526>] handle_irq+0x76/0x130
[  165.290226]  [<ffffffff818d0601>] do_IRQ+0x61/0x120
[  165.290229]  [<ffffffff818ce3d6>] common_interrupt+0x96/0x96
[  165.290230]  <EOI>  [<ffffffff817270ca>] ? cpuidle_enter_state+0x11a/0x370
[  165.290235]  [<ffffffff817270c3>] ? cpuidle_enter_state+0x113/0x370
[  165.290237]  [<ffffffff81727357>] cpuidle_enter+0x17/0x20
[  165.290240]  [<ffffffff8110503a>] call_cpuidle+0x2a/0x50
[  165.290242]  [<ffffffff81105489>] cpu_startup_entry+0x2f9/0x420
[  165.290244]  [<ffffffff8105af93>] start_secondary+0x173/0x1b0
[  165.290246] handlers:
[  165.290248] [<ffffffff81663fc0>] usb_hcd_irq
[  165.290250] Disabling IRQ #17

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14616681793.173e3.17987
Date: Tue, 26 Apr 2016 10:56:19 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:asad78611&#64;googlemail.com" title="asad78611&#64;googlemail.com">asad78611&#64;googlemail.com</a>
</span></b>
        <pre>Not sure if correct bug bu
lspci:
07:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 840M] (rev a2)
    Subsystem: Hewlett-Packard Company Device 21a0
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at b5000000 (32-bit, non-prefetchable) [size=16M]
    Memory at a0000000 (64-bit, prefetchable) [size=256M]
    Memory at b0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 5000 [size=128]
    Expansion ROM at &lt;ignored&gt; [disabled]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [250] Latency Tolerance Reporting
    Capabilities: [258] L1 PM Substates
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Capabilities: [900] #19
    Kernel modules: nouveau

using rawhide, with nouveau skeggsb:master

insmod nouveau.ko runpm=0
sleep 10
rmmod nouveau.ko

dmesg:
[  154.072779] nouveau: module verification failed: signature and/or required
key missing - tainting kernel
[  154.186565] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.186825] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch -
Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.187853] i915 0000:00:02.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[  154.187972] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.188213] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160108/nsarguments-95)
[  154.189673] pci 0000:07:00.0: optimus capabilities: enabled, status dynamic
power, hda bios codec supported
[  154.189681] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP
handle
[  154.189777] nouveau 0000:07:00.0: enabling device (0006 -&gt; 0007)
[  154.190144] nouveau 0000:07:00.0: NVIDIA GM108 (118010a2)
[  154.209966] nouveau 0000:07:00.0: bios: version 82.08.14.00.0e
[  154.301465] nouveau 0000:07:00.0: priv: HUB0: 6013d4 00005723 (1d408200)
[  154.301583] nouveau 0000:07:00.0: fb: 2048 MiB DDR3
[  154.301920] nouveau 0000:07:00.0: priv: HUB0: 10ecc0 ffffffff (1d40822c)
[  154.339347] vga_switcheroo: enabled
[  154.341211] [TTM] Zone  kernel: Available graphics memory: 4036698 kiB
[  154.341213] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  154.341215] [TTM] Initializing pool allocator
[  154.341267] [TTM] Initializing DMA pool allocator
[  154.341487] nouveau 0000:07:00.0: DRM: VRAM: 2048 MiB
[  154.341490] nouveau 0000:07:00.0: DRM: GART: 1048576 MiB
[  154.341493] nouveau 0000:07:00.0: DRM: Pointer to TMDS table invalid
[  154.341495] nouveau 0000:07:00.0: DRM: DCB version 4.0
[  154.341497] nouveau 0000:07:00.0: DRM: Pointer to flat panel table invalid
[  154.403182] nouveau 0000:07:00.0: fifo: write fault at 0000102000 engine 05
[BAR2] client 08 [HOST_CPU_NB] reason 02 [PTE] on channel -1 [007fd76000
unknown]
[  154.466319] nouveau 0000:07:00.0: fifo: read fault at 0000100000 engine 04
[BAR1] client 07 [HOST_CPU] reason 00 [PDE] on channel -1 [007fd5d000 unknown]
[  154.466333] nouveau 0000:07:00.0: fifo: PBDMA1: 80060000 [PBPTR PBENTRY
SIGNATURE] ch 0 [007fb84000 DRM] subc 0 mthd 0000 data 00000000
[  154.466439] nouveau 0000:07:00.0: fifo: PBDMA1: 00820000 [PBPTR DEVICE] ch 0
[007fb84000 DRM] subc 7 mthd 3bec data 03000302
[  154.466458] nouveau 0000:07:00.0: fifo: read fault at fffebf5000 engine 0b
[HOST4] client 06 [HOST] reason 03 [VA_LIMIT_VIOLATION] on channel 0
[007fb84000 DRM]
[  154.492673] nouveau 0000:07:00.0: fifo: PBDMA0: 80020000 [PBPTR SIGNATURE]
ch 0 [007fb84000 DRM] subc 7 mthd 3ffc data ffffdfff
[  154.492695] nouveau 0000:07:00.0: fifo: read fault at 0000100000 engine 04
[BAR1] client 07 [HOST_CPU] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  154.492705] nouveau 0000:07:00.0: fifo: PBDMA0: 00020000 [PBPTR] ch 0
[007fb84000 DRM] subc 0 mthd 0000 data 00000000
[  154.492720] nouveau 0000:07:00.0: fifo: read fault at fffebf5000 engine 07
[HOST0] client 06 [HOST] reason 03 [VA_LIMIT_VIOLATION] on channel 0
[007fb84000 DRM]
[  154.492966] nouveau 0000:07:00.0: DRM: MM: using COPY for buffer copies
[  154.492977] [drm] Initialized nouveau 1.3.1 20120801 for 0000:07:00.0 on
minor 1
[  154.492984] nouveau 0000:07:00.0: fifo: write fault at 0000000000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.555908] nouveau 0000:07:00.0: fifo: write fault at 0000000000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.556029] nouveau 0000:07:00.0: fifo: read fault at 0000100000 engine 04
[BAR1] client 07 [HOST_CPU] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.556068] nouveau 0000:07:00.0: fifo: write fault at 0000100000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.572192] nouveau 0000:07:00.0: fifo: write fault at 0000000000 engine 04
[BAR1] client 08 [HOST_CPU_NB] reason 0c [UNSUPPORTED_KIND] on channel -1
[007fd5d000 unknown]
[  164.572210] nouveau 0000:07:00.0: fifo: DROPPED_MMU_FAULT 00000000
[  164.591364] [TTM] Finalizing pool allocator
[  164.591643] [TTM] Finalizing DMA pool allocator
[  164.593527] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[  164.593545] [TTM] Zone   dma32: Used memory at exit: 0 kiB
[  164.593570] vga_switcheroo: disabled
[  164.605845] [drm] Module unloaded
[  165.290184] irq 17: nobody cared (try booting with the &quot;irqpoll&quot; option)
[  165.290190] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           OE  
4.6.0-0.rc4.git3.1.fc25.x86_64 #1
[  165.290192] Hardware name: Hewlett-Packard HP ENVY TS 15 Notebook PC/1967,
BIOS F.66 09/22/2015
[  165.290194]  0000000000000086 41e7614639a7b651 ffff880255e03e38
ffffffff81459d15
[  165.290197]  ffff8802524eee00 ffff8802524eeea0 ffff880255e03e68
ffffffff8112b185
[  165.290200]  ffff8802524eee00 0000000000000000 0000000000000011
ffffffff81fb6980
[  165.290202] Call Trace:
[  165.290204]  &lt;IRQ&gt;  [&lt;ffffffff81459d15&gt;] dump_stack+0x86/0xc1
[  165.290212]  [&lt;ffffffff8112b185&gt;] __report_bad_irq+0x35/0xc0
[  165.290214]  [&lt;ffffffff8112b504&gt;] note_interrupt+0x234/0x270
[  165.290216]  [&lt;ffffffff811285b3&gt;] handle_irq_event_percpu+0x243/0x370
[  165.290218]  [&lt;ffffffff81128719&gt;] handle_irq_event+0x39/0x60
[  165.290220]  [&lt;ffffffff8112bbaf&gt;] handle_fasteoi_irq+0x8f/0x160
[  165.290223]  [&lt;ffffffff81038526&gt;] handle_irq+0x76/0x130
[  165.290226]  [&lt;ffffffff818d0601&gt;] do_IRQ+0x61/0x120
[  165.290229]  [&lt;ffffffff818ce3d6&gt;] common_interrupt+0x96/0x96
[  165.290230]  &lt;EOI&gt;  [&lt;ffffffff817270ca&gt;] ? cpuidle_enter_state+0x11a/0x370
[  165.290235]  [&lt;ffffffff817270c3&gt;] ? cpuidle_enter_state+0x113/0x370
[  165.290237]  [&lt;ffffffff81727357&gt;] cpuidle_enter+0x17/0x20
[  165.290240]  [&lt;ffffffff8110503a&gt;] call_cpuidle+0x2a/0x50
[  165.290242]  [&lt;ffffffff81105489&gt;] cpu_startup_entry+0x2f9/0x420
[  165.290244]  [&lt;ffffffff8105af93&gt;] start_secondary+0x173/0x1b0
[  165.290246] handlers:
[  165.290248] [&lt;ffffffff81663fc0&gt;] usb_hcd_irq
[  165.290250] Disabling IRQ #17</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14616681793.173e3.17987--

--===============1627892690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1627892690==--
