From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27455] New: dualhead not working,
	second display always black
Date: Sun,  4 Apr 2010 21:33:37 -0700 (PDT)
Message-ID: <bug-27455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27455

           Summary: dualhead not working, second display always black
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tcwardrobe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=34667)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=34667)
output of dmesg

Regardless of connected before booting or after, second display turns black as
soon as nouveau.ko is loaded (but it switches from standby to on when it
should). xrandr -q recognizes the second display correctly, xrandr --output
VGA-1 --auto == display on but black.
A sidenote, while watching a clip with mplayer and going fullscreen, the second
display switches from on to standby and on again every several seconds (between
10 and 30 seconds).
See dmesg attached.

ii  libdrm-nouveau1                      2.4.18-4                            
Userspace interface to nouveau-specific kernel DRM services -- runtime
ii  libdrm2                              2.4.18-4                            
Userspace interface to kernel DRM services -- runtime
ii  xserver-xorg-video-nouveau           1:0.0.15+git20100329+7858345-1      
X.Org X server -- Nouveau display driver (experimental)

Debian sid/experimental, kernel 2.6.32 (backported drm from 2.6.33)

01:00.0 VGA compatible controller [0300]: nVidia Corporation NV34M [GeForce FX
Go5200 32M/64M] [10de:0328] (rev a1)

regards
Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
