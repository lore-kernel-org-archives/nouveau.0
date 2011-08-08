From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: 8 Aug 2011 11:04:53 -0400
Message-ID: <20110808150453.22943.qmail@science.horizon.com>
References: <20110701201516.GB3162@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110701201516.GB3162-OI9uyE9O0yo@public.gmane.org>
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
Cc: linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Thanks to Marcin for figuring out my "X would not start" problem (console
FB used more memory than text console, resulting in not enough room for
X FB; I dropped console depth & increased video RAM).  So I now have a
working display.

Well, mostly working.  There is still the outstanding problem that
the screen is shifted about 16 pixels down.  The top row of pixels is
replicated to fill the vacant space at the top, while the bottom is
cut off.  The cursor is not shifted, so I'm getting used to compensating
for the 16-pixel offset between the tip of the visible mouse pointer
and the thing I want to click on.

(The count of 16 is based on moving the mouse very slowly and trying to
count pixels; it may be off slightly.)

I have photos, but they're a bit big for mailing list.  And they just show
what I described.

If anyone has any ideas, I'd definitely appreciate them.

00:00.0 Host bridge [0600]: nVidia Corporation nForce2 IGP2 [10de:01e0] (rev a2)
00:00.1 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 1 [10de:01eb] (rev a2)
00:00.2 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 4 [10de:01ee] (rev a2)
00:00.3 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 3 [10de:01ed] (rev a2)
00:00.4 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 2 [10de:01ec] (rev a2)
00:00.5 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 5 [10de:01ef] (rev a2)
00:01.0 ISA bridge [0601]: nVidia Corporation nForce2 ISA Bridge [10de:0060] (rev a3)
00:01.1 SMBus [0c05]: nVidia Corporation nForce2 SMBus (MCP) [10de:0064] (rev a2)
00:02.0 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0067] (rev a3)
00:02.1 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0067] (rev a3)
00:02.2 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0068] (rev a3)
00:04.0 Ethernet controller [0200]: nVidia Corporation nForce2 Ethernet Controller [10de:0066] (rev a1)
00:05.0 Multimedia audio controller [0401]: nVidia Corporation nForce Audio Processing Unit [10de:006b] (rev a2)
00:06.0 Multimedia audio controller [0401]: nVidia Corporation nForce2 AC97 Audio Controler (MCP) [10de:006a] (rev a1)
00:08.0 PCI bridge [0604]: nVidia Corporation nForce2 External PCI Bridge [10de:006c] (rev a3)
00:09.0 IDE interface [0101]: nVidia Corporation nForce2 IDE [10de:0065] (rev a2)
00:0d.0 FireWire (IEEE 1394) [0c00]: nVidia Corporation nForce2 FireWire (IEEE 1394) Controller [10de:006e] (rev a3)
00:1e.0 PCI bridge [0604]: nVidia Corporation nForce2 AGP [10de:01e8] (rev a2)
04:00.0 VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX - nForce GPU] [10de:01f0] (rev a3)

[   39.321483] [drm] Initialized drm 1.1.0 20060810
[   39.617894] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 10
[   39.617907] nouveau 0000:04:00.0: PCI INT A -> Link[LNK5] -> GSI 10 (level, low) -> IRQ 10
[   39.621354] [drm] nouveau 0000:04:00.0: Detected an NV10 generation card (0x01f000a5)
[   39.621605] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PRAMIN
[   39.666221] [drm] nouveau 0000:04:00.0: ... BIOS checksum invalid
[   39.666226] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PROM
[   39.666232] [drm] nouveau 0000:04:00.0: ... BIOS signature not found
[   39.666236] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PCIROM
[   39.666706] [drm] nouveau 0000:04:00.0: ... appears to be valid
[   39.668278] [drm] nouveau 0000:04:00.0: BMP BIOS found
[   39.668282] [drm] nouveau 0000:04:00.0: BMP version 5.21
[   39.668288] [drm] nouveau 0000:04:00.0: Bios version 04.1f.00.07
[   39.668294] [drm] nouveau 0000:04:00.0: Found Display Configuration Block version 2.0
[   39.668301] [drm] nouveau 0000:04:00.0: Raw DCB entry 0: 01000100 000088b8
[   39.668307] [drm] nouveau 0000:04:00.0: Raw DCB entry 1: 02010210 000088b8
[   39.668312] [drm] nouveau 0000:04:00.0: Raw DCB entry 2: 01120132 00000000
[   39.668317] [drm] nouveau 0000:04:00.0: Raw DCB entry 3: 01120232 00000000
[   39.668322] [drm] nouveau 0000:04:00.0: Raw DCB entry 4: 02010121 00000003
[   39.668326] [drm] nouveau 0000:04:00.0: Raw DCB entry 5: 02010221 00000003
[   39.668332] [drm] nouveau 0000:04:00.0: Merging DCB entries 2 and 3
[   39.668336] [drm] nouveau 0000:04:00.0: Merging DCB entries 4 and 5
[   39.669907] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xC284
[   39.669937] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xC4E0
[   39.669948] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xC2E7
[   39.684992] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xC632
[   39.685005] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xC47B
[   39.685014] [drm] nouveau 0000:04:00.0: Unknown memclock table version 0.
[   39.731088] [drm] nouveau 0000:04:00.0: 0 available performance level(s)
[   39.731119] [drm] nouveau 0000:04:00.0: c: core 199MHz memory 200454M
[   39.734870] [TTM] Zone  kernel: Available graphics memory: 444122 kiB.
[   39.734877] [TTM] Zone highmem: Available graphics memory: 1005246 kiB.
[   39.734881] [TTM] Initializing pool allocator.
[   39.734903] [drm] nouveau 0000:04:00.0: Detected 64MiB VRAM
[   39.735038] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[   39.735068] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[   39.735148] nouveau 0000:04:00.0: putting AGP V2 device into 4x mode
[   39.735155] [drm] nouveau 0000:04:00.0: 128 MiB GART (aperture)
[   39.735247] [drm] nouveau 0000:04:00.0: Saving VGA fonts
[   39.782849] [drm] nouveau 0000:04:00.0: Detected TMDS transmitter: sil164
[   39.794896] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   39.794906] [drm] No driver support for vblank timestamp query.
[   39.794932] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 0)
[   39.794940] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[   39.794947] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[   39.794954] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[   39.989410] [drm] nouveau 0000:04:00.0: allocated 1920x1080 fb: 0x49000, bo f586c600
[   39.990919] fbcon: nouveaufb (fb0) is primary device
[   39.991873] Console: switching to colour frame buffer device 240x67
[   39.991893] fb0: nouveaufb frame buffer device
[   39.991897] drm: registered panic notifier
[   39.991916] [drm] Initialized nouveau 0.0.16 20090420 for 0000:04:00.0 on minor 0
[   41.419444] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[   41.419455] [drm] nouveau 0000:04:00.0: Output DVI-D-1 is running on CRTC 0 using output A

Display is 1920x1080 LCD, connected via DVI-D.
