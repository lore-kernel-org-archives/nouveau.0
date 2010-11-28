From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] New: [drm:drm_crtc_helper_set_config] *ERROR*
 failed to set mode on [CRTC:6]
Date: Sun, 28 Nov 2010 13:20:59 -0800 (PST)
Message-ID: <bug-31961-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31961

           Summary: [drm:drm_crtc_helper_set_config] *ERROR* failed to set
                    mode on [CRTC:6]
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dasfox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm running Arch Linux 2010.05 i686 with a Compaq Presario SR1923WM (Running a
AMD 3500+ and 1GB Ram).

Here is the box specs;
http://h10025.www1.hp.com/ewfrf/wc/document?docname=c00683218&tmp_task=prodinfoCategory&lc=en&dlc=en&cc=us&site=null&key=null&product=3208974

Xorg versions:
---------------
xorg-server-1.9.2-2
xf86-video-nouveau-0.0.16_git20100819-1
nouveau-dri-7.9-1

I noticed in dmesg these lines;

[drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
fbcon_init: detected unhandled fb_set_par error, error code -22
[drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
Console: switching to colour frame buffer device 90x36
[drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]
fb0: nouveaufb frame buffer device
drm: registered panic notifier


Here are my logs;
--------------

dmesg:
http://pastebin.com/B9g95YGT

Xorg.0.log:
http://pastebin.com/jTW5mhAV




THANKS

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
