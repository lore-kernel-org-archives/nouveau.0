From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66696] New: Nouveau does DMA to/from unexpected
	address
Date: Mon, 08 Jul 2013 13:12:01 +0000
Message-ID: <bug-66696-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284063157=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1284063157==
Content-Type: multipart/alternative; boundary="1373289121.28AB1.30023"; charset="us-ascii"


--1373289121.28AB1.30023
Date: Mon, 8 Jul 2013 13:12:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66696

          Priority: medium
            Bug ID: 66696
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau does DMA to/from unexpected address
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: stijn+bugs-VfPWfsRibaPZj6PxcwrBaQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

It appears that on my GeForce 7600 GS (G73), nouveau is doing DMA to/from
unexpected addresses. This gives a lot of warnings, and eventually a system
freeze. This is similar to https://bugs.freedesktop.org/show_bug.cgi?id=27063 /
https://bugzilla.redhat.com/show_bug.cgi?id=561267. This was fixed for nv50 in
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4eb3033c72099fab3536ed8ac54a5dc99f0832d7
but with the G73 I am seeing this problem in a 3.10 kernel.

[    1.499379] [drm] Initialized drm 1.1.0 20060810
[    1.504059] MXM: GUID detected in BIOS
[    1.508111] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x04b200a2
[    1.514207] nouveau  [  DEVICE][0000:01:00.0] Chipset: G73 (NV4B)
[    1.520301] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[    1.527097] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.575254] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.581696] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.588216] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.594305] nouveau  [   VBIOS][0000:01:00.0] version 05.73.22.16.02
[    1.600858] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    1.606516] nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
[    1.612436] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 379904 tags
[    1.652901] nouveau  [  PTHERM][0000:01:00.0] FAN control: toggle
[    1.658996] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    1.665521] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.691750] [TTM] Zone  kernel: Available graphics memory: 16478742 kiB
[    1.698366] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.704892] [TTM] Initializing pool allocator
[    1.709254] [TTM] Initializing DMA pool allocator
[    1.713964] mtrr: type mismatch for 80000000,10000000 old: write-back new:
write-combining
[    1.722226] nouveau  [     DRM] VRAM: 251 MiB
[    1.726584] nouveau  [     DRM] GART: 512 MiB
[    1.730945] nouveau  [     DRM] TMDS table version 1.1
[    1.736082] nouveau W[     DRM] TMDS table script pointers not stubbed
[    1.742608] nouveau  [     DRM] DCB version 3.0
[    1.747143] nouveau  [     DRM] DCB outp 00: 01000300 00000028
[    1.752974] nouveau  [     DRM] DCB outp 01: 03000302 00000000
[    1.758807] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    1.764641] nouveau  [     DRM] DCB outp 03: 04011312 00c00000
[    1.770471] nouveau  [     DRM] DCB outp 04: 020223f1 0000c080
[    1.776304] nouveau  [     DRM] DCB conn 00: 1030
[    1.781037] nouveau  [     DRM] DCB conn 01: 2130
[    1.785765] nouveau  [     DRM] DCB conn 02: 0210
[    1.790492] nouveau  [     DRM] DCB conn 03: 0211
[    1.795224] nouveau  [     DRM] DCB conn 04: 0213
[    1.801402] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    1.808018] [drm] No driver support for vblank timestamp query.
[    1.813978] nouveau  [     DRM] 0xD1A1: Parsing digital output script table
[    1.870947] nouveau  [     DRM] 0xD1F1: Parsing digital output script table
[    1.928298] nouveau  [     DRM] 1 available performance level(s)
[    1.934308] nouveau  [     DRM] 0: core 400MHz shader 400MHz memory 400MHz
voltage 1050mV fanspeed 100%
[    1.943694] nouveau  [     DRM] c: core 400MHz shader 400MHz memory 405MHz
fanspeed 100%
[    1.955321] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.961340] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 4)
[    2.060713] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo
ffff8808528bf800
[    2.068437] fbcon: nouveaufb (fb0) is primary device
[    2.078765] nouveau  [     DRM] 0xD1A1: Parsing digital output script table
[    2.139034] nouveau  [     DRM] 0xD1F1: Parsing digital output script table
[    2.189610] dmar: DRHD: handling fault status reg 2
[    2.189612] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.189612] DMAR:[fault reason 06] PTE Read access is not set
[    2.190017] dmar: DRHD: handling fault status reg 102
[    2.190019] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.190019] DMAR:[fault reason 06] PTE Read access is not set
[    2.190120] Console: switching to colour frame buffer device 240x75
[    2.190254] dmar: DRHD: handling fault status reg 202
[    2.190255] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.190255] DMAR:[fault reason 06] PTE Read access is not set
[    2.190672] dmar: DRHD: handling fault status reg 302
[    2.190674] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.190674] DMAR:[fault reason 06] PTE Read access is not set
[    2.191081] dmar: DRHD: handling fault status reg 402
[    2.191083] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.191083] DMAR:[fault reason 06] PTE Read access is not set
[    2.203182] dmar: DRHD: handling fault status reg 502
[    2.203184] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.203184] DMAR:[fault reason 06] PTE Read access is not set
[    2.321167] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.327527] nouveau 0000:01:00.0: registered panic notifier
[    2.333109] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0


01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G73 [GeForce 7600
GS] [10de:0392] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. NX7600GS-T2D256EH
[1462:0622]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort+ >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 32
        Region 0: Memory at 91000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at 80000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at 90000000 (64-bit, non-prefetchable) [size=16M]
        Region 5: I/O ports at e000 [size=128]
        Expansion ROM at 92000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <256ns,
L1 <4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency
L0 <256ns, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x8, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting <?>
        Kernel driver in use: nouveau
        Kernel modules: nvidia

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373289121.28AB1.30023
Date: Mon, 8 Jul 2013 13:12:01 +0000
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
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696">66696</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau does DMA to/from unexpected address
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>stijn+bugs&#64;linux-ipv6.be
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>It appears that on my GeForce 7600 GS (G73), nouveau is doing DMA to/from
unexpected addresses. This gives a lot of warnings, and eventually a system
freeze. This is similar to <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau does DMA to/from unexpected address"
   href="show_bug.cgi?id=27063">https://bugs.freedesktop.org/show_bug.cgi?id=27063</a> /
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=561267">https://bugzilla.redhat.com/show_bug.cgi?id=561267</a>. This was fixed for nv50 in
<a href="http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4eb3033c72099fab3536ed8ac54a5dc99f0832d7">http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4eb3033c72099fab3536ed8ac54a5dc99f0832d7</a>
but with the G73 I am seeing this problem in a 3.10 kernel.

[    1.499379] [drm] Initialized drm 1.1.0 20060810
[    1.504059] MXM: GUID detected in BIOS
[    1.508111] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x04b200a2
[    1.514207] nouveau  [  DEVICE][0000:01:00.0] Chipset: G73 (NV4B)
[    1.520301] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[    1.527097] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.575254] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.581696] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.588216] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.594305] nouveau  [   VBIOS][0000:01:00.0] version 05.73.22.16.02
[    1.600858] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    1.606516] nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
[    1.612436] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 379904 tags
[    1.652901] nouveau  [  PTHERM][0000:01:00.0] FAN control: toggle
[    1.658996] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    1.665521] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.691750] [TTM] Zone  kernel: Available graphics memory: 16478742 kiB
[    1.698366] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.704892] [TTM] Initializing pool allocator
[    1.709254] [TTM] Initializing DMA pool allocator
[    1.713964] mtrr: type mismatch for 80000000,10000000 old: write-back new:
write-combining
[    1.722226] nouveau  [     DRM] VRAM: 251 MiB
[    1.726584] nouveau  [     DRM] GART: 512 MiB
[    1.730945] nouveau  [     DRM] TMDS table version 1.1
[    1.736082] nouveau W[     DRM] TMDS table script pointers not stubbed
[    1.742608] nouveau  [     DRM] DCB version 3.0
[    1.747143] nouveau  [     DRM] DCB outp 00: 01000300 00000028
[    1.752974] nouveau  [     DRM] DCB outp 01: 03000302 00000000
[    1.758807] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    1.764641] nouveau  [     DRM] DCB outp 03: 04011312 00c00000
[    1.770471] nouveau  [     DRM] DCB outp 04: 020223f1 0000c080
[    1.776304] nouveau  [     DRM] DCB conn 00: 1030
[    1.781037] nouveau  [     DRM] DCB conn 01: 2130
[    1.785765] nouveau  [     DRM] DCB conn 02: 0210
[    1.790492] nouveau  [     DRM] DCB conn 03: 0211
[    1.795224] nouveau  [     DRM] DCB conn 04: 0213
[    1.801402] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    1.808018] [drm] No driver support for vblank timestamp query.
[    1.813978] nouveau  [     DRM] 0xD1A1: Parsing digital output script table
[    1.870947] nouveau  [     DRM] 0xD1F1: Parsing digital output script table
[    1.928298] nouveau  [     DRM] 1 available performance level(s)
[    1.934308] nouveau  [     DRM] 0: core 400MHz shader 400MHz memory 400MHz
voltage 1050mV fanspeed 100%
[    1.943694] nouveau  [     DRM] c: core 400MHz shader 400MHz memory 405MHz
fanspeed 100%
[    1.955321] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.961340] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 4)
[    2.060713] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo
ffff8808528bf800
[    2.068437] fbcon: nouveaufb (fb0) is primary device
[    2.078765] nouveau  [     DRM] 0xD1A1: Parsing digital output script table
[    2.139034] nouveau  [     DRM] 0xD1F1: Parsing digital output script table
[    2.189610] dmar: DRHD: handling fault status reg 2
[    2.189612] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.189612] DMAR:[fault reason 06] PTE Read access is not set
[    2.190017] dmar: DRHD: handling fault status reg 102
[    2.190019] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.190019] DMAR:[fault reason 06] PTE Read access is not set
[    2.190120] Console: switching to colour frame buffer device 240x75
[    2.190254] dmar: DRHD: handling fault status reg 202
[    2.190255] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.190255] DMAR:[fault reason 06] PTE Read access is not set
[    2.190672] dmar: DRHD: handling fault status reg 302
[    2.190674] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.190674] DMAR:[fault reason 06] PTE Read access is not set
[    2.191081] dmar: DRHD: handling fault status reg 402
[    2.191083] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.191083] DMAR:[fault reason 06] PTE Read access is not set
[    2.203182] dmar: DRHD: handling fault status reg 502
[    2.203184] dmar: DMAR:[DMA Read] Request device [01:00.0] fault addr 0
[    2.203184] DMAR:[fault reason 06] PTE Read access is not set
[    2.321167] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.327527] nouveau 0000:01:00.0: registered panic notifier
[    2.333109] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0


01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G73 [GeForce 7600
GS] [10de:0392] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. NX7600GS-T2D256EH
[1462:0622]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort+ &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 32
        Region 0: Memory at 91000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at 80000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at 90000000 (64-bit, non-prefetchable) [size=16M]
        Region 5: I/O ports at e000 [size=128]
        Expansion ROM at 92000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;256ns,
L1 &lt;4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency
L0 &lt;256ns, L1 &lt;4us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x8, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting &lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nvidia</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373289121.28AB1.30023--

--===============1284063157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1284063157==--
