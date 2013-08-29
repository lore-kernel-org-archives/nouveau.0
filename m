From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 6/6] drm/nouveau: use MSI interrupts
Date: Thu, 29 Aug 2013 01:00:52 -0400
Message-ID: <CAKb7UvhHncbNN9Q=VM-drJARF74RyZH6Vhb1Gqway1y+fUNyww@mail.gmail.com>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
	<1377648050-6649-7-git-send-email-dev@lynxeye.de>
	<CACAvsv5shyLkE-WdJj6yDx1hhFtNRkuzujxQasWd2MAaVMjJ7A@mail.gmail.com>
	<1377674937.1624.2.camel@tellur>
	<CAKb7Uvini5fD0JRLg4hnc2U7Cq51y0EWzR_yAUuSU0TtQeDvQw@mail.gmail.com>
	<CACAvsv7Ew+0icWEq6ixdtP9Vpux4zeWjV5Lpih94YZWgs_jx4A@mail.gmail.com>
	<CAKb7UvgsJYsD9rvAXziGP716zh1KuKEp5Wq6rzFWjCXFp3a86g@mail.gmail.com>
	<CACAvsv6GPuSAnL+mHkygQHjgu1YVyRpRF7-UVRdV=DiMzFrU5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CACAvsv6GPuSAnL+mHkygQHjgu1YVyRpRF7-UVRdV=DiMzFrU5Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 29, 2013 at 12:45 AM, Ben Skeggs <skeggsb@gmail.com> wrote:
> On Thu, Aug 29, 2013 at 12:20 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>> On Wed, Aug 28, 2013 at 8:07 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
>>> On Wed, Aug 28, 2013 at 11:54 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>> On Wed, Aug 28, 2013 at 3:28 AM, Lucas Stach <dev@lynxeye.de> wrote:
>>>>> Am Mittwoch, den 28.08.2013, 17:09 +1000 schrieb Ben Skeggs:
>>>>>> On Wed, Aug 28, 2013 at 10:00 AM, Lucas Stach <dev@lynxeye.de> wrote:
>>>>>> > MSIs were only problematic on some old, broken chipsets. But now that we
>>>>>> > already see systems where PCI legacy interrupts are somewhat flaky, it's
>>>>>> > really time to move to MSIs.
>>>>>> >
>>>>>> > Signed-off-by: Lucas Stach <dev@lynxeye.de>
>>>>>> > ---
>>>>>> >  drivers/gpu/drm/nouveau/core/include/subdev/mc.h |  1 +
>>>>>> >  drivers/gpu/drm/nouveau/core/subdev/mc/base.c    | 17 +++++++++++++++++
>>>>>> >  2 files changed, 18 insertions(+)
>>>>>> >
>>>>>> > diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>>>>>> > index 9d2cd20..ce6569f 100644
>>>>>> > --- a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>>>>>> > +++ b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
>>>>>> > @@ -12,6 +12,7 @@ struct nouveau_mc_intr {
>>>>>> >  struct nouveau_mc {
>>>>>> >         struct nouveau_subdev base;
>>>>>> >         const struct nouveau_mc_intr *intr_map;
>>>>>> > +       bool use_msi;
>>>>>> >  };
>>>>>> >
>>>>>> >  static inline struct nouveau_mc *
>>>>>> > diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> > index ec9cd6f..02b337e 100644
>>>>>> > --- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> > +++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
>>>>>> > @@ -23,6 +23,7 @@
>>>>>> >   */
>>>>>> >
>>>>>> >  #include <subdev/mc.h>
>>>>>> > +#include <core/option.h>
>>>>>> >
>>>>>> >  static irqreturn_t
>>>>>> >  nouveau_mc_intr(int irq, void *arg)
>>>>>> > @@ -43,6 +44,9 @@ nouveau_mc_intr(int irq, void *arg)
>>>>>> >                 map++;
>>>>>> >         }
>>>>>> >
>>>>>> > +       if (pmc->use_msi)
>>>>>> > +               nv_wr08(pmc->base.base.parent, 0x00088068, 0xff);
>>>>>> Register not present everywhere.
>>>>>>
>>>>>> At the very least, the enabling of MSI should be disallowed on the
>>>>>> earlier chipsets where it's not supported.  Though, it's perhaps
>>>>>> possible that the pci_enable_msi() call will fail in all of these
>>>>>> cases anyway.. I'm not certain.
>>>>>>
>>>>> MSIs are required property for everything doing PCIe. So the only cases
>>>>> where this should fail is plain PCI/AGP devices. I don't really have a
>>>>> test system for those old cards set up.
>>>>>
>>>>> But I remember Ilia having some legacy things plugged in, so maybe he
>>>>> could test this patch and see how it goes?
>>>>
>>>> Sure, let me know what you need -- I have nv18 PCI, nv34 PCIe (note
>>>> that it's not native PCIe, but some sort of bridge thing IIRC),
>>> Cases like the nv34 here (i think there's some nv4x that aren't native
>>> pcie too) are what I'm wondering about primarily.
>>
>> And rightly so. With the NV18 PCI, NV34 PCIe, NV42 PCIe plugged in,
>> with "AutoAddGPU" disabled the NV18 and NV42 seem fine. However merely
>> starting X (not xinit, not startx, not [gkx]dm) on the NV34 and ^C'ing
>> it (with no clients connecting to said X), causes a "failed to idle
>> channel" message in dmesg, which apparently never rectifies itself, so
>> X is hung forever. FTR, there were no displays connected either, but I
>> tried the exact same procedure without the MSI patch and it worked
>> fine. Here is the init sequence with the MSI patch:
> I don't suppose bashing 0x1868 instead of 0x88068 works here?  If not,

Should that work on the NV42 as well?

> next thing would be to mmiotrace the binary driver and see if you can
> make it enable+use MSI on it.  I doubt the current legacy driver does
> it by default, but there was some magic to enable it that you can
> probably find if you google around.

I've yet to set up the legacy driver... I bet it doesn't compile on
3.11, so I'll have to patch it to nuke procfs/i2c...

>
>>
>> [  307.049812] nouveau  [  DEVICE][0000:04:00.0] BOOT0  : 0x034a00b1
>> [  307.049815] nouveau  [  DEVICE][0000:04:00.0] Chipset: NV34 (NV34)
>> [  307.049819] nouveau  [  DEVICE][0000:04:00.0] Family : NV30
>> [  307.050648] nouveau  [   VBIOS][0000:04:00.0] checking PRAMIN for image...
>> [  307.050652] nouveau  [   VBIOS][0000:04:00.0] ... signature not found
>> [  307.050653] nouveau  [   VBIOS][0000:04:00.0] checking PROM for image...
>> [  307.195201] nouveau  [   VBIOS][0000:04:00.0] ... appears to be valid
>> [  307.195205] nouveau  [   VBIOS][0000:04:00.0] using image from PROM
>> [  307.195209] nouveau  [   VBIOS][0000:04:00.0] BMP version 5.29
>> [  307.195429] nouveau  [   VBIOS][0000:04:00.0] version 04.34.20.79.00
>> [  307.195971] nouveau  [ DEVINIT][0000:04:00.0] adaptor not initialised
>> [  307.195979] nouveau  [   VBIOS][0000:04:00.0] running init tables
>> [  307.209253] nouveau 0000:04:00.0: irq 47 for MSI/MSI-X
>> [  307.209266] nouveau  [     PMC][0000:04:00.0] MSI interrupts enabled
>> [  307.209281] nouveau W[  PTIMER][0000:04:00.0] unknown input clock freq
>> [  307.209288] nouveau  [     PFB][0000:04:00.0] RAM type: DDR1
>> [  307.209290] nouveau  [     PFB][0000:04:00.0] RAM size: 64 MiB
>> [  307.209292] nouveau  [     PFB][0000:04:00.0]    ZCOMP: 0 tags
>> [  307.215653] nouveau  [     DRM] VRAM: 63 MiB
>> [  307.215656] nouveau  [     DRM] GART: 128 MiB
>> [  307.215659] nouveau  [     DRM] BMP version 5.41
>> [  307.215662] nouveau  [     DRM] DCB version 2.2
>> [  307.215666] nouveau  [     DRM] DCB outp 00: 01000300 000088b8
>> [  307.215669] nouveau  [     DRM] DCB outp 01: 02010310 000088b8
>> [  307.215672] nouveau  [     DRM] DCB outp 02: 01000302 00000000
>> [  307.215676] nouveau  [     DRM] DCB outp 03: 04010312 00000000
>> [  307.215686] nouveau  [     DRM] Adaptor not initialised, running
>> VBIOS init tables.
>> [  307.215964] nouveau  [     DRM] Saving VGA fonts
>> [  307.310084] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
>> [  307.310087] [drm] No driver support for vblank timestamp query.
>> [  307.310093] nouveau  [     DRM] 0xB61E: Parsing digital output script table
>> [  307.360111] nouveau  [     DRM] 0xB70B: Parsing digital output script table
>> [  307.410799] nouveau  [     DRM] 0 available performance level(s)
>> [  307.410804] nouveau  [     DRM] c: core 249MHz memory 405MHz
>> [  307.412062] nouveau  [     DRM] MM: using M2MF for buffer copies
>> [  307.442478] nouveau 0000:04:00.0: No connectors reported connected with modes
>> [  307.442483] [drm] Cannot find any crtc or sizes - going 1024x768
>> [  307.442669] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
>> ffff8801c73c3800
>> [...]
>> [  360.414044] nouveau E[ X[8294]] failed to idle channel 0xcccc0001 [X[8294]]
>> [  375.403288] nouveau E[ X[8294]] failed to idle channel 0xcccc0001 [X[8294]]
>> [  390.392407] nouveau E[ X[8294]] failed to idle channel 0xcccc0001 [X[8294]]
>>
>> In case it's of interest, this is a Quadro NVS 280 card, here is the
>> lspci output:
>>
>> 04:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV37GL
>> [Quadro PCI-E Series] [10de:00fd] (rev a2) (prog-if 00 [VGA
>> controller])
>>         Subsystem: NVIDIA Corporation Device [10de:0215]
>>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
>> ParErr- Stepping- SERR- FastB2B- DisINTx+
>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
>> <TAbort- <MAbort- >SERR- <PERR- INTx-
>>         Latency: 0, Cache Line Size: 64 bytes
>>         Interrupt: pin A routed to IRQ 47
>>         Region 0: Memory at f4000000 (32-bit, non-prefetchable) [size=16M]
>>         Region 1: Memory at c0000000 (32-bit, prefetchable) [size=256M]
>>         Region 2: Memory at f5000000 (32-bit, non-prefetchable) [size=16M]
>>         [virtual] Expansion ROM at f6000000 [disabled] [size=128K]
>>         Capabilities: [60] Power Management version 2
>>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
>> PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>                 Address: 00000000feeff00c  Data: 4162
>>         Capabilities: [78] Express (v1) Legacy Endpoint, MSI 00
>>                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
>> <512ns, L1 <4us
>>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
>>                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
>> Unsupported-
>>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>>                 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
>> AuxPwr- TransPend-
>>                 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s,
>> Latency L0 <2us, L1 <16us
>>                         ClockPM- Surprise- LLActRep- BwNot-
>>                 LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain- CommClk-
>>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>                 LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train-
>> SlotClk+ DLActive- BWMgmt- ABWMgmt-
>>         Capabilities: [100 v1] Virtual Channel
>>                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>>                 Arb:    Fixed- WRR32- WRR64- WRR128-
>>                 Ctrl:   ArbSelect=Fixed
>>                 Status: InProgress-
>>                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>>                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>>                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
>>                         Status: NegoPending- InProgress-
>>         Capabilities: [128 v1] Power Budgeting <?>
>>         Kernel driver in use: nouveau
>>         Kernel modules: nouveau
>>
>>
>> Let me know if you have any questions about my setup.
>>
>>   -ilia
