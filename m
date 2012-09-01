From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54359] New: X crashes after resume (8600GT / NV84)
Date: Sat, 01 Sep 2012 19:26:02 +0000
Message-ID: <bug-54359-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54359

             Bug #: 54359
           Summary: X crashes after resume (8600GT / NV84)
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luca.wehrstedt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 66458
  --> https://bugs.freedesktop.org/attachment.cgi?id=66458
The dmesg output

I have a NVIDIA GeForce 8600GT graphics card. I'm using Gentoo on a AMD64
machine with a custom built 3.5 kernel.

I've been using nouveau for more than a year by now without any kind of
problems. Yet, since I enabled the last kernel options I needed to get 3D
hardware acceleration, I'm having some issues.

When closing applications like web browsers or video players the X server
suddenly hangs (I cannot even move the pointer) and, after a few seconds, it
crashes and I see a TTY console. Then, I think, gdm tries to restart it and
after a few seconds I have again some graphics on the screen which often is a
corrupted image of what I was seeing before the crash. Then X crashes again,
gdm tries to restart it and so on.

When I'm on the TTYs I'm having some keyboard issues (keys double-typed or
missed) but otherwise they work fine, so I was able to log in and get some
dmesg output and X logs, which I'm attaching.

This issue only appears after I suspend and resume the PC. I can trigger this
behavior almost at will after a resume but I'm not able to do it before. It
also seems to be related to Xorg drivers and/or 3D, since I didn't encounter it
before activating hardware acceleration and it only affects the X server, even
after a restart, while having no effect at all on TTYs.

If you need more detailed information just let me know.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
