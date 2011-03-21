From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35475] New: asus laptop boots to blank screen 2 out
	of 3 times
Date: Sun, 20 Mar 2011 17:03:30 -0700 (PDT)
Message-ID: <bug-35475-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35475

           Summary: asus laptop boots to blank screen 2 out of 3 times
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: marius.melzer-eNlI3vuSufmsTnJN9+BGXg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


System: Asus Pro36 or U36, "Nvidia Optimus" hybrid graphics with a gpu in the
core i5 processor and a dedicated nvidia geforce 310m graphics card.

Software: Next Ubuntu Release (11.04; Natty) with Xorg 7.6, nouveau ddx driver
1:0.0.16+git20110107+b795ca6e-0ubuntu6, libdrm-nouveau1a 2.4.23-1ubuntu5,
Kernel 2.6.38-7-generic

In 2 out of 3 times, my laptop boots very early to a black screen. When using
"nomodeset" it works fine, so it might be a kms-related problem. The laptop is
using hybrid graphics. When looking into the dmesg-logs afterwards, I found
out, that when the nouveau-driver initialises normally, the boot fails and if
the nouveau driver fails, the boot works fine.  Yes, this way round! I guess,
when nouveau fails (interestingly with "chipset not supported reason" that does
not appear the other times), the intel chipset is used.

Dmesg-logs when boot fails:
[    2.011009] VGA switcheroo: detected DSM switching method
\_SB_.PCI0.PEG1.GFX0 handle
[    2.011083] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    2.011089] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    2.011094] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    2.011105] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    2.011111] nouveau 0000:01:00.0: setting latency timer to 64
[    2.068960] i915 0000:00:02.0: irq 43 for MSI/MSI-X
[    2.068966] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    2.068971] [drm] Driver supports precise vblank timestamp query.
[    2.200079] vgaarb: device changed decodes:
PCI:0000:00:02.0,olddecodes=io+mem,decodes=none:owns=io+mem
[    2.200087] vgaarb: transferring owner from PCI:0000:00:02.0 to
PCI:0000:01:00.0
[    2.349958] Console: switching to colour frame buffer device 170x48
[    2.352403] fb0: inteldrmfb frame buffer device
[    2.352423] drm: registered panic notifier

[    2.359734] [drm] nouveau 0000:01:00.0: Unsupported chipset 0xffffffff
[    2.360842] nouveau 0000:01:00.0: PCI INT A disabled
[    2.360907] nouveau: probe of 0000:01:00.0 failed with error -22


dmesg-logs when boots fine:
[    2.615806] VGA switcheroo: detected DSM switching method
\_SB_.PCI0.PEG1.GFX0 handle
[    2.617276] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    2.618659] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    2.620022] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    2.621403] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    2.622778] nouveau 0000:01:00.0: setting latency timer to 64
[    2.626107] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x0a8800b1)
[    2.634129] vga_switcheroo: enabled
[    2.635601] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[    2.637066] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    2.638520] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PROM
[    2.639980] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    2.641428] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PCIROM
[    2.643010] nouveau 0000:01:00.0: Invalid ROM contents
[    2.644512] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[    2.645973] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
ACPI

[    2.890941] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    2.892343] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    2.893732] [drm] nouveau 0000:01:00.0: Bios version 70.18.66.00
[    2.895112] [drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid
[    2.896483] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    2.897844] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[    2.899205] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 02014300 00000000
[    2.900571] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02022362 00020010
[    2.901918] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 0000000e 00000000
[    2.903269] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16
4
[    2.904607] [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag
0xff
[    2.905927] [drm] nouveau 0000:01:00.0:   1: 0x00410146: type 0x46 idx 1 tag
0x51
[    2.907240] [drm] nouveau 0000:01:00.0:   2: 0x00002261: type 0x61 idx 2 tag
0x08
[    2.908552] [drm] nouveau 0000:01:00.0:   3: 0x00001330: type 0x30 idx 3 tag
0x07
[    2.909846] [drm] nouveau 0000:01:00.0:   4: 0x00000400: type 0x00 idx 4 tag
0xff
[    2.911123] [drm] nouveau 0000:01:00.0:   5: 0x00000560: type 0x60 idx 5 tag
0xff
[    2.912394] [drm] nouveau 0000:01:00.0: Adaptor not initialised, running
VBIOS init tables.
[    2.913671] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xDDBB
[    2.939260] [drm] nouveau 0000:01:00.0: 0xDD22: i2c wr fail: -6
[    2.962750] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xE26E
[    3.072704] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xEF2B
[    3.074009] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xEF44
[    3.092760] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xF02B
[    3.093950] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xF090
[    3.141533] [drm] nouveau 0000:01:00.0: 3 available performance level(s)
[    3.142614] [drm] nouveau 0000:01:00.0: 0: memory 135MHz core 135MHz shader
270MHz voltage 850mV
[    3.143698] [drm] nouveau 0000:01:00.0: 1: memory 405MHz core 405MHz shader
810MHz voltage 850mV
[    3.144770] [drm] nouveau 0000:01:00.0: 3: memory 667MHz core 606MHz shader
1468MHz voltage 1000mV
[    3.145856] [drm] nouveau 0000:01:00.0: c: memory 950MHz core 550MHz shader
200MHz voltage 1000mV
[    3.147152] [TTM] Zone  kernel: Available graphics memory: 1921146 kiB.
[    3.148321] [TTM] Initializing pool allocator.
[    3.149445] [drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM
[    3.187176] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    3.252928] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    3.254017] [drm] No driver support for vblank timestamp query.
[    3.266257] [drm] nouveau 0000:01:00.0: ACPI backlight interface available,
not registering our own
[    3.322868] [drm] nouveau 0000:01:00.0: allocated 1024x768 fb: 0x60000000,
bo ffff880139461000
[    3.324049] fb1: nouveaufb frame buffer device
[    3.325169] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
minor 1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
