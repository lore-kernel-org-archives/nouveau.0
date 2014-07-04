From: Brian Becker <brian.johnathan.b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to check for proper MSI support?
Date: Thu, 3 Jul 2014 20:35:40 -0400
Message-ID: <CALhae2jRz8hL0bwySAbP7r+vJGOG5aif4GA_Yjp0inGAwz5JEA@mail.gmail.com>
References: <CAKb7UviGCtebGwyHbXRLZhDOiDAez+eKkxPe9jz5kc-3R1kUvQ@mail.gmail.com>
 <53B4F0F7.9020403@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0575396485=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53B4F0F7.9020403-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0575396485==
Content-Type: multipart/alternative; boundary=001a11370a3411d82104fd534e9e

--001a11370a3411d82104fd534e9e
Content-Type: text/plain; charset=UTF-8

I mistakenly only replied to Yijing Wang the first time. Here are the
further details.

uname -a: Linux p5-133 3.15.2-p5-133 #1 Thu Jun 26 22:56:27 EDT 2014 i586
GNU/Linux

Here is the output from lspci -vvvxxx:

root@p5-133:~# cat lspci.txt
00:00.0 Host bridge: Intel Corporation 430FX - 82437FX TSC [Triton I] (rev
01)
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort+ >SERR- <PERR- INTx-
        Latency: 64
00: 86 80 2d 12 06 00 00 22 01 00 00 06 00 40 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 88 00 41 00 00 00 00 03 49 10 55 55 55 05 55 05
60: 08 10 18 20 20 00 00 00 0f 00 00 00 00 00 00 00
70: 00 00 0a 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00

00:07.0 ISA bridge: Intel Corporation 82371FB PIIX ISA [Triton I] (rev 02)
        Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
00: 86 80 2e 12 0f 00 80 02 02 00 01 06 00 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 4d 00 60 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 0b 0b 0b 09 00 00 00 00 00 f2 05 00 00 00 00 00
70: 0f 80 00 00 00 00 04 04 02 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 03 00 e0 00 02 d0 00 a0 13 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 08 02 00 00 00 00 00 00

00:07.1 IDE interface: Intel Corporation 82371FB PIIX IDE [Triton I] (rev
02) (prog-if 80 [Master])
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64
        Region 0: [virtual] Memory at 000001f0 (32-bit, non-prefetchable)
[size=8]
        Region 1: [virtual] Memory at 000003f0 (type 3, non-prefetchable)
[size=1]
        Region 2: [virtual] Memory at 00000170 (32-bit, non-prefetchable)
[size=8]
        Region 3: [virtual] Memory at 00000370 (type 3, non-prefetchable)
[size=1]
        Region 4: I/O ports at ef80 [size=16]
        Kernel driver in use: pata_oldpiix
00: 86 80 30 12 05 00 80 02 02 80 01 01 00 40 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 81 ef 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
40: 36 a3 07 a3 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 08 02 00 00 00 00 00 00

00:0e.0 PCI bridge: PLX Technology, Inc. PEX8112 x1 Lane PCI Express-to-PCI
Bridge (rev aa) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 66, Cache Line Size: 32 bytes

        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 0000f000-0000ffff
        Memory behind bridge: f5e00000-fbffffff
        Prefetchable memory behind bridge: d5d00000-f5dfffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2- AuxCurrent=0mA
PME(D0+,D1+,D2-,D3hot+,D3cold-
)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [60] Express (v1) PCI/PCI-X to PCI-Express Bridge,
MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<64ns, L1 <1us
                        ExtTag- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
BrConfRtry-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1,
Latency L0 <1us, L1 <16us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; Disabled- Retrain- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk-
DLActive- BWMgmt- ABWMgmt-
00: b5 10 12 81 17 01 30 02 aa 00 04 06 08 42 01 00
10: 00 00 00 00 00 00 00 00 00 01 01 00 f0 f0 00 00
20: e0 f5 f0 fb d0 d5 d0 f5 00 00 00 00 00 00 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 00 01 0b 00
40: 01 50 02 5a 00 00 00 00 10 28 0e 00 00 00 00 00
50: 05 60 80 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 10 00 81 00 00 00 00 00 00 20 00 00 11 4c 02 00
70: 00 00 11 00 80 0c 00 00 00 00 40 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 33 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:0f.0 USB controller: ULi Electronics Inc. USB 1.1 Controller (rev 03)
(prog-if 10 [OHCI])
        Subsystem: ULi Electronics Inc. ASRock 939Dual-SATA2 Motherboard
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (20000ns max), Cache Line Size: 32 bytes
        Interrupt: pin B routed to IRQ 9
        Region 0: Memory at ffbeb000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1+,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ohci-pci
00: b9 10 37 52 17 01 b0 02 03 10 03 0c 08 40 80 00
10: 00 b0 be ff 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 37 52
30: 00 00 00 00 60 00 00 00 00 00 00 00 09 02 00 50
40: 00 00 1f 00 e0 02 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 01 00 02 d8 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:0f.1 USB controller: ULi Electronics Inc. USB 1.1 Controller (rev 03)
(prog-if 10 [OHCI])
        Subsystem: ULi Electronics Inc. ASRock 939Dual-SATA2 Motherboard
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (20000ns max), Cache Line Size: 32 bytes
        Interrupt: pin C routed to IRQ 11
        Region 0: Memory at ffbec000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1+,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ohci-pci
00: b9 10 37 52 17 01 b0 02 03 10 03 0c 08 40 80 00
10: 00 c0 be ff 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 37 52
30: 00 00 00 00 60 00 00 00 00 00 00 00 0b 03 00 50
40: 00 00 1f 00 e0 02 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 01 00 02 d8 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:0f.2 USB controller: ULi Electronics Inc. USB 1.1 Controller (rev 03)
(prog-if 10 [OHCI])
        Subsystem: ULi Electronics Inc. ASRock 939Dual-SATA2 Motherboard
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (20000ns max), Cache Line Size: 32 bytes
        Interrupt: pin D routed to IRQ 11
        Region 0: Memory at ffbed000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1+,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: ohci-pci
00: b9 10 37 52 17 01 b0 02 03 10 03 0c 08 40 80 00
10: 00 d0 be ff 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 37 52
30: 00 00 00 00 60 00 00 00 00 00 00 00 0b 04 00 50
40: 00 00 1f 00 e0 02 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 01 00 02 d8 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:0f.3 USB controller: ULi Electronics Inc. USB 2.0 Controller (rev 01)
(prog-if 20 [EHCI])
        Subsystem: ULi Electronics Inc. Device 5272
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (20000ns max), Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 11
        Region 0: Memory at ffbefc00 (32-bit, non-prefetchable) [size=256]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Debug port: BAR=1 offset=0090
        Kernel driver in use: ehci-pci
00: b9 10 39 52 16 01 b0 02 01 20 03 0c 08 40 80 00
10: 00 fc be ff 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 72 52
30: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 50
40: 01 02 00 ee 00 00 10 c4 00 00 00 00 00 00 00 00
50: 01 58 02 c8 00 00 00 00 0a 00 90 20 00 00 00 00
60: 20 20 7f 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 01 00 00 00 00 00 00 c0 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:10.0 RAID bus controller: Silicon Image, Inc. PCI0680 Ultra ATA-133 Host
Controller (rev 02)
        Subsystem: Silicon Image, Inc. Winic W-680 (Silicon Image 680 based)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 4 bytes
        Interrupt: pin A routed to IRQ 9
        Region 0: I/O ports at eff0 [size=8]
        Region 1: I/O ports at efe4 [size=4]
        Region 2: I/O ports at efa8 [size=8]
        Region 3: I/O ports at efe0 [size=4]
        Region 4: I/O ports at ef90 [size=16]
        Region 5: Memory at ffbeec00 (32-bit, non-prefetchable) [size=256]
        [virtual] Expansion ROM at 08000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=2 PME-
        Kernel driver in use: pata_sil680
00: 95 10 80 06 07 01 90 02 02 00 04 01 01 40 00 00
10: f1 ef 00 00 e5 ef 00 00 a9 ef 00 00 e1 ef 00 00
20: 91 ef 00 00 00 ec be ff 00 00 00 00 95 10 80 36
30: 00 00 00 00 60 00 00 00 00 00 00 00 09 01 00 00
40: 00 00 00 00 90 14 19 08 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 01 00 22 06 00 40 00 64 00 00 00 00 00 00 00 00
70: 08 00 00 00 00 70 57 07 00 00 00 00 00 00 00 00
80: 03 00 00 00 00 00 00 00 00 00 11 00 d9 7d ff 7b
90: 00 fe 00 0d ff ff ff 3b 33 00 00 19 ff 00 00 00
a0: 00 62 c1 10 c1 10 8a 32 c1 10 92 43 07 40 09 40
b0: 01 60 8a 32 8a 32 8a 32 92 43 92 43 09 40 09 40
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

01:00.0 VGA compatible controller: NVIDIA Corporation G96 [GeForce 9400 GT]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Jaton Corp Device 0641
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 11
        Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
        Region 5: I/O ports at fc80 [size=128]

        [virtual] Expansion ROM at d5d00000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<512ns, L1 <4us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1,
Latency L0 <512ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-

        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: nouveau
00: de 10 41 06 07 01 10 00 a1 00 00 03 08 00 00 00
10: 00 00 00 fb 0c 00 00 e0 00 00 00 00 04 00 00 f8
20: 00 00 00 00 81 fc 00 00 00 00 00 00 13 1b 41 06
30: 00 00 00 00 60 00 00 00 00 00 00 00 0b 01 00 00
40: 13 1b 41 06 00 00 00 00 00 00 00 00 00 00 00 00
50: 01 00 00 00 01 00 00 00 ce d6 23 00 00 00 00 00
60: 01 68 03 00 00 00 00 00 05 78 80 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 10 b4 01 00 e0 84 64 00
80: 10 28 00 00 01 3d 00 00 08 00 11 10 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 09 00 14 01 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00



On Thu, Jul 3, 2014 at 1:58 AM, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:

> On 2014/7/3 11:20, Ilia Mirkin wrote:
> > Hello,
> >
> > A user (cc'd) reported that nouveau's enabling of MSI causes the card
> > to not work on his setup [1]. I think the situation is that MSI is
> > just not supported by the underlying motherboard, even though the
> > card, and probably bridge, support it just fine. It's a very old
> > board. The nouveau code does:
>
>
> What is the kernel version running in your board ?
>
> >
> > pmc->use_msi = pci_enable_msi(device->pdev) == 0;
>
> Driver call pci_enable_msi() and always return 0 ?
>
> >
> > Does it need to do more checking than that before trying to enable MSI
> > on the device? Could it be that the linux pci subsystem is missing on
> > inheriting MSI capabilities somewhere?
>
> pci_enable_msi() will checking your device whether it supports MSI.
> Can you provide the detailed lspci information ? eg. lspci -vvvxxx ?
>
>
> >
> >   -ilia
> >
> > [1]
> >
> > 00:00.0 Host bridge [0600]: Intel Corporation 430FX - 82437FX TSC
> > [Triton I] [8086:122d] (rev 01)
> >         Flags: bus master, medium devsel, latency 64
> >
> > 00:0e.0 PCI bridge [0604]: PLX Technology, Inc. PEX8112 x1 Lane PCI
> > Express-to-PCI Bridge [10b5:8112] (rev aa) (prog-if 00 [Normal
> > decode])
> >         Flags: bus master, 66MHz, medium devsel, latency 66
> >         Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
> >         I/O behind bridge: 0000f000-0000ffff
> >         Memory behind bridge: f5e00000-fbffffff
> >         Prefetchable memory behind bridge: d5d00000-f5dfffff
> >         Capabilities: [40] Power Management version 2
> >         Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
> >         Capabilities: [60] Express PCI/PCI-X to PCI-Express Bridge, MSI
> 00
> >
> > 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96
> > [GeForce 9400 GT] [10de:0641] (rev a1) (prog-if 00 [VGA controller])
> >         Subsystem: Jaton Corp Device [1b13:0641]
> >         Flags: bus master, fast devsel, latency 0, IRQ 11
> >         Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
> >         Memory at e0000000 (64-bit, prefetchable) [size=256M]
> >         Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
> >         I/O ports at fc80 [size=128]
> >         [virtual] Expansion ROM at d5d00000 [disabled] [size=512K]
> >         Capabilities: [60] Power Management version 3
> >         Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
> >         Capabilities: [78] Express Endpoint, MSI 00
> >         Capabilities: [b4] Vendor Specific Information: Len=14 <?>
> >         Kernel driver in use: nouveau
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
>
>
> --
> Thanks!
> Yijing
>
>

--001a11370a3411d82104fd534e9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I mistakenly only replied to Yijing Wang the first time. H=
ere are the further details.<br><br><div class=3D"">uname -a: Linux p5-133 =
3.15.2-p5-133 #1 Thu Jun 26 22:56:27 EDT 2014 i586 GNU/Linux<img class=3D""=
 id=3D":jn" src=3D"https://mail.google.com/mail/u/0/images/cleardot.gif" al=
t=3D""><br>
</div><div class=3D""><br></div>Here is the output from lspci -vvvxxx:<br><=
br>root@p5-133:~# cat lspci.txt<br>00:00.0 Host bridge: Intel Corporation 4=
30FX - 82437FX TSC [Triton I] (rev 01)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r- Stepping- SERR- FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap- 66MHz- UDF- FastB2B=
- ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort+ &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64<br>0=
0: 86 80 2d 12 06 00 00 22 01 00 00 06 00 40 00 00<br>10: 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00<br>

20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>30: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>40: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>50: 88 00 41 00 00 00 00 03 49 10 55 55 55 05 55 05<br>
60: 08 10 18 20 20 00 00 00 0f 00 00 00 00 00 00 00<br>
70: 00 00 0a 00 00 00 00 00 00 00 00 00 00 00 00 00<br>80: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>90: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00<br>
<br>
00:07.0 ISA bridge: Intel Corporation 82371FB PIIX ISA [Triton I] (rev 02)<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+=
 SpecCycle+ MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap- 66MHz- UDF- FastB2=
B+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &l=
t;PERR- INTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 0<br>00: 86 80 2e 12 0f=
 00 80 02 02 00 01 06 00 00 80 00<br>10: 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00<br>20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>30:=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>

40: 00 00 00 00 00 00 00 00 00 00 00 00 4d 00 60 00<br>50: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>60: 0b 0b 0b 09 00 00 00 00 00 f2 05 00 =
00 00 00 00<br>70: 0f 80 00 00 00 00 04 04 02 00 00 00 00 00 00 00<br>
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>a0: 03 00 e0 00 02 d=
0 00 a0 13 00 00 00 00 00 00 00<br>b0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>f0: 00 00 00 00 00 0=
0 00 00 08 02 00 00 00 00 00 00<br><br>00:07.1 IDE interface: Intel Corpora=
tion 82371FB PIIX IDE [Triton I] (rev 02) (prog-if 80 [Master])<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem- BusMaster+ SpecCycl=
e- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap- 66MHz- UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: [virtual] Memory at 00=
0001f0 (32-bit, non-prefetchable) [size=3D8]<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 1: [virtual] Memory at 00=
0003f0 (type 3, non-prefetchable) [size=3D1]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Region 2: [virtual] Memory at 00000170 (32-bit, non-prefetc=
hable) [size=3D8]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 3: [=
virtual] Memory at 00000370 (type 3, non-prefetchable) [size=3D1]<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 4: I/O ports at ef80 [siz=
e=3D16]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use:=
 pata_oldpiix<br>00: 86 80 30 12 05 00 80 02 02 80 01 01 00 40 00 00<br>10:=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>20: 81 ef 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00<br>

30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>40: 36 a3 07 a3 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>50: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>90: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>a0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>e0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>f0: 00 00 00 00 00 00 00 00 08 02 00 00 =
00 00 00 00<br><br>00:0e.0 PCI bridge: PLX Technology, Inc. PEX8112 x1 Lane=
 PCI Express-to-PCI Bridge (rev aa) (prog-if 00 [Normal decode])<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+ Sp=
ecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz+ UDF- FastB2B=
- ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 66, Cache Line Size: 32=
 bytes<div class=3D"im"><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bus:=
 primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=3D0<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I/O behind bridge: 0000f000-0000ffff<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory behind bridge: f5e00000=
-fbffffff<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Prefetchable memory behind bridg=
e: d5d00000-f5dfffff<br></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Se=
condary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort- &lt;TAbor=
t- &lt;MAbort- &lt;SERR- &lt;PERR-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BridgeCtl: Parity+ SERR+ NoISA- VGA+ MAbort- &gt;Reset- FastB2B-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-<div cla=
ss=3D"im"><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [40]=
 Power Management version 2<br></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: PMEClk- DSI- =
D1+ D2- AuxCurrent=3D0mA PME(D0+,D1+,D2-,D3hot+,D3cold-<div dir=3D"ltr">
)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-<=
div class=3D"im"><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilitie=
s: [50] MSI: Enable- Count=3D1/1 Maskable- 64bit+<br></div>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Address: 0000000000000000=C2=A0 Data: 0000<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [60] Express (v1) =
PCI/PCI-X to PCI-Express Bridge, MSI 00<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;=
64ns, L1 &lt;1us<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ExtTag- RBE- FLReset-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DevCtl: Report errors: =
Correctable- Non-Fatal- Fatal- Unsupported-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RlxdOrd- Ex=
tTag- PhantFunc- AuxPwr- NoSnoop- BrConfRtry-<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MaxPayload 128 bytes, MaxReadReq 51=
2 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq=
- AuxPwr- TransPend-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Late=
ncy L0 &lt;1us, L1 &lt;16us<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ClockPM- Surprise- LLActRep- BwNot-<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 LnkCtl: ASPM Disabled; Disabled- Retrain- CommClk-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ExtSynch- C=
lockPM- AutWidDis- BWInt- AutBWInt-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LnkSta: Speed 2.5GT/=
s, Width x1, TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-<br>00: b5 10=
 12 81 17 01 30 02 aa 00 04 06 08 42 01 00<br>

10: 00 00 00 00 00 00 00 00 00 01 01 00 f0 f0 00 00<br>20: e0 f5 f0 fb d0 d=
5 d0 f5 00 00 00 00 00 00 00 00<br>30: 00 00 00 00 40 00 00 00 00 00 00 00 =
00 01 0b 00<br>40: 01 50 02 5a 00 00 00 00 10 28 0e 00 00 00 00 00<br>
50: 05 60 80 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
60: 10 00 81 00 00 00 00 00 00 20 00 00 11 4c 02 00<br>70: 00 00 11 00 80 0=
c 00 00 00 00 40 00 00 00 00 00<br>80: 00 00 00 00 00 00 00 00 33 00 00 00 =
00 00 00 00<br>90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>c0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
<br>00:0f.0 USB controller: ULi Electronics Inc. USB 1.1 Controller (rev 03=
) (prog-if 10 [OHCI])<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsyst=
em: ULi Electronics Inc. ASRock 939Dual-SATA2 Motherboard<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- Mem=
WINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz+ UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64 (200=
00ns max), Cache Line Size: 32 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Interrupt: pin B routed to IRQ 9<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at ffbeb000 (32=
-bit, non-prefetchable) [size=3D4K]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Capabilities: [60] Power Management version 2<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fl=
ags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1+,D2-,D3hot+,D3cold+)<=
br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: ohci-pc=
i<br>00: b9 10 37 52 17 01 b0 02 03 10 03 0c 08 40 80 00<br>10: 00 b0 be ff=
 00 00 00 00 00 00 00 00 00 00 00 00<br>

20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 37 52<br>30: 00 00 00 00 60 0=
0 00 00 00 00 00 00 09 02 00 50<br>40: 00 00 1f 00 e0 02 00 00 00 00 00 00 =
00 00 00 00<br>50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
60: 01 00 02 d8 00 00 00 00 00 00 00 00 00 00 00 00<br>
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>80: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>90: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
<br>
00:0f.1 USB controller: ULi Electronics Inc. USB 1.1 Controller (rev 03) (p=
rog-if 10 [OHCI])<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: =
ULi Electronics Inc. ASRock 939Dual-SATA2 Motherboard<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ =
VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz+ UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64 (200=
00ns max), Cache Line Size: 32 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Interrupt: pin C routed to IRQ 11<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at ffbec000 (32=
-bit, non-prefetchable) [size=3D4K]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Capabilities: [60] Power Management version 2<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fl=
ags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1+,D2-,D3hot+,D3cold+)<=
br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: ohci-pc=
i<br>00: b9 10 37 52 17 01 b0 02 03 10 03 0c 08 40 80 00<br>10: 00 c0 be ff=
 00 00 00 00 00 00 00 00 00 00 00 00<br>

20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 37 52<br>30: 00 00 00 00 60 0=
0 00 00 00 00 00 00 0b 03 00 50<br>40: 00 00 1f 00 e0 02 00 00 00 00 00 00 =
00 00 00 00<br>50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
60: 01 00 02 d8 00 00 00 00 00 00 00 00 00 00 00 00<br>
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>80: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>90: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
<br>
00:0f.2 USB controller: ULi Electronics Inc. USB 1.1 Controller (rev 03) (p=
rog-if 10 [OHCI])<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: =
ULi Electronics Inc. ASRock 939Dual-SATA2 Motherboard<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ =
VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz+ UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64 (200=
00ns max), Cache Line Size: 32 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Interrupt: pin D routed to IRQ 11<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at ffbed000 (32=
-bit, non-prefetchable) [size=3D4K]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Capabilities: [60] Power Management version 2<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fl=
ags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1+,D2-,D3hot+,D3cold+)<=
br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: ohci-pc=
i<br>00: b9 10 37 52 17 01 b0 02 03 10 03 0c 08 40 80 00<br>10: 00 d0 be ff=
 00 00 00 00 00 00 00 00 00 00 00 00<br>

20: 00 00 00 00 00 00 00 00 00 00 00 00 b9 10 37 52<br>30: 00 00 00 00 60 0=
0 00 00 00 00 00 00 0b 04 00 50<br>40: 00 00 1f 00 e0 02 00 00 00 00 00 00 =
00 00 00 00<br>50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
60: 01 00 02 d8 00 00 00 00 00 00 00 00 00 00 00 00<br>
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>80: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>90: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
<br>
00:0f.3 USB controller: ULi Electronics Inc. USB 2.0 Controller (rev 01) (p=
rog-if 20 [EHCI])<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: =
ULi Electronics Inc. Device 5272<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Ste=
pping- SERR+ FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz+ UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64 (200=
00ns max), Cache Line Size: 32 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Interrupt: pin A routed to IRQ 11<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at ffbefc00 (32=
-bit, non-prefetchable) [size=3D256]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Capabilities: [50] Power Management version 2<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D2-,D3hot+,D3cold=
+)<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [58] Debug port=
: BAR=3D1 offset=3D0090<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kerne=
l driver in use: ehci-pci<br>00: b9 10 39 52 16 01 b0 02 01 20 03 0c 08 40 =
80 00<br>

10: 00 fc be ff 00 00 00 00 00 00 00 00 00 00 00 00<br>20: 00 00 00 00 00 0=
0 00 00 00 00 00 00 b9 10 72 52<br>30: 00 00 00 00 50 00 00 00 00 00 00 00 =
0b 01 00 50<br>40: 01 02 00 ee 00 00 10 c4 00 00 00 00 00 00 00 00<br>
50: 01 58 02 c8 00 00 00 00 0a 00 90 20 00 00 00 00<br>
60: 20 20 7f 00 00 00 00 00 00 00 00 00 00 00 00 00<br>70: 01 00 00 00 00 0=
0 00 c0 00 00 00 00 00 00 00 00<br>80: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>c0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
<br>00:10.0 RAID bus controller: Silicon Image, Inc. PCI0680 Ultra ATA-133 =
Host Controller (rev 02)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subs=
ystem: Silicon Image, Inc. Winic W-680 (Silicon Image 680 based)<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+ SpecCycl=
e- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB2B=
+ ParErr- DEVSEL=3Dmedium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt=
;PERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 64, Cac=
he Line Size: 4 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interru=
pt: pin A routed to IRQ 9<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: I/O ports at eff0 [siz=
e=3D8]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 1: I/O ports at=
 efe4 [size=3D4]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 2: I/=
O ports at efa8 [size=3D8]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Re=
gion 3: I/O ports at efe0 [size=3D4]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Region 4: I/O ports at ef90 [size=3D16]<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 5: Memory at ffbeec00 (32=
-bit, non-prefetchable) [size=3D256]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [virtual] Expansion ROM at 08000000 [disabled] [size=3D512K]<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [60] Power Managem=
ent version 2<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=3D=
0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D2 PME-<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: pata_si=
l680<br>00: 95 10 80 06 07 01 90 02 02 00 04 01 01 40 00 00<br>10: f1 ef 00=
 00 e5 ef 00 00 a9 ef 00 00 e1 ef 00 00<br>

20: 91 ef 00 00 00 ec be ff 00 00 00 00 95 10 80 36<br>30: 00 00 00 00 60 0=
0 00 00 00 00 00 00 09 01 00 00<br>40: 00 00 00 00 90 14 19 08 00 00 00 00 =
00 00 00 00<br>50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
60: 01 00 22 06 00 40 00 64 00 00 00 00 00 00 00 00<br>
70: 08 00 00 00 00 70 57 07 00 00 00 00 00 00 00 00<br>80: 03 00 00 00 00 0=
0 00 00 00 00 11 00 d9 7d ff 7b<br>90: 00 fe 00 0d ff ff ff 3b 33 00 00 19 =
ff 00 00 00<br>a0: 00 62 c1 10 c1 10 8a 32 c1 10 92 43 07 40 09 40<br>
b0: 01 60 8a 32 8a 32 8a 32 92 43 92 43 09 40 09 40<br>
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>d0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>e0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00<br>f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
<br>
01:00.0 VGA compatible controller: NVIDIA Corporation G96 [GeForce 9400 GT]=
 (rev a1) (prog-if 00 [VGA controller])<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Subsystem: Jaton Corp Device 0641<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASno=
op- ParErr- Stepping- SERR+ FastB2B- DisINTx-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB2B=
- ParErr- DEVSEL=3Dfast &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;P=
ERR- INTx-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 0, Cache =
Line Size: 32 bytes<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt=
: pin A routed to IRQ 11<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at fb000000 (32=
-bit, non-prefetchable) [size=3D16M]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 3: Memory at f8000000=
 (64-bit, non-prefetchable) [size=3D32M]<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 5: I/O ports at fc80 [siz=
e=3D128]<div class=3D"im"><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [v=
irtual] Expansion ROM at d5d00000 [disabled] [size=3D512K]<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [60] Power Management version =
3<br></div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PM=
E(D0-,D1-,D2-,D3hot-,D3cold-)<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-<=
div class=3D"im"><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilitie=
s: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+<br></div>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Address: 0000000000000000=C2=A0 Data: 0000<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [78] Express (v1) =
Endpoint, MSI 00<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;=
512ns, L1 &lt;4us<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RlxdOrd+ Ex=
tTag- PhantFunc- AuxPwr- NoSnoop+<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 MaxPayload 128 bytes, MaxReadReq 512 bytes<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- Tr=
ansPend-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Lat=
ency L0 &lt;512ns, L1 &lt;1us<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ClockPM- Surprise- LLActRep- BwNot-<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk-<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ExtSynch- C=
lockPM- AutWidDis- BWInt- AutBWInt-<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LnkSta: Speed 2.5GT/=
s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-<div class=3D=
"im"><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [b4] Vend=
or Specific Information: Len=3D14 &lt;?&gt;<br>

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: nouveau<br=
></div>00: de 10 41 06 07 01 10 00 a1 00 00 03 08 00 00 00<br>10: 00 00 00 =
fb 0c 00 00 e0 00 00 00 00 04 00 00 f8<br>20: 00 00 00 00 81 fc 00 00 00 00=
 00 00 13 1b 41 06<br>30: 00 00 00 00 60 00 00 00 00 00 00 00 0b 01 00 00<b=
r>

40: 13 1b 41 06 00 00 00 00 00 00 00 00 00 00 00 00<br>50: 01 00 00 00 01 0=
0 00 00 ce d6 23 00 00 00 00 00<br>60: 01 68 03 00 00 00 00 00 05 78 80 00 =
00 00 00 00<br>70: 00 00 00 00 00 00 00 00 10 b4 01 00 e0 84 64 00<br>
80: 10 28 00 00 01 3d 00 00 08 00 11 10 00 00 00 00<br>
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>a0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00<br>b0: 00 00 00 00 09 00 14 01 00 00 00 00 =
00 00 00 00<br>c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00<br>f0: 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00</div><br></div><div class=3D"gmail_extra"><=
br><br><div class=3D"gmail_quote">On Thu, Jul 3, 2014 at 1:58 AM, Yijing Wa=
ng <span dir=3D"ltr">&lt;<a href=3D"mailto:wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" target=3D=
"_blank">wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 2014/7/3 11:20, Ilia Mirk=
in wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; A user (cc&#39;d) reported that nouveau&#39;s enabling of MSI causes t=
he card<br>
&gt; to not work on his setup [1]. I think the situation is that MSI is<br>
&gt; just not supported by the underlying motherboard, even though the<br>
&gt; card, and probably bridge, support it just fine. It&#39;s a very old<b=
r>
&gt; board. The nouveau code does:<br>
<br>
<br>
</div>What is the kernel version running in your board ?<br>
<div class=3D""><br>
&gt;<br>
&gt; pmc-&gt;use_msi =3D pci_enable_msi(device-&gt;pdev) =3D=3D 0;<br>
<br>
</div>Driver call pci_enable_msi() and always return 0 ?<br>
<div class=3D""><br>
&gt;<br>
&gt; Does it need to do more checking than that before trying to enable MSI=
<br>
&gt; on the device? Could it be that the linux pci subsystem is missing on<=
br>
&gt; inheriting MSI capabilities somewhere?<br>
<br>
</div>pci_enable_msi() will checking your device whether it supports MSI.<b=
r>
Can you provide the detailed lspci information ? eg. lspci -vvvxxx ?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; =C2=A0 -ilia<br>
&gt;<br>
&gt; [1]<br>
&gt;<br>
&gt; 00:00.0 Host bridge [0600]: Intel Corporation 430FX - 82437FX TSC<br>
&gt; [Triton I] [8086:122d] (rev 01)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Flags: bus master, medium devsel, latency =
64<br>
&gt;<br>
&gt; 00:0e.0 PCI bridge [0604]: PLX Technology, Inc. PEX8112 x1 Lane PCI<br=
>
&gt; Express-to-PCI Bridge [10b5:8112] (rev aa) (prog-if 00 [Normal<br>
&gt; decode])<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Flags: bus master, 66MHz, medium devsel, l=
atency 66<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bus: primary=3D00, secondary=3D01, subordi=
nate=3D01, sec-latency=3D0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I/O behind bridge: 0000f000-0000ffff<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memory behind bridge: f5e00000-fbffffff<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Prefetchable memory behind bridge: d5d0000=
0-f5dfffff<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [40] Power Management versio=
n 2<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [50] MSI: Enable- Count=3D1/=
1 Maskable- 64bit+<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [60] Express PCI/PCI-X to PC=
I-Express Bridge, MSI 00<br>
&gt;<br>
&gt; 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96<br>
&gt; [GeForce 9400 GT] [10de:0641] (rev a1) (prog-if 00 [VGA controller])<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Subsystem: Jaton Corp Device [1b13:0641]<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Flags: bus master, fast devsel, latency 0,=
 IRQ 11<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memory at fb000000 (32-bit, non-prefetchab=
le) [size=3D16M]<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memory at e0000000 (64-bit, prefetchable) =
[size=3D256M]<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memory at f8000000 (64-bit, non-prefetchab=
le) [size=3D32M]<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I/O ports at fc80 [size=3D128]<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 [virtual] Expansion ROM at d5d00000 [disab=
led] [size=3D512K]<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [60] Power Management versio=
n 3<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [68] MSI: Enable- Count=3D1/=
1 Maskable- 64bit+<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [78] Express Endpoint, MSI 0=
0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Capabilities: [b4] Vendor Specific Informa=
tion: Len=3D14 &lt;?&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel driver in use: nouveau<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe linux-p=
ci&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">=
majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
&gt; More majordomo info at =C2=A0<a href=3D"http://vger.kernel.org/majordo=
mo-info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html<=
/a><br>
&gt;<br>
&gt;<br>
<br>
<br>
--<br>
Thanks!<br>
Yijing<br>
<br>
</font></span></blockquote></div><br></div>

--001a11370a3411d82104fd534e9e--

--===============0575396485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0575396485==--
