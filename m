From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28524] New: Debian Testing Kernel Upgrade Enables
 KMS, Disables External Monitor
Date: Sun, 13 Jun 2010 07:49:51 -0700 (PDT)
Message-ID: <bug-28524-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28524

           Summary: Debian Testing Kernel Upgrade Enables KMS, Disables
                    External Monitor
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: whirlygig-Wuw85uim5zDR7s880joybQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=36249)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=36249)
dmesg.txt collected via ssh session, booting docked with external LCD

Hardware: Dell Latitude D810, Nvidia Quadro Go 1400 video, using 1920x1200
built-in LCD when undocked / 1680x1050 Dell LCD when attached to port
replicator
OS: Debian Squeeze with Xfce desktop environment, fully updated using no
no-free or contrib repositories, no proprietary drivers or software of any kind
(including no Nvidia blobs, ever), video expansion turned off in BIOS (more
about which later)

Accepted upgrade from main repositories 2.6.32-3-686 to 2.6.32-5-686. I think
the pertinent change is that KMS is now enabled by default.

Upon reboot following the kernel upgrade the external monitor goes blank
(backlight off) immediately after the populating /dev message in console. The
system can be logged on to via ssh -X, and I can launch graphical applications
on the affected system. (dmesg.txt attached is dmesg output collected from one
of these sessions immediately after boot).

You will note from this section of dmesg.txt that the external monitor and its
resolution are detected:

----------------------->8-------------------------

> > [    7.308183] [drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x49000, bo f6feb600
> > [    7.319925] [drm] nouveau 0000:01:00.0: Output DVI-D-1 is running on CRTC 0 using output A
> > [    7.319929] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 2)
> > [    7.319931] [drm] nouveau 0000:01:00.0: Output DVI-D-1 is running on CRTC 0 using output A
> > [    7.321231] Console: switching to colour frame buffer device 210x65

----------------------->8-------------------------

If I undock the system and boot with the new kernel I see the point
(immediately after populating /dev message) where the framebuffer is started.
At that point the system stops using the 800x600 central area of the screen for
the console and switches to the full 1920x1200 resolution, as expected. GDM
starts, and desktop and all graphical functions are normal.

Please note, also, the result of

grep -B2 'Module class: X.Org Video Driver' /var/log/Xorg.0.log
(II) Module nv: vendor="X.Org Foundation"
        compiled for 1.7.7, module version = 2.1.17
        Module class: X.Org Video Driver
--
(II) Module vesa: vendor="X.Org Foundation"
        compiled for 1.7.7, module version = 2.3.0
        Module class: X.Org Video Driver

The Xorg log shows this content regardless of whether the system is docked or
undocked, and whether I boot with the old kernel or the new one. (But I would
swear that it used to show only the vesa driver.)

I tried forcing the use of nouveau driver creating

Section "Device"
Identifier "n"
Driver "nouveau"
EndSection

for Xorg configuration. This results in X not starting at all -- until the
configuration file is removed..

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
