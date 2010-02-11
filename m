From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] New: nouveau does not fetch edid from
 connected monitor on nforce1 (nv1a)
Date: Thu, 11 Feb 2010 12:10:28 -0800 (PST)
Message-ID: <bug-26534-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

           Summary: nouveau does not fetch edid from connected monitor on
                    nforce1 (nv1a)
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Nouveau does not seem to fetch EDID from my monitor (Iiyama E431S, 1280x1024)
connected via VGA to MSI K7N420 Pro, using the onboard nforce graphics.

02:00.0 VGA compatible controller [0300]: nVidia Corporation NVCrush11
        [GeForce2 MX Integrated Graphics] [10de:01a0] (rev b1)
(see bug #25619 for full lspci)

kernel version used: 2.6.33-rc7 from Linus at commit
e28cab42f384745c8a947a9ccd51e4aae52f5d51 with nouveau/for-airlied branch at
commit 13876c6e5fec94e9ea51b73ac025583dd7655345 + commit
d5f669822059651c4db1be94cbab605e1ba5a389 from nouveau/master.

Under /sys/class/drm/card0-VGA-1/ "edid" is empty and "modes" lists only a few
modes: 1024x768 800x600 800x600 848x480 640x480



nouveau entries in kernel log:
[    8.579720] nouveau 0000:02:00.0: PCI INT A -> Link[LNK5] -> GSI 16 (level,
high) -> IRQ 16
[    8.584417] [drm] nouveau 0000:02:00.0: failed to evaluate _DSM: 5
[    8.584793] [drm] nouveau 0000:02:00.0: Detected an NV10 generation card
(0x01a000b1)
[    8.584974] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PROM
[    8.584982] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[    8.584985] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PRAMIN
[    8.629799] [drm] nouveau 0000:02:00.0: ... BIOS checksum invalid
[    8.629803] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from
PCIROM
[    8.630444] [drm] nouveau 0000:02:00.0: ... appears to be valid
[    8.630786] [drm] nouveau 0000:02:00.0: BMP BIOS found
[    8.630789] [drm] nouveau 0000:02:00.0: BMP version 5.20
[    8.630794] [drm] nouveau 0000:02:00.0: Bios version 03.1a.01.03
[    8.630799] [drm] nouveau 0000:02:00.0: Found Display Configuration Block
version 1.4
[    8.630804] [drm] nouveau 0000:02:00.0: No useful information in BIOS output
table; adding all possible outputs
[    8.630809] [drm] nouveau 0000:02:00.0: Probing TV encoders on I2C bus: 1
[    8.635669] [drm] nouveau 0000:02:00.0: No TV encoders found.
[    8.635945] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset
0xA850
[    8.635951] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset
0xADC5
[    8.635958] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset
0xA851
[    8.635964] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset
0xADC4
[    8.635967] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset
0xA875
[    8.635971] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 5 at offset
0xA931
[    8.635989] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 6 at offset
0xA876
[    8.636008] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 7 at offset
0xA8CC
[    8.648284] [TTM] Zone  kernel: Available graphics memory: 240446 kiB.
[    8.648313] [drm] nouveau 0000:02:00.0: 32 MiB VRAM
[    8.648390] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[    8.648409] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[    8.648526] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[    8.648531] [drm] nouveau 0000:02:00.0: 32 MiB GART (aperture)
[    8.649055] [drm] nouveau 0000:02:00.0: Allocating FIFO number 0
[    8.650297] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised
FIFO 0
[    8.650324] [drm] nouveau 0000:02:00.0: Saving VGA fonts
[    8.695505] [drm] nouveau 0000:02:00.0: Detected a VGA connector
[    8.695781] [drm] nouveau 0000:02:00.0: Detected a DVI-D connector
[    8.696494] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder
(output 0)
[    8.696500] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder
(output 1)
[    8.888732] [drm] nouveau 0000:02:00.0: Load detected on head A
[    8.892813] [drm] nouveau 0000:02:00.0: allocated 1024x768 fb: 0x45000, bo
dc1cc200
[    8.893104] fbcon: nouveaufb (fb0) is primary device
[    8.904873] [drm] nouveau 0000:02:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[    8.904881] [drm] nouveau 0000:02:00.0: Output VGA-1 is running on CRTC 0
using output @
[    8.906386] Console: switching to colour frame buffer device 128x48
[    8.908107] fb0: nouveaufb frame buffer device
[    8.908110] registered panic notifier
[    8.908119] [drm] Initialized nouveau 0.0.15 20090420 for 0000:02:00.0 on
minor 0
[  635.030022] [drm] nouveau 0000:02:00.0: Setting dpms mode 1 on vga encoder
(output 0)
[  992.927898] [drm] nouveau 0000:02:00.0: Load detected on head A


Is there anything additional I could provide to help getting the EDID reading
working?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
