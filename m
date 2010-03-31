From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27398] New: displayport: x server does not draw
 anything on ThinkPad T410
Date: Wed, 31 Mar 2010 09:08:34 -0700 (PDT)
Message-ID: <bug-27398-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=27398

           Summary: displayport: x server does not draw anything on ThinkPad
                    T410
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pav_s-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=34582)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=34582)
dmesg when DP-1 is plugged in

This happens when booting with an external monitor attached to Displayport on
ThinkPad T410.

After loading nouveau.ko the main display on LVDS-1 switches to hi-res
framebuffer (KMS) like during normal boot. But when X is started, it switches
to vt7 and then nothing happens - neither is the frame buffer is redrawn
anymore, nor the external display is enabled. This is not a lockup, though. I
can switch back to vt1 with ctrl-alt-f1, and I can login into the x session by
blindly typing username/password (though xdm) or start gtk-demo from vt1. (Same
happens if I just start X with "X -wr&" .)

[in brief]

xorg.conf:
----> snip ----->
Section "Device"
        Identifier  "Card0"
        Driver      "nouveau"
        VendorName  "nVidia Corporation"
        BoardName   "NVIDIA Quadro NVS 3100m"
        BusID       "PCI:1:0:0"
EndSection
<---- snap <-----

steps to reproduce:
 - boot and load nouveau.ko
 - start X with "X -wr -config ./xorg.conf&"

result:
 - KMS console works, but
 - X stops redrawing the frambuffer switching to vt7 does not change the screen

expected:
 - KMS console works
 - X draws a blank white screen on LVDS-1 (in vt7)
 - xrandr can enable DP-1


[notes]

kernel reports several:
[drm] nouveau 0000:01:00.0: 0xD404: Init table command not found: 0x3A
   errors.

what is SOR?
[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
[drm] nouveau 0000:01:00.0: SOR-1: link training failed
[drm] nouveau 0000:01:00.0: SOR-1: link training failed
[drm] nouveau 0000:01:00.0: SOR-1: link training failed
[drm] nouveau 0000:01:00.0: SOR-1: link training failed

this looks suspicious
[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[drm] nouveau 0000:01:00.0: unplugged DisplayPort-1
[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
[drm] nouveau 0000:01:00.0: plugged DisplayPort-1
[drm] nouveau 0000:01:00.0: 0xD076: Init table command not found: 0x3A
[drm] nouveau 0000:01:00.0: SOR-1: link training failed

Thanks in advance!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
