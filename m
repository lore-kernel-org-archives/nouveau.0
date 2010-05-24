From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel module fails to initialize on AMD751 based
	system with NV34
Date: Mon, 24 May 2010 15:31:36 -0400
Message-ID: <AANLkTilhznHd9eMZPAQTRTndH8lzY37WyizviXebe3Mk@mail.gmail.com>
References: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
	<AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo-@mail.gmail.com>
	<AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6@mail.gmail.com>
	<AANLkTinDO1dTAEm8cFA9rQ5ba2tkubCtrDgGgHymjt4M@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinDO1dTAEm8cFA9rQ5ba2tkubCtrDgGgHymjt4M-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, May 24, 2010 at 3:02 PM, Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> Hi Younes,
>
> Thanks a lot for taking the time to reply to me mail.
>
> Updating the Bios (latest version for that board was Dec. 2000) didn't he=
lp.
> I also tried nouveau with an old TNT2M64 card, but that didn't succeed ei=
ther:
>
> 01:05.0 VGA compatible controller: nVidia Corporation NV5M64 [RIVA
> TNT2 Model 64/Model 64 Pro] (rev 11)
> =A0 =A0 =A0 =A0Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop=
- ParErr-
> Stepping- SERR- FastB2B- DisINTx-
> =A0 =A0 =A0 =A0Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium =
>TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
> =A0 =A0 =A0 =A0Interrupt: pin A routed to IRQ 11
> =A0 =A0 =A0 =A0Region 0: Memory at ee000000 (32-bit, non-prefetchable) [s=
ize=3D16M]
> =A0 =A0 =A0 =A0Region 1: Memory at e2000000 (32-bit, prefetchable) [size=
=3D32M]
> =A0 =A0 =A0 =A0Expansion ROM at efef0000 [disabled] [size=3D64K]
> =A0 =A0 =A0 =A0Capabilities: <access denied>
> =A0 =A0 =A0 =A0Kernel modules: nvidiafb, rivafb, nouveau
>
>
> 01:05.0 VGA compatible controller: nVidia Corporation NV34 [GeForce FX
> 5200] (rev a1)
> =A0 =A0 =A0 =A0Subsystem: XFX Pine Group Inc. Device 1351
> =A0 =A0 =A0 =A0Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop=
- ParErr-
> Stepping- SERR- FastB2B- DisINTx-
> =A0 =A0 =A0 =A0Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium =
>TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
> =A0 =A0 =A0 =A0Interrupt: pin A routed to IRQ 11
> =A0 =A0 =A0 =A0Region 0: Memory at ee000000 (32-bit, non-prefetchable) [s=
ize=3D16M]
> =A0 =A0 =A0 =A0Region 1: Memory at d8000000 (32-bit, prefetchable) [size=
=3D128M]
> =A0 =A0 =A0 =A0Expansion ROM at efee0000 [disabled] [size=3D128K]
> =A0 =A0 =A0 =A0Capabilities: <access denied>
> =A0 =A0 =A0 =A0Kernel modules: nvidiafb, nouveau
>
>
> 00:01.0 PCI bridge: Advanced Micro Devices [AMD] AMD-751 [Irongate]
> AGP Bridge (rev 01)
> =A0 =A0 =A0 =A0Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop=
- ParErr-
> Stepping- SERR+ FastB2B- DisINTx-
> =A0 =A0 =A0 =A0Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium =
>TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
> =A0 =A0 =A0 =A0Latency: 120
> =A0 =A0 =A0 =A0Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-l=
atency=3D32
> =A0 =A0 =A0 =A0I/O behind bridge: 0000c000-0000cfff
> =A0 =A0 =A0 =A0Memory behind bridge: ede00000-efefffff
> =A0 =A0 =A0 =A0Prefetchable memory behind bridge: d5c00000-e5cfffff
> =A0 =A0 =A0 =A0Secondary status: 66MHz+ FastB2B- ParErr- DEVSEL=3Dmedium =
>TAbort-
> <TAbort- <MAbort+ <SERR- <PERR-
> =A0 =A0 =A0 =A0BridgeCtl: Parity- SERR+ NoISA- VGA+ MAbort- >Reset- FastB=
2B-
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscT=
mrSERREn-
> =A0 =A0 =A0 =A0Kernel modules: shpchp
>
>
> Should I file a bug directly against nouveau instead Ubuntu/Fedora?
>
>
> Thanks again, Clemens
>

Both cards show BusMaster- when it should be BusMaster+. Also both
cards have 2 BARs instead of 3. Check your BIOS settings to see if
there's a switch to enable bus mastering. This is an AGP card right?
If it was a PCI card I'd say plug it into another slot since some
slots on some mobos can't do bus mastering, but if it's AGP the only
thing left is a BIOS switch. Just guessing at this point.
