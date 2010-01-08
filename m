From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25952] New: GeForce 9800 GTX - nouveau_init takes ~
 1 minute to complete
Date: Fri,  8 Jan 2010 12:04:49 -0800 (PST)
Message-ID: <bug-25952-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25952

           Summary: GeForce 9800 GTX - nouveau_init takes ~ 1 minute to
                    complete
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bugs.freedesktop.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32533)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32533)
complete kernel boot-log with initcall_debug enabled

[2010-01-01 13:52] upgraded kernel26 (2.6.31.6-1 -> 2.6.32.2-2)
[2010-01-01 13:52] upgraded nouveau-drm (0.0.15_20091120-1 ->
0.0.15_20091220-1)
[2010-01-01 13:52] upgraded xf86-video-nouveau (0.0.10_git20091101-1 ->
0.0.10_git20091221-1)

My computer runs ArchLinux, and since I upgraded the above packages; my booting
process takes about a minute longer to complete. This seems to be caused by
nouveau_init; which hangs the complete system for about a minute. An excerpt
from the attached logfile:

calling  nouveau_init+0x0/0x4c [nouveau] @ 42
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x092900a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 62.92.5d.00
[drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supported
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:01:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
[drm] nouveau 0000:01:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 02000300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01000302 00020030
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02011312 00020030
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 010223f1 00c0c080
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xC718
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xCC63
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDA58
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDB56
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDDBE
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xDE23
[drm] nouveau 0000:01:00.0: 0xDE23: Condition still not met after 20ms,
skipping following opcodes
[drm] nouveau 0000:01:00.0: 0xB6C4: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xB6C4: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xA2EE: parsing output script 0
[TTM] Zone  kernel: Available graphics memory: 2028336 kiB.
[drm] nouveau 0000:01:00.0: 512 MiB VRAM
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
mtrr: type mismatch for c0000000,20000000 old: write-back new: write-combining
nouveau 0000:01:00.0: firmware: requesting nouveau/nv92.ctxprog
[drm] nouveau 0000:01:00.0: No ctxprog for NV92
[drm] nouveau 0000:01:00.0: Detected a DAC output
[drm] nouveau 0000:01:00.0: Detected a TMDS output
[drm] nouveau 0000:01:00.0: Detected a DAC output
[drm] nouveau 0000:01:00.0: Detected a TMDS output
[drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x40180000, bo
ffff88013e847800
[drm] TMDS-8: set mode 1680x1050 19
[drm] nouveau 0000:01:00.0: 0xB6C8: parsing output script 1
[drm] nouveau 0000:01:00.0: 0xB6C9: parsing output script 2
[drm] nouveau 0000:01:00.0: 0xB50F: parsing clock script 0
Console: switching to colour frame buffer device 210x65
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
initcall nouveau_init+0x0/0x4c [nouveau] returned 0 after 59002907 usecs

I couldn't find a bug describing this problem.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
