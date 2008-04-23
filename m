From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15675] New: Randr12: works from command-line but not
 in xorg.conf
Date: Wed, 23 Apr 2008 08:17:26 -0700 (PDT)
Message-ID: <bug-15675-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15675

           Summary: Randr12: works from command-line but not in xorg.conf
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have two machines with different hardware that are using nouveau with
Randr12.  One of them works fine.  The other one is behaving oddly.  If I set
"Virtual 3200 1200" in the xorg.conf and start up X, only the DVI monitor
displays anything.  The VGA is blank.  If I run `xrandr --output VGA-0
--right-of DVI-D-0`, then the VGA screen lights up and everything is happy.

However, if I try to tell xorg.conf to put VGA-0 right of DVI-D-0 (which is
what I successfully do on the other computer), then the VGA monitor stays
blank, even though X apparently thinks it is using two monitors.  Here's what's
at the bottom of xorg.conf:

Section "Monitor"
    Identifier "DVI-D-0"
EndSection 

Section "Monitor"
    Identifier "VGA-0"
    Option "RightOf" "DVI-D-0"
EndSection

When I use this configuration, switching which display is left and which is
right doesn't help.  If I do `xrandr --output VGA-0 --left-of DVI-D-0`, then
the DVI gets the other half of the virtual screen and whatever windows should
have been displayed on the VGA.  However, the VGA is still blank.

At this point, if I do `xrandr --output VGA-0 --same-as DVI-D-0`, then suddenly
the VGA lights up and displays correctly.  I can now put VGA-0 to the right of
or left of DVI-D-0; all of the xrandr commands work perfectly.

I'm using the latest version of nouveau from git.  The machine is running
Fedora Rawhide.  In case it helps, here's the output from `lspci -v` about the
video card:

05:00.0 VGA compatible controller: nVidia Corporation NV44A [GeForce 6200] (rev
a1) (prog-if 00 [VGA controller])
        Subsystem: Unknown device 196e:02f0
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 16
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (32-bit, prefetchable) [size=256M]
        Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Expansion ROM at feae0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel driver in use: nvidia
        Kernel modules: nvidia, nvidiafb

I hope this is helpful.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
