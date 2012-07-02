From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51645] New: Unreadable and flickering text in
	iceweasel
Date: Mon, 02 Jul 2012 07:23:36 +0000
Message-ID: <bug-51645-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51645

             Bug #: 51645
           Summary: Unreadable and flickering text in iceweasel
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: klaasdc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 63688
  --> https://bugs.freedesktop.org/attachment.cgi?id=63688
Unreadable text in Iceweasel 10.0.4 in Gmail

Since a few months I'm experiencing unreadable text in iceweasel/firefox.
It always happens in iceweasel (10.0.4) and rarely (but sometimes) in other
applications such as Eclipse.

Most of the time, the text is garbled, but sometimes it is just replaced with
some other line on the same or a previous page. It is the worst when loading
Gmail, even buttons can be unreadable and sometimes the text keeps flickering
from black blocks to "noisy" blocks etc. Most of the time selecting the
offending part of the screen 1 or multiple times makes it render correctly long
enough to be able to read it.

I have attached a screenshot to better illustrate what I mean.

Currently, I'm using Debian AMD64 (unstable) on a Dell E6500 with an nVidia
Quadro NVS 160M. The installed nouveau package is
1:0.0.16+git20120322+ab7291d-1. Originally I thought I had screwed something up
with my installation, but after a fresh install of Debian Wheezy the problem is
still there. Again, mostly in iceweasel (13.0).




Relevant dmesg output below:
-------------------------------------------------------
[8.688997] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x298580a2)
[    8.693435] [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[    8.797110] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    8.797113] [drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
[    8.797117] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    8.797120] [drm] nouveau 0000:01:00.0: Bios version 62.98.73.00
[    8.797122] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    8.797296] [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
[    8.797299] [drm] nouveau 0000:01:00.0: DCB version 4.0
[    8.797301] [drm] nouveau 0000:01:00.0: DCB outp 00: 01000323 00010034
[    8.797304] [drm] nouveau 0000:01:00.0: DCB outp 01: 02011300 00000028
[    8.797306] [drm] nouveau 0000:01:00.0: DCB outp 02: 02022386 0f200010
[    8.797308] [drm] nouveau 0000:01:00.0: DCB outp 03: 02022332 00020010
[    8.797310] [drm] nouveau 0000:01:00.0: DCB outp 04: 040333a6 0f200010
[    8.797312] [drm] nouveau 0000:01:00.0: DCB outp 05: 04033312 00020010
[    8.797314] [drm] nouveau 0000:01:00.0: DCB conn 00: 00000040
[    8.797316] [drm] nouveau 0000:01:00.0: DCB conn 01: 00000100
[    8.797318] [drm] nouveau 0000:01:00.0: DCB conn 02: 00005246
[    8.797320] [drm] nouveau 0000:01:00.0: DCB conn 03: 0000a346
[    8.797331] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xDB61
[    8.822744] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xDF66
[    8.829628] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xE771
[    8.829644] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xE83F
[    8.830756] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xEAF5
[    8.830762] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xEB5A
[    8.850774] [drm] nouveau 0000:01:00.0: 0xEB5A: Condition still not met
after 20ms, skipping following opcodes
[    8.853877] [TTM] Zone  kernel: Available graphics memory: 2021802 kiB
[    8.853879] [TTM] Initializing pool allocator
[    8.853884] [TTM] Initializing DMA pool allocator
[    8.853893] [drm] nouveau 0000:01:00.0: Detected 256MiB VRAM (GDDR3)
[    8.853900] mtrr: type mismatch for e0000000,10000000 old: write-back new:
write-combining
[    8.853933] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    8.870360] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    8.870362] [drm] No driver support for vblank timestamp query.
[    8.870364] [drm] nouveau 0000:01:00.0: ACPI backlight interface available,
not registering our own
[    8.876628] [drm] nouveau 0000:01:00.0: 4 available performance level(s)
[    8.876632] [drm] nouveau 0000:01:00.0: 0: core 169MHz shader 338MHz memory
100MHz voltage 900mV fanspeed 100%
[    8.876636] [drm] nouveau 0000:01:00.0: 1: core 275MHz shader 550MHz memory
301MHz voltage 900mV fanspeed 100%
[    8.876640] [drm] nouveau 0000:01:00.0: 2: core 500MHz shader 1000MHz memory
450MHz voltage 1090mV fanspeed 100%
[    8.876644] [drm] nouveau 0000:01:00.0: 3: core 580MHz shader 1450MHz memory
702MHz voltage 1170mV fanspeed 100%
[    8.876647] [drm] nouveau 0000:01:00.0: c: core 275MHz shader 550MHz memory
300MHz voltage 900mV fanspeed 100%

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
