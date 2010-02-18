From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] nouveau does not fetch edid from connected
 monitor on nforce1 (nv1a)
Date: Thu, 18 Feb 2010 09:47:48 -0800 (PST)
Message-ID: <20100218174748.A3D171300D9@annarchy.freedesktop.org>
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





--- Comment #7 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org>  2010-02-18 09:47:47 PST ---
(In reply to comment #6)
> Created an attachment (id=33363)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33363) [details]
> nv1a_ddc.patch
> 
> Could you try the attached patch? Any effect at all?

Yes there is a difference, it now says that my VGA monitor is connected via DVI
(no such connector!) and does not list card-VGA-* anymore under
/sys/class/dri/.

I would say the visible part is more bad than good... If you need more info,
please ask.

[  652.499815] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[  652.499899] nouveau 0000:02:00.0: PCI INT A -> Link[LNK5] -> GSI 16 (level,
high) -> IRQ 16
[  652.506128] [drm] nouveau 0000:02:00.0: failed to evaluate _DSM: 5
[  652.506577] [drm] nouveau 0000:02:00.0: Detected an NV10 generation card
(0x01a000b1)
[  652.506803] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PROM
[  652.506865] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[  652.506920] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PRAMIN
[  652.552228] [drm] nouveau 0000:02:00.0: ... BIOS checksum invalid
[  652.553204] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PCIROM
[  652.553930] [drm] nouveau 0000:02:00.0: ... appears to be valid
[  652.554311] [drm] nouveau 0000:02:00.0: BMP BIOS found
[  652.554361] [drm] nouveau 0000:02:00.0: BMP version 5.20
[  652.554416] [drm] nouveau 0000:02:00.0: Bios version 03.1a.01.03
[  652.554471] [drm] nouveau 0000:02:00.0: Found Display Configuration Block
version 1.4
[  652.554532] [drm] nouveau 0000:02:00.0: No useful information in BIOS output
table; adding all possible outputs
[  652.554598] [drm] nouveau 0000:02:00.0: Probing TV encoders on I2C bus: 1
[  652.559842] [drm] nouveau 0000:02:00.0: No TV encoders found.
[  652.560217] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset
0xA850
[  652.560280] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset
0xADC5
[  652.560345] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset
0xA851
[  652.560409] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset
0xADC4
[  652.560470] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset
0xA875
[  652.560530] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 5 at offset
0xA931
[  652.560606] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 6 at offset
0xA876
[  652.560682] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 7 at offset
0xA8CC
[  652.573465] [TTM] Zone  kernel: Available graphics memory: 240446 kiB.
[  652.573540] [drm] nouveau 0000:02:00.0: 32 MiB VRAM
[  652.573674] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  652.573741] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  652.573844] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  652.573898] [drm] nouveau 0000:02:00.0: 32 MiB GART (aperture)
[  652.574242] [drm] nouveau 0000:02:00.0: Allocating FIFO number 0
[  652.575687] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised
FIFO 0
[  652.575799] [drm] nouveau 0000:02:00.0: Saving VGA fonts
[  652.621722] [drm] nouveau 0000:02:00.0: Detected a DVI-I connector
[  652.622843] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[  652.622909] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder
(output 1)
[  652.667225] [drm] nouveau 0000:02:00.0: Load detected on head A
[  652.667528] [drm] nouveau 0000:02:00.0: allocated 1024x768 fb: 0x45000, bo
db6f2000
[  652.668186] fbcon: nouveaufb (fb0) is primary device
[  652.680032] [drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[  652.680040] [drm] nouveau 0000:02:00.0: Output DVI-I-1 is running on CRTC 0
using output @
[  652.681377] Console: switching to colour frame buffer device 128x48
[  652.682941] fb0: nouveaufb frame buffer device
[  652.682944] registered panic notifier
[  652.683465] [drm] Initialized nouveau 0.0.15 20090420 for 0000:02:00.0 on
minor 0
[  652.684647] modprobe used greatest stack depth: 848 bytes left


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
