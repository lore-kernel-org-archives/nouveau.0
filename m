From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14025] New: The X11 / X Server Exhibits Jitters in
 the Display after it is on for many hours
Date: Fri, 11 Jan 2008 09:12:08 -0800 (PST)
Message-ID: <bug-14025-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14025

           Summary: The X11 / X Server Exhibits Jitters in the Display after
                    it is on for many hours
           Product: xorg
           Version: 7.2
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=13661)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=13661)
Xorg.0.log of the session.

On my setup:

* Mandriva Cooker (updated as of 2008-Jan-10).
* Pentium 4 2.4 GHz.
* GeForce 4 MX.
* Screen: ViewSonic VA-903m
* xorg-x11-7.2.0-2mdv2008.0
* Nouveau drivers - mostly up-to-date git master, installed using the
instructions on the wiki.
* x11-server-1.4-18mdv2008.1

I'm getting jitters on the screen - sudden movements of several pixels in a
certain region that disappear after a fraction of a second. I don't recall
seeing it a week ago or earlier.

I'll attach an Xorg.0.log file and an IRC log of #nouveau.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
