From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35049] New: Cannot use higher resolutions of monitor
Date: Sat,  5 Mar 2011 18:53:21 -0800 (PST)
Message-ID: <bug-35049-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35049

           Summary: Cannot use higher resolutions of monitor
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sancaktar.1-ZbGKxL/pcrQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I did a fresh Debian install to sid, upgraded to experimental to get xorg
1.9.99.903 (1.10.0 RC 3) then followed the instructions on the nouveau wiki
(http://nouveau.freedesktop.org/wiki/DebianInstall) to build a new kernel and
drivers.  This was successful.  The problem is that I have a monitor which
supports up to 2560x1600 (which the monitor reports by EDID) but the drivers
will only run at 1280x800.  If I use xrandr to resize, I get a desktop that is
compressed to be equivalent to the larger size, but is actually 1280x800.  I
have tried adding a virtual line to my monitor section and setting the
preferredmode.  These did not help.  The Xorg log shows that it detects the
higher resolutions.  I tried booting the kernel with video=DVI-I-1:2560x1600. 
The kernel FB driver does exactly the same thing, making the text very small
but still actually outputting the lower resolution.  I originally thought that
this was a dual-link problem, but I don't think that 1280x800 is even the
maximum for a single DVI cable.  The propriety driver works at the higher
resolutions.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
