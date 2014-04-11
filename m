From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Bug: noveau DATA_ERROR / CACHE_ERROR on Quadro NVS 290
Date: Fri, 11 Apr 2014 12:55:14 -0400
Message-ID: <CAKb7Uvh4sOCmUffi1-fJx4oWtUeHLkFrHZ3hyicMaM1gzhLn_Q@mail.gmail.com>
References: <53481A23.7030006@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53481A23.7030006-hi6Y0CQ0nG0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Clemens Koller <clemens.ml-hi6Y0CQ0nG0@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Apr 11, 2014 at 12:36 PM, Clemens Koller <clemens.ml-hi6Y0CQ0nG0@public.gmane.org> wrote:
> Hi, there!
>
> Every once in a while / about once a day I have nouveau for a Quadro NVS
> 290 failing in my
> system from about kernel 3.10...up to now 3.14, so I finally decided to
> report this bug as
> it gets really annoying. After the bug appears, there are some (one per
> DATA_ERROR line)
> small 20x20 to 40x40 pixel sized odd shaped white block artefacts stuck
> on my (dual monitor)
> desktop. After a restart of X, the artefacts disappear until the bug
> triggers again.
>
> I am on a current Arch Linux Distro. The motherboard is from an
> industrial system which is
> otherwise running fine and very stable.
>
> Here are some log outputs:
>
> % uname -a
> Linux octo 3.14.0-4-ARCH #1 SMP PREEMPT Wed Apr 9 21:11:25 CEST 2014
> x86_64 GNU/Linux
>
> $ dmesg
> ...
> [22616.270000] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2
> [X[632]] get 0x0020029b08 put 0x0020029e60 ib_get 0x000003bd ib_put
> 0x000003d7 state 0x8000e6a8 (err: INVALID_CMD) push 0x00406040

I've seen this error before, specifically with the 0x00406040 value,
on a wide range of setups. We have no clue why it happens, but once it
does, a bunch of commands get dropped. Sometimes it recovers fine,
other times, not so much. I know this isn't very helpful, but wanted
to mention it anyways.

> [22616.270226] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270232] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x1360 data 0x00000001
> [22616.270260] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270265] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x1340 data 0x00008006
> [22616.270280] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270284] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x1344 data 0x00004001
> [22616.270298] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270302] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x1348 data 0x00004303
> [22616.270316] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270321] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x134c data 0x00008006
> [22616.270335] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270340] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x1350 data 0x00004001
> [22616.270352] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR BEGIN_END_ACT=
IVE
> [22616.270356] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 7 class 0x8297 mthd 0x1358 data 0x00004303
> [22642.053387] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2
> [X[632]] get 0x002003e70c put 0x002003eb98 ib_get 0x00000278 ib_put
> 0x00000385 state 0xc000ef05 (err: MEM_FAULT) push 0x00406040
> [22642.053426] nouveau E[     PFB][0000:01:00.0] trapped read at
> 0xfffffffffc on channel 0x0000fcb0 [unknown] PFIFO/PFIFO_READ/PUSHBUF
> reason: PT_NOT_PRESENT
> [22642.055251] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR (unknown
> enum 0x00000034)
> [22642.055258] nouveau E[  PGRAPH][0000:01:00.0] ch 2 [0x000fb33000
> X[632]] subc 2 class 0x502d mthd 0x08dc data 0x00000040
> [22652.695809] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2
> [X[632]] get 0x002000f840 put 0x002000f860 ib_get 0x0000039a ib_put
> 0x000003ac state 0x80004610 (err: INVALID_CMD) push 0x00406040
> [22740.413503] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 2
> [X[632]] subc 0 mthd 0x0060 data 0xbeef0201
> [22775.303885] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 2
> [X[632]] subc 0 mthd 0x0060 data 0xbeef0201
>
>
>
> $ lspci
> 00:00.0 Host bridge: Intel Corporation Core Processor DMI (rev 11)
> 00:03.0 PCI bridge: Intel Corporation Core Processor PCI Express Root
> Port 1 (rev 11)
> 00:08.0 System peripheral: Intel Corporation Core Processor System
> Management Registers (rev 11)
> 00:08.1 System peripheral: Intel Corporation Core Processor Semaphore
> and Scratchpad Registers (rev 11)
> 00:08.2 System peripheral: Intel Corporation Core Processor System
> Control and Status Registers (rev 11)
> 00:08.3 System peripheral: Intel Corporation Core Processor
> Miscellaneous Registers (rev 11)
> 00:10.0 System peripheral: Intel Corporation Core Processor QPI Link
> (rev 11)
> 00:10.1 System peripheral: Intel Corporation Core Processor QPI Routing
> and Protocol Registers (rev 11)
> 00:16.0 Communication controller: Intel Corporation 5 Series/3400 Series
> Chipset HECI Controller (rev 06)
> 00:16.2 IDE interface: Intel Corporation 5 Series/3400 Series Chipset PT
> IDER Controller (rev 06)
> 00:16.3 Serial controller: Intel Corporation 5 Series/3400 Series
> Chipset KT Controller (rev 06)
> 00:19.0 Ethernet controller: Intel Corporation 82578DM Gigabit Network
> Connection (rev 06)
> 00:1a.0 USB controller: Intel Corporation 5 Series/3400 Series Chipset
> USB2 Enhanced Host Controller (rev 06)
> 00:1b.0 Audio device: Intel Corporation 5 Series/3400 Series Chipset
> High Definition Audio (rev 06)
> 00:1c.0 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI
> Express Root Port 1 (rev 06)
> 00:1c.6 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI
> Express Root Port 7 (rev 06)
> 00:1d.0 USB controller: Intel Corporation 5 Series/3400 Series Chipset
> USB2 Enhanced Host Controller (rev 06)
> 00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev a6)
> 00:1f.0 ISA bridge: Intel Corporation 5 Series Chipset LPC Interface
> Controller (rev 06)
> 00:1f.2 SATA controller: Intel Corporation 5 Series/3400 Series Chipset
> 6 port SATA AHCI Controller (rev 06)
> 00:1f.3 SMBus: Intel Corporation 5 Series/3400 Series Chipset SMBus
> Controller (rev 06)
> 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS
> 290] (rev a1)
> 03:00.0 Ethernet controller: Intel Corporation 82583V Gigabit Network
> Connection
> 04:0c.0 USB controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
> Controller (rev 61)
> 04:0c.1 USB controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
> Controller (rev 61)
> 04:0c.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 63)
> 04:0c.3 FireWire (IEEE 1394): VIA Technologies, Inc. VT6306/7/8 [Fire
> II(M)] IEEE 1394 OHCI Controller (rev 46)
> 04:0e.0 Mass storage controller: Promise Technology, Inc. PDC40775 (SATA
> 300 TX2plus) (rev 02)
> ff:00.0 Host bridge: Intel Corporation Core Processor QuickPath
> Architecture Generic Non-Core Registers (rev 04)
> ff:00.1 Host bridge: Intel Corporation Core Processor QuickPath
> Architecture System Address Decoder (rev 04)
> ff:02.0 Host bridge: Intel Corporation Core Processor QPI Link 0 (rev 04)
> ff:02.1 Host bridge: Intel Corporation Core Processor QPI Physical 0
> (rev 04)
> ff:03.0 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller (rev 04)
> ff:03.1 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Target Address Decoder (rev 04)
> ff:03.4 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Test Registers (rev 04)
> ff:04.0 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 0 Control Registers (rev 04)
> ff:04.1 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 0 Address Registers (rev 04)
> ff:04.2 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 0 Rank Registers (rev 04)
> ff:04.3 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 0 Thermal Control Registers (rev 04)
> ff:05.0 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 1 Control Registers (rev 04)
> ff:05.1 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 1 Address Registers (rev 04)
> ff:05.2 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 1 Rank Registers (rev 04)
> ff:05.3 Host bridge: Intel Corporation Core Processor Integrated Memory
> Controller Channel 1 Thermal Control Registers (rev 04)
>
> $ lspci -vvv (just the snippet from nvidia card:)
>
> 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS
> 290] (rev a1) (prog-if 00 [VGA controller])
>         Subsystem: NVIDIA Corporation Device 0492
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParEr=
r-
> Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort-
> <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 32 bytes
>         Interrupt: pin A routed to IRQ 51
>         Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=3D1=
6M]
>         Region 1: Memory at f0000000 (64-bit, prefetchable) [size=3D64M]
>         Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=3D3=
2M]
>         Region 5: I/O ports at cc00 [size=3D128]
>         Expansion ROM at fbde0000 [disabled] [size=3D128K]
>         Capabilities: <access denied>
>         Kernel driver in use: nouveau
>         Kernel modules: nouveau
>
> Cooling seems to be fine:
>
> $ sensors
> coretemp-isa-0000
> Adapter: ISA adapter
> Core 0:       +39.0=B0C  (high =3D +83.0=B0C, crit =3D +99.0=B0C)
> Core 1:       +38.0=B0C  (high =3D +83.0=B0C, crit =3D +99.0=B0C)
> Core 2:       +44.0=B0C  (high =3D +83.0=B0C, crit =3D +99.0=B0C)
> Core 3:       +38.0=B0C  (high =3D +83.0=B0C, crit =3D +99.0=B0C)
>
> nouveau-pci-0100
> Adapter: PCI adapter
> temp1:        +65.0=B0C  (high =3D +95.0=B0C, hyst =3D  +3.0=B0C)
>                        (crit =3D +115.0=B0C, hyst =3D  +2.0=B0C)
>                        (emerg =3D +135.0=B0C, hyst =3D  +5.0=B0C)
>
>
> Is this a hardware bug or some driver issue?
> Any hints are welcome.
>
> I am able to patch, compile and test a custom kernel (latest git)
> if its of any use.
>
> Regards,
>
> Clemens
>
> --
> Embeon Systemdesign und Elektronik
> http://www.embeon.de
> ---
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
