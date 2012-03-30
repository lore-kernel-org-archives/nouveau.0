From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48074] New: 3D / OpenGL clients used with wayland
 always cause an immediate hang
Date: Fri, 30 Mar 2012 02:44:11 +0000
Message-ID: <bug-48074-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48074

             Bug #: 48074
           Summary: 3D / OpenGL clients used with wayland always cause an
                    immediate hang
    Classification: Unclassified
           Product: Mesa
           Version: 8.0
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: darxus-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org


Using wayland 0.85, mesa built from git branch 8.0.  The gears client that
comes with weston is the best example.  There was an opengl example that came
with QT5 that did it too, but I'd have to dig up which one I tried.  But those
two were enough to convince me to stop trying to run opengl wayland clients.

$ lspci | grep -i vga
05:00.0 VGA compatible controller: nVidia Corporation G92 [GeForce 8800 GT]
(rev a2)

Wayland build script I wrote and used is here: 
http://www.chaosreigns.com/wayland/buildscript/wayland-build-0.85.sh

I was running on Ubuntu Oneric.

This crash was basically the last thing that resulted in me installing a new
AMD Radeon just now, so I'm not particularly eager to dig up more details.  

I did verify the hang with weston's gears immediately before plugging in my
AMD, booting, and running the same thing again without a hang.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
