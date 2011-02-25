From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34741] New: Freezes every 10 seconds when polling DP
 connections (by default)
Date: Fri, 25 Feb 2011 13:30:37 -0800 (PST)
Message-ID: <bug-34741-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34741

           Summary: Freezes every 10 seconds when polling DP connections
                    (by default)
           Product: xorg
           Version: unspecified
          Platform: All
        OS/Version: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: homyur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=43839)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43839)
dmesg output

Ubuntu 11.04 Alpha 2
HP EliteBook 8440p
Quadro NVS 3100M

If "drm_kms_helper poll" option is enabled (by default), the system freezes for
0.3 seconds every 10 seconds when polling DP connections.

dmesg output:
  ...
  [  242.324730] [drm] nouveau 0000:01:00.0: nouveau_dp_auxch:489 - ch 0 cmd 4
addr 0x50 len 1
  [  242.482252] [drm:output_poll_execute], [CONNECTOR:11:DP-1] status updated
from 2 to 2
  [  242.482261] [drm] nouveau 0000:01:00.0: nouveau_dp_auxch:489 - ch 2 cmd 4
addr 0x50 len 1
  [  242.641851] [drm:output_poll_execute], [CONNECTOR:14:DP-2] status updated
from 2 to 2
  ...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
