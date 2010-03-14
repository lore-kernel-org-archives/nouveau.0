From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27076] New: [C51/6100 GO] Image corruption / broken
	Xv
Date: Sun, 14 Mar 2010 15:55:13 -0700 (PDT)
Message-ID: <bug-27076-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=27076

           Summary: [C51/6100 GO] Image corruption / broken Xv
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarding from Launchpad bug
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/532756

This is with DDX git up to commit 9b4118d, libdrm 2.6.18 with the 0.0.16 API
bump reverted, and 2.6.33 drm + nouveau.

The user reports image corruption on the bottom of the desktop wallpaper, but
only with a background image or gradient - not a flat colour.  Image here:
http://www.flickr.com/photos/danielecruciani/4417023969/

The user also reports that Xv produces nothing but scrambled colours. 
Screenshot here:
http://launchpadlibrarian.net/40483459/Schermata-Awakenedvoice-DrupalCCKAndViewsTutorial767.mov.png

Dmesg: http://launchpadlibrarian.net/40871533/BootDmesg.txt
Xorg.0.log: http://launchpadlibrarian.net/40871601/XorgLog.txt
lspci output: http://launchpadlibrarian.net/40871582/Lspci.txt


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
