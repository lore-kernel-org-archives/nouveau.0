From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Nouveau] [PATCH 6/6] drm/nouveau: use MSI interrupts
Date: Mon, 30 Sep 2013 13:27:48 -0400
Message-ID: <5249B494.5020500@hurleysoftware.com>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>	<CACAvsv5shyLkE-WdJj6yDx1hhFtNRkuzujxQasWd2MAaVMjJ7A@mail.gmail.com>	<1377674937.1624.2.camel@tellur>	<CAKb7Uvini5fD0JRLg4hnc2U7Cq51y0EWzR_yAUuSU0TtQeDvQw@mail.gmail.com>	<CACAvsv7Ew+0icWEq6ixdtP9Vpux4zeWjV5Lpih94YZWgs_jx4A@mail.gmail.com>	<CAKb7UvgsJYsD9rvAXziGP716zh1KuKEp5Wq6rzFWjCXFp3a86g@mail.gmail.com>	<CACAvsv6GPuSAnL+mHkygQHjgu1YVyRpRF7-UVRdV=DiMzFrU5Q@mail.gmail.com>	<CAKb7UvhHncbNN9Q=VM-drJARF74RyZH6Vhb1Gqway1y+fUNyww@mail.gmail.com>	<CACAvsv4AZo-B3MtTh3oN946YAC=vPiR=S3TsEg7R2-hEma57tg@mail.gmail.com>	<CAKb7Uvh2_VC4Wh3GQ5v+YEcD+PoJYYbZdb97BJdpTNyxbZTcxQ@mail.gmail.com>	<CACAvsv5f3vfP1Fs41N=L8Sc_ih32_h5Vz44mjMTJ-WXH9mDe0A@mail.gmail.com>	<CAKb7Uvj_E0h+9RHqOtHJvnV1td+7BmKqKVGTEwLzYkDsyTfJpg@mail.gmail.com>	<CACAvsv6LozC56
 n71FR6DVcrw+jUzRf6YHXtO+mKKPxWJWN-x1Q@mail.gmail.com>	<1377846683.1613.2.camel@tellur>
	<CACAvsv4HWRDuGkxgiYJgnrw9FNTYhHsN8KGMbPUzd4sBqG0Hpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CACAvsv4HWRDuGkxgiYJgnrw9FNTYhHsN8KGMbPUzd4sBqG0Hpg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>, Lucas Stach <dev@lynxeye.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 09/03/2013 09:45 PM, Ben Skeggs wrote:
> On Fri, Aug 30, 2013 at 5:11 PM, Lucas Stach <dev@lynxeye.de> wrote:
>> Am Freitag, den 30.08.2013, 15:36 +1000 schrieb Ben Skeggs:
>>> On Fri, Aug 30, 2013 at 12:01 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>> On Thu, Aug 29, 2013 at 9:58 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
>>>>> On Fri, Aug 30, 2013 at 11:10 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>>>> On Thu, Aug 29, 2013 at 1:07 AM, Ben Skeggs <skeggsb@gmail.com> wrote:
>>>>>>> On Thu, Aug 29, 2013 at 3:00 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>>>>>> On Thu, Aug 29, 2013 at 12:45 AM, Ben Skeggs <skeggsb@gmail.com> wrote:
>>>>>>>>> On Thu, Aug 29, 2013 at 12:20 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>>>>>>>> On Wed, Aug 28, 2013 at 8:07 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
>>>>>>>>>>> On Wed, Aug 28, 2013 at 11:54 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>>>>>>>>>> On Wed, Aug 28, 2013 at 3:28 AM, Lucas Stach <dev@lynxeye.de> wrote:
>>>>>>>>>>>>> Am Mittwoch, den 28.08.2013, 17:09 +1000 schrieb Ben Skeggs:
>>>>>>>>>>>>>> On Wed, Aug 28, 2013 at 10:00 AM, Lucas Stach <dev@lynxeye.de> wrote:
>>>>>>>>>>>>>>> MSIs were only problematic on some old, broken chipsets. But now that we
>>>>>>>>>>>>>>> already see systems where PCI legacy interrupts are somewhat flaky, it's
>>>>>>>>>>>>>>> really time to move to MSIs.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Lucas Stach <dev@lynxeye.de>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>   drivers/gpu/drm/nouveau/core/include/subdev/mc.h |  1 +
>>>>>>>>>>>>>>>   drivers/gpu/drm/nouveau/core/subdev/mc/base.c    | 17 +++++++++++++++++
>>>>>>>>>>>>>>>   2 files changed, 18 insertions(+)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>>>>>>>>>>>>>>> index 9d2cd20..ce6569f 100644
>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>>>>>>>>>>>>>>> @@ -12,6 +12,7 @@ struct nouveau_mc_intr {
>>>>>>>>>>>>>>>   struct nouveau_mc {
>>>>>>>>>>>>>>>          struct nouveau_subdev base;
>>>>>>>>>>>>>>>          const struct nouveau_mc_intr *intr_map;
>>>>>>>>>>>>>>> +       bool use_msi;
>>>>>>>>>>>>>>>   };
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>   static inline struct nouveau_mc *
>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>>>>>>>>>>> index ec9cd6f..02b337e 100644
>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>>>>>>>>>>> @@ -23,6 +23,7 @@
>>>>>>>>>>>>>>>    */
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>   #include <subdev/mc.h>
>>>>>>>>>>>>>>> +#include <core/option.h>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>   static irqreturn_t
>>>>>>>>>>>>>>>   nouveau_mc_intr(int irq, void *arg)
>>>>>>>>>>>>>>> @@ -43,6 +44,9 @@ nouveau_mc_intr(int irq, void *arg)
>>>>>>>>>>>>>>>                  map++;
>>>>>>>>>>>>>>>          }
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +       if (pmc->use_msi)
>>>>>>>>>>>>>>> +               nv_wr08(pmc->base.base.parent, 0x00088068, 0xff);
>>>>>>>>>>>>>> Register not present everywhere.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> At the very least, the enabling of MSI should be disallowed on the
>>>>>>>>>>>>>> earlier chipsets where it's not supported.  Though, it's perhaps
>>>>>>>>>>>>>> possible that the pci_enable_msi() call will fail in all of these
>>>>>>>>>>>>>> cases anyway.. I'm not certain.
>>>>>>>>>>>>>>
>>>>>>>>>>>>> MSIs are required property for everything doing PCIe. So the only cases
>>>>>>>>>>>>> where this should fail is plain PCI/AGP devices. I don't really have a
>>>>>>>>>>>>> test system for those old cards set up.
>>>>>>>>>>>>>
>>>>>>>>>>>>> But I remember Ilia having some legacy things plugged in, so maybe he
>>>>>>>>>>>>> could test this patch and see how it goes?
>>>>>>>>>>>>
>>>>>>>>>>>> Sure, let me know what you need -- I have nv18 PCI, nv34 PCIe (note
>>>>>>>>>>>> that it's not native PCIe, but some sort of bridge thing IIRC),
>>>>>>>>>>> Cases like the nv34 here (i think there's some nv4x that aren't native
>>>>>>>>>>> pcie too) are what I'm wondering about primarily.
>>>>>>>>>>
>>>>>>>>>> And rightly so. With the NV18 PCI, NV34 PCIe, NV42 PCIe plugged in,
>>>>>>>>>> with "AutoAddGPU" disabled the NV18 and NV42 seem fine. However merely
>>>>>>>>>> starting X (not xinit, not startx, not [gkx]dm) on the NV34 and ^C'ing
>>>>>>>>>> it (with no clients connecting to said X), causes a "failed to idle
>>>>>>>>>> channel" message in dmesg, which apparently never rectifies itself, so
>>>>>>>>>> X is hung forever. FTR, there were no displays connected either, but I
>>>>>>>>>> tried the exact same procedure without the MSI patch and it worked
>>>>>>>>>> fine. Here is the init sequence with the MSI patch:
>>>>>>>>> I don't suppose bashing 0x1868 instead of 0x88068 works here?  If not,
>>>>>>>>
>>>>>>>> Should that work on the NV42 as well?
>>>>>>> I believe so.  NV4x has both the 0x18xx and 0x88xxx apertures I believe.
>>>>>>>
>>>>>>>>
>>>>>>>>> next thing would be to mmiotrace the binary driver and see if you can
>>>>>>>>> make it enable+use MSI on it.  I doubt the current legacy driver does
>>>>>>>>> it by default, but there was some magic to enable it that you can
>>>>>>>>> probably find if you google around.
>>>>>>>>
>>>>>>>> I've yet to set up the legacy driver... I bet it doesn't compile on
>>>>>>>> 3.11, so I'll have to patch it to nuke procfs/i2c...
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> [  307.049812] nouveau  [  DEVICE][0000:04:00.0] BOOT0  : 0x034a00b1
>>>>>>>>>> [  307.049815] nouveau  [  DEVICE][0000:04:00.0] Chipset: NV34 (NV34)
>>>>>>>>>> [  307.049819] nouveau  [  DEVICE][0000:04:00.0] Family : NV30
>>>>>>>>>> [  307.050648] nouveau  [   VBIOS][0000:04:00.0] checking PRAMIN for image...
>>>>>>>>>> [  307.050652] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
>>>>>>>>>> [  307.050653] nouveau  [   VBIOS][0000:04:00.0] checking PROM for image...
>>>>>>>>>> [  307.195201] nouveau  [   VBIOS][0000:04:00.0] ... appears to be valid
>>>>>>>>>> [  307.195205] nouveau  [   VBIOS][0000:04:00.0] using image from PROM
>>>>>>>>>> [  307.195209] nouveau  [   VBIOS][0000:04:00.0] BMP version 5.29
>>>>>>>>>> [  307.195429] nouveau  [   VBIOS][0000:04:00.0] version 04.34.20.79.00
>>>>>>>>>> [  307.195971] nouveau  [ DEVINIT][0000:04:00.0] adaptor not initialised
>>>>>>>>>> [  307.195979] nouveau  [   VBIOS][0000:04:00.0] running init tables
>>>>>>>>>> [  307.209253] nouveau 0000:04:00.0: irq 47 for MSI/MSI-X
>>>>>>>>>> [  307.209266] nouveau  [     PMC][0000:04:00.0] MSI interrupts enabled
>>>>>>>>>> [  307.209281] nouveau W[  PTIMER][0000:04:00.0] unknown input clock freq
>>>>>>>>>> [  307.209288] nouveau  [     PFB][0000:04:00.0] RAM type: DDR1
>>>>>>>>>> [  307.209290] nouveau  [     PFB][0000:04:00.0] RAM size: 64 MiB
>>>>>>>>>> [  307.209292] nouveau  [     PFB][0000:04:00.0]    ZCOMP: 0 tags
>>>>>>>>>> [  307.215653] nouveau  [     DRM] VRAM: 63 MiB
>>>>>>>>>> [  307.215656] nouveau  [     DRM] GART: 128 MiB
>>>>>>>>>> [  307.215659] nouveau  [     DRM] BMP version 5.41
>>>>>>>>>> [  307.215662] nouveau  [     DRM] DCB version 2.2
>>>>>>>>>> [  307.215666] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
>>>>>>>>>> [  307.215669] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
>>>>>>>>>> [  307.215672] nouveau  [     DRM] DCB outp 02: 01000302 00000000
>>>>>>>>>> [  307.215676] nouveau  [     DRM] DCB outp 03: 04010312 00000000
>>>>>>>>>> [  307.215686] nouveau  [     DRM] Adaptor not initialised, running
>>>>>>>>>> VBIOS init tables.
>>>>>>>>>> [  307.215964] nouveau  [     DRM] Saving VGA fonts
>>>>>>>>>> [  307.310084] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
>>>>>>>>>> [  307.310087] [drm] No driver support for vblank timestamp query.
>>>>>>>>>> [  307.310093] nouveau  [     DRM] 0xB61E: Parsing digital output script table
>>>>>>>>>> [  307.360111] nouveau  [     DRM] 0xB70B: Parsing digital output script table
>>>>>>>>>> [  307.410799] nouveau  [     DRM] 0 available performance level(s)
>>>>>>>>>> [  307.410804] nouveau  [     DRM] c: core 249MHz memory 405MHz
>>>>>>>>>> [  307.412062] nouveau  [     DRM] MM: using M2MF for buffer copies
>>>>>>>>>> [  307.442478] nouveau 0000:04:00.0: No connectors reported connected with modes
>>>>>>>>>> [  307.442483] [drm] Cannot find any crtc or sizes - going 1024x768
>>>>>>>>>> [  307.442669] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
>>>>>>>>>> ffff8801c73c3800
>>>>>>>>>> [...]
>>>>>>>>>> [  360.414044] nouveau E[ X[8294]] failed to idle channel 0xcccc0001 [X[8294]]
>>>>>>>>>> [  375.403288] nouveau E[ X[8294]] failed to idle channel 0xcccc0001 [X[8294]]
>>>>>>>>>> [  390.392407] nouveau E[ X[8294]] failed to idle channel 0xcccc0001 [X[8294]]
>>>>>>>>>>
>>>>>>>>>> In case it's of interest, this is a Quadro NVS 280 card, here is the
>>>>>>>>>> lspci output:
>>>>>>>>>>
>>>>>>>>>> 04:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV37GL
>>>>>>>>>> [Quadro PCI-E Series] [10de:00fd] (rev a2) (prog-if 00 [VGA
>>>>>>>>>> controller])
>>>>>>>>>>          Subsystem: NVIDIA Corporation Device [10de:0215]
>>>>>>>>>>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
>>>>>>>>>> ParErr- Stepping- SERR- FastB2B- DisINTx+
>>>>>>>>>>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>>>>>>>>>> <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>>>>>>>>          Latency: 0, Cache Line Size: 64 bytes
>>>>>>>>>>          Interrupt: pin A routed to IRQ 47
>>>>>>>>>>          Region 0: Memory at f4000000 (32-bit, non-prefetchable) [size=16M]
>>>>>>>>>>          Region 1: Memory at c0000000 (32-bit, prefetchable) [size=256M]
>>>>>>>>>>          Region 2: Memory at f5000000 (32-bit, non-prefetchable) [size=16M]
>>>>>>>>>>          [virtual] Expansion ROM at f6000000 [disabled] [size=128K]
>>>>>>>>>>          Capabilities: [60] Power Management version 2
>>>>>>>>>>                  Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
>>>>>>>>>> PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>>>>>>>>>                  Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>>>>>>>>>>          Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>>>>>>>>>                  Address: 00000000feeff00c  Data: 4162
>>>>>>>>>>          Capabilities: [78] Express (v1) Legacy Endpoint, MSI 00
>>>>>>>>>>                  DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
>>>>>>>>>> <512ns, L1 <4us
>>>>>>>>>>                          ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
>>>>>>>>>>                  DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
>>>>>>>>>> Unsupported-
>>>>>>>>>>                          RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>>>>>>>>>>                          MaxPayload 128 bytes, MaxReadReq 512 bytes
>>>>>>>>>>                  DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
>>>>>>>>>> AuxPwr- TransPend-
>>>>>>>>>>                  LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s,
>>>>>>>>>> Latency L0 <2us, L1 <16us
>>>>>>>>>>                          ClockPM- Surprise- LLActRep- BwNot-
>>>>>>>>>>                  LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk-
>>>>>>>>>>                          ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>>>>>>>>>                  LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train-
>>>>>>>>>> SlotClk+ DLActive- BWMgmt- ABWMgmt-
>>>>>>>>>>          Capabilities: [100 v1] Virtual Channel
>>>>>>>>>>                  Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>>>>>>>>>>                  Arb:    Fixed- WRR32- WRR64- WRR128-
>>>>>>>>>>                  Ctrl:   ArbSelect=Fixed
>>>>>>>>>>                  Status: InProgress-
>>>>>>>>>>                  VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>>>>>>>>>>                          Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>>>>>>>>>>                          Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>>>>>>>>>>                          Status: NegoPending- InProgress-
>>>>>>>>>>          Capabilities: [128 v1] Power Budgeting <?>
>>>>>>>>>>          Kernel driver in use: nouveau
>>>>>>>>>>          Kernel modules: nouveau
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Let me know if you have any questions about my setup.
>>>>>>>>>>
>>>>>>>>>>    -ilia
>>>>>>
>>>>>> Same problem with the following (whitespace-damanged) diff applied on top:
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> index 02b337e..68a51d4 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> @@ -45,7 +45,7 @@ nouveau_mc_intr(int irq, void *arg)
>>>>>>          }
>>>>>>
>>>>>>          if (pmc->use_msi)
>>>>>> -               nv_wr08(pmc->base.base.parent, 0x00088068, 0xff);
>>>>>> +               nv_wr08(pmc->base.base.parent, 0x1868, 0xff);
>>>>>>
>>>>>>          if (intr) {
>>>>>>                  nv_error(pmc, "unknown intr 0x%08x\n", stat);
>>>>>> @@ -108,7 +108,7 @@ nouveau_mc_create_(struct nouveau_object *parent,
>>>>>> struct nouveau_object *engine,
>>>>>>                  if (ret) {
>>>>>>                          pmc->use_msi = false;
>>>>>>                  } else {
>>>>>> -                       nv_wr08(device, 0x00088068, 0xff);
>>>>>> +                       nv_wr08(device, 0x1868, 0xff);
>>>>>>                          nv_info(pmc, "MSI interrupts enabled\n");
>>>>>>                  }
>>>>>>          }
>>>>>>
>>>>>> I guess this needs a way of telling whether it has "for real" MSI or
>>>>>> not. That 1800 range is on NV41:NV50 according to rnndb, which
>>>>>> probably means that it's safe to use msi on nv41+ (via the 88068
>>>>>> address, since the 1800 stuff disappears on nv50+). [Based purely on
>>>>>> speculation, btw, not on hardware experimentation. I assume
>>>>>> pci_enable_msi() would implicitly fail on any non-pcie card, e.g. nv4a
>>>>>> which is an agp version of nv44, and all the pci versions of the 6200
>>>>>> (and later) cards... i think there are some 8-series pci cards too.]
>>>>> Yeah, I suspect the only case we need to explicitly detect is the
>>>>> BR02-using pretend PCIE cards.
>>>>>
>>>>> What's the pccid of your nv3x board?
>>>>
>>>> I assume that was a typo and you meant "pci id"? If so, 10de:00fd. You
>>>> can see the full info (including ids) in the quoted part above.
>>> Lucas,
>>>
>>> Would you be OK with the patch still, but blacklisting devices with
>>> 10de:00fX/10de:02eX pciids?
>>>
>>> These seem to be the two ranges that indicate that a bridge device is
>>> present (according to xf86-video-nv).
>>>
>> Ok, will put this in for a respin of the series. I personally don't care
>> too much about cards < NV50 at the moment, but if blacklisting those two
>> ranges helps to avoid any breakage it's obviously the right thing to do.
> Well, we can't just go around breaking stuff deliberately for the
> people still using them!
>
> I've blacklisted them myself and merged the patch.

Ben,

This patch causes my dual-head Quadro FX570 (G84) to fail to idle when
dragging a window around.

It loops for the full timeout (15 sec.) in nouveau_gem_ioctl_cpu_prep() --
ie., never reaches required fence sequence #.


lspci -vvv -nn

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84 [Quadro FX 570] [10de:040e] (rev a1) (prog-if 00 [VGA controller])
	Subsystem: NVIDIA Corporation Device [10de:0474]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 52
	Region 0: Memory at de000000 (32-bit, non-prefetchable) [size=16M]
	Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
	Region 3: Memory at dc000000 (64-bit, non-prefetchable) [size=32M]
	Region 5: I/O ports at cc80 [size=128]
	Expansion ROM at dfc00000 [disabled] [size=128K]
	Capabilities: [60] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [78] Express (v1) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	Report errors: Correctable- Non-Fatal+ Fatal+ Unsupported-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
		LnkCap:	Port #8, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0 <512ns, L1 <4us
			ClockPM- Surprise- LLActRep- BwNot-
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
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
	Kernel driver in use: nouveau
	Kernel modules: nouveau, nvidiafb

Regards,
Peter Hurley
