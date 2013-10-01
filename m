From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/6] drm/nouveau: use MSI interrupts
Date: Tue, 01 Oct 2013 13:32:22 -0400
Message-ID: <524B0726.60105@hurleysoftware.com>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>	<CACAvsv5shyLkE-WdJj6yDx1hhFtNRkuzujxQasWd2MAaVMjJ7A@mail.gmail.com>	<1377674937.1624.2.camel@tellur>	<CAKb7Uvini5fD0JRLg4hnc2U7Cq51y0EWzR_yAUuSU0TtQeDvQw@mail.gmail.com>	<CACAvsv7Ew+0icWEq6ixdtP9Vpux4zeWjV5Lpih94YZWgs_jx4A@mail.gmail.com>	<CAKb7UvgsJYsD9rvAXziGP716zh1KuKEp5Wq6rzFWjCXFp3a86g@mail.gmail.com>	<CACAvsv6GPuSAnL+mHkygQHjgu1YVyRpRF7-UVRdV=DiMzFrU5Q@mail.gmail.com>	<CAKb7UvhHncbNN9Q=VM-drJARF74RyZH6Vhb1Gqway1y+fUNyww@mail.gmail.com>	<CACAvsv4AZo-B3MtTh3oN946YAC=vPiR=S3TsEg7R2-hEma57tg@mail.gmail.com>	<CAKb7Uvh2_VC4Wh3GQ5v+YEcD+PoJYYbZdb97BJdpTNyxbZTcxQ@mail.gmail.com>	<CACAvsv5f3vfP1Fs41N=L8Sc_ih32_h5Vz44mjMTJ-WXH9mDe0A@mail.gmail.com>	<CAKb7Uvj_E0h+9RHqOtHJvnV1td+7BmKqKVGTEwLzYkDsyTfJpg@mail.gmail.com>	<CACAvsv6LozC56
 n71FR6DVcrw+jUzRf6YHXtO+mKKPxWJWN-x1Q@mail.gmail.com>	<1377846683.1613.2.camel@tellur>	<CACAvsv4HWRDuGkxgiYJgnrw9FNTYhHsN8KGMbPUzd4sBqG0Hpg@mail.gmail.com>
	<5249B494.5020500@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5249B494.5020500-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 09/30/2013 01:27 PM, Peter Hurley wrote:
> On 09/03/2013 09:45 PM, Ben Skeggs wrote:
>> Well, we can't just go around breaking stuff deliberately for the
>> people still using them!
>>
>> I've blacklisted them myself and merged the patch.
>
> Ben,
>
> This patch causes my dual-head Quadro FX570 (G84) to fail to idle when
> dragging a window around.
>
> It loops for the full timeout (15 sec.) in nouveau_gem_ioctl_cpu_prep() --
> ie., never reaches required fence sequence #.

FWIW, I can get the binary 319.32 driver to run this hardware
with MSIs on [1] and not crash in similar circumstances.

But repeating the testing on 3.12.0-rc2/3 has proved challenging.
Although I have the binary driver running on 3.12.0-rc2, the
userspace won't fully come up and I haven't figured out why
(it's an old userspace that I don't use regularly, so it could
be some other problem).

Regards,
Peter Hurley

[1] lspci -vvv -nn on 3.2.x

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84GL [Quadro FX 570] [10de:040e] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: NVIDIA Corporation Device [10de:0474]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 94
	Region 0: Memory at de000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
	Region 3: Memory at dc000000 (64-bit, non-prefetchable) [size=32M]
	Region 5: I/O ports at cc80 [size=128]
	[virtual] Expansion ROM at dfc00000 [disabled] [size=128K]
	Capabilities: [60] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee1100c  Data: 41c9
	Capabilities: [78] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
		LnkCap:	Port #8, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0 <512ns, L1 <4us
			ClockPM- Surprise- LLActRep- BwNot-
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis+
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB
	Capabilities: [100 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=01
			Status:	NegoPending- InProgress-
	Capabilities: [128 v1] Power Budgeting <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
	Kernel driver in use: nvidia
	Kernel modules: nvidia_319_updates, nouveau, nvidiafb
