From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15777] New: nouveau driver crash with Xen kernel
Date: Wed, 30 Apr 2008 14:43:26 -0700 (PDT)
Message-ID: <bug-15777-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15777

           Summary: nouveau driver crash with Xen kernel
           Product: xorg
           Version: 7.3
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: hub-o3JoHyyelnrk1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=16271)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16271)
xorg.conf

I use nouveau as it is shipped in openSUSE Factory.

xorg-x11-driver-video-nouveau-0.10.1.20080424-2
xorg-x11-driver-video-nouveau-3d-0.10.1.20080424-2
nouveau-kmp-xen-0.10.1.20080424_2.6.25_19-2

Kernel is 
Linux stewie 2.6.25-19-xen #1 SMP 2008-04-22 17:29:12 +0200 x86_64 x86_64
x86_64 GNU/Linux

Video card is
40:00.0 VGA compatible controller: nVidia Corporation NV44 [Quadro NVS 285]
(rev a1)

With the regular kernel it works fine.
With the Xen kernel the X server crash

Will attach xorg.conf, /var/log/message and Xorg.0.conf


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
