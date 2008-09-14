From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17571] New: Nouveau and PPC64 issues
Date: Sun, 14 Sep 2008 09:39:43 -0700 (PDT)
Message-ID: <bug-17571-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17571

           Summary: Nouveau and PPC64 issues
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.goyet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Running nouveau on PPC64 is a whole experience :-)

 - Running from git/master crashes X : "(EE) NOUVEAU(0): No known BIOS
signature found"

 - Removing nvidiafb and using only offb was suggested, done, but didn't change
a lot of things

 - Commenting { "PROM", load_vbios_prom }," in nv_bios.c fixed the first issue.

 - I was then back to the same state I was at a few weeks ago : the screen is
full of weird vertical multicolored lines.

 - Taking a screenshot with ImageMagick's 'import' shows a perfectly good image

 - Trying to go back to the console (killing X) would show a black screen

 - Adding "return;" at the start of the run_tmds_table function in nv_bios.c
mostly fixes the issu : the screen is now totally readable, even though some
artefact appear throughout the screen

 - Adding `Option "Randr12" "Off"' in your xorg.conf device section eventually
totally fixed the issue, letting me use nouveau on a PPC64 machine !!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
