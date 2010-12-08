From: rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Wed, 8 Dec 2010 03:23:00 -0900
Message-ID: <20101208122300.GA4480@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
	<20101204075925.GB4170@localhost2.local>
	<20101205070234.GB4102@localhost2.local>
	<20101205133804.5430594f@daedalus.pq.iki.fi>
	<20101206011231.GC4122@localhost2.local>
	<20101208093458.GA11429@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101208093458.GA11429-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Here's the last bit I got from syslog right after loading the nouveau.ko module.  All other ch7006, ttm, drm, drm_kms_helper modules seem to load fine.  Just when nouveau.ko module is loaded, according to the last line gotten indicates the freeze occurs at or right after handover to framebuffer.

Here's the output of syslog just prior to system lockup.

(I'm still trying to get kdump working here but it's being a pain in the arse on the "kexec -p" option with "crashkernel=" ... I'm pretty sure I did it right as I saw something funky written in at the end of /proc/cmdline. <shrugs>)


08 03:07:48 [kernel] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
Dec 08 03:07:48 [kernel] [drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x04b200b1)
Dec 08 03:07:48 [kernel] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: ... appears to be valid
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: BIT BIOS found
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Bios version 05.73.22.51
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: BIT table 'd' not found
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 00000000
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 020223f1 00c0c080
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0:   0: 0x00002030: type 0x30 idx 0 tag 0x08
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xCDAD
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD457
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDB8B
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDD0F
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDF1B
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
Dec 08 03:07:49 [kernel] [TTM] Zone  kernel: Available graphics memory: 446486 kiB.
Dec 08 03:07:49 [kernel] [TTM] Zone highmem: Available graphics memory: 516058 kiB.
Dec 08 03:07:49 [kernel] [TTM] Initializing pool allocator.
Dec 08 03:07:49 [kernel] agpgart-intel 0000:00:00.0: AGP 1.0 bridge
Dec 08 03:07:49 [kernel] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
Dec 08 03:07:49 [kernel] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: 4 MiB GART (aperture)
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Saving VGA fonts
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Allocating FIFO number 0
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1)
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 3)
Dec 08 03:07:49 [kernel] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x48000, bo f4b64800


-- 
Roger
http://rogerx.freeshell.org/
