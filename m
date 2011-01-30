From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33728] New: Framebuffer and Xorg display distorted
 only at monitor's native resolution
Date: Sun, 30 Jan 2011 10:48:18 -0800 (PST)
Message-ID: <bug-33728-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33728

           Summary: Framebuffer and Xorg display distorted only at
                    monitor's native resolution
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mark-PVWywRySYQIdnm+yROfE0A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=42725)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=42725)
Xorg log

As shown in the attached photo, the correctly detected native resolution for my
laptop's LCD (1280x800) is severely distorted when using the nouveau driver.
The framebuffer console looks similar to X. I can set the framebuffer to a
lower resolution (i.e. kernel=1024x768@60 in grub) and set X to 1024x768 with
xrandr to solve the problem.

I've also tried two different external LCD monitors on the VGA port with
success. Everything works correctly on the external monitors (even adding a
1280x800 modeline to them).

Both the nvidia and nv drivers detect the correct resolution and display it
correctly, so I've tried manually setting the modeline's that they use using
xrandr and nouveau, but the display stays distorted at 1280x800.

This isn't specific to the version included with Fedora 14. I've experienced
the same problem on the older versions of Nouveau included with Debian Squeeze,
Ubuntu 10.04 and 10.10.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
