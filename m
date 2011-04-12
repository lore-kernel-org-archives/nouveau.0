From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 36163] New: nouveau fails to render framebuffer
 on [GeForce 7300 GS]
Date: Tue, 12 Apr 2011 19:39:13 +0100
Message-ID: <1302633553.4636.11.camel@emo-laptop>
References: <bug-36163-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36163-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Can you please attach both full kernel and X logs (as plain text).
If for some reason you feel that some information is too sensitive to be
shared, please remove it. Try to keep the logs as complete as possible
as they might have some relevant information.

Does the liveCD (guessing Arch as well) load nouveau? If it does it may
be a good idea to attach those logs as well.

Do you recall having problems with previous "version" of nouveau on this
system?

Cheers

On Tue, 2011-04-12 at 07:29 -0700, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=36163
> 
>            Summary: nouveau fails to render framebuffer on [GeForce 7300
>                     GS]
>            Product: xorg
>            Version: git
>           Platform: x86-64 (AMD64)
>         OS/Version: Linux (All)
>             Status: NEW
>           Severity: major
>           Priority: medium
>          Component: Driver/nouveau
>         AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>         ReportedBy: semmikozod-hRtevi7K+EU+Va1GwOuvDg@public.gmane.org
>          QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
> 
> 
> System: Archlinux, kernel 2.6.38.2, no other nvidia driver installed.
> 
> When loading modules at boot, the screen becomes garbled. Still the system
> works, I can blindly type, login and startx, but also the graphical screen is
> garbled. I could fix my system by no other means but using a liveCD and chroot
> into the system.
> 
> Here is the relevant part of the kernel log:
> 
> Apr 11 22:09:11 HomeC kernel: [drm] Initialized drm 1.1.0 20060810
> Apr 11 22:09:11 HomeC kernel: nouveau 0000:02:00.0: PCI INT A -> GSI 24 (level,
> low) -> IRQ 24
> Apr 11 22:09:11 HomeC kernel: nouveau 0000:02:00.0: setting latency timer to 64
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Detected an NV40
> generation card (0x046f00a3)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Attempting to load
> BIOS image from PRAMIN
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: ... appears to be
> valid
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: BIT BIOS found
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Bios version
> 05.72.22.43
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: TMDS table version
> 1.1
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: TMDS table script
> pointers not stubbed
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: BIT table 'd' not
> found
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Found Display
> Configuration Block version 3.0
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 0:
> 01000300 00000028
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 1:
> 02011310 00000028
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 2:
> 01011312 00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Raw DCB entry 3:
> 020223f1 00c0c080
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: DCB connector table:
> VHER 0x30 5 10 2
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0:   0: 0x00000000: type
> 0x00 idx 0 tag 0xff
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0:   1: 0x00002130: type
> 0x30 idx 1 tag 0x08
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0:   2: 0x00000210: type
> 0x10 idx 2 tag 0xff
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0:   3: 0x00000211: type
> 0x11 idx 3 tag 0xff
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0:   4: 0x00000213: type
> 0x13 idx 4 tag 0xff
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init
> table 0 at offset 0xE0F0
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init
> table 1 at offset 0xE41F
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init
> table 2 at offset 0xE9BD
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init
> table 3 at offset 0xEB38
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Parsing VBIOS init
> table 4 at offset 0xED91
> Apr 11 22:09:11 HomeC kernel: agpgart: Detected VIA PT880 Ultra chipset
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: 1 available
> performance level(s)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: 0: memory 800MHz core
> 550MHz fanspeed 100%
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: c: memory 391MHz core
> 199MHz
> Apr 11 22:09:11 HomeC kernel: [TTM] Zone  kernel: Available graphics memory:
> 1029772 kiB.
> Apr 11 22:09:11 HomeC kernel: [TTM] Initializing pool allocator.
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Detected 256MiB VRAM
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: 64 MiB GART
> (aperture)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Saving VGA fonts
> Apr 11 22:09:11 HomeC kernel: [drm] Supports vblank timestamp caching Rev 1
> (10.10.2010).
> Apr 11 22:09:11 HomeC kernel: [drm] No driver support for vblank timestamp
> query.
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000004 Put 0x000000a0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3
> on vga encoder (output 0)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3
> on vga encoder (output 1)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3
> on tmds encoder (output 2)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 3
> on TV encoder (output 3)
> Apr 11 22:09:11 HomeC kernel: agpgart-via 0000:00:00.0: AGP aperture is 64M @
> 0xf8000000
> Apr 11 22:09:11 HomeC kernel: via-rhine.c:v1.10-LK1.5.0 2010-10-09 Written by
> Donald Becker
> Apr 11 22:09:11 HomeC kernel: via-rhine 0000:00:12.0: PCI INT A -> GSI 23
> (level, low) -> IRQ 23
> Apr 11 22:09:11 HomeC kernel: eth0: VIA Rhine II at 0x1c000, 00:19:66:31:9a:97,
> IRQ 23.
> Apr 11 22:09:11 HomeC kernel: eth0: MII PHY found at address 1, status 0x786d
> advertising 05e1 Link 41e1.
> Apr 11 22:09:11 HomeC kernel: sd 0:0:0:0: Attached scsi generic sg0 type 0
> Apr 11 22:09:11 HomeC kernel: sr 2:0:0:0: Attached scsi generic sg1 type 5
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: allocated 1440x900
> fb: 0x49000, bo ffff88007877ac00
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x000000a4 Put 0x00000180 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: 0xD4A0: Parsing
> digital output script table
> Apr 11 22:09:11 HomeC kernel: lp: driver loaded but no devices found
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Setting dpms mode 0
> on tmds encoder (output 2)
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: Output DVI-I-1 is
> running on CRTC 0 using output A
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000184 Put 0x000001b4 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x000001b4 Put 0x000001d0 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x000001d4 Put 0x00000d48 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x00002438 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x00003b28 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x00005d90 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00005d94 Put 0x00007480 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00007484 Put 0x00008b70 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00008b74 Put 0x0000a260 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000a264 Put 0x0000b950 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000b954 Put 0x0000d088 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x0000e7bc State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000e7c4 Put 0x000001f8 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x000018ec State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001904 Put 0x000030b0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x000030b4 Put 0x000047a0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x000047a4 Put 0x00005e90 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00005e94 Put 0x000080f8 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x000097e8 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x0000ba50 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000ba54 Put 0x0000d140 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000d144 Put 0x0000e830 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000e834 Put 0x0000ff20 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000ff24 Put 0x00001750 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001754 Put 0x00002e40 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00002e44 Put 0x00004530 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00004534 Put 0x00005c20 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00005c24 Put 0x00007310 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00007314 Put 0x00008a34 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: Console: switching to colour frame buffer device
> 180x56
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00008a34 Put 0x00008a68 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x00008a84 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00008a84 Put 0x0000b864 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000b864 Put 0x0000cf54 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000cf54 Put 0x0000e644 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000e644 Put 0x0000fd34 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000fd34 Put 0x00008900 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00008904 Put 0x00009ad8 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x0000add8 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x0000d040 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000d044 Put 0x0000e730 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000e734 Put 0x0000fe20 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000fe24 Put 0x00001750 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001754 Put 0x00002e40 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00002e44 Put 0x00004530 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00004534 Put 0x00005c20 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00005c24 Put 0x00007e88 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x0000a0f0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000a0f4 Put 0x0000b7e0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000b7e4 Put 0x0000ced0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000ced4 Put 0x0000e5c0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000e5c4 Put 0x0000fcb0 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x0000fcb4 Put 0x0000154c State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001564 Put 0x00001580 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: fb0: nouveaufb frame buffer device
> Apr 11 22:09:11 HomeC kernel: drm: registered panic notifier
> Apr 11 22:09:11 HomeC kernel: [drm] Initialized nouveau 0.0.16 20090420 for
> 0000:02:00.0 on minor 0
> 
> ....
> 
> and then it goes on flooding the log like this:
> 
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001584 Put 0x0000161c State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001634 Put 0x000016a4 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x000016a4 Put 0x00001840 State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001844 Put 0x00001874 State 0x80001680 Push 0x00000000
> 
> 
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001874 Put 0x000018fc State 0x80000000 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001904 Put 0x00001c40 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001c44 Put 0x00001cdc State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001cf4 Put 0x00001d78 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00000104 Put 0x00001f00 State 0x80001680 Push 0x00000000
> Apr 11 22:09:11 HomeC kernel: [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch
> 0 Get 0x00001f04 Put 0x00001f68 State 0x80001680 Push 0x00000000
> 
> etc.
> 
