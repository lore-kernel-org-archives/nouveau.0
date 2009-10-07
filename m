From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24370] New: nouveau and xorg-server-1.7 does not
 work without NoAccel
Date: Wed,  7 Oct 2009 02:52:51 -0700 (PDT)
Message-ID: <bug-24370-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=24370

           Summary: nouveau and xorg-server-1.7 does not work without
                    NoAccel
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=30137)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=30137)
dmesg | grep drm

I am using gentoo with the nouveau-kernel, libdrm from git, xf86-video-nouveau
from git all updated today.
If I use org-server-1.6 it seems to work as it should but because of the
slowness with gnome-terminal I wanted to take a look at xorg-server-1.7.

The problem:
I upgraded to xorg-server-1.7, and have also (for other reasons) rebuilt
everything in my system, so every X-component are rebuilt with the latest
versions installed, including all the drivers.
If I tri to startx, then everything start to loads, except that things does not
look like they should. There are no characters what so ever. Windows borders
are drawn, the background are drawn. The nouspointer are drawn. Some content
fof the windows are particially drawn. Then lockup. No response from keyboard,
no response from mouse.

The system responds to ssh, and with NoAccel everything works as is should,
just a bit more slow.

Attaching Xorg.log and "dmesg | grep drm".
Will see if I can get out a backtrace also if that would be helpful.

$ sudo lspci -s 02: -nnvv
02:00.0 VGA compatible controller [0300]: nVidia Corporation GT200b [GeForce
GTX 285] [10de:05e3] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: nVidia Corporation Device [10de:065b]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
        Region 5: I/O ports at ac00 [size=128]
        Expansion ROM at fba80000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <1us, L1
<4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency
L0 <1us, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk-
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information <?>
        Kernel driver in use: nouveau


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
