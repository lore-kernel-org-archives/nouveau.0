From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73233] New: [NV43] GeForce 6600 GT nouveau on AMD-Vi
 triggers constant errors: Event logged IO_PAGE_FAULT
Date: Thu, 02 Jan 2014 18:01:26 +0000
Message-ID: <bug-73233-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1190973773=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1190973773==
Content-Type: multipart/alternative; boundary="1388685686.12CA1.3837"; charset="us-ascii"


--1388685686.12CA1.3837
Date: Thu, 2 Jan 2014 18:01:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73233

          Priority: medium
            Bug ID: 73233
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV43] GeForce 6600 GT nouveau on AMD-Vi triggers
                    constant errors: Event logged IO_PAGE_FAULT
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: michele-Vrs1pLNSz9odnm+yROfE0A@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Via https://bugzilla.redhat.com/show_bug.cgi?id=1047637 on this AMD-Vi box
there are constant errors like the following on 3.12.5-302.fc20.x86_64:
[    7.171789] AMD-Vi: Event logged [IO_PAGE_FAULT device=01:00.0 domain=0x0012
address=0x0000000000000000 flags=0x0000]
[    7.171791] AMD-Vi: Event logged [IO_PAGE_FAULT device=01:00.0 domain=0x0012
address=0x0000000000000040 flags=0x0000]

IOMMU related stuff:
[    0.891828] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
[    0.891846] pci 0000:00:00.2: irq 72 for MSI/MSI-X
[    0.899108] AMD-Vi: Lazy IO/TLB flushing enabled
[    0.975349] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.975352] software IO TLB [mem 0xceafd000-0xd2afd000] (64MB) mapped at
[ffff8800ceafd000-ffff8800d2afcfff]

Nouveau related dmesg:
[    3.151771] checking generic (d8000000 300000) vs hw (d8000000 8000000)
[    3.151771] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
[    3.174182] Console: switching to colour dummy device 80x25
[    3.174276] pcieport 0000:00:02.0: driver skip pci_set_master, fix it!
[    3.174472] [drm] hdmi device  not found 1 0 1
[    3.174564] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x043000a4
[    3.174567] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV43 (NV43)
[    3.174569] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[    3.178621] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    3.267873] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    3.267878] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    3.267951] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    3.267955] nouveau  [   VBIOS][0000:01:00.0] version 05.43.02.80.00
[    3.268084] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[    3.268087] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[    3.268089] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 378880 tags
[    3.294544] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    3.294556] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    3.294559] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    3.314625] [TTM] Zone  kernel: Available graphics memory: 8167966 kiB
[    3.314628] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    3.314630] [TTM] Initializing pool allocator
[    3.314634] [TTM] Initializing DMA pool allocator
[    3.314642] nouveau  [     DRM] VRAM: 124 MiB
[    3.314644] nouveau  [     DRM] GART: 512 MiB
[    3.314648] nouveau  [     DRM] TMDS table version 1.1
[    3.314651] nouveau  [     DRM] DCB version 3.0
[    3.314653] nouveau  [     DRM] DCB outp 00: 01000300 00000028
[    3.314656] nouveau  [     DRM] DCB outp 01: 04011312 00000000
[    3.314659] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    3.314661] nouveau  [     DRM] DCB outp 03: 020223f1 0040c080
[    3.314664] nouveau  [     DRM] DCB conn 00: 0000
[    3.314666] nouveau  [     DRM] DCB conn 01: 2130
[    3.314669] nouveau  [     DRM] DCB conn 02: 0210
[    3.314671] nouveau  [     DRM] DCB conn 03: 0211
[    3.314673] nouveau  [     DRM] DCB conn 04: 0213
[    3.316351] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    3.316354] [drm] No driver support for vblank timestamp query.
[    3.316400] nouveau  [     DRM] 0xD625: Parsing digital output script table
[    3.366780] Switched to clocksource tsc
[    3.366795] nouveau  [     DRM] 2 available performance level(s)
[    3.366801] nouveau  [     DRM] 0: core 300MHz shader 300MHz memory 1000MHz
voltage 1300mV fanspeed 100%
[    3.366805] nouveau  [     DRM] 1: core 500MHz shader 500MHz memory 1000MHz
voltage 1400mV fanspeed 100%
[    3.366809] nouveau  [     DRM] c: core 299MHz shader 299MHz memory 598MHz
voltage 1300mV fanspeed 100%
[    3.367495] nouveau  [     DRM] MM: using M2MF for buffer copies
[    3.367501] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    3.485551] nouveau  [     DRM] allocated 1920x1080 fb: 0x9000, bo
ffff88040d20f400
[    3.485610] fbcon: nouveaufb (fb0) is primary device
[    3.505918] nouveau  [     DRM] 0xD625: Parsing digital output script table
[    3.555882] Console: switching to colour frame buffer device 240x67
[    3.557572] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.557573] nouveau 0000:01:00.0: registered panic notifier
[    3.557577] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0

PCI related info to 01:00.0:
01:00.0 0300: 10de:0140 (rev a2) (prog-if 00 [VGA controller])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort+
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 24
    Region 0: Memory at f0000000 (32-bit, non-prefetchable) [size=64M]
    Region 1: Memory at d8000000 (64-bit, prefetchable) [size=128M]
    Region 3: Memory at f4000000 (64-bit, non-prefetchable) [size=16M]
    Expansion ROM at f5000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [78] Express (v1) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1
<4us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency
L0s <256ns, L1 <4us
            ClockPM- Surprise- LLActRep- BwNot-
        LnkCtl:    ASPM Disabled; RCB 128 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
    Capabilities: [100 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=01
            Status:    NegoPending- InProgress-
    Capabilities: [128 v1] Power Budgeting <?>
    Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388685686.12CA1.3837
Date: Thu, 2 Jan 2014 18:01:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] GeForce 6600 GT nouveau on AMD-Vi triggers constant errors: Event logged IO_PAGE_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73233">73233</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV43] GeForce 6600 GT nouveau on AMD-Vi triggers constant errors: Event logged IO_PAGE_FAULT
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>michele&#64;acksyn.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Via <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1047637">https://bugzilla.redhat.com/show_bug.cgi?id=1047637</a> on this AMD-Vi box
there are constant errors like the following on 3.12.5-302.fc20.x86_64:
[    7.171789] AMD-Vi: Event logged [IO_PAGE_FAULT device=01:00.0 domain=0x0012
address=0x0000000000000000 flags=0x0000]
[    7.171791] AMD-Vi: Event logged [IO_PAGE_FAULT device=01:00.0 domain=0x0012
address=0x0000000000000040 flags=0x0000]

IOMMU related stuff:
[    0.891828] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
[    0.891846] pci 0000:00:00.2: irq 72 for MSI/MSI-X
[    0.899108] AMD-Vi: Lazy IO/TLB flushing enabled
[    0.975349] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.975352] software IO TLB [mem 0xceafd000-0xd2afd000] (64MB) mapped at
[ffff8800ceafd000-ffff8800d2afcfff]

Nouveau related dmesg:
[    3.151771] checking generic (d8000000 300000) vs hw (d8000000 8000000)
[    3.151771] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
[    3.174182] Console: switching to colour dummy device 80x25
[    3.174276] pcieport 0000:00:02.0: driver skip pci_set_master, fix it!
[    3.174472] [drm] hdmi device  not found 1 0 1
[    3.174564] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x043000a4
[    3.174567] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV43 (NV43)
[    3.174569] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[    3.178621] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    3.267873] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    3.267878] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    3.267951] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    3.267955] nouveau  [   VBIOS][0000:01:00.0] version 05.43.02.80.00
[    3.268084] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR3
[    3.268087] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[    3.268089] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 378880 tags
[    3.294544] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    3.294556] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    3.294559] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    3.314625] [TTM] Zone  kernel: Available graphics memory: 8167966 kiB
[    3.314628] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    3.314630] [TTM] Initializing pool allocator
[    3.314634] [TTM] Initializing DMA pool allocator
[    3.314642] nouveau  [     DRM] VRAM: 124 MiB
[    3.314644] nouveau  [     DRM] GART: 512 MiB
[    3.314648] nouveau  [     DRM] TMDS table version 1.1
[    3.314651] nouveau  [     DRM] DCB version 3.0
[    3.314653] nouveau  [     DRM] DCB outp 00: 01000300 00000028
[    3.314656] nouveau  [     DRM] DCB outp 01: 04011312 00000000
[    3.314659] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    3.314661] nouveau  [     DRM] DCB outp 03: 020223f1 0040c080
[    3.314664] nouveau  [     DRM] DCB conn 00: 0000
[    3.314666] nouveau  [     DRM] DCB conn 01: 2130
[    3.314669] nouveau  [     DRM] DCB conn 02: 0210
[    3.314671] nouveau  [     DRM] DCB conn 03: 0211
[    3.314673] nouveau  [     DRM] DCB conn 04: 0213
[    3.316351] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    3.316354] [drm] No driver support for vblank timestamp query.
[    3.316400] nouveau  [     DRM] 0xD625: Parsing digital output script table
[    3.366780] Switched to clocksource tsc
[    3.366795] nouveau  [     DRM] 2 available performance level(s)
[    3.366801] nouveau  [     DRM] 0: core 300MHz shader 300MHz memory 1000MHz
voltage 1300mV fanspeed 100%
[    3.366805] nouveau  [     DRM] 1: core 500MHz shader 500MHz memory 1000MHz
voltage 1400mV fanspeed 100%
[    3.366809] nouveau  [     DRM] c: core 299MHz shader 299MHz memory 598MHz
voltage 1300mV fanspeed 100%
[    3.367495] nouveau  [     DRM] MM: using M2MF for buffer copies
[    3.367501] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    3.485551] nouveau  [     DRM] allocated 1920x1080 fb: 0x9000, bo
ffff88040d20f400
[    3.485610] fbcon: nouveaufb (fb0) is primary device
[    3.505918] nouveau  [     DRM] 0xD625: Parsing digital output script table
[    3.555882] Console: switching to colour frame buffer device 240x67
[    3.557572] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.557573] nouveau 0000:01:00.0: registered panic notifier
[    3.557577] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0

PCI related info to 01:00.0:
01:00.0 0300: 10de:0140 (rev a2) (prog-if 00 [VGA controller])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort+
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 24
    Region 0: Memory at f0000000 (32-bit, non-prefetchable) [size=64M]
    Region 1: Memory at d8000000 (64-bit, prefetchable) [size=128M]
    Region 3: Memory at f4000000 (64-bit, non-prefetchable) [size=16M]
    Expansion ROM at f5000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [78] Express (v1) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;512ns, L1
&lt;4us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency
L0s &lt;256ns, L1 &lt;4us
            ClockPM- Surprise- LLActRep- BwNot-
        LnkCtl:    ASPM Disabled; RCB 128 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
    Capabilities: [100 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=01
            Status:    NegoPending- InProgress-
    Capabilities: [128 v1] Power Budgeting &lt;?&gt;
    Kernel driver in use: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388685686.12CA1.3837--

--===============1190973773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1190973773==--
