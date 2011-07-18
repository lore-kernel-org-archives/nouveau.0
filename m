From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39330] New: nVidia GF108 [Quadro 1000M] gives:
 "PGRAPH: unsupported chipset, please report!"
Date: Mon, 18 Jul 2011 06:05:20 -0700 (PDT)
Message-ID: <bug-39330-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39330

           Summary: nVidia GF108 [Quadro 1000M] gives: "PGRAPH:
                    unsupported chipset, please report!"
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mikko.tiihonen-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Running latest rawhide on Lenovo W520 laptop with Quadro 1000M card:

[drm] nouveau 0000:01:00.0: PGRAPH: unsupported chipset, please report!

xorg-x11-drv-nouveau-0.0.16-25.20110324git8378443.fc16.x86_64
kernel-3.0-0.rc7.git0.1.fc16.x86_64

lspci device information
01:00.0 0300: 10de:0dfa (rev a1)
01:00.0 VGA compatible controller: nVidia Corporation GF108 [Quadro 1000M] (rev
a1)

[    4.725472] [drm] nouveau 0000:01:00.0: Detected an NVc0 generation card
(0x0c1d00a1)
[    4.739676] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    4.800772] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    4.800776] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    4.800778] [drm] nouveau 0000:01:00.0: Bios version 70.08.55.00
[    4.800780] [drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid
[    4.800882] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    4.800885] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[    4.800888] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01800323 00010034
[    4.800891] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011300 00000000
[    4.800893] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 028223a6 0f220010
[    4.800895] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02822362 00020010
[    4.800897] [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 048333b6 0f220010
[    4.800899] [drm] nouveau 0000:01:00.0: Raw DCB entry 5: 04833372 00020010
[    4.800901] [drm] nouveau 0000:01:00.0: Raw DCB entry 6: 088443c6 0f220010
[    4.800903] [drm] nouveau 0000:01:00.0: Raw DCB entry 7: 08844382 00020010
[    4.800905] [drm] nouveau 0000:01:00.0: Raw DCB entry 8: 0000000e 00000000
[    4.800908] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16
4
[    4.800910] [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag
0xff
[    4.800913] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag
0xff
[    4.800915] [drm] nouveau 0000:01:00.0:   2: 0x00101246: type 0x46 idx 2 tag
0x07
[    4.800918] [drm] nouveau 0000:01:00.0:   3: 0x00202346: type 0x46 idx 3 tag
0x08
[    4.800928] [drm] nouveau 0000:01:00.0:   4: 0x00410446: type 0x46 idx 4 tag
0x51
[    4.800932] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xD4E1
[    4.822109] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xDB3D
[    4.829245] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xED43
[    4.829255] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xED47
[    4.829316] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xEE2F
[    4.829323] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xEE94
[    4.849313] [drm] nouveau 0000:01:00.0: 0xD41A: Condition still not met
after 20ms, skipping following opcodes
[    4.870252] [drm] nouveau 0000:01:00.0: 3 available performance level(s)
[    4.870256] [drm] nouveau 0000:01:00.0: 0: memory 135MHz core 50MHz shader
101MHz voltage 830mV timing 4
[    4.870259] [drm] nouveau 0000:01:00.0: 1: memory 324MHz core 202MHz shader
405MHz voltage 830mV timing 5
[    4.870262] [drm] nouveau 0000:01:00.0: 3: memory 900MHz core 700MHz shader
1400MHz voltage 1080mV timing 6
[    4.870969] [TTM] Zone  kernel: Available graphics memory: 8198230 kiB.
[    4.870971] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB.
[    4.870973] [TTM] Initializing pool allocator.
[    4.871098] [drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM
[    4.894786] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    4.894824] [drm] nouveau 0000:01:00.0: PGRAPH: unsupported chipset, please
report!
[    4.902862] [drm] nouveau 0000:01:00.0: ACPI backlight interface available,
not registering our own
[    4.905058] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    4.905060] [drm] No driver support for vblank timestamp query.
[    5.382950] [drm] nouveau 0000:01:00.0: allocated 1920x1200 fb: 0x8020000,
bo ffff88041edb4d10
[    5.383447] fbcon: nouveaufb (fb0) is primary device
[    6.754561] Console: switching to colour frame buffer device 200x56
[    6.758697] fb0: nouveaufb frame buffer device
[    6.758699] drm: registered panic notifier
[    6.758758] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
minor 0

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
