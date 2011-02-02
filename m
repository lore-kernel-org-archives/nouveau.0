From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33841] New: Fedora 14 randomly crashes
Date: Wed,  2 Feb 2011 07:48:03 -0800 (PST)
Message-ID: <bug-33841-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33841

           Summary: Fedora 14 randomly crashes
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: franzmariamd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=42855)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=42855)
output dmesg after crash and restart with a rescue dvd

My computer randomly crashes with Fedora 14.

I had the same problem with Fedora 12 one year ago; so I returned to use Fedora
11.
I used Fedora 11 for more than a year without problems.
One month ago I had to pass to Fedora 14, fresh installation.
I use the default driver nouveau. It seems ok, it recognizes the hardware
(video card and monitor) and set the correct resolution 1440x900.
But randomly my computer freezes.
The problems with Fedora 14 is the same encountered with Fedora 12.
Level of hang = 3:
Display is frozen, no reaction at all to key presses or mouse. NumLock etc.
keyboard lights do not react.

I passed to use nvidia rpmfusion driver, but I had the same problem.

My motherboard is MSI MS-7301.
Video card Nvidia 8300GS 128M.
Monitor Packard Bell PKB VIS 190WS.

If I start with kernel option nouveau.modeset=0 computer never freezes; but
resolution is set to 1280x1024 and not to correct one (1440x900).
I suppose with this kernel option I'm using the vesa driver.
So with vesa driver is all OK.

After a crash using nouveau driver I restart with the rescue DVD and I save
dmesg output.

I hope it is useful.

Best regards.
Franco

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
