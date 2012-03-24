From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47796] New: Powerpoint 2010 Viewer crashes with Wine
 and the Nouveau driver: "Unhandled exception: assertion failed"
Date: Sat, 24 Mar 2012 02:14:38 +0000
Message-ID: <bug-47796-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47796

             Bug #: 47796
           Summary: Powerpoint 2010 Viewer crashes with Wine and the
                    Nouveau driver: "Unhandled exception: assertion
                    failed"
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alister.hood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 58959
  --> https://bugs.freedesktop.org/attachment.cgi?id=58959
kernel log

I have an Nvidia MX440 graphics card and am running Arch Linux.  When I run MS
Powerpoint Viewer 2010 (using Wine), a file select dialog opens for me to
select a powerpoint file, but then it crashes a second or so after the dialog
opens.
On the Wine tracker I was told that it was a problem with the nouveau driver,
not Wine:

> > This is an assertion in nouveau driver, so you have to try to update it or use
> > proprietary one.
> To add to that, the backtrace is missing function names and line numbers, but
> this is probably the assert in get_rt_format() in nv10_state_fb.c. It gets
> triggered because during wined3d startup we try to attach a GL_RGB5_A1 texture
> (among various others) to an FBO. The driver should probably fail the FBO
> completeness test for formats it doesn't know how to handle instead of
> asserting.

I am running current GIT, but this issue is longstanding.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
