From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27587] New: X (nouveau) crashes kernel on start
Date: Sun, 11 Apr 2010 11:28:43 -0700 (PDT)
Message-ID: <bug-27587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27587

           Summary: X (nouveau) crashes kernel on start
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex.vizor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=34893)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=34893)
kernel log

Hi. I recently updated Linus' kernel tree to revision
0eddb519b9127c73d53db4bf3ec1d45b13f844d1 (2.6.34-git), nouveau DDX from git to
revision 4063616938f76af8028491276039d422c0782b1b and libdrm, also from git, to
revision 894c86e8400f13f1ee0dfe23ca4b5f98c32d9223. Then I recompiled all the
code in following order 1) kernel; 2) libdrm; 3) DDX. And rebooted - after
starting X left several seconds system hangs up, I think that was kernel panic
because CapsLock was blinking and system didn't respond on any attempts to
reboot, even SysRq didn't help.

With 2.6.34-rc3 same versions of DDX and libdrm work fine. The interesting fact
that there is nothing in kernel log and syslog about this.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
