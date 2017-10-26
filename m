From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103467] New: [NVC0/GF108] fifo: read fault at
 cd90f4d000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00
 [PT_NOT_PRESENT] on channel 1 [003fe11000 DRM]
Date: Thu, 26 Oct 2017 14:36:54 +0000
Message-ID: <bug-103467-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0992310138=="
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


--===============0992310138==
Content-Type: multipart/alternative; boundary="15090286140.B15fa.23354";
 charset="UTF-8"


--15090286140.B15fa.23354
Date: Thu, 26 Oct 2017 14:36:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103467

            Bug ID: 103467
           Summary: [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07
                    [PFIFO] client 07 [BAR_READ] reason 00
                    [PT_NOT_PRESENT] on channel 1 [003fe11000 DRM]
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: PowerPC
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: erhard_f-cl+VPiYnx/1AfugRpC6u6w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135065
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135065&action=3Dedit
dmesg output

In my PowerMac G5 11,2 I am running a Geforce 6600 MAC Edition (which works=
),
and added a GeForce GT 430 as a 2nd card. It seems this card does not get
initialized properly:

[...]
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00004000 [=
] ch
1 [003fe11000 DRM] subc 0 mthd 0000 data 44dc3569
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00204000
[ILLEGAL_MTHD] ch 1 [003fe11000 DRM] subc 0 mthd 0004 data 39e65d54
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00204000
[ILLEGAL_MTHD] ch 1 [003fe11000 DRM] subc 0 mthd 000c data 2bd98280
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00004000 [=
] ch
1 [003fe11000 DRM] subc 0 mthd 0018 data e384a768
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00004000 [=
] ch
1 [003fe11000 DRM] subc 0 mthd 001c data 8e86bf68
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: read fault at
cd90f4d000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT=
] on
channel 1 [003fe11000 DRM]
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: fifo engine fault =
on
channel 1, recovering...
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: DRM: channel 1 killed!

# lspci -vv -s 0001:06:00.0
0001:06:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT
430] (rev a1) (prog-if 00 [VGA controller])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 65
        Region 0: Memory at 81000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at 88000000 (64-bit, prefetchable) [size=3D128M]
        Region 3: Memory at 82000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 0000 [size=3D128]
        Expansion ROM at 80180000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr+ FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <1us, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x8, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LT=
R-,
OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
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
        Kernel driver in use: nouveau
        Kernel modules: nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15090286140.B15fa.23354
Date: Thu, 26 Oct 2017 14:36:54 +0000
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
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467">103467</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PFIFO]=
 client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe11000 D=
RM]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>erhard_f&#64;mailbox.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135065=
" name=3D"attach_135065" title=3D"dmesg output">attachment 135065</a> <a hr=
ef=3D"attachment.cgi?id=3D135065&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

In my PowerMac G5 11,2 I am running a Geforce 6600 MAC Edition (which works=
),
and added a GeForce GT 430 as a 2nd card. It seems this card does not get
initialized properly:

[...]
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00004000 [=
] ch
1 [003fe11000 DRM] subc 0 mthd 0000 data 44dc3569
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00204000
[ILLEGAL_MTHD] ch 1 [003fe11000 DRM] subc 0 mthd 0004 data 39e65d54
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00204000
[ILLEGAL_MTHD] ch 1 [003fe11000 DRM] subc 0 mthd 000c data 2bd98280
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00004000 [=
] ch
1 [003fe11000 DRM] subc 0 mthd 0018 data e384a768
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: PBDMA0: 00004000 [=
] ch
1 [003fe11000 DRM] subc 0 mthd 001c data 8e86bf68
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: read fault at
cd90f4d000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT=
] on
channel 1 [003fe11000 DRM]
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: fifo: fifo engine fault =
on
channel 1, recovering...
Okt 26 15:46:33 T801 kernel: nouveau 0001:06:00.0: DRM: channel 1 killed!

# lspci -vv -s 0001:06:00.0
0001:06:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT
430] (rev a1) (prog-if 00 [VGA controller])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 65
        Region 0: Memory at 81000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at 88000000 (64-bit, prefetchable) [size=3D128M]
        Region 3: Memory at 82000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 0000 [size=3D128]
        Expansion ROM at 80180000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 0.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr+ FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s &lt;1us, L1 &lt;4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x8, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LT=
R-,
OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
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
        Kernel driver in use: nouveau
        Kernel modules: nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15090286140.B15fa.23354--

--===============0992310138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0992310138==--
