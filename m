From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33436] New: data error on channel 128 when running
	piglit
Date: Mon, 24 Jan 2011 14:42:44 -0800 (PST)
Message-ID: <bug-33436-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33436

           Summary: data error on channel 128 when running piglit
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=42413)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=42413)
dmesg

I get the following message associated with screen freeze every time I do a
piglit run :
[  512.205375] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR INVALID_OBJECT
[  512.205381] [drm] nouveau 0000:01:00.0: PGRAPH - DATA_ERROR
[  512.205387] [drm] nouveau 0000:01:00.0: PGRAPH - ch 128 (0x0002d30000) subc
3 class 0x5039 mthd 0x0184 data 0x00000e02

Previously I got vanishing text/pictures rather than freeze, but this behavior
has been there for a long time now.

I think it was introduced in October after the 2.6.36-rc7 merge but not 100%
sure.

This commit makes the problem appear less quickly, but it is still reproducible
:
drm/nv50: Fix race with PFIFO during PGRAPH context destruction.

git as of today:
kernel: 64b792
drm: 550fe2
ddx: 38e880

01:00.0 VGA compatible controller: nVidia Corporation G84 [GeForce 8600M GT]
(rev a1)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
