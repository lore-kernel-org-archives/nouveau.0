From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16792] New: modesetting on NV86: text mode goes
 blank, machine freeze on gdm stop
Date: Mon, 21 Jul 2008 07:20:20 -0700 (PDT)
Message-ID: <bug-16792-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16792

           Summary: modesetting on NV86: text mode goes blank, machine
                    freeze on gdm stop
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=17791)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17791)
X log of gdm session

modesetting on NV86: text mode goes blank, machine freeze on gdm stop

using branches nouveau/master, mesa/drm/modestting-101 and
nouveau/mesa/gallium-0.1.

I reboot in single user mode, modprobe "drm debug=1" and "nouveau modeset=1".

At this moment, the screen turns blacks but the machine does not freeze. From a
SSH, I can start gdm and it seems to work, though the screen is still black.

When trying to stop gdm, the machine is freezing.

After X start I had many of these lines:

Jul 21 15:48:36 xiong kernel: [  605.062180] [drm] PGRAPH_ERROR - nSource:
PROTECTION_ERROR, nStatus:
Jul 21 15:48:36 xiong kernel: [  605.062APH_ERROR - Ch 2/0 Class 0x502d Mthd
0x08dc APH_ERROR - Ch 2/0 Class 0x502d Mthd 0x08dc Data 0x00000000:0x00000000

(Yeah, I was told not to use the debug option, I typed too fast.)

Adding logs as usual.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
