From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47182] New: GeFroce 6150SE nForce 430: misaligned
 reg 0x0060081D
Date: Sat, 10 Mar 2012 12:07:35 +0000
Message-ID: <bug-47182-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47182

             Bug #: 47182
           Summary: GeFroce 6150SE nForce 430: misaligned reg 0x0060081D
    Classification: Unclassified
           Product: xorg
           Version: 7.6 (2010.12)
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


On system start-up, the messages "misaligend reg 0x0060081D" appear in the log:

[    3.165315] nouveau 0000:00:0d.0: setting latency timer to 64
[    3.166731] [drm] nouveau 0000:00:0d.0: Detected an NV40 generation card
(0x04c000a2)
[    3.166739] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
[    3.169138] [drm] nouveau 0000:00:0d.0: Attempting to load BIOS image from
PRAMIN
[    3.208458] [drm] nouveau 0000:00:0d.0: ... appears to be valid
[    3.208461] [drm] nouveau 0000:00:0d.0: BIT BIOS found
[    3.208464] [drm] nouveau 0000:00:0d.0: Bios version 05.61.32.14
[    3.208467] [drm] nouveau 0000:00:0d.0: TMDS table version 1.1
[    3.208469] [drm] nouveau 0000:00:0d.0: TMDS table script pointers not
stubbed
[    3.208549] [drm] nouveau 0000:00:0d.0: MXM: no VBIOS data, nothing to do
[    3.208552] [drm] nouveau 0000:00:0d.0: DCB version 3.0
[    3.208555] [drm] nouveau 0000:00:0d.0: DCB outp 00: 01000310 00000023
[    3.208558] [drm] nouveau 0000:00:0d.0: DCB outp 01: 00110204 974f0000
[    3.208560] [drm] nouveau 0000:00:0d.0: DCB conn 00: 0000
[    3.208566] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 0 at offset
0xDA6D
[    3.208569] [drm] nouveau 0000:00:0d.0: ======= misaligned reg 0x0060081D
=======
[    3.208576] [drm] nouveau 0000:00:0d.0: ======= misaligned reg 0x0060081D
=======
[    3.208624] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 1 at offset
0xDBC4
[    3.208626] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 2 at offset
0xDBC5
[    3.208677] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 3 at offset
0xDD47
[    3.208681] [drm] nouveau 0000:00:0d.0: Parsing VBIOS init table 4 at offset
0xDD90
[    3.209464] [drm] nouveau 0000:00:0d.0: 1 available performance level(s)
[    3.209468] [drm] nouveau 0000:00:0d.0: 0: core 425MHz shader 425MHz
fanspeed 100%
[    3.209475] [drm] nouveau 0000:00:0d.0: c:
[    3.209656] [drm] nouveau 0000:00:0d.0: Detected 256MiB VRAM
[    3.210308] [drm] nouveau 0000:00:0d.0: 64 MiB GART (aperture)
[    3.214207] [drm] nouveau 0000:00:0d.0: DCB type 4 not known
[    3.214209] [drm] nouveau 0000:00:0d.0: Unknown-1 has no encoders, removing
[    3.215658] [drm] nouveau 0000:00:0d.0: Setting dpms mode 3 on vga encoder
(output 0)
[    3.255055] [drm] nouveau 0000:00:0d.0: allocated 1680x1050 fb: 0x49000, bo
f0314200
[    3.255142] fbcon: nouveaufb (fb0) is primary device
[    3.316418] [drm] nouveau 0000:00:0d.0: Setting dpms mode 0 on vga encoder
(output 0)
[    3.316422] [drm] nouveau 0000:00:0d.0: Output VGA-1 is running on CRTC 0
using output A
[    3.318438] fb0: nouveaufb frame buffer device
[    3.318444] [drm] Initialized nouveau 0.0.16 20090420 for 0000:00:0d.0 on
minor 0
[  110.134496] [drm] nouveau 0000:00:0d.0: Setting dpms mode 3 on vga encoder
(output 0)
[  110.168161] [drm] nouveau 0000:00:0d.0: Setting dpms mode 0 on vga encoder
(output 0)
[  110.168173] [drm] nouveau 0000:00:0d.0: Output VGA-1 is running on CRTC 0
using output A


Tested with kernel 3.1.9 an 3.3.0-rc6.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
