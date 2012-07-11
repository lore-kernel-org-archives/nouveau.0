From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51962] New: Raz's eyes flicker in Psychonauts on nv50
Date: Wed, 11 Jul 2012 03:24:39 +0000
Message-ID: <bug-51962-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51962

             Bug #: 51962
           Summary: Raz's eyes flicker in Psychonauts on nv50
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bryancain3+fdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


This bug affects the Gallium nv50 driver, but for some reason there's no
"Drivers/Gallium/nv50" component listed in Bugzilla.

In Psychonauts on the nv50 driver, Raz's eyes (supposed to be red) flicker
between red and white.  This behavior first appears in git with the commit that
switches the nv50 driver to use the new nv50/nvc0 shader compiler.  The eye
flickering is caused by one vertex shader being miscompiled.  In the attached
apitrace, the GL program number used to draw Raz's eyes (which has the vertex
shader in question) is 541.  If vertex shader optimizations are disabled in
nv50_program.c, Raz's eyes stay white all the time instead of flickering.  If
shader program 541 is disabled entirely, Raz's eyes render correctly.

It is evident that there is a problem with the vertex shader by looking at its
nv50 IR source after it is converted to SSA - there are several "nop"
instructions at the beginning of the program to compensate for undefined source
registers emitted by the TGSI to nv50 IR conversion.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
