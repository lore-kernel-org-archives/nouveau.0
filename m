From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46956] New: Selecting 2xAntiAliasing causes Nexuiz
 to crash "X Error: BadMatch, failed request (X_CreateWindow)"
Date: Sun, 04 Mar 2012 14:01:43 +0000
Message-ID: <bug-46956-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46956

             Bug #: 46956
           Summary: Selecting 2xAntiAliasing causes Nexuiz to crash "X
                    Error: BadMatch, failed request (X_CreateWindow)"
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Created attachment 58004
  --> https://bugs.freedesktop.org/attachment.cgi?id=58004
Nexuiz console output

How to:
1. Startup Nexuiz
2. Select Settings>Effects
3. Set Antialiasing to 2x
4. Click Apply immediately
5. Observe the crash

Issue is not present when
* 0xAA, 4xAA mode is selected in Nexuiz
* Software rendering is used - LIBGL_ALWAYS_SOFTWARE=1

Issue is independent on
* kernel version
* direct/indirect rendering - LIBGL_ALWAYS_INDIRECT=1 makes no difference
* Desktop enviroment - Gnome3, fluxbox


Distribution - Arch x86-64
Nexuiz - 2.5.2 Nexuiz Linux 02:51:06 Oct  1 2009 9271 release
kernel - 3.0.22 / 3.2.8 / nouveau-git
libdrm - 2.4.31
Mesa - 95594bae47d8b3302be188e6f0be2d69c5507bb3
xf86-video-nouveau - b0d7f4ddd94154491d04dcb9698d63d61e9240d
Xorg - 1.11.4



The issue was bisected to

commit b2dcf880e8bcd61be59602f5a2d18c77a5fc60c1
Author: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date:   Mon Jul 11 18:02:27 2011 +0200

    nv50,nvc0: add support for multi-sample resources

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
