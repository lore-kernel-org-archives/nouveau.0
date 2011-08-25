From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40375] New: nvidoa geforce gt425m reports PGRAPH:
 unsupported chipset, please report
Date: Thu, 25 Aug 2011 07:12:41 -0700 (PDT)
Message-ID: <bug-40375-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40375

           Summary: nvidoa geforce gt425m reports PGRAPH: unsupported
                    chipset, please report
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bd-jle0f6upsw7YtjvyW6yDsg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


This is on debian squeeze, with a backports kernel:

2.6.39-bpo.2-amd64

[    6.103304] [drm] nouveau 0000:01:00.0: PGRAPH: unsupported chipset, please
report!
[    6.103660] [drm] nouveau 0000:01:00.0: PGRAPH: unknown config: 2/0/0/0, 1
[    6.134361] [drm] nouveau 0000:01:00.0: failed to load fuc409d

dmesg | egrep '(nouveau|drm|fbcon|fb0:)'

[    5.837562] [drm] Initialized drm 1.1.0 20060810
[    5.952280] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    5.952285] nouveau 0000:01:00.0: setting latency timer to 64
[    5.953207] [drm] nouveau 0000:01:00.0: Detected an NVc0 generation card
(0x0c1800a1)
[    5.955917] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    6.027952] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    6.027959] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    6.027964] [drm] nouveau 0000:01:00.0: Bios version 70.08.19.00
[    6.027967] [drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid
[    6.028045] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    6.028049] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[    6.028054] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 08013382 00020030
[    6.028059] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02027362 00020010
[    6.028062] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02013380 00000000
[    6.028067] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16
4
[    6.028072] [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag
0xff
[    6.028077] [drm] nouveau 0000:01:00.0:   1: 0x00001161: type 0x61 idx 1 tag
0x07
[    6.028082] [drm] nouveau 0000:01:00.0:   2: 0x00001231: type 0x31 idx 2 tag
0x07
[    6.028086] [drm] nouveau 0000:01:00.0:   3: 0x01000330: type 0x30 idx 3 tag
0x5e
[    6.028090] [drm] nouveau 0000:01:00.0:   4: 0x01000446: type 0x46 idx 4 tag
0x5e
[    6.028095] [drm] nouveau 0000:01:00.0:   5: 0x02000546: type 0x46 idx 5 tag
0x5f
[    6.028099] [drm] nouveau 0000:01:00.0:   6: 0x00010631: type 0x31 idx 6 tag
0x51
[    6.028104] [drm] nouveau 0000:01:00.0:   7: 0x00010761: type 0x61 idx 7 tag
0x51
[    6.028108] [drm] nouveau 0000:01:00.0:   8: 0x00020846: type 0x46 idx 8 tag
0x52
[    6.028112] [drm] nouveau 0000:01:00.0:   9: 0x00000900: type 0x00 idx 9 tag
0xff
[    6.028119] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0x81E2
[    6.048234] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0x8828
[    6.055226] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0x99BD
[    6.055228] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0x99C1
[    6.055272] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0x9AA9
[    6.055274] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0x9B0E
[    6.075098] [drm] nouveau 0000:01:00.0: 0x815C: Condition still not met
after 20ms, skipping following opcodes
[    6.093909] [drm] nouveau 0000:01:00.0: 3 available performance level(s)
[    6.093912] [drm] nouveau 0000:01:00.0: 0: memory 135MHz core 270MHz shader
540MHz voltage 860mV
[    6.093915] [drm] nouveau 0000:01:00.0: 1: memory 405MHz core 270MHz shader
810MHz voltage 860mV
[    6.093918] [drm] nouveau 0000:01:00.0: 3: memory 405MHz core 890MHz shader
1120MHz voltage 900mV
[    6.093997] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[    6.103296] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    6.103304] [drm] nouveau 0000:01:00.0: PGRAPH: unsupported chipset, please
report!
[    6.103660] [drm] nouveau 0000:01:00.0: PGRAPH: unknown config: 2/0/0/0, 1
[    6.134361] [drm] nouveau 0000:01:00.0: failed to load fuc409d
[    6.151061] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    6.151063] [drm] No driver support for vblank timestamp query.
[    6.265320] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x8020000,
bo ffff88011f40d000
[    6.265378] fbcon: nouveaufb (fb0) is primary device
[    6.321479] fb0: nouveaufb frame buffer device
[    6.321480] drm: registered panic notifier
[    6.321485] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
minor 0

lspci -s 01:00.0 -vvv

01:00.0 VGA compatible controller: nVidia Corporation Device 0df0 (rev a1)
(prog-if 00 [VGA controller])
    Subsystem: Device 1b0a:9077
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 32 bytes
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at d8000000 (64-bit, prefetchable) [size=128M]
    Region 3: Memory at d6000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at dc00 [size=128]
    Expansion ROM at fbc00000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [78] Express (v1) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1
<64us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0
<256ns, L1 <4us
            ClockPM+ Surprise- LLActRep- BwNot-
        LnkCtl:    ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
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

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
