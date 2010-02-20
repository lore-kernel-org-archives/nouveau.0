From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] nouveau does not fetch edid from connected
 monitor on nforce1 (nv1a)
Date: Sat, 20 Feb 2010 10:02:51 -0800 (PST)
Message-ID: <20100220180251.4075413008D@annarchy.freedesktop.org>
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





--- Comment #14 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org>  2010-02-20 10:02:50 PST ---
(In reply to comment #13)
> Created an attachment (id=33455)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33455) [details]
> nv1a_ddc_3.patch
> 
> Could you try again with this one?
> 

Still no EDID:

[  484.935609] nouveau 0000:02:00.0: PCI INT A -> Link[LNK5] -> GSI 16 (level,
high) -> IRQ 16
[  484.941696] [drm] nouveau 0000:02:00.0: failed to evaluate _DSM: 5
[  484.942152] [drm] nouveau 0000:02:00.0: Detected an NV10 generation card
(0x01a000b1)
[  484.942378] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PROM
[  484.942443] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[  484.942500] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PRAMIN
[  484.987738] [drm] nouveau 0000:02:00.0: ... BIOS checksum invalid
[  484.987791] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PCIROM
[  484.988482] [drm] nouveau 0000:02:00.0: ... appears to be valid
[  484.988859] [drm] nouveau 0000:02:00.0: BMP BIOS found
[  484.988910] [drm] nouveau 0000:02:00.0: BMP version 5.20
[  484.988964] [drm] nouveau 0000:02:00.0: Bios version 03.1a.01.03
[  484.989019] [drm] nouveau 0000:02:00.0: Found Display Configuration Block
version 1.4
[  484.989080] [drm] nouveau 0000:02:00.0: No useful information in BIOS output
table; adding all possible outputs
[  484.989146] [drm] nouveau 0000:02:00.0: Probing TV encoders on I2C bus: 1
[  484.994316] [drm] nouveau 0000:02:00.0: No TV encoders found.
[  484.994661] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset
0xA850
[  484.994723] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset
0xADC5
[  484.994789] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset
0xA851
[  484.994852] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset
0xADC4
[  484.994913] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset
0xA875
[  484.994974] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 5 at offset
0xA931
[  484.995050] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 6 at offset
0xA876
[  484.995126] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 7 at offset
0xA8CC
[  485.008021] [TTM] Zone  kernel: Available graphics memory: 240446 kiB.
[  485.008109] [drm] nouveau 0000:02:00.0: 32 MiB VRAM
[  485.008252] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  485.008323] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  485.008424] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  485.008477] [drm] nouveau 0000:02:00.0: 32 MiB GART (aperture)
[  485.008823] [drm] nouveau 0000:02:00.0: Allocating FIFO number 0
[  485.010856] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised
FIFO 0
[  485.010961] [drm] nouveau 0000:02:00.0: Saving VGA fonts
[  485.056430] [drm] nouveau 0000:02:00.0: Detected a VGA connector
[  485.057261] [drm] nouveau 0000:02:00.0: Detected a DVI-D connector
[  485.058137] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  485.058202] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder
(output 1)
[  485.071773] nv1a i2c base: 5010
[  485.097535] [drm] nouveau 0000:02:00.0: Load detected on head A
[  485.101753] [drm] nouveau 0000:02:00.0: allocated 1024x768 fb: 0x45000, bo
dbcf8400
[  485.102474] fbcon: nouveaufb (fb0) is primary device
[  485.114118] [drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  485.114126] [drm] nouveau 0000:02:00.0: Output VGA-1 is running on CRTC 0
using output @
[  485.115494] Console: switching to colour frame buffer device 128x48
[  485.117021] fb0: nouveaufb frame buffer device
[  485.117024] registered panic notifier
[  485.117494] [drm] Initialized nouveau 0.0.15 20090420 for 0000:02:00.0 on
minor 0
[  485.118838] modprobe used greatest stack depth: 832 bytes left


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
