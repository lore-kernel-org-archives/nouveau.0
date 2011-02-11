From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34179] New: Nouveau 3D driver: nv50_pc_emit.c:863
 assertion error kills Compiz
Date: Fri, 11 Feb 2011 07:06:23 -0800 (PST)
Message-ID: <bug-34179-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34179

           Summary: Nouveau 3D driver: nv50_pc_emit.c:863 assertion error
                    kills Compiz
           Product: Mesa
           Version: 7.10
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sense-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org


When you use the experimental Gallium3D driver of Nouveau to enable DRI, Compiz
will actually try to run, but it will be abort because of the following
assertion error:
"compiz: nv50_pc_emit.c:863: emit_flop: Assertion `STYPE(i, 0) == 0x09'
failed."

It seems that this only happens with PCI-E cards that have the NV50 chip.

There is an 'xorg.log' at <http://launchpadlibrarian.net/63209980/XorgLog.txt>.
An unprocessed stacktrace can be found at
<http://launchpadlibrarian.net/63209976/Stacktrace.txt>, the stacktrace
processed by Apport at <http://launchpadlibrarian.net/63321404/Stacktrace.txt>.
StacktraceTop:
 __kernel_vsyscall ()
 *__GI_raise (sig=6)
 *__GI_abort () at abort.c:59

This bug was originally reported by several people in Ubuntu on Launchpad, the
master bug report can be found at <https://launchpad.net/bugs/710588>. You can
find many more log files at this bug report, and attached to its duplicates.
If you need something specifically, please ask!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
