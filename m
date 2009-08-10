From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23231] New: Nouveau driver from git fails to build
Date: Mon, 10 Aug 2009 01:28:15 -0700 (PDT)
Message-ID: <bug-23231-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23231

           Summary: Nouveau driver from git fails to build
           Product: xorg
           Version: 6.99.99.904 (7.0 RC4)
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi to all,
         I'm currently using Fedora Rawhide 12 Constantine.
I also complile D.R.M the unamed git repository for the nouveau kernel
moudules,Mesa and the Nouveau driver form git.My graphics card is an nvidia
geforce 6,800 G.T with 256Mb of memory,my monitor is a A.D.I Microscan G1000.

I've been building the former source code from git ok,but I'm having trouble
building the Nouveau driver.I update the commits from the nouveau git
repository regulary.

The problem is after ./configure and then run make.I'll try and type the error
I'm getting as accurately as possible:

Make all-recursive
make[1]: Entering directory '/opt/xf86-video-nouvuea'
Making all in src
make[2]: entering directory '/opt/xf86-video-nouveau/src'
CC nouveau_exa.lo
nouveau_exa.c: In function 'nouveau_exa_init'
nouveau_exa.c:576:error:'EXA_MIXED_PIXMAPS'undelclared(first use in this
function
nouveau_exa.c:576:error:for each function declared in)
make[2]:*** [nouveau_exa.lo] Error1

I hope anybody can solve this problem.
Regards,
       STEVE555


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
