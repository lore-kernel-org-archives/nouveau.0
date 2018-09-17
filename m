From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107959] New: System hangs up when loading nouveau
 for NVIDIA MX150 card
Date: Mon, 17 Sep 2018 08:26:25 +0000
Message-ID: <bug-107959-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0996158627=="
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


--===============0996158627==
Content-Type: multipart/alternative; boundary="15371727851.AFFA1d1C.15062"
Content-Transfer-Encoding: 7bit


--15371727851.AFFA1d1C.15062
Date: Mon, 17 Sep 2018 08:26:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107959

            Bug ID: 107959
           Summary: System hangs up when loading nouveau for NVIDIA MX150
                    card
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jian-hong-6IF/jdPJHihWk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141593
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141593&action=3Dedit
dmesg log

We have an Acer Aspire Z24-890 desktop equipped with Intel i3-8100T CPU and
NVIDIA GeForce MX150 card.

01:00.0 3D controller [0302]: NVIDIA Corporation GP108M [GeForce MX150]
[10de:1d10] (rev a1)
        Subsystem: Acer Incorporated [ALI] GP108M [GeForce MX150] [1025:130=
8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 255
        Region 0: Memory at a3000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at 90000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at a0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 4000 [disabled] [size=3D128]
        Expansion ROM at a4000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <1us, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLAct=
ive-
BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR+, O=
BFF
Via message
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
+,
OBFF Disabled
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
                        Status: NegoPending- InProgress-
        Capabilities: [250 v1] Latency Tolerance Reporting
                Max snoop latency: 71680ns
                Max no snoop latency: 71680ns
        Capabilities: [258 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
                          PortCommonModeRestoreTime=3D255us PortTPowerOnTim=
e=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
                L1SubCtl2: T_PwrOn=3D10us
        Capabilities: [128 v1] Power Budgeting <?>
        Capabilities: [420 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatal=
Err-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatal=
Err+
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- Ch=
kEn-
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 <?>
        Capabilities: [900 v1] #19
        Kernel modules: nouveau

I tested with Linux kernel 4.19-rc4 and used nouveau with parameters runpm=
=3D0
and noaccel=3D1

I get into multi-user.target first, then modprobe nouveau manually.
I get these messages in dmesg, then system hangs up.

[  119.569015] MXM: GUID detected in BIOS
[  119.572640] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20180810/nsarguments-66)
[  119.576334] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20180810/nsarguments-66)
[  119.579229] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[  119.581675] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  119.583603] nouveau: detected PR support, will not use DSM
[  119.585487] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[  119.587467] nouveau 0000:01:00.0: NVIDIA GP108 (138000a1)
[  120.586407] nouveau 0000:01:00.0: bios: version 86.08.1e.00.06
[  120.768431] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5

I cannot get into desktop environment until I set nouveau.modeset=3D0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15371727851.AFFA1d1C.15062
Date: Mon, 17 Sep 2018 08:26:25 +0000
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
   title=3D"NEW - System hangs up when loading nouveau for NVIDIA MX150 car=
d"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107959">107959</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System hangs up when loading nouveau for NVIDIA MX150 card
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
          <td>jian-hong&#64;endlessm.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141593=
" name=3D"attach_141593" title=3D"dmesg log">attachment 141593</a> <a href=
=3D"attachment.cgi?id=3D141593&amp;action=3Dedit" title=3D"dmesg log">[deta=
ils]</a></span>
dmesg log

We have an Acer Aspire Z24-890 desktop equipped with Intel i3-8100T CPU and
NVIDIA GeForce MX150 card.

01:00.0 3D controller [0302]: NVIDIA Corporation GP108M [GeForce MX150]
[10de:1d10] (rev a1)
        Subsystem: Acer Incorporated [ALI] GP108M [GeForce MX150] [1025:130=
8]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 255
        Region 0: Memory at a3000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at 90000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at a0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 4000 [disabled] [size=3D128]
        Expansion ROM at a4000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s &lt;1us, L1 &lt;4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLAct=
ive-
BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR+, O=
BFF
Via message
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
+,
OBFF Disabled
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTra=
ns-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
                        Status: NegoPending- InProgress-
        Capabilities: [250 v1] Latency Tolerance Reporting
                Max snoop latency: 71680ns
                Max no snoop latency: 71680ns
        Capabilities: [258 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
                          PortCommonModeRestoreTime=3D255us PortTPowerOnTim=
e=3D10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
                L1SubCtl2: T_PwrOn=3D10us
        Capabilities: [128 v1] Power Budgeting &lt;?&gt;
        Capabilities: [420 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatal=
Err-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatal=
Err+
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- Ch=
kEn-
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 &lt;?&gt;
        Capabilities: [900 v1] #19
        Kernel modules: nouveau

I tested with Linux kernel 4.19-rc4 and used nouveau with parameters runpm=
=3D0
and noaccel=3D1

I get into multi-user.target first, then modprobe nouveau manually.
I get these messages in dmesg, then system hangs up.

[  119.569015] MXM: GUID detected in BIOS
[  119.572640] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20180810/nsarguments-66)
[  119.576334] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20180810/nsarguments-66)
[  119.579229] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[  119.581675] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  119.583603] nouveau: detected PR support, will not use DSM
[  119.585487] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[  119.587467] nouveau 0000:01:00.0: NVIDIA GP108 (138000a1)
[  120.586407] nouveau 0000:01:00.0: bios: version 86.08.1e.00.06
[  120.768431] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5

I cannot get into desktop environment until I set nouveau.modeset=3D0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15371727851.AFFA1d1C.15062--

--===============0996158627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0996158627==--
