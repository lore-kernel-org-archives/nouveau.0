From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45752] New: Debian Wheezy with xfce4-power-manager
 and noveau fails to resume from hibernate
Date: Tue, 07 Feb 2012 21:15:54 +0000
Message-ID: <bug-45752-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45752

             Bug #: 45752
           Summary: Debian Wheezy with xfce4-power-manager and noveau
                    fails to resume from hibernate
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rmsystematicfailure-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Suspending/resuming to ram works fine, but thawing from hibernate causes a
blank screen and an unresponsive keyboard. SSH works fine though.

Disabling kernel mode setting works but then the display resolution is really
lmited and only parts of the desktop is visible.

Some kind of timeout?

root@bergarn:~# uname -a
Linux bergarn 3.1.0-1-amd64 #1 SMP Tue Jan 10 05:01:58 UTC 2012 x86_64
GNU/Linux

root@bergarn:~# dmesg | grep drm

<snip>
[  375.581395] [drm] nouveau 0000:01:00.0: Disabling fbcon acceleration...
[  375.581399] [drm] nouveau 0000:01:00.0: Unpinning framebuffer(s)...
[  375.581482] [drm] nouveau 0000:01:00.0: Evicting buffers...
[  376.577978] [drm] nouveau 0000:01:00.0: Idling channels...
[  376.578088] [drm] nouveau 0000:01:00.0: Suspending GPU objects...
[  376.871211] [drm] nouveau 0000:01:00.0: And we're gone!
[  378.558456] [drm] nouveau 0000:01:00.0: We're back, enabling device...
[  378.558471] [drm] nouveau 0000:01:00.0: POSTing device...
[  378.558474] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0x7D74
[  378.608964] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0x8497
[  378.641548] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0x9AD6
[  378.641799] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0x9AE0
[  378.642700] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0x9CB5
[  378.642701] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0x9D1A
[  380.628904] [drm] nouveau 0000:01:00.0: 0x9D1A: Condition still not met
after 2000ms, skipping following opcodes
[  380.630216] [drm] nouveau 0000:01:00.0: Restoring GPU objects...
[  380.640617] [drm] nouveau 0000:01:00.0: Reinitialising engines...
[  380.640909] [drm] nouveau 0000:01:00.0: Restoring mode...
[  382.640908] [drm] nouveau 0000:01:00.0: timeout:
CURSOR_CTRL2_STATUS_ACTIVE(0)
[  382.640961] [drm] nouveau 0000:01:00.0: CURSOR_CTRL2(0) = 0x00000000
</snip>

Machine is a Clevo P170HM with Intel Q2760M and Geforce GTX 560M.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
