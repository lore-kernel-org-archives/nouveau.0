From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] nouveau does not fetch edid from connected
 monitor on nforce1 (nv1a)
Date: Sat, 20 Feb 2010 07:47:15 -0800 (PST)
Message-ID: <20100220154715.4B12C130091@annarchy.freedesktop.org>
References: <bug-26534-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26534-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26534





--- Comment #9 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org>  2010-02-20 07:47:14 PST ---
(In reply to comment #8)
> Created an attachment (id=33448)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33448) [details]
> nv1a_ddc_2.patch
> 
> Any luck with this patch instead?
> 

No EDID discovered yet, but it now detects same connectors as initially:
  card0-DVI-D-1 card0-VGA-1


[  552.251506] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[  552.251587] nouveau 0000:02:00.0: PCI INT A -> Link[LNK5] -> GSI 16 (level,
high) -> IRQ 16
[  552.257353] [drm] nouveau 0000:02:00.0: failed to evaluate _DSM: 5
[  552.257805] [drm] nouveau 0000:02:00.0: Detected an NV10 generation card
(0x01a000b1)
[  552.258032] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PROM
[  552.258095] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[  552.258151] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PRAMIN
[  552.303570] [drm] nouveau 0000:02:00.0: ... BIOS checksum invalid
[  552.303622] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PCIROM
[  552.304347] [drm] nouveau 0000:02:00.0: ... appears to be valid
[  552.304724] [drm] nouveau 0000:02:00.0: BMP BIOS found
[  552.304774] [drm] nouveau 0000:02:00.0: BMP version 5.20
[  552.304828] [drm] nouveau 0000:02:00.0: Bios version 03.1a.01.03
[  552.304883] [drm] nouveau 0000:02:00.0: Found Display Configuration Block
version 1.4
[  552.304944] [drm] nouveau 0000:02:00.0: No useful information in BIOS output
table; adding all possible outputs
[  552.305011] [drm] nouveau 0000:02:00.0: Probing TV encoders on I2C bus: 1
[  552.309221] [drm] nouveau 0000:02:00.0: No TV encoders found.
[  552.309551] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset
0xA850
[  552.309612] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset
0xADC5
[  552.309678] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset
0xA851
[  552.309742] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset
0xADC4
[  552.309803] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset
0xA875
[  552.309864] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 5 at offset
0xA931
[  552.309940] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 6 at offset
0xA876
[  552.310040] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 7 at offset
0xA8CC
[  552.322192] [TTM] Zone  kernel: Available graphics memory: 240446 kiB.
[  552.322268] [drm] nouveau 0000:02:00.0: 32 MiB VRAM
[  552.322401] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  552.322468] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  552.322570] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  552.322625] [drm] nouveau 0000:02:00.0: 32 MiB GART (aperture)
[  552.322985] [drm] nouveau 0000:02:00.0: Allocating FIFO number 0
[  552.324413] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised
FIFO 0
[  552.324524] [drm] nouveau 0000:02:00.0: Saving VGA fonts
[  552.371309] [drm] nouveau 0000:02:00.0: Detected a VGA connector
[  552.372091] [drm] nouveau 0000:02:00.0: Detected a DVI-D connector
[  552.372971] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  552.373035] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder
(output 1)
[  552.383415] nv1a i2c base: 0
[  552.568795] [drm] nouveau 0000:02:00.0: Load detected on head A
[  552.572884] [drm] nouveau 0000:02:00.0: allocated 1024x768 fb: 0x45000, bo
db93f400
[  552.573509] fbcon: nouveaufb (fb0) is primary device
[  552.585146] [drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  552.585153] [drm] nouveau 0000:02:00.0: Output VGA-1 is running on CRTC 0
using output @
[  552.586229] Console: switching to colour frame buffer device 128x48
[  552.587746] fb0: nouveaufb frame buffer device
[  552.587762] registered panic notifier
[  552.587787] [drm] Initialized nouveau 0.0.15 20090420 for 0000:02:00.0 on
minor 0
[  637.700024] [drm] nouveau 0000:02:00.0: Setting dpms mode 1 on vga encoder
(output 0)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
