From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35374] New: nouveau: nv50,
 regression "GPU lockup - switching to software fbcon" introduced in
 2.6.38-rc8
Date: Wed, 16 Mar 2011 16:42:33 -0700 (PDT)
Message-ID: <bug-35374-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35374

           Summary: nouveau: nv50, regression "GPU lockup - switching to
                    software fbcon" introduced in 2.6.38-rc8
           Product: xorg
           Version: 7.4
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tallica-h7QdYz1kt/Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=44527)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=44527)
dmesg log, 2.6.38 with commit 73412c3854c877e5f37ad944ee8977addde4d35a reverted

There's a regression introduced in kernel >=2.6.38-rc8. It's in nouveau/master
(commit 7972f91c24bb66643d76cf635faea78eb184e6b6) as well. Dmesg shows: "GPU
lockup - switching to software fbcon". I've done a git bisect. The problematic
commit is: 73412c3854c877e5f37ad944ee8977addde4d35a "drm/nouveau: allocate
kernel's notifier object at end of block". I reverted that commit on top of the
2.6.38 to confirm the issue.

Reproducible: always

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
