From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25824] New: KMS, Dualhead: Strange bigger console
Date: Tue, 29 Dec 2009 14:39:24 -0800 (PST)
Message-ID: <bug-25824-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25824

           Summary: KMS, Dualhead: Strange bigger console
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: achim_schaefer-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm using kernel 2.6.33-rc2 on a 5200 with two scenns attached.
This gets detected very well:
[    0.901764] [drm] nouveau 0000:01:00.0: failed to evaluate _DSM: 5
[    0.902107] [drm] nouveau 0000:01:00.0: Detected an NV30 generation card
(0x034200a2)
[    0.902191] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PROM
[    1.026027] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    1.026294] [drm] nouveau 0000:01:00.0: BMP BIOS found
[    1.026297] [drm] nouveau 0000:01:00.0: BMP version 5.38
[    1.026301] [drm] nouveau 0000:01:00.0: Bios version 04.34.20.18

and 
[    1.352207] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x9000, bo
f6f50e00
[    1.355869] [drm] DAC-7: set mode 1280x1024 3f
[    1.366246] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 0)
[    1.366251] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0
using output A
[    1.366269] [drm] DAC-8: set mode 1024x768 40
[    1.376641] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder
(output 1)
[    1.376646] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 1
using output B

Now I get 
[    1.379072] Console: switching to colour frame buffer device 128x48 
which fits exacly on the smaller screen. 

But on the bigger screen this uses only a part of the console and looks quite
strange. 
The last line is somewhere below the middle of the screen and as well the last
character on the right is not a the right side.
So I assume it uses only the resolution 1024x768 on a 1280x1024 screen.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
