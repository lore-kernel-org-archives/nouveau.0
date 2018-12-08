From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] New: GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Sat, 08 Dec 2018 14:49:13 +0000
Message-ID: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0352703529=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0352703529==
Content-Type: multipart/alternative; boundary="15442805531.b0Bd1fFB.3050"
Content-Transfer-Encoding: 7bit


--15442805531.b0Bd1fFB.3050
Date: Sat, 8 Dec 2018 14:49:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

            Bug ID: 108980
           Summary: GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Kernel 4.10 and next, till the last:

# dmesg | grep nouveau
[   15.161745] nouveau: detected PR support, will not use DSM
[   15.163013] nouveau 0000:08:00.0: enabling device (0006 -> 0007)
[   15.164408] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.186628] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.271378] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.289248] nouveau 0000:08:00.0: volt: couldn't find speedo value, volt=
ing
not possible
[   15.289262] nouveau 0000:08:00.0: bus: MMIO write of 0000001f FAULT at
6013d4 [ IBUS ]
[   15.935388] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   15.936749] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   15.938436] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   15.939583] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   15.942999] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   15.944156] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1

Before kernel 4.10.x
(in this example 4.9.140):

# dmesg | grep nouveau
[   15.755065] nouveau: detected PR support, will not use DSM
[   15.756863] nouveau 0000:08:00.0: enabling device (0006 -> 0007)
[   15.758852] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.785141] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.868828] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   16.510223] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   16.510227] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   16.510232] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   16.510236] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   16.510240] nouveau 0000:08:00.0: DRM: Pointer to flat panel table inval=
id
[   16.640514] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   16.640527] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1
[   22.007459] nouveau 0000:08:00.0: DRM: evicting buffers...
[   22.008617] nouveau 0000:08:00.0: DRM: waiting for kernel channels to go
idle...
[   22.009842] nouveau 0000:08:00.0: DRM: suspending client object trees...
[   22.011334] nouveau 0000:08:00.0: DRM: suspending kernel object tree...

Hardware:

Dell Inspiron 3542 (0652).

# lspci -vvv
08:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/810M/82=
0M /
GT 620M/625M/630M/720M] (rev a1)
        Subsystem: Dell GeForce 820M
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 49
        Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at d000 [size=3D128]
        Expansion ROM at f7000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee003b8  Data: 0000
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 25.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x8, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Not Supported
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                         AtomicOpsCtl: ReqEn-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- Speed=
Dis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting <?>
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

Distribution: Fedora, Gentoo

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15442805531.b0Bd1fFB.3050
Date: Sat, 8 Dec 2018 14:49:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">108980</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>adamos&#64;hell.factory.net.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Kernel 4.10 and next, till the last:

# dmesg | grep nouveau
[   15.161745] nouveau: detected PR support, will not use DSM
[   15.163013] nouveau 0000:08:00.0: enabling device (0006 -&gt; 0007)
[   15.164408] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.186628] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.271378] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.289248] nouveau 0000:08:00.0: volt: couldn't find speedo value, volt=
ing
not possible
[   15.289262] nouveau 0000:08:00.0: bus: MMIO write of 0000001f FAULT at
6013d4 [ IBUS ]
[   15.935388] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   15.936749] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   15.938436] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   15.939583] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   15.942999] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   15.944156] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1

Before kernel 4.10.x
(in this example 4.9.140):

# dmesg | grep nouveau
[   15.755065] nouveau: detected PR support, will not use DSM
[   15.756863] nouveau 0000:08:00.0: enabling device (0006 -&gt; 0007)
[   15.758852] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.785141] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.868828] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   16.510223] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   16.510227] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   16.510232] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   16.510236] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   16.510240] nouveau 0000:08:00.0: DRM: Pointer to flat panel table inval=
id
[   16.640514] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   16.640527] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1
[   22.007459] nouveau 0000:08:00.0: DRM: evicting buffers...
[   22.008617] nouveau 0000:08:00.0: DRM: waiting for kernel channels to go
idle...
[   22.009842] nouveau 0000:08:00.0: DRM: suspending client object trees...
[   22.011334] nouveau 0000:08:00.0: DRM: suspending kernel object tree...

Hardware:

Dell Inspiron 3542 (0652).

# lspci -vvv
08:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/810M/82=
0M /
GT 620M/625M/630M/720M] (rev a1)
        Subsystem: Dell GeForce 820M
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 49
        Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at d000 [size=3D128]
        Expansion ROM at f7000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee003b8  Data: 0000
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 25.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x8, ASPM L0s L1, Exit
Latency L0s &lt;512ns, L1 &lt;4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Not Supported
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                         AtomicOpsCtl: ReqEn-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- Speed=
Dis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [b4] Vendor Specific Information: Len=3D14 &lt;?&gt;
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3D01
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting &lt;?&gt;
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 &lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

Distribution: Fedora, Gentoo</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15442805531.b0Bd1fFB.3050--

--===============0352703529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0352703529==--
