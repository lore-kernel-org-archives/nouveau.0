From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50830] New: GeForce 8500 GT Connectors Reversed
Date: Thu, 07 Jun 2012 13:28:51 +0000
Message-ID: <bug-50830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

https://bugs.freedesktop.org/show_bug.cgi?id=50830

             Bug #: 50830
           Summary: GeForce 8500 GT Connectors Reversed
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have noticed that the nouveau DRM kernel driver seems to get the
connectors reversed on my GeForce 8500 GT card.  My setup looks like:

8500GT----------VGA-----------Samsung 2043W (1680x1050)
          |______DVI_______LG L1920P (1280x1024)

but as far as the kernel is concerned, the Samsung monitor gets
detected via the DVI probing:

[    0.521009] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:15:DVI-I-1] probed modes :
[    0.521015] [drm:drm_mode_debug_printmodeline], Modeline
21:"1680x1050" 60 119000 1680 1728 1760 1840 1050 1053 1059 1080 0x48
0x9

and the LG via the VGA probing:

[    0.551267] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:17:VGA-1] probed modes :
[    0.551272] [drm:drm_mode_debug_printmodeline], Modeline
89:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x48
0x5

I have used my xorg.conf configuration to re-reverse the monitor
definitions to get a working system, but should some quirk be added to
handle this particular card:

01:00.0 VGA compatible controller: NVIDIA Corporation G86 [GeForce
8500 GT] (rev a1) (prog-if 00 [VGA controller])
       Subsystem: eVga.com. Corp. Device c793
       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
       Latency: 0, Cache Line Size: 64 bytes
       Interrupt: pin A routed to IRQ 25
       Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
       Region 1: Memory at a0000000 (64-bit, prefetchable) [size=256M]
       Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
       Region 5: I/O ports at dc00 [size=128]
       Expansion ROM at fe7e0000 [disabled] [size=128K]
       Capabilities: [60] Power Management version 2
               Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
               Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
       Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
               Address: 0000000000000000  Data: 0000
       Capabilities: [78] Express (v1) Endpoint, MSI 00
               DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns,
L1 <4us
                       ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
               DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                       RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
                       MaxPayload 128 bytes, MaxReadReq 512 bytes
               DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
               LnkCap: Port #213, Speed 2.5GT/s, Width x16, ASPM L0s L1,
Latency L0
<512ns, L1 <4us
                       ClockPM- Surprise- LLActRep- BwNot-
               LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk+
                       ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
               LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive-
BWMgmt- ABWMgmt-
       Kernel driver in use: nouveau

Are there any other details I can provide that could help?  Even if I
had to write the patch myself and test it, that would be fine by me
with a little advice.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
