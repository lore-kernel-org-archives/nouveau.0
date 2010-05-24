From: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel module fails to initialize on AMD751 based
	system with NV34
Date: Mon, 24 May 2010 21:02:09 +0200
Message-ID: <AANLkTinDO1dTAEm8cFA9rQ5ba2tkubCtrDgGgHymjt4M@mail.gmail.com>
References: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
	<AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo-@mail.gmail.com>
	<AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Younes,

Thanks a lot for taking the time to reply to me mail.

Updating the Bios (latest version for that board was Dec. 2000) didn't help.
I also tried nouveau with an old TNT2M64 card, but that didn't succeed either:

[    3.443164] nouveau 0000:01:05.0: PCI INT A -> Link[LNKB] -> GSI 11
(level, low) -> IRQ 11
[    3.459167] [drm] nouveau 0000:01:05.0: Detected an NV 0 generation
card (0x20114000)
[    3.459418] [drm] nouveau 0000:01:05.0: Attempting to load BIOS
image from PROM
[    3.543330] [drm] nouveau 0000:01:05.0: ... appears to be valid
[    3.544296] [drm] nouveau 0000:01:05.0: BMP BIOS found
[    3.544306] [drm] nouveau 0000:01:05.0: BMP version 2.1
[    3.544318] [drm] nouveau 0000:01:05.0: Bios version 02.05.13.00
[    3.544329] [drm] nouveau 0000:01:05.0: Assuming a CRT output exists
[    3.544339] [drm] nouveau 0000:01:05.0: Probing TV encoders on I2C bus: 1
[    3.549933] [drm] nouveau 0000:01:05.0: No TV encoders found.
[    3.571730] [TTM] Zone  kernel: Available graphics memory: 189918 kiB.
[    3.571781] [drm] nouveau 0000:01:05.0: 32 MiB VRAM
[    3.571927] agpgart-amdk7 0000:00:00.0: AGP 1.0 bridge
[    3.571968] agpgart-amdk7 0000:00:00.0: putting AGP V2 device into 1x mode
[    3.572069] nouveau 0000:01:05.0: putting AGP V2 device into 1x mode
[    3.572083] [drm] nouveau 0000:01:05.0: 64 MiB GART (aperture)
[    3.573660] [drm] nouveau 0000:01:05.0: Allocating FIFO number 0
[    3.579725] [TTM] AGP Bind memory failed.
[    3.579746] [TTM] Couldn't bind backend.
[    3.580113] [drm] nouveau 0000:01:05.0: error allocating DMA push buffer: -22
[    3.580124] [drm] nouveau 0000:01:05.0: pushbuf -12
[    3.580133] [drm] nouveau 0000:01:05.0: nouveau_channel_free: freeing fifo 0
[    3.580400] [TTM] Zone  kernel: Used memory at exit: 0 kiB.
[    3.582843] nouveau 0000:01:05.0: PCI INT A disabled
[    3.582878] nouveau: probe of 0000:01:05.0 failed with error -12


01:05.0 VGA compatible controller: nVidia Corporation NV5M64 [RIVA
TNT2 Model 64/Model 64 Pro] (rev 11)
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at ee000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at e2000000 (32-bit, prefetchable) [size=32M]
	Expansion ROM at efef0000 [disabled] [size=64K]
	Capabilities: <access denied>
	Kernel modules: nvidiafb, rivafb, nouveau


> Seems to be failing on trying to read from the user area (despite the
> ioremap of that area succeeding), but before that there is another
> failure that forces it to take the channel down before it's fully
> initialized. Can you paste the output of lspci -vv for the video card
> just out of curiousity?

Sure:

01:05.0 VGA compatible controller: nVidia Corporation NV34 [GeForce FX
5200] (rev a1)
	Subsystem: XFX Pine Group Inc. Device 1351
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at ee000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at d8000000 (32-bit, prefetchable) [size=128M]
	Expansion ROM at efee0000 [disabled] [size=128K]
	Capabilities: <access denied>
	Kernel modules: nvidiafb, nouveau


00:01.0 PCI bridge: Advanced Micro Devices [AMD] AMD-751 [Irongate]
AGP Bridge (rev 01)
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 120
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=32
	I/O behind bridge: 0000c000-0000cfff
	Memory behind bridge: ede00000-efefffff
	Prefetchable memory behind bridge: d5c00000-e5cfffff
	Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Kernel modules: shpchp


Should I file a bug directly against nouveau instead Ubuntu/Fedora?


Thanks again, Clemens
