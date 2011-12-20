From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] Dual head doesn't work for some combination
 of monitors (second screen still off)
Date: Tue, 20 Dec 2011 08:54:14 +0000
Message-ID: <bug-38074-8800-KcR3ebeWtL@http.bugs.freedesktop.org/>
References: <bug-38074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38074-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38074

--- Comment #14 from Luzipher <luziphermcleod-CVfgzVlYcRg@public.gmane.org> 2011-12-20 00:54:14 PST ---
I think I have a similar problem with a laptop card. For me the laptop screen
on LVDS-1 works, but another screen only works when connected to VGA-1. I can
connect it to DVI-D-1 and it is detected correctly and I can activate it using
xrandr (and move the mouse there) - but the monitor will only go into power
save. With VGA-1 everything works as expected.
On windows the second monitor also works via DVI-D-1, so it's not a hardware
limitation (didn't test the nvidia blob).

I also think these bugs might be related:
https://bugs.freedesktop.org/show_bug.cgi?id=30589
https://bugs.freedesktop.org/show_bug.cgi?id=43668
(I did test with "nouveau.perflvl_wr=7777 nouveau.perflvl=2", but I only get
screen corruption that way - also not the 2 instead of 3, since there doesn't
seem to be a perflvl 3 on my card).



Details:
------------------ Versions ------------------
Sabayon Linux Weekly
X.org Server 1.10.4
xf86-video-nouveau-0.0.16_pre20110801
kernel: 3.1.0-sabayon
CPU: x86_64 Intel(R) Core(TM)2 CPU T7400
xrandr 1.3.5 on server 1.3



------------------ lspci -vvv ------------------

01:00.0 VGA compatible controller: nVidia Corporation G71 [Quadro FX 2500M]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device 019b
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at ed000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at ee000000 (64-bit, non-prefetchable) [size=16M]
    Region 5: I/O ports at ef00 [size=128]
    Expansion ROM at efe00000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [78] Express (v1) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s <256ns, L1
<4us
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0
<256ns, L1 <4us
            ClockPM- Surprise- LLActRep- BwNot-
        LnkCtl:    ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk+
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
    Kernel driver in use: nouveau
    Kernel modules: nouveau



------------------ xrandr ------------------
(DVI-D-1 and VGA-1 is the same monitor, of course I tried with only DVI-D-1
connected)

Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 4096 x 4096
LVDS-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 367mm
x 230mm
   1920x1200      60.0*+   59.9  
   1920x1080      60.0  
   1600x1200      59.9  
   1680x1050      60.0  
   1400x1050      60.0  
   1280x1024      59.9  
   1280x960       59.9  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 connected 1920x1200+1920+0 (normal left inverted right x axis y axis)
518mm x 324mm
   1920x1200      60.0*+
   1600x1200      60.0  
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
TV-1 disconnected (normal left inverted right x axis y axis)
DVI-D-1 connected (normal left inverted right x axis y axis)
   1920x1200      60.0 +
   1600x1200      60.0  
   1280x1024      75.0     60.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  


------------------  ------------------

If anybody needs more info I'll be happy to supply it.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
