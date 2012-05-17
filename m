From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50058] New: [NV86] All OpenGL programs crashing with
 nouveau dri
Date: Thu, 17 May 2012 17:46:18 +0000
Message-ID: <bug-50058-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50058

             Bug #: 50058
           Summary: [NV86] All OpenGL programs crashing with nouveau dri
    Classification: Unclassified
           Product: Mesa
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org


Created attachment 61754
  --> https://bugs.freedesktop.org/attachment.cgi?id=61754
glxinfo backtrace

All programs, which use OpenGL, are crashing with nouveau dri, llvmpipe works
fine. You can find glxinfo backtrace in the attached file. Please tell me if
any other traces/info is needed to fix the issue.

01:00.0 VGA compatible controller: NVIDIA Corporation G86 [GeForce 8400M GS]
(rev a1)
mesa-git (rev 03e3bc4 gallium/auxiliary/pipe-loader: Fix usage of anonymous
union.)
libdrm-git (rev 481234f radeon: Add Southern Islands PCI IDs.)
xf86-video-noveau-git (rev 581564 dri2: Don't try to page-flip pixmaps (fdo bug
49351).)
X version 1.12.1.901
kernel-3.2.6

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
