From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37769] New: [NVA8] UT2003: Unfinished frames during
 gameplay and menu in fullscreen
Date: Mon, 30 May 2011 16:34:26 -0700 (PDT)
Message-ID: <bug-37769-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37769

           Summary: [NVA8] UT2003: Unfinished frames during gameplay and
                    menu in fullscreen
           Product: Mesa
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org


Created an attachment (id=47341)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47341)
Splash video with nVidia logo, missing texture

When Gnome-shell is enabled, often frames are not completely finished before
rendering. This shows sometimes by absent light effects or even textures, and
sometimes by not rendering foreground elements. This happens often enough to
make this game unplayable, even though the framerate is around 40FPS.
Attached image will demonstrate several parts of frames that got captured. This
should give a little more detail on what's going wrong.
No error messages are given in dmesg or in terminal.

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
