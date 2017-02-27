From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99841] Switching to VT freezes X only on a dual
	screen
Date: Mon, 27 Feb 2017 14:27:49 +0000
Message-ID: <bug-99841-8800-cBKnRrrEZD@http.bugs.freedesktop.org/>
References: <bug-99841-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0781618972=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99841-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0781618972==
Content-Type: multipart/alternative; boundary="14882056691.cE3aa7e1B.32098";
 charset="UTF-8"


--14882056691.cE3aa7e1B.32098
Date: Mon, 27 Feb 2017 14:27:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99841

--- Comment #7 from Joseph Thommes <joseph-thommes-Mmb7MZpHnFY@public.gmane.org> ---
I can confirm what kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org said, same for me with 4.10.1-gen=
too.
I am using a triple monitor setup with different monitors in different
resolutions and everything is fine in X.
If I press Ctrl-Alt-F1, the screens do not change but I can login in tty1.
If I kill X from there, screens turn off and a press of Ctrl-Alt-F1 brings =
me
to tty1.
If I restart X  from there, it's the same as in the beginning.
lspci -vv:
[...]
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 77=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Palit Microsystems Inc. GK104 [GeForce GTX 770]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Region 0: Memory at ee000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D128M]
        Region 3: Memory at e8000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at ef000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000feeff00c  Data: 4191
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest+
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
        Capabilities: [900 v1] #19
        Kernel driver in use: nouveau
[...]

uname -a:
Linux gentoo-PC 4.10.1-gentoo #2 SMP Mon Feb 27 13:38:23 CET 2017 x86_64
Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz GenuineIntel GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14882056691.cE3aa7e1B.32098
Date: Mon, 27 Feb 2017 14:27:49 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Switching to VT freezes X only on a dual screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99841#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Switching to VT freezes X only on a dual screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99841">bug 99841<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joseph-thommes&#64;gmx.de" title=3D"Joseph Thommes &lt;joseph-thommes&#64;g=
mx.de&gt;"> <span class=3D"fn">Joseph Thommes</span></a>
</span></b>
        <pre>I can confirm what <a href=3D"mailto:kevin&#64;potatofrom.spac=
e">kevin&#64;potatofrom.space</a> said, same for me with 4.10.1-gentoo.
I am using a triple monitor setup with different monitors in different
resolutions and everything is fine in X.
If I press Ctrl-Alt-F1, the screens do not change but I can login in tty1.
If I kill X from there, screens turn off and a press of Ctrl-Alt-F1 brings =
me
to tty1.
If I restart X  from there, it's the same as in the beginning.
lspci -vv:
[...]
01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 77=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Palit Microsystems Inc. GK104 [GeForce GTX 770]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        Region 0: Memory at ee000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D128M]
        Region 3: Memory at e8000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at e000 [size=3D128]
        Expansion ROM at ef000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000feeff00c  Data: 4191
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s &lt;512ns, L1 &lt;4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDi=
s-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest+
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
        Capabilities: [900 v1] #19
        Kernel driver in use: nouveau
[...]

uname -a:
Linux gentoo-PC 4.10.1-gentoo #2 SMP Mon Feb 27 13:38:23 CET 2017 x86_64
Intel(R) Core(TM) i7-4790 CPU &#64; 3.60GHz GenuineIntel GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14882056691.cE3aa7e1B.32098--

--===============0781618972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0781618972==--
