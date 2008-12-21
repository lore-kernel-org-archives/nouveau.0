From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19223] New: Exit code of X-Windows restart is always
	failure
Date: Sun, 21 Dec 2008 13:21:36 -0800 (PST)
Message-ID: <bug-19223-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19223

           Summary: Exit code of X-Windows restart is always failure
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: skliarie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


ubuntu 8.10 has a nice feature of switching users using fast-user-switch. If I
understand correctly, it somehow stops the current X-Windows server without
destroying already open windows, and then starts the new X-Windows server, on
behalf of user you want to switch to.

For some reason, stopping of Nouveau-powered X-Server always returns faulure,
with following error message in /var/log/Xorg.0.log

Fatal server error:
xf86OpenConsole: VT_WAITACTIVE failed: Interrupted system call

Because of that, the fast-user-switch never proceeds to second part of starting
another X-Windows, and instead returns to the previous X session with obscure
error about inability to start X-Windows.

Card: 
01:00.0 VGA compatible controller: nVidia Corporation NV34 [GeForce FX 5200]
(rev a1)

driver: xserver-xorg-video-nouveau 1:0.0.10~git20081124-0~ppa1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
