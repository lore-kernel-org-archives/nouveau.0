From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49746] New: EDID checksum is invalid
Date: Thu, 10 May 2012 17:57:44 +0000
Message-ID: <bug-49746-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49746

             Bug #: 49746
           Summary: EDID checksum is invalid
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: spam-7bUvwKseDQ1hl2p70BpVqQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 61378
  --> https://bugs.freedesktop.org/attachment.cgi?id=61378
nouveau version, dmesg (Arch, Fedora 17 Beta)

Hi.

I am getting EDID checksum errors with my monitor connected to VGA via E-Port
Replicator; also the monitor gets wrong resolution (1024x768 instead of
1680x1050) or stays blank. Infrequently the screen shows garbage or the system
crashes.

Hardware: Dell Latitude E6400, E-Port Replicator PR01X/02X, Samsung SyncMaster
2243EW (1680x1050), dual-head setup (DP-1 and VGA-1 connected), nVidia Quadro
NVS 160M

OS: Arch running Gnome 3.4.1 with all updates (2012-05-10) and
xf86-video-nouveau (0.0.16_git20120210-1), Fedora 17 Beta LiveUSB and
xorg-x11-drv-nouveau.x86_64 1:0.0.16-34.20110720gitb806e3f.fc17

The setup worked without error some Arch Linux updates ago or with Fedora 16
LiveUSB. Also I happened to have a similar setup at another office with Samsung
SyncMaster 203B (1400x1050), also no errors.

Attachment is the dmesg output of Arch Linux and Fedora 17.

Similar info can be found in this forum post:
https://bbs.archlinux.org/viewtopic.php?id=140961

Is it related to the following bug
or nouveau troubleshooting topic?
https://bugs.freedesktop.org/show_bug.cgi?id=31943
http://nouveau.freedesktop.org/wiki/TroubleShooting#Blank_monitor.2C_flicker.2C_snow.2C_or_other_random_live_image_corruption

Thanks in advance. Best regards,

christoph

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
