From: Dave Stevenson <dave.stevenson-FnsA7b+Nu9Xg+KzdeAJ3hg@public.gmane.org>
Subject: GT710 and Nouveau on ARM/ARM64
Date: Wed, 28 Oct 2020 13:46:36 +0000
Message-ID: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi

Seeing as we (Raspberry Pi) have just launched the Compute Module 4
with an exposed PCIe x1 lane, people are asking about adding graphics
cards.

Seeing as you are the people who have the knowledge with regard to
NVidia and nouveau, what are your immediate thoughts of nouveau
working on ARM/ARM64? Is there a chance of this working? I'm no PCIe
expert, although I can call on some expertise :-/

I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
in the memset of nvkm_instobj_new whilst initialising the BAR
subdevice [2], having gone through the "No such luck" path in
nvkm_mmu_ptc_get [3].

Taking the naive approach of simply removing the memset, I get through
initialising all the subdevices, but again die in a location I
currently haven't pinpointed. The last logging messages are:
[ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us
[ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us
[ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...
[ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...
[ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us
[ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
02 [PTE] on channel -1 [007fd38000 unknown]
[ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0
[ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32
[ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
type 01 object ffffff80ee8c2170 owner ff
[ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8
[ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass
vers 0 count 0
[ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0
[ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48
[ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
type 01 object ffffff80ee8c2170 owner ff
[ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24
[ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass
vers 0 count 2
[ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0
[ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48

Any input very welcome, otherwise I'll continue blundering about
slightly in the dark.

Thanks
  Dave

[1] https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Monitor-Productivity/dp/B0897T6PYM/
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c#L114
[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c#L201
