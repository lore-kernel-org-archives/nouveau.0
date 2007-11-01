From: Alfred Zastrow <alfred.zastrow-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Subject: Re: Looking for NV44 testers?
Date: Thu, 01 Nov 2007 14:25:46 +0100
Message-ID: <4729D3DA.4080409@t-online.de>
References: <4729C32E.6050105@t-online.de>	<6a89f9d50711010547q7d06da6dkf919852d87c717e5@mail.gmail.com>
	<4729CFE6.50009@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4729CFE6.50009-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Stephane Marchesin schrieb:
> 
>> Could you also please provide a matching kernel log ?

here ist the crash visible:


Nov  1 14:18:15 z1 kernel: Linux agpgart interface v0.102
Nov  1 14:18:15 z1 kernel: [drm] Initialized drm 1.1.0 20060810
Nov  1 14:18:15 z1 kernel: PCI: Setting latency timer of device
0000:01:00.0 to 64
Nov  1 14:18:15 z1 kernel: [drm] Detected an NV44 generation card
(0x044100a2)
Nov  1 14:18:15 z1 kernel: [drm] Initialized nouveau 0.0.10 20060213 on
minor 0
Nov  1 14:18:15 z1 kernel: [drm] Used old pci detect: framebuffer loaded
Nov  1 14:20:35 z1 kernel: allocation failed: out of vmalloc space - use
vmalloc=<size> to increase size.
Nov  1 14:20:35 z1 kernel: BUG: unable to handle kernel paging request
at virtual address 00010000
Nov  1 14:20:35 z1 kernel:  printing eip:
Nov  1 14:20:35 z1 kernel: fe4bff5f
Nov  1 14:20:35 z1 kernel: *pdpt = 00000000361d9001
Nov  1 14:20:35 z1 kernel: *pde = 0000000036d4a067
Nov  1 14:20:35 z1 kernel: *pte = 0000000000000000
Nov  1 14:20:35 z1 kernel: Oops: 0002 [#1]
Nov  1 14:20:35 z1 kernel: PREEMPT SMP
Nov  1 14:20:35 z1 kernel: Modules linked in: nouveau drm nvidia_agp
agpgart tsdev usbmouse arc4 ecb blkcipher cryptomgr crypto_algapi
rc80211_simple tuner tvaudio rtl8187 msp3400 mac80211 cfg80211 bttv
video_buf eeprom_93cx6 ir_common compat_ioctl32 btcx_risc tveeprom ipv6
evdev k8temp videodev v4l2_common v4l1_compat snd_bt87x fan ohci_hcd
hwmon i2c_nforce2 sg forcedeth snd_hda_intel snd_pcm snd_timer snd
soundcore snd_page_alloc button ehci_hcd usbcore ide_cd cdrom
Nov  1 14:20:35 z1 kernel: CPU:    1
