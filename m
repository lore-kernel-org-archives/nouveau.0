From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82834] New: GeForce 8800 GS shows incorrect
 temperature with nouveau
Date: Wed, 20 Aug 2014 03:16:08 +0000
Message-ID: <bug-82834-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0693942729=="
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0693942729==
Content-Type: multipart/alternative; boundary="1408504568.ff41A1c1.19749"; charset="us-ascii"


--1408504568.ff41A1c1.19749
Date: Wed, 20 Aug 2014 03:16:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D82834

          Priority: medium
            Bug ID: 82834
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GeForce 8800 GS shows incorrect temperature  with
                    nouveau
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 104931
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D104931&action=3Dedit
dmesg with nouveau.debug=3Ddebug

If I  try  to  see  how  hot  my  new cards  is I get:

nouveau-pci-0500
Adapter: PCI adapter
temp1:         +0.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +100.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)


This is  using kernel 3.17-rc1 (32-bit), but same  happens  with older  ker=
nels
, both 32 and 64 bit.

lspci -vvn:
05:00.0 0300: 10de:0606 (rev a2) (prog-if 00 [VGA controller])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=3D32M]
        Region 5: I/O ports at 9c00 [size=3D128]
        Expansion ROM at fbfe0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee0300c  Data: 4122
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512=
ns,
L1 <4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Laten=
cy
L0 <512ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDi=
s-,
Selectable De-emphasis: -6dB
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB
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
        Capabilities: [128 v1] Power Budgeting <?>
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 <?>
        Kernel driver in use: nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1408504568.ff41A1c1.19749
Date: Wed, 20 Aug 2014 03:16:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - GeForce 8800 GS shows incorrect temperature with nouv=
eau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82834">82834</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GeForce 8800 GS shows incorrect temperature  with nouveau
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D104931=
" name=3D"attach_104931" title=3D"dmesg with nouveau.debug=3Ddebug">attachm=
ent 104931</a> <a href=3D"attachment.cgi?id=3D104931&amp;action=3Dedit" tit=
le=3D"dmesg with nouveau.debug=3Ddebug">[details]</a></span>
dmesg with nouveau.debug=3Ddebug

If I  try  to  see  how  hot  my  new cards  is I get:

nouveau-pci-0500
Adapter: PCI adapter
temp1:         +0.0=C2=B0C  (high =3D +95.0=C2=B0C, hyst =3D  +3.0=C2=B0C)
                       (crit =3D +100.0=C2=B0C, hyst =3D  +5.0=C2=B0C)
                       (emerg =3D +135.0=C2=B0C, hyst =3D  +5.0=C2=B0C)


This is  using kernel 3.17-rc1 (32-bit), but same  happens  with older  ker=
nels
, both 32 and 64 bit.

lspci -vvn:
05:00.0 0300: 10de:0606 (rev a2) (prog-if 00 [VGA controller])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=3D32M]
        Region 5: I/O ports at 9c00 [size=3D128]
        Expansion ROM at fbfe0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000fee0300c  Data: 4122
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;=
512ns,
L1 &lt;4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Laten=
cy
L0 &lt;512ns, L1 &lt;1us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDi=
s-,
Selectable De-emphasis: -6dB
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB
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
        Capabilities: [128 v1] Power Budgeting &lt;?&gt;
        Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=
=3D1
Len=3D024 &lt;?&gt;
        Kernel driver in use: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408504568.ff41A1c1.19749--

--===============0693942729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0693942729==--
