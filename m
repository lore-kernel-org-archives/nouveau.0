From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14820] New: Double mouse cursor on nv4
Date: Tue,  4 Mar 2008 15:03:18 -0800 (PST)
Message-ID: <bug-14820-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14820

           Summary: Double mouse cursor on nv4
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=14833)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14833)
Xorg log file

With Randr1.2 enabled, I get two mouse cursors after a few mode changes. One
that moves (sw emulated cursor) and one that doesn't (presumably the hw cursor
sitting there).

01:00.0 0300: 10de:002d (rev 15)
01:00.0 VGA compatible controller: nVidia Corporation NV5M64 [RIVA TNT2 Model
64/Model 64 Pro] (rev 15)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
