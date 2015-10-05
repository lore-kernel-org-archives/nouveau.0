From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92299] New: PGRAPH error when using plasmashell (KDE
	v5)
Date: Mon, 05 Oct 2015 20:32:07 +0000
Message-ID: <bug-92299-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1374382703=="
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


--===============1374382703==
Content-Type: multipart/alternative; boundary="1444077127.CBCA50.24231"; charset="UTF-8"


--1444077127.CBCA50.24231
Date: Mon, 5 Oct 2015 20:32:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92299

            Bug ID: 92299
           Summary: PGRAPH error when using plasmashell (KDE v5)
           Product: Mesa
           Version: 11.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: quelque_ri1-Qt13gs6zZMY@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118684
  --> https://bugs.freedesktop.org/attachment.cgi?id=118684&action=edit
dmesg + stacktrace

Hi everyone,


Just in case, I wonder if there is not some kind of connection to this post:
https://bugs.freedesktop.org/show_bug.cgi?id=92213
Also, I am not sure of the version of nouveau, so I give the information I know
for sure there:
I am running Archlinux (Linux 4.2.2), KDE (5.4.4), Qt (5.5.0) on a x86_64
system. mesa is version 11.0.2 and xf86-video-nouveau is version 1.0.11-3.

Also, there is my lspci -vv:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 320M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Acer Incorporated [ALI] Device 036d
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at 3000 [size=128]
        Expansion ROM at b3080000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee0f00c  Data: 4122
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <256ns, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM L0s L1 Enabled; RCB 128 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-,
OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
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
        Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1
Len=024 <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

And I have errors when running the system for too long.
There, you can access the stacktrace (on an Archlinux system). You also have
the dmesg messages. There is a sample of what is displayed:
[251170.682470] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.682485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2008bf05
[251170.682494] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205640
[251170.682501] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.682509] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.682515] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.682531] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.682555] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683469] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683476] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009bc05
[251170.683481] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205641
[251170.683485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683490] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.683493] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683502] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.683513] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564100
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683543] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683555] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009610f
[251170.683560] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205734
[251170.683565] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683570] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x57200000
[251170.683574] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683586] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x15f0 data 0x02000201
[251170.683599] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020573400
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683632] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683644] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x20086805
[251170.683650] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205890
[251170.683656] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683662] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x58900000
[251170.683667] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683680] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x0900 data 0x20000010
[251170.683698] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020589000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT

... and there is more there. Please see the attachment.

I can also add that it makes the plasmashell application hangs for a while,
with 100%CPU usage. After some time, the system is responsive again, with some
glitches in the interface (meaning, some icons disappearing or wrongly
displayed for instance. Once, it made the file explorer dolphin crash). I have
been told that it could be related to a Vsync problem.

It has been identified by a problem with nouveau (I refer you to the comment 4
of the ticket, that gives better understanding of the problem):
https://bugs.kde.org/show_bug.cgi?id=353292#c4

Thank you for your time! And keep the good work going!
Cheers.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444077127.CBCA50.24231
Date: Mon, 5 Oct 2015 20:32:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PGRAPH error when using plasmashell (KDE v5)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92299">92299</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>PGRAPH error when using plasmashell (KDE v5)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>quelque_ri1&#64;yahoo.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118684" name="attach_118684" title="dmesg + stacktrace">attachment 118684</a> <a href="attachment.cgi?id=118684&amp;action=edit" title="dmesg + stacktrace">[details]</a></span>
dmesg + stacktrace

Hi everyone,


Just in case, I wonder if there is not some kind of connection to this post:
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau hangs after resume on kwin present windows"
   href="show_bug.cgi?id=92213">https://bugs.freedesktop.org/show_bug.cgi?id=92213</a>
Also, I am not sure of the version of nouveau, so I give the information I know
for sure there:
I am running Archlinux (Linux 4.2.2), KDE (5.4.4), Qt (5.5.0) on a x86_64
system. mesa is version 11.0.2 and xf86-video-nouveau is version 1.0.11-3.

Also, there is my lspci -vv:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 320M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Acer Incorporated [ALI] Device 036d
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at 3000 [size=128]
        Expansion ROM at b3080000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee0f00c  Data: 4122
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s &lt;256ns, L1 &lt;4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                LnkCtl: ASPM L0s L1 Enabled; RCB 128 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-,
OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
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
        Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1
Len=024 &lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

And I have errors when running the system for too long.
There, you can access the stacktrace (on an Archlinux system). You also have
the dmesg messages. There is a sample of what is displayed:
[251170.682470] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.682485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2008bf05
[251170.682494] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205640
[251170.682501] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.682509] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.682515] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.682531] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.682555] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683469] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683476] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009bc05
[251170.683481] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205641
[251170.683485] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683490] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x56400000
[251170.683493] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683502] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x1b0c data 0x1000f010
[251170.683513] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020564100
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683543] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683555] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x2009610f
[251170.683560] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205734
[251170.683565] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683570] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x57200000
[251170.683574] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683586] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x15f0 data 0x02000201
[251170.683599] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020573400
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[251170.683632] nouveau E[  PGRAPH][0000:01:00.0] magic set 1:
[251170.683644] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e04: 0x20086805
[251170.683650] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e08: 0x00205890
[251170.683656] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e0c: 0x40000432
[251170.683662] nouveau E[  PGRAPH][0000:01:00.0]     0x00408e10: 0x58900000
[251170.683667] nouveau E[  PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP1:  FAULT
[251170.683680] nouveau E[  PGRAPH][0000:01:00.0] ch 9 [0x003f518000
plasmashell[503]] subc 3 class 0x8597 mthd 0x0900 data 0x20000010
[251170.683698] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020589000
on channel 0x0003f518 [plasmashell[503]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT

... and there is more there. Please see the attachment.

I can also add that it makes the plasmashell application hangs for a while,
with 100%CPU usage. After some time, the system is responsive again, with some
glitches in the interface (meaning, some icons disappearing or wrongly
displayed for instance. Once, it made the file explorer dolphin crash). I have
been told that it could be related to a Vsync problem.

It has been identified by a problem with nouveau (I refer you to the <a href="show_bug.cgi?id=92299#c4">comment 4</a>
of the ticket, that gives better understanding of the problem):
<a href="https://bugs.kde.org/show_bug.cgi?id=353292#c4">https://bugs.kde.org/show_bug.cgi?id=353292#c4</a>

Thank you for your time! And keep the good work going!
Cheers.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444077127.CBCA50.24231--

--===============1374382703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1374382703==--
