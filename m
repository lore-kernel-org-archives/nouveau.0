From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [bisected][3.9.0-rc3] NULL ptr dereference from
	nv50_disp_intr()
Date: Sat, 23 Mar 2013 07:47:40 -0400
Message-ID: <1364039260.3440.5.camel@thor.lan>
References: <1363705988.3413.17.camel@thor.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1363705988.3413.17.camel-AsKIXgLx6sE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2013-03-19 at 11:13 -0400, Peter Hurley wrote:
> On vanilla 3.9.0-rc3, I get this 100% repeatable oops after login when
> the user X session is coming up:

Perhaps I wasn't clear that this happens on every boot and is a
regression from 3.8

I'd be happy to help resolve this but time is of the essence; it would
be a shame to have to revert all of this for 3.9

Regards,
Peter Hurley

> BUG: unable to handle kernel NULL pointer dereference at 0000000000000001
> IP: [<0000000000000001>] 0x0
> PGD 0 
> Oops: 0010 [#1] PREEMPT SMP 
> Modules linked in: ip6table_filter ip6_tables ebtable_nat ebtables ...<snip>...
> CPU 3 
> Pid: 0, comm: swapper/3 Not tainted 3.9.0-rc3-xeon #rc3 Dell Inc. Precision WorkStation T5400  /0RW203
> RIP: 0010:[<0000000000000001>]  [<0000000000000001>] 0x0
> RSP: 0018:ffff8802afcc3d80  EFLAGS: 00010087
> RAX: ffff88029f6e5808 RBX: 0000000000000001 RCX: 0000000000000000
> RDX: 0000000000000096 RSI: 0000000000000001 RDI: ffff88029f6e5808
> RBP: ffff8802afcc3dc8 R08: 0000000000000000 R09: 0000000000000004
> R10: 000000000000002c R11: ffff88029e559a98 R12: ffff8802a376cb78
> R13: ffff88029f6e57e0 R14: ffff88029f6e57f8 R15: ffff88029f6e5808
> FS:  0000000000000000(0000) GS:ffff8802afcc0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 0000000000000001 CR3: 000000029fa67000 CR4: 00000000000007e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> Process swapper/3 (pid: 0, threadinfo ffff8802a355e000, task ffff8802a3535c40)
> Stack:
>  ffffffffa0159d8a 0000000000000082 ffff88029f6e5820 0000000000000001
>  ffff88029f71aa00 0000000000000000 0000000000000000 0000000004000000
>  0000000004000000 ffff8802afcc3e38 ffffffffa01843b5 ffff8802afcc3df8
> Call Trace:
>  <IRQ> 
>  [<ffffffffa0159d8a>] ? nouveau_event_trigger+0xaa/0xe0 [nouveau]
>  [<ffffffffa01843b5>] nv50_disp_intr+0xc5/0x200 [nouveau]
>  [<ffffffff816fbacc>] ? _raw_spin_unlock_irqrestore+0x2c/0x50
>  [<ffffffff816ff98d>] ? notifier_call_chain+0x4d/0x70
>  [<ffffffffa017a105>] nouveau_mc_intr+0xb5/0x110 [nouveau]
>  [<ffffffffa01d45ff>] nouveau_irq_handler+0x6f/0x80 [nouveau]
>  [<ffffffff810eec95>] handle_irq_event_percpu+0x75/0x260
>  [<ffffffff810eeec8>] handle_irq_event+0x48/0x70
>  [<ffffffff810f205a>] handle_fasteoi_irq+0x5a/0x100
>  [<ffffffff810182f2>] handle_irq+0x22/0x40
>  [<ffffffff8170561a>] do_IRQ+0x5a/0xd0
>  [<ffffffff816fc2ad>] common_interrupt+0x6d/0x6d
>  <EOI> 
>  [<ffffffff810449b6>] ? native_safe_halt+0x6/0x10
>  [<ffffffff8101ea1d>] default_idle+0x3d/0x170
>  [<ffffffff8101f736>] cpu_idle+0x116/0x130
>  [<ffffffff816e2a06>] start_secondary+0x251/0x258
> Code:  Bad RIP value.
> RIP  [<0000000000000001>] 0x0
>  RSP <ffff8802afcc3d80>
> CR2: 0000000000000001
> ---[ end trace 907323cb8ce6f301 ]---
> 
> 
> 
> git bisect from 3.8.0 (good) to 3.9.0-rc3 (bad) blames (bisect log
> attached):
> 
> 1d7c71a3e2f77336df536855b0efd2dc5bdeb41b is the first bad commit
> commit 1d7c71a3e2f77336df536855b0efd2dc5bdeb41b
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Jan 31 09:23:34 2013 +1000
> 
>     drm/nouveau/disp: port vblank handling to event interface
>     
>     This removes the nastiness with the interactions between display and
>     software engines when handling vblank semaphore release interrupts.
>     
>     Now, all the semantics are handled in one place (sw) \o/.
>     
>     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> :040000 040000 fbd44f8566271415fd2775ab4b6346efef7e82fe a0730be0f35feaa1476b1447b1d65c4b3b3c0686 M	drivers
> 
> 
> On this hardware:
> nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x084e00a2
> nouveau  [  DEVICE][0000:02:00.0] Chipset: G84 (NV84)
> nouveau  [  DEVICE][0000:02:00.0] Family : NV50
> nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
> nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
> nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
> nouveau  [   VBIOS][0000:02:00.0] BIT signature found
> nouveau  [   VBIOS][0000:02:00.0] version 60.84.63.00.11
> nouveau  [     PFB][0000:02:00.0] RAM type: DDR2
> nouveau  [     PFB][0000:02:00.0] RAM size: 256 MiB
> nouveau  [     PFB][0000:02:00.0]    ZCOMP: 1892 tags
> nouveau  [     DRM] VRAM: 256 MiB
> nouveau  [     DRM] GART: 512 MiB
> nouveau  [     DRM] BIT BIOS found
> nouveau  [     DRM] Bios version 60.84.63.00
> nouveau  [     DRM] TMDS table version 2.0
> nouveau  [     DRM] DCB version 4.0
> nouveau  [     DRM] DCB outp 00: 02000300 00000028
> nouveau  [     DRM] DCB outp 01: 01000302 00000030
> nouveau  [     DRM] DCB outp 02: 04011310 00000028
> nouveau  [     DRM] DCB outp 03: 02011312 00000030
> nouveau  [     DRM] DCB conn 00: 1030
> nouveau  [     DRM] DCB conn 01: 2130
> nouveau  [     DRM] 2 available performance level(s)
> nouveau  [     DRM] 0: core 208MHz shader 416MHz memory 100MHz voltage 1200mV fanspeed 100%
> nouveau  [     DRM] 1: core 460MHz shader 920MHz memory 400MHz voltage 1200mV fanspeed 100%
> nouveau  [     DRM] c: core 459MHz shader 918MHz memory 399MHz voltage 1200mV
> nouveau  [     DRM] MM: using CRYPT for buffer copies
> nouveau  [     DRM] allocated 1680x1050 fb: 0x60000, bo ffff88029ef50400
> fbcon: nouveaufb (fb0) is primary device
> nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
> nouveau 0000:02:00.0: registered panic notifier
> [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on minor 0
> 
> 
> 02:00.0 VGA compatible controller: NVIDIA Corporation G84 [Quadro FX 570] (rev a1) (prog-if 00 [VGA controller])
> 	Subsystem: NVIDIA Corporation Device 0474
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 52
> 	Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
> 	Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
> 	Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
> 	Region 5: I/O ports at dc80 [size=128]
> 	Expansion ROM at fbd00000 [disabled] [size=128K]
> 	Capabilities: [60] Power Management version 2
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [78] Express (v1) Endpoint, MSI 00
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> 		DevCtl:	Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
> 		LnkCap:	Port #8, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0 <512ns, L1 <4us
> 			ClockPM- Surprise- LLActRep- BwNot-
> 		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled- Retrain- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 	Capabilities: [100 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [128 v1] Power Budgeting <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> 	Kernel driver in use: nouveau
> 	Kernel modules: nouveau, nvidiafb
> 
> 
