From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22756] New: nouveau_fence.c kernel BUG and recursive
	faults
Date: Mon, 13 Jul 2009 14:27:33 -0700 (PDT)
Message-ID: <bug-22756-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22756

           Summary: nouveau_fence.c kernel BUG and recursive faults
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=27647)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=27647)
Xorg log

Nouveau, KMS enabled and working fine, NV28 card.

DRM modules from nouveau/linux-2.6 git, v2.6.31-rc2-65-g7525cc6, branch
master-compat, commit 7525cc6ddc45772f78aa40fe0a767f512f2ae1ed "Clarify
nouveau/DEPENDS file.". This branch is up-to-date with master branch commit
"drm/nouveau: allow celcius on nv20". The host kernel is 2.6.28-gentoo-r5.

When trying to start X, screen blinks, goes black, kernel hits BUGs, but the
machine does not hang. SysRq can unlock the keyboard, but I do not get the
console back, screen stays black. The kernel recommends a reboot after the
recursive fault.

Attaching X.org log (nothing really interesting), and the kernel log with drm
debug=1, except all debug messages starting in nouveau_hw.h disabled (they
overflow the kernel message buffer and I hear they make I2C/DDC fail).

I'm guessing a way to reproduce this would be to remove e.g. NVxxTCL object
from the list of allowed grobjs, and then starting X. Missing NV11TCL was how I
first hit this kind of bug, but adding that did not fix everything. Probably
something wrong in the nouveau DRM error paths.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
