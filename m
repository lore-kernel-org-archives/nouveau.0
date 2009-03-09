From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20547] New: nouveau drm doesn't build
Date: Sun,  8 Mar 2009 17:57:43 -0700 (PDT)
Message-ID: <bug-20547-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20547

           Summary: nouveau drm doesn't build
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dliana-/1bC63wxbnDD0D/r9Z6QQA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm using Gentoo, nouveau overlay.  Kernel is 2.6.29-rc7-git1.  The Gentoo
ebuild pulls x11-drm source from git.  I'm on powerpc.

I get this error:
  CC [M] 
/var/tmp/portage/x11-base/x11-drm-99999999/work/drm/linux-core/nouveau_state.o
/var/tmp/portage/x11-base/x11-drm-99999999/work/drm/linux-core/nouveau_state.c:
In function 'nouveau_load':
/var/tmp/portage/x11-base/x11-drm-99999999/work/drm/linux-core/nouveau_state.c:499:
error: implicit declaration of function '___swab32'
make[2]: ***
[/var/tmp/portage/x11-base/x11-drm-99999999/work/drm/linux-core/nouveau_state.o]
Error 1
make[1]: ***
[_module_/var/tmp/portage/x11-base/x11-drm-99999999/work/drm/linux-core] Error
2
make[1]: Leaving directory `/usr/src/linux-2.6.29-rc7-git1'
make: *** [modules] Error 2

If I change "___swab32" to "__fswab32" this compiles, as per #nouveau on irc.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
