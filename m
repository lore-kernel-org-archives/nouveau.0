From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29525] New: DVI monitor (via docking station)
	remains blank
Date: Thu, 12 Aug 2010 03:02:01 -0700 (PDT)
Message-ID: <bug-29525-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29525

           Summary: DVI monitor (via docking station) remains blank
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Laptop: Toshiba Tecra P10 with a single DB15 VGA output
GPU: nVidia Corporation G86M [Quadro NVS 150M] (according to lspci)
PCI id:  10de:06ea    (rev a1)
Docking station: a second VGA output and a DVI output

Issue: Nouveau driver will drive the LVDS laptop screen and either VGA output
but will not drive the DVI output, even though it seems to be correctly listed
in xrandr's output. The DVI monitor simply remains blank with "no signal"
displayed. This is the case at the framebuffer console level and when X is
started.

Kernel: 2.6.35
DRM, libdrm, nouveau, etc: all recent versions from git

There are some potentially interesting kernel messages when the docking station
is attached - i.e. the "unknown type" messages.

Aug 11 19:15:00 its-ess-sb kernel: [    3.739304] [drm] nouveau 0000:01:00.0:
TMDS table revision 2.0 not currently supported
Aug 11 19:15:00 its-ess-sb kernel: [    3.740063] [drm] nouveau 0000:01:00.0:
DCB connector table: VHER 0x40 5 16 4
Aug 11 19:15:00 its-ess-sb kernel: [    3.740166] [drm] nouveau 0000:01:00.0:  
0: 0x00000040: type 0x40 idx 0 tag 0xff
Aug 11 19:15:00 its-ess-sb kernel: [    3.740287] [drm] nouveau 0000:01:00.0:  
1: 0x00000100: type 0x00 idx 1 tag 0xff
Aug 11 19:15:00 its-ess-sb kernel: [    3.740407] [drm] nouveau 0000:01:00.0:  
2: 0x00001255: type 0x55 idx 2 tag 0x07
Aug 11 19:15:00 its-ess-sb kernel: [    3.740526] [drm] nouveau 0000:01:00.0:
unknown type, using 0x31
Aug 11 19:15:00 its-ess-sb kernel: [    3.740628] [drm] nouveau 0000:01:00.0:  
3: 0x00000351: type 0x51 idx 3 tag 0xff
Aug 11 19:15:00 its-ess-sb kernel: [    3.740747] [drm] nouveau 0000:01:00.0:
unknown type, using 0x00
Aug 11 19:15:00 its-ess-sb kernel: [    3.740842] [drm] nouveau 0000:01:00.0:  
4: 0x00000462: type 0x62 idx 4 tag 0xff
Aug 11 19:15:00 its-ess-sb kernel: [    3.740962] [drm] nouveau 0000:01:00.0:
unknown type, using 0xff

I am about to reboot with the docking station removed. I'll attach the same
part of the boot sequence plus exact details about driver versions, etc.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
