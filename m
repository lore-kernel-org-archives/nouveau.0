From: Ondrej Zary <linux@rainbow-software.org>
Subject: AGP cards in PCI mode (fake slots like AGPro, AGP Express, AGI, AGX, XGP)
Date: Sun, 13 Sep 2015 20:57:30 +0200
Message-ID: <201509132057.30674.linux@rainbow-software.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hello,
I have a PC Chips A31G board with AGPro slot and found that nouveau does not
work properly with it. Console works but reverts to software mode, X11 hangs
with mouse cursor only.

The slot is physically AGP 1.5V but is wired to PCI bus as the chipset (SiS
761) does not support AGP cards. To further complicate things, the chipset has
AGP capability - but only for the integrated video. You can see that in the
lspci output below - the AGP card is on bus 0 and SiS card on bus 1 (AGP bus
behind the AGP bridge). The SiS card is not used (can be disabled in BIOS but
it does not improve things - as the AGP capability of the host bridge remains
active).

As seen in dmesg below, kernel tries to set AGP 8x mode for all AGP devices,
including the AGP 4x TNT2 card which is not even connected to the AGP bridge.

Setting nouveau.agpmode=0 makes it work but how can we make this case work
automatically?

Radeon driver does some "ring test" and if it fails, it disables AGP mode and
retries. That seems to work a bit (with R7000 but not with R7200).

But I think that we shouldn't even touch the AGP registers of other devices
in this case as it might break the integrated video.
But how can we know that the card is connected to the AGP bus? There does not
seem to be a reliable way...

dmesg:
[   22.015411] nouveau  [  DEVICE][0000:00:05.0] BOOT0  : 0x20154000
[   22.015473] nouveau  [  DEVICE][0000:00:05.0] Chipset: NV05 (NV05)
[   22.015527] nouveau  [  DEVICE][0000:00:05.0] Family : NV04
[   22.041131] nouveau  [   VBIOS][0000:00:05.0] using image from PRAMIN
[   22.041194] nouveau  [   VBIOS][0000:00:05.0] BMP version 5.6
[   22.041382] nouveau  [   VBIOS][0000:00:05.0] version 02.05.20.02.00
[   22.041561] nouveau W[   VBIOS][0000:00:05.0] DCB table not found
[   22.041867] nouveau W[   VBIOS][0000:00:05.0] DCB table not found
[   22.042079] nouveau W[   VBIOS][0000:00:05.0] DCB table not found
[   22.042133] nouveau W[   VBIOS][0000:00:05.0] DCB table not found
[   22.042245] nouveau W[  PTIMER][0000:00:05.0] unknown input clock freq
[   22.042306] nouveau  [     PFB][0000:00:05.0] RAM type: SDRAM
[   22.042360] nouveau  [     PFB][0000:00:05.0] RAM size: 32 MiB
[   22.042413] nouveau  [     PFB][0000:00:05.0]    ZCOMP: 0 tags
[   22.047063] nouveau  [     CLK][0000:00:05.0] --:
[   22.047137] nouveau W[   VBIOS][0000:00:05.0] DCB table not found
[   22.047220] agpgart-amd64 0000:00:00.0: AGP 3.0 bridge
[   22.047281] agpgart: systemd-udevd tried to set rate=x12. Setting to AGP3 x8 mode.
[   22.047348] agpgart-amd64 0000:00:00.0: putting AGP V3 device into 8x mode
[   22.047425] nouveau 0000:00:05.0: putting AGP V3 device into 8x mode
[   22.047503] pci 0000:01:00.0: putting AGP V3 device into 8x mode
[   22.047632] [TTM] Zone  kernel: Available graphics memory: 239112 kiB
[   22.047685] [TTM] Initializing pool allocator
[   22.047744] [TTM] Initializing DMA pool allocator
[   22.047814] nouveau  [     DRM] VRAM: 31 MiB
[   22.047865] nouveau  [     DRM] GART: 64 MiB
[   22.047918] nouveau  [     DRM] BMP version 5.6
[   22.047971] nouveau W[     DRM] No DCB data found in VBIOS
[   22.051250] nouveau  [     DRM] Saving VGA fonts
[   22.099912] nouveau W[     DRM] No DCB data found in VBIOS
[   22.101006] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   22.101061] [drm] Driver supports precise vblank timestamp query.
[   22.102645] nouveau  [     DRM] MM: using M2MF for buffer copies
[   22.133344] nouveau  [     DRM] allocated 1280x1024 fb: 0x4000, bo db2d6c00
[   22.133545] fbcon: nouveaufb (fb0) is primary device
[   22.369387] nouveau E[     DRM] GPU lockup - switching to software fbcon
[   22.378443] Console: switching to colour frame buffer device 160x64
[   22.395704] nouveau 0000:00:05.0: fb0: nouveaufb frame buffer device
[   22.395808] nouveau 0000:00:05.0: registered panic notifier
[   22.396783] [drm] Initialized nouveau 1.2.2 20120801 for 0000:00:05.0 on minor 0

lspci -vvnn:
00:00.0 Host bridge [0600]: Silicon Integrated Systems [SiS] 761/M761 Host [1039:0761] (rev 01)
        Subsystem: Elitegroup Computer Systems Device [1019:0131]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-
        Latency: 32
        Region 0: Memory at f0000000 (32-bit, non-prefetchable) [size=64M]
        Capabilities: [a0] AGP version 3.0
                Status: RQ=32 Iso- ArqSz=2 Cal=3 SBA+ ITACoh- GART64- HTrans- 64bit- FW- AGP3+ Rate=x4,x8
                Command: RQ=1 ArqSz=0 Cal=0 SBA+ AGP+ GART64- 64bit- FW- Rate=x8
        Capabilities: [d0] HyperTransport: Slave or Primary Interface
                Command: BaseUnitID=0 UnitCnt=17 MastHost- DefDir- DUL-
                Link Control 0: CFlE- CST- CFE- <LkFail- Init+ EOC- TXO- <CRCErr=0 IsocEn- LSEn- ExtCTL- 64b-
                Link Config 0: MLWI=16bit DwFcIn- MLWO=16bit DwFcOut- LWI=16bit DwFcInEn- LWO=16bit DwFcOutEn-
                Link Control 1: CFlE- CST- CFE- <LkFail+ Init- EOC+ TXO+ <CRCErr=0 IsocEn- LSEn- ExtCTL- 64b-
                Link Config 1: MLWI=N/C DwFcIn- MLWO=N/C DwFcOut- LWI=N/C DwFcInEn- LWO=N/C DwFcOutEn-
                Revision ID: 1.05
                Link Frequency 0: 800MHz
                Link Error 0: <Prot- <Ovfl- <EOC- CTLTm-
                Link Frequency Capability 0: 200MHz+ 300MHz- 400MHz+ 500MHz- 600MHz- 800MHz+ 1.0GHz+ 1.2GHz- 1.4GHz- 1.6GHz- Vend-
                Feature Capability: IsocFC- LDTSTOP+ CRCTM- ECTLT- 64bA+ UIDRD-
                Link Frequency 1: 200MHz
                Link Error 1: <Prot- <Ovfl- <EOC- CTLTm-
                Link Frequency Capability 1: 200MHz- 300MHz- 400MHz- 500MHz- 600MHz- 800MHz- 1.0GHz- 1.2GHz- 1.4GHz- 1.6GHz- Vend-
                Error Handling: PFlE- OFlE- PFE- OFE- EOCFE- RFE- CRCFE- SERRFE- CF- RE- PNFE- ONFE- EOCNFE- RNFE- CRCNFE- SERRNFE-
                Prefetchable memory behind bridge Upper: 00-00
                Bus Number: 00
        Capabilities: [f0] HyperTransport: Interrupt Discovery and Configuration
        Capabilities: [5c] HyperTransport: Revision ID: 1.05
        Kernel driver in use: agpgart-amd64

00:01.0 PCI bridge [0604]: Silicon Integrated Systems [SiS] AGP Port (virtual PCI-to-PCI bridge) [1039:0002] (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=64
        I/O behind bridge: 0000e000-0000efff
        Memory behind bridge: feb00000-febfffff
        Prefetchable memory behind bridge: d8000000-dfffffff
        Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [a4] HyperTransport: UnitID Clumping
...
00:05.0 VGA compatible controller [0300]: NVIDIA Corporation NV5 [Riva TNT2 Model 64 / Model 64 Pro] [10de:002d] (rev 15) (prog-if 00 [VGA controller])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (1250ns min, 250ns max)
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d6000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at feae0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [44] AGP version 2.0
                Status: RQ=32 Iso- ArqSz=0 Cal=0 SBA- ITACoh- GART64- HTrans- 64bit- FW- AGP3- Rate=x1,x2,x4
                Command: RQ=32 ArqSz=0 Cal=0 SBA- AGP+ GART64- 64bit- FW- Rate=x2
        Kernel driver in use: nouveau
...
01:00.0 VGA compatible controller [0300]: Silicon Integrated Systems [SiS] 661/741/760 PCI/AGP or 662/761Gx PCIE VGA Display Adapter [1039:6330] (rev 03) (prog-if 00 [VGA controller])
        Subsystem: Silicon Integrated Systems [SiS] [M]661xX/[M]741[GX]/[M]760 PCI/AGP VGA Adapter [1039:6330]
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 10
        BIST result: 00
        Region 0: Memory at d8000000 (32-bit, prefetchable) [disabled] [size=128M]
        Region 1: Memory at febe0000 (32-bit, non-prefetchable) [disabled] [size=128K]
        Region 2: I/O ports at e800 [disabled] [size=128]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] AGP version 3.0
                Status: RQ=256 Iso- ArqSz=0 Cal=0 SBA+ ITACoh- GART64- HTrans- 64bit- FW- AGP3+ Rate=x4,x8
                Command: RQ=32 ArqSz=2 Cal=0 SBA+ AGP+ GART64- 64bit- FW- Rate=x8

-- 
Ondrej Zary
