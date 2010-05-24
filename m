From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Kernel module fails to initialize on AMD751 based
 system with NV34
Date: Mon, 24 May 2010 23:39:30 +0300
Message-ID: <20100524233930.6f954897@daedalus.pq.iki.fi>
References: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
	<AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo-@mail.gmail.com>
	<AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6@mail.gmail.com>
	<AANLkTinDO1dTAEm8cFA9rQ5ba2tkubCtrDgGgHymjt4M@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

On Mon, 24 May 2010 21:02:09 +0200
Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Updating the Bios (latest version for that board was Dec. 2000)
> didn't help. I also tried nouveau with an old TNT2M64 card, but
> that didn't succeed either:
> 
> [    3.443164] nouveau 0000:01:05.0: PCI INT A -> Link[LNKB] ->
> GSI 11 (level, low) -> IRQ 11
> [    3.459167] [drm] nouveau 0000:01:05.0: Detected an NV 0
> generation card (0x20114000)
<clip>

NV0? That's a very bad sign to start with. I'm surprised
Nouveau does not just throw up right there.

Btw. you have not provided a *complete* kernel log from boot.
Plain text attachment would be nice, since your email client
breaks the lines and makes it hard to read. But before that...

> 01:05.0 VGA compatible controller: nVidia Corporation NV5M64 [RIVA
> TNT2 Model 64/Model 64 Pro] (rev 11)
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV-
> VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Interrupt: pin A routed to IRQ 11
> 	Region 0: Memory at ee000000 (32-bit, non-prefetchable)
> [size=16M] Region 1: Memory at e2000000 (32-bit, prefetchable)
> [size=32M] Expansion ROM at efef0000 [disabled] [size=64K]
> 	Capabilities: <access denied>
> 	Kernel modules: nvidiafb, rivafb, nouveau

<clip>

> 01:05.0 VGA compatible controller: nVidia Corporation NV34
> [GeForce FX 5200] (rev a1)
> 	Subsystem: XFX Pine Group Inc. Device 1351
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV-
> VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Interrupt: pin A routed to IRQ 11
> 	Region 0: Memory at ee000000 (32-bit, non-prefetchable)
> [size=16M] Region 1: Memory at d8000000 (32-bit, prefetchable)
> [size=128M] Expansion ROM at efee0000 [disabled] [size=128K]
> 	Capabilities: <access denied>
> 	Kernel modules: nvidiafb, nouveau

These both mention nvidiafb, one of them even rivafb.
Are you sure these are not loaded? (This is a basic
troubleshooting question,
http://nouveau.freedesktop.org/wiki/TroubleShooting )

A complete kernel log would have shown, if these
bad drivers load.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
