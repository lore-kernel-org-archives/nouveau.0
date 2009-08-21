From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23445] New: NV46: GPU lockup on VT switch
Date: Fri, 21 Aug 2009 16:01:34 -0700 (PDT)
Message-ID: <bug-23445-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23445

           Summary: NV46: GPU lockup on VT switch
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I got these errors on the logs after switching from Xorg to another VT, and
logging in:

(...)
Aug 21 23:39:50 pinguinus login[5571]: ROOT LOGIN  on '/dev/tty1'
Aug 21 23:40:01 pinguinus cron[5579]: (root) CMD (test -x /usr/sbin/run-crons
&& /usr/sbin/run-crons )
Aug 21 23:40:02 pinguinus [   47.488542] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 0/3 Mthd 0x1268 Data 0x00000000
Aug 21 23:40:02 pinguinus [   47.488548] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 21 23:40:02 pinguinus [   47.488555] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 0/2 Mthd 0x0c6c Data 0x00000000
Aug 21 23:40:02 pinguinus [   47.488561] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 21 23:40:02 pinguinus [   47.488587] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 21 23:40:03 pinguinus [   47.730059] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Aug 21 23:40:03 pinguinus [   47.977559] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Aug 21 23:40:03 pinguinus [   48.220945] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon

The "GPU lockup" message goes on and on, and the terminal is damn slow. After
trying to change back to the X's VT, the system seemed to hang. Ctrl+Alt+SysRq
still worked, so I managed to sync disk and reboot:

(...)
Aug 21 23:42:58 pinguinus [  223.124393] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Aug 21 23:42:58 pinguinus [  223.351695] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Aug 21 23:43:03 pinguinus [  228.097813] SysRq : Emergency Sync
Aug 21 23:43:42 pinguinus syslog-ng[5220]: syslog-ng starting up;
version='2.1.4'
(...)


Today I've switched to "all-git" versions of Xorg components, and it has been a
quite a ride so far :)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
