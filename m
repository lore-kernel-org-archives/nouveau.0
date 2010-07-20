From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29171] New: Garbled console on Macbook 13" (6,
 1 9400M]) when using EFI
Date: Tue, 20 Jul 2010 06:57:59 -0700 (PDT)
Message-ID: <bug-29171-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29171

           Summary: Garbled console on Macbook 13" (6,1 9400M]) when using
                    EFI
           Product: xorg
           Version: 7.5
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: felix.leimbach-hi6Y0CQ0nG0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=37238)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=37238)
Kernel config for EFI boot

On my macbook 13" (late 2009, 6,1) with a GeForce 9400M (0x0ac180b1) when
booting nouveaufb kicks in and displays a garbled screen. Mostly black, some
greenish lines, some very unreadable text.

Interestingly, that only happens when I use the Macbook's native EFI mode (i.e.
*without* BIOS emulation).
If I use the BIOS emulation then nouveau works.

Typing blindly, I extracted the dmesg output, from an EFI boot:

#grep -i -e drm -e nouv -e fb efi-dmesg
Kernel command line: BOOT_IMAGE=/boot/experimental root=/dev/sda5 video=efifb
reboot=pci
efifb: probing for efifb
efifb: framebuffer at 0xc0010000, mapped to 0xffffc90004580000, using 6400k,
total 6400k
efifb: mode is 1280x800x32, linelength=8192, pages=1
efifb: scrolling: redraw
efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
fb0: EFI VGA frame buffer device
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:02:00.0: enabling device (0002 -> 0003)
nouveau 0000:02:00.0: PCI INT A -> Link[LGPU] -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:02:00.0: setting latency timer to 64
[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x0ac180b1)
fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing generic driver
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from ACPI
[drm] nouveau 0000:02:00.0: ... BIOS signature not found
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:02:00.0: ... appears to be valid
[drm] nouveau 0000:02:00.0: BIT BIOS found
[drm] nouveau 0000:02:00.0: Bios version 62.79.77.00
[drm] nouveau 0000:02:00.0: TMDS table revision 2.0 not currently supported
[drm] nouveau 0000:02:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:02:00.0: Raw DCB entry 0: 01000123 00010014
[drm] nouveau 0000:02:00.0: Raw DCB entry 1: 02021232 00000010
[drm] nouveau 0000:02:00.0: Raw DCB entry 2: 02021286 0f220010
[drm] nouveau 0000:02:00.0: Raw DCB entry 3: 0000000e 00000000
[drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:02:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[drm] nouveau 0000:02:00.0:   1: 0x0000a146: type 0x46 idx 1 tag 0x08
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xDC70
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xDF48
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xDF4A
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xE00B
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xE0D0
[drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset 0xE135
[drm] nouveau 0000:02:00.0: 0xE135: Condition still not met after 20ms,
skipping following opcodes
[drm] nouveau 0000:02:00.0: Couldn't find matching output script table
[drm] nouveau 0000:02:00.0: 0xC88E: parsing output script 0
[drm] nouveau 0000:02:00.0: 0xCB5A: parsing output script 0
[drm] nouveau 0000:02:00.0: Detected 256MiB VRAM
[drm] nouveau 0000:02:00.0: Stolen system memory at: 0x0070000000
[drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
[drm] nouveau 0000:02:00.0: Allocating FIFO number 1
[drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised FIFO 1
[drm] nouveau 0000:02:00.0: Detected a LVDS output
[drm] nouveau 0000:02:00.0: Detected a TMDS output
[drm] nouveau 0000:02:00.0: Detected a DP output
[drm] nouveau 0000:02:00.0: Detected a LVDS connector
[drm] nouveau 0000:02:00.0: Detected a DisplayPort connector
[drm] nouveau 0000:02:00.0: timeout: (0x610200 & 0x1e0000) != 0
[drm] nouveau 0000:02:00.0: 0x610200 = 0x0c052b08
[drm] nouveau 0000:02:00.0: timeout: (0x610200 & 0x1e0000) == 0
[drm] nouveau 0000:02:00.0: 0x610200 = 0x0c050008
[drm] nouveau 0000:02:00.0: nouveau_channel_free: freeing fifo 1
nouveau 0000:02:00.0: PCI INT A disabled
nouveau: probe of 0000:02:00.0 failed with error -16

Kernel version: 2.6.35-rc3 (config attached)
Distribution: Gentoo

What's wrong? Let me know if you need anything, can even provide shell access
if need be.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
