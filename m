From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17357] New: NV4B 10DE: 0393 funny stripes in video
 flash when using nouveau
Date: Fri, 29 Aug 2008 15:32:03 -0700 (PDT)
Message-ID: <bug-17357-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=17357

           Summary: NV4B 10DE:0393 funny stripes in video flash when using
                    nouveau
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Ubuntu 8.04.1
(/var/log/Xorg.0.log) Xserver 1.4.0.90
(dpkg -l | grep nouveau) xserver-xorg-video-nouveau
1:0.0.10~git20080827-0~ppa1~hardy
(/var/log/messages) nouveau 0.0.11 drm-2.3.0-1870-g9c7137483d1ef47ea
(dpkg -l | grep drm) libdrm2 2.3.1+git20080827-0~ppa1~hardy
(/var/log/messages) drm drm-2.3.0-1870-g9c7137483d1ef47ea
(uname -a) kernel 2.6.24-19-generic #1 SMP Wed Aug 20 22:56:21 UTC 2008 i686
GNU/Linux

Playing video flashes funny stripes in video window, will upload three
screenshots;

Screenshot 1: Desktop showing thumbnail of video - no stripes
Screenshot 2: Playing video using totem - stripes
Screenshot 3: Later frame of same video - no stripes


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
