From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31366] New: [drm][KMS][Regression] Screen shutdown
	during boot
Date: Wed,  3 Nov 2010 15:22:21 -0700 (PDT)
Message-ID: <bug-31366-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31366

           Summary: [drm][KMS][Regression] Screen shutdown during boot
           Product: xorg
           Version: git
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vivaneon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=40026)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=40026)
Dmesg of 2.6.36.x boot

Graphic Card : Nvidia 9500M (Hybrid SLI : chipset of the Dell Studio XPS 13
composed by a nvidia 9400GM and a 9200GS) Under Linux, only the 9400 is
detected and it always work fine.

I'm using nouveau on an Archlinux x86_64 GNU/linux system. I have had a great
KMS for months, but since the 2.6.35.x kernel, I lost it.

Instead of my KMS, my screen shutdown, and switch on again when X is launching,
and everything went nice, 2D,3D, dual screen etc.

I think it is a drm driver problem. Here is my dmesg with drm.debug=14 to have
a maximum of information, but there isn't really an error.

I tried with Ubuntu 10.10 32/64bits live CDs, but the results are the same,
however when I boot my "old" kernel 2.6.32.x, I still have my KMS of course.

When I type Ctrl+Alt+F1, my computer switch on the tty, I can login and use it
blindly, but my screen show the last screen of my graphical environment.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
