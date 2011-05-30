From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37768] New: [NVA8] UT2003: Splash-screen is
 transparent with gnome-shell enabled
Date: Mon, 30 May 2011 15:51:54 -0700 (PDT)
Message-ID: <bug-37768-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37768

           Summary: [NVA8] UT2003: Splash-screen is transparent with
                    gnome-shell enabled
           Product: Mesa
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org


Created an attachment (id=47340)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47340)
Screenshot of the transparent splash-screen

When Gnome-Shell is enabled and I try to start Unreal Tournament 2003, the
splash screen is not shown with a black background. Instead, there is a high
level of transparency, which can be seen in the attached image.
If I change the gnome-shell background to black, the image shows correctly.
This implies that there is no missing colour information but instead an
incorrect alpha value is used. With gnome-shell disabled the splash screen
shows as normal.
Dmesg or console output does not show anything strange.

Running:
kernel-2.6.38.6-27.fc15.x86_64 (but also tried with Koji kernel and upstream
nouveau module)
mesa-dri-drivers-7.11-0.11.20110525.0.fc15.i686
xorg-x11-drv-nouveau-0.0.16-24.20110324git8378443.fc15.x86_64
xorg-x11-server-Xorg-1.10.1-14.fc15.x86_64

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
