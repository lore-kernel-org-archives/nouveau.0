From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35875] New: GPU hang while playing games (#1)
Date: Fri,  1 Apr 2011 08:54:02 -0700 (PDT)
Message-ID: <bug-35875-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35875

           Summary: GPU hang while playing games (#1)
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Created an attachment (id=45136)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45136)
git snapshot

Hardware: Geforce 8400M GS - (0x086700a2)
          Acer Aspire 5720G

Userspace: Git tips of all components except Xserver.
          In attached file, you see the latest commits of each tree

Kernel drm version: dd34154f9bd75d13caefffd9d6086a1d23a45856
          drm/nouveau: use static vidshift of 2 on volt 0x30 tables


This time, it happened this way:
I open neverball, play it for a while, then system freezes, nothing in the
kernel log until I execute the SAK, then I get this generic message in the
kernel log:

[ 1678.640048] [drm] nouveau 0000:01:00.0: Failed to idle channel 2.
[ 1680.266949] [drm] nouveau 0000:01:00.0: GPU lockup - switching to software
fbcon
[ 1682.860053] [drm] nouveau 0000:01:00.0: Failed to idle channel 4.


Then X restarts, and doesn't use 3D acceleration because no new GPU channels
can be allocated:

[  1686.340] (EE) NOUVEAU(0): Error creating GPU channel: -16
[  1686.341] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel


Thats all. I really don't expect that to be fixed, just want to document this
issue.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
