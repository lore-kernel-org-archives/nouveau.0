From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95330] New: [NV84] Hangs with gr: DATA_ERROR
 [INVALID_BITFIELD], TRAP_PROP [RT_FAULT],
 fb: trapped write [PGRAPH] [PROP] [RT0] [PAGE_NOT_PRESENT],
 bsp: Watchdog interrupt, engine hung
Date: Tue, 10 May 2016 02:36:01 +0000
Message-ID: <bug-95330-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1797988098=="
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


--===============1797988098==
Content-Type: multipart/alternative; boundary="14628477611.eC56.777";
 charset="UTF-8"


--14628477611.eC56.777
Date: Tue, 10 May 2016 02:36:01 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95330

            Bug ID: 95330
           Summary: [NV84] Hangs with gr: DATA_ERROR [INVALID_BITFIELD],
                    TRAP_PROP [RT_FAULT], fb: trapped write [PGRAPH]
                    [PROP] [RT0] [PAGE_NOT_PRESENT], bsp: Watchdog
                    interrupt, engine hung
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 123586
  --> https://bugs.freedesktop.org/attachment.cgi?id=123586&action=edit
kernel.log

Nouveau has been wildly unstable for me ever since I upgraded from about Linux
4.1 to 4.4+. The latest manifestation of this bumpy ride was a full X.org
server hang. I was still able to SSH in to capture some logs.

01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Gigabyte Technology Co., Ltd G84 [GeForce 8600 GT]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 27
    Region 0: Memory at e4000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at e2000000 (64-bit, non-prefetchable) [size=32M]
    Region 5: I/O ports at 3000 [size=128]
    Expansion ROM at <ignored> [disabled]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0100c  Data: 41e1
    Capabilities: [78] Express (v1) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1
<4us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit
75.000W
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency
L0s <512ns, L1 <4us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
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
    Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
    Kernel driver in use: nouveau


Software versions in use:

  * Linux kernel 4.5.3-gentoo
  * X.org X11 server 1.18.3
  * xf86-video-nouveau 1.0.12
  * libdrm 2.4.68
  * Mesa 11.2.1


Hang occurred shortly after quitting VLC. Kernel logs shows multiple errors
from nouveau at this time, followed by an eventual segfault of vlc in
libxcb.so.1.1.0 and segfault of kactivitymanage in libQt5Sql.so.5.6.0.

I logged in via SSH and issued a reboot command, which took a while to process.
Kernel log shows multiple "failed to idle channel" errors from nouveau,
apparently one per X client. Also "fifo: channel … unload timeout" and "bsp:
Watchdog interrupt, engine hung." See attached kernel log for specifics.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14628477611.eC56.777
Date: Tue, 10 May 2016 02:36:01 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Hangs with gr: DATA_ERROR [INVALID_BITFIELD], TRAP_PROP [RT_FAULT], fb: trapped write [PGRAPH] [PROP] [RT0] [PAGE_NOT_PRESENT], bsp: Watchdog interrupt, engine hung"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95330">95330</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV84] Hangs with gr: DATA_ERROR [INVALID_BITFIELD], TRAP_PROP [RT_FAULT], fb: trapped write [PGRAPH] [PROP] [RT0] [PAGE_NOT_PRESENT], bsp: Watchdog interrupt, engine hung
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
          <td>Other
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
          <td>freedesktop&#64;mattwhitlock.name
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123586" name="attach_123586" title="kernel.log">attachment 123586</a> <a href="attachment.cgi?id=123586&amp;action=edit" title="kernel.log">[details]</a></span>
kernel.log

Nouveau has been wildly unstable for me ever since I upgraded from about Linux
4.1 to 4.4+. The latest manifestation of this bumpy ride was a full X.org
server hang. I was still able to SSH in to capture some logs.

01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Gigabyte Technology Co., Ltd G84 [GeForce 8600 GT]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 27
    Region 0: Memory at e4000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at e2000000 (64-bit, non-prefetchable) [size=32M]
    Region 5: I/O ports at 3000 [size=128]
    Expansion ROM at &lt;ignored&gt; [disabled]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0100c  Data: 41e1
    Capabilities: [78] Express (v1) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;512ns, L1
&lt;4us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit
75.000W
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency
L0s &lt;512ns, L1 &lt;4us
            ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
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
    Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
    Kernel driver in use: nouveau


Software versions in use:

  * Linux kernel 4.5.3-gentoo
  * X.org X11 server 1.18.3
  * xf86-video-nouveau 1.0.12
  * libdrm 2.4.68
  * Mesa 11.2.1


Hang occurred shortly after quitting VLC. Kernel logs shows multiple errors
from nouveau at this time, followed by an eventual segfault of vlc in
libxcb.so.1.1.0 and segfault of kactivitymanage in libQt5Sql.so.5.6.0.

I logged in via SSH and issued a reboot command, which took a while to process.
Kernel log shows multiple &quot;failed to idle channel&quot; errors from nouveau,
apparently one per X client. Also &quot;fifo: channel … unload timeout&quot; and &quot;bsp:
Watchdog interrupt, engine hung.&quot; See attached kernel log for specifics.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14628477611.eC56.777--

--===============1797988098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1797988098==--
