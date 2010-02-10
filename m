From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26499] New: nouveau driver fails to load
Date: Tue,  9 Feb 2010 18:04:47 -0800 (PST)
Message-ID: <bug-26499-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26499

           Summary: nouveau driver fails to load
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: info-96uw9CIjR0PWwRiSwr8iaA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Below you find the dmesg. Using Fedora 12 2.6.32.7-37.fc12.i686.PAE

Cannot replicate. Is my video card dying or so?

[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: power state changed by ACPI to D0
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 5
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x086500a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... BIOS checksum invalid
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
[drm] nouveau 0000:01:00.0: ... BIOS signature not found
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PCIROM
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 60.86.4f.00
[drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supported
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 14 2
[drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff
[drm] nouveau 0000:01:00.0:   2: 0x00001261: type 0x61 idx 2 tag 0x07
[drm] nouveau 0000:01:00.0:   3: 0x00000310: type 0x10 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000311: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   5: 0x00000313: type 0x13 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00000034
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02011300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02022312 00020010
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 010333f1 00c0c080
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 0000000e 00000000
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xC581
[drm] nouveau 0000:01:00.0: 0xC581: Init table command not found: 0x00
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xC8D1
[drm] nouveau 0000:01:00.0: 0xC8D1: Init table command not found: 0x00
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xD512
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xD604
[drm] nouveau 0000:01:00.0: 0xD617: Init table command not found: 0x6A
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xD7FE
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xD863
[drm] nouveau 0000:01:00.0: 0x0000: Init table command not found: 0x55
[drm] nouveau 0000:01:00.0: 0xD86A: Init table command not found: 0x61
[drm] nouveau 0000:01:00.0: 0xB5E2: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xB758: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xADC8: parsing output script 0
[drm] nouveau 0000:01:00.0: Error reading back PRAMIN at 0x000004d0
[drm] nouveau 0000:01:00.0: gpuobj dbb3fc00 still exists at takedown, refs=1
[drm] nouveau 0000:01:00.0: gpuobj dbb3fa80 still exists at takedown, refs=1
[drm] nouveau 0000:01:00.0: gpuobj dbb3f940 still exists at takedown, refs=0
[drm] nouveau 0000:01:00.0: gpuobj dbb3f8c0 still exists at takedown, refs=1
[drm] nouveau 0000:01:00.0: gpuobj dbb3fc80 still exists at takedown, refs=1
[drm] nouveau 0000:01:00.0: gpuobj dbb3f980 still exists at takedown, refs=1
[drm] nouveau 0000:01:00.0: gpuobj dbb3f780 still exists at takedown, refs=1
nouveau 0000:01:00.0: PCI INT A disabled
nouveau: probe of 0000:01:00.0 failed with error -22


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
