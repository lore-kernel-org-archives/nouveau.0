From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49061] New: HDMI output clipped since commit of
 'enable sending of avi/audio infoframes'
Date: Sun, 22 Apr 2012 15:47:49 +0000
Message-ID: <bug-49061-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49061

             Bug #: 49061
           Summary: HDMI output clipped since commit of 'enable sending of
                    avi/audio infoframes'
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
        ReportedBy: gitbisector-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 60467
  --> https://bugs.freedesktop.org/attachment.cgi?id=60467
drm output from 'dmesg' and output of 'xrandr --verbose' to hopefully describe
my setup

Since some time now 1920x1200 output on HDMI port of my nv50 based card shows
two black bands on the left and right side of the screen. It's clipping (i.e.
pieces of the desktop are not drawn), resolution seems to be correct. 

bisecting of the linux kernel got me here:

b2337f2333c0bdefc9b230da17ed7188e4eb7f6c is the first bad commit
commit b2337f2333c0bdefc9b230da17ed7188e4eb7f6c
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Oct 5 14:59:14 2011 +1000

    drm/nouveau/hdmi: enable sending of avi/audio infoframes

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 edc0d0e6f57362c38edb0845cf19ee076a045f0b
364748b5ea73b322991331396fb218d8afd65fe7 M    drivers

And indeed taking out these changes from the current 3.4.0-rc4 kernel seems to
solve my problem.

Seems this enabling of avi/audio infoframes has some bad side effect for my
hardware.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
