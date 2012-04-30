From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49295] New: artifacts in prboom on NV86
Date: Mon, 30 Apr 2012 08:27:48 +0000
Message-ID: <bug-49295-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49295

             Bug #: 49295
           Summary: artifacts in prboom on NV86
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
        ReportedBy: svenjoac-Mmb7MZpHnFY@public.gmane.org


Created attachment 60784
  --> https://bugs.freedesktop.org/attachment.cgi?id=60784
Doom 1, Episode 1, Map 4 under prboom 2.5.0

Under prboom 2.5.0 with OpenGL renderer, I'm seeing bad artifacts:

- Walls are very bright, sometimes transparent.  In some cases,
  the texture disappears completely and is replaced by a solid color.

- A "hall of mirrors effect" as described in
http://doomwiki.org/wiki/Hall_of_mirrors_effect.

I'm attaching a screenshot from Doom 1, Episode 1, Map 4 shortly after the
start.

There are no error messages in the kernel logs, and other 3D games (including
doomsday, another Doom source port) are unaffected.


Hardware is a GeForce 8500 GT, software stack as follows:

Mesa from git commit 4c15a77f27
Kernel 3.4.0-rc5
Libdrm from git commit 754655c795
Nouveau DDX from git commit 174f170720

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
