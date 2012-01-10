From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 44608] New: Freeze after Fn-F8 - Next boots: screen
 remains off after suspend/resume
Date: Tue, 10 Jan 2012 02:17:14 +0000
Message-ID: <bug-44608-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=44608

             Bug #: 44608
           Summary: Freeze after Fn-F8 - Next boots: screen remains off
                    after suspend/resume
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


On my DELL Latitude E6400 laptop, when I type Fn-F8, the machine almost
completely freezes: the mouse pointer no longer moves, I can no longer connect
to the machine by SSH, and I can no longer control the screen brightness;
however I can still control the keyboard backlight. Once this is done, after
the following reboots, when I suspend the machine with Fn-F1 and resume it, the
screen remains off. I can still connect to the machine by SSH.

To solve this problem, I need to type: "xrandr --output LVDS-1 --auto". Then
the screen-off-after-resume bug no longer occurs... until I type Fn-F8 again.

lspci info: VGA compatible controller: nVidia Corporation G98M [Quadro NVS
160M] (rev a1)

When the resume fails to work correctly, I get the following additional lines
in the logs:

kernel: detected fb_set_par error, error code: -16
kernel: [drm] nouveau 0000:01:00.0: bo ffff8801186ef800 pinned elsewhere:
0x00000002 vs 0x00000004
kernel: [drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x0080 Data 0x00000000 (0x0005
0x05)
kernel: [drm] nouveau 0000:01:00.0: bo ffff8801186ef800 pinned elsewhere:
0x00000002 vs 0x00000004
kernel: [drm:drm_helper_resume_force_mode] *ERROR* failed to set mode on crtc
ffff880117cb0000
kernel: [drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x0080 Data 0x00000000 (0x1005
0x05)

The log files are provided in my bug report on the Debian BTS:
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=655183

Also, I don't know whether this matters, but in the syslog messages, I can see:

Jan 10 01:57:08 xvii kernel: [    0.171552] [Firmware Bug]: ACPI: BIOS
_OSI(Linux) query ignored
Jan 10 01:57:08 xvii kernel: [   13.152045] [Firmware Bug]: Duplicate ACPI
video bus devices for the same VGA controller, please try module parameter
"video.allow_duplicates=1"if the current driver doesn't work.

As requested in the Debian BTS, I'll attach drm.debug=6 dmesg.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
