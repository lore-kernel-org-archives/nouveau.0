From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Sun, 5 Dec 2010 13:38:04 +0200
Message-ID: <20101205133804.5430594f@daedalus.pq.iki.fi>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101205070234.GB4102-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 4 Dec 2010 22:02:34 -0900
Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Wow. This is a fluke.  I got around to the recommendation of installing the
> latest kernel snapshot (2.6.37*), but ended up rebooting using 2.6.35 after
> apparently recompiling nouveau-drm out of kernel driver package.

Does this mean you never got the very latest git kernel modules running?
Unfortunately, problems with earlier versions are easily disregarded as
ancient, especially from 2.6.36 and earlier vanilla kernels.

> The fluke looks to me like for this card, I need to be mighty cautious and
> recompile the nouveau-drm modules more often -- or maybe it was the cold boot
> -- else I get the black/white vertical bars and kernel freeze.
> 
> 
> The following cards seems to work using nouveau framebuffer/Xorg:
> NV40 generation card (0x04b200b1) - G73 [GeForce 7600 GS]
> NV20 generation card (0x025300a3) - NV25 [GeForce4 Ti 4200]
> NV10 generation card (0x011200b2) - NV11 [GeForce2 Go]
> I only noticed some very very minor pixel disintegration when using Xorg &
> Seamonkey using LCars(?) theme colors.  Likely the LCD Display timings(?).
> 
> 
> 
> Anyways, for what it's worth, here's the dmesg output of this GeForce 7600 GS
> card:
> 
> # dmesg |grep nouv
> nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> [drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x04b200b1)
> [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
> [drm] nouveau 0000:01:00.0: ... appears to be valid
> [drm] nouveau 0000:01:00.0: BIT BIOS found
> [drm] nouveau 0000:01:00.0: Bios version 05.73.22.51
> [drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
> [drm] nouveau 0000:01:00.0: BIT table 'd' not found
> [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
> [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
> [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 00000000
> [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
> [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
> [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
> [drm] nouveau 0000:01:00.0:   0: 0x00002030: type 0x30 idx 0 tag 0x08
> [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
> [drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
> [drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
> [drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
> [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xCDAD
> [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD457
> [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDB8B
> [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDD0F
> [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDF1B
> [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
> nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
> [drm] nouveau 0000:01:00.0: 4 MiB GART (aperture)
> [drm] nouveau 0000:01:00.0: Saving VGA fonts
> [drm] nouveau 0000:01:00.0: Allocating FIFO number 0
> [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
> [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
> [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1)
> [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
> [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
> [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x48000, bo f6a56800
> [drm] nouveau 0000:01:00.0: 0xC210: Parsing digital output script table
> [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 1)
> [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 0 using output A

> [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 0

That is a bad problem, which...

> [drm] nouveau 0000:01:00.0: GPU lockup - switching to software fbcon

...forces the GPU unusable. No acceleration whatsoever. The
problem may or may not have been fixed in the latest git. I assume
this log is from 2.6.35, is it not?

> fb0: nouveaufb frame buffer device
> [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0

When you provide kernel logs, please, do not filter them. Nouveau
possibly interacts with lots of other drivers.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
