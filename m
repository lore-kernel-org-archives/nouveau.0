From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34348] New: (regression/bisected) (2.6.37
 nouveau/KMS) internal laptop display remains blank
Date: Wed, 16 Feb 2011 10:01:24 -0800 (PST)
Message-ID: <bug-34348-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34348

           Summary: (regression/bisected) (2.6.37 nouveau/KMS) internal
                    laptop display remains blank
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=43440)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43440)
2.6.37 dmesg

2.6.36 works, 2.6.37 does not; issue is that internal display on a Dell
Latitude E6510 becomes blank when KMS is loaded - X thinks everything is fine
and keeps the monitor as the primary (I also have an external 22' Dell LCD
monitor as a secondary)

bisection points to:
---
fe224bb7e12f1ea9a785ec942bc5d59950543888 is the first bad commit
commit fe224bb7e12f1ea9a785ec942bc5d59950543888
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Sep 27 08:29:33 2010 +1000

    drm/nouveau: enable enhanced framing only if DP display supports it

    Reported-by: Adam Jackson <ajax-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 b7c4a355f61feea4e8937678b7114f10ecbde9e2
a6e97b63576d4ea0628114824e1f54ca397417e5 M      drivers
---

video card is:
---
01:00.0 VGA compatible controller: nVidia Corporation GT218 [NVS 3100M] (rev
a2) (prog-if 00 [VGA controller])
    Subsystem: Dell Latitude E6510
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at e2000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at e0000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at 7000 [size=128]
    Expansion ROM at e3000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [78] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1
<64us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Latency L0
<256ns, L1 <4us
            ClockPM+ Surprise- LLActRep- BwNot-
        LnkCtl:    ASPM L1 Enabled; RCB 128 bytes Disabled- Retrain- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis+
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-,
Selectable De-emphasis: -6dB
             Transmit Margin: Normal Operating Range, EnterModifiedCompliance-
ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB
    Capabilities: [b4] Vendor Specific Information <?>
    Capabilities: [100] Virtual Channel <?>
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information <?>
    Kernel driver in use: nouveau
    Kernel modules: nouveau
---
xrandr output follows - (external monitor is connected using DVI regardless
what xrands says)
xrandr (with 2.6.37 - not working):
---
Screen 0: minimum 320 x 200, current 3280 x 1050, maximum 8192 x 8192
eDP-1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 344mm x
194mm
   1600x900       60.0*+   40.0  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1680x1050+1600+0 (normal left inverted right x axis y axis)
473mm x 296mm
   1680x1050      59.9*+
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
---

xrandr (with 2.6.36 - working):
---
Screen 0: minimum 320 x 200, current 3280 x 1050, maximum 8192 x 8192
eDP-1 connected 1600x900+0+0 (normal left inverted right x axis y axis) 344mm x
194mm
   1600x900       40.0* 
   1152x864       39.9  
   1024x768       39.9  
   800x600        39.6  
   640x480        39.9  
   720x400        39.6  
   640x400        39.3  
   640x350        39.3  
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1680x1050+1600+0 (normal left inverted right x axis y axis)
473mm x 296mm
   1680x1050      59.9*+
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)
---

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
