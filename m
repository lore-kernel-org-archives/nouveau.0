From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] New: NV31 lockup
Date: Thu, 26 Feb 2009 17:51:03 -0800 (PST)
Message-ID: <bug-20341-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20341

           Summary: NV31 lockup
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=23346)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=23346)
Xorg.0.log

I'm seeing a lockup when images are changed on screen.  The display will freeze
and all mouse clicks and keyboard input is lost, including keylock toggles. 
Curiously, the pointer will continue tracking mouse movement.  Attached X
clients also seem to be happy remaining connected.

In practice, this happens quite a bit in Opera when switching tabs or scrolling
web pages with large images.  I've found a test case using "x11perf
-putimage500" which triggers the same bug (I think?) after one or two seconds
of drawing the test pattern.

Connecting to the machine over the network shows X taking 100% CPU time. 
Attaching strace shows a rapidly repeating output of:
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])

I can recover to a working system with a "killall -9 X; vbetool post; startx"
stanza, but that's really not something I enjoy doing once an hour.  ;-)


My hardware is
> lspci
01:00.0 VGA compatible controller: nVidia Corporation NV31 [GeForce FX 5600
Ultra] (rev a1) 
> lspci -n
01:00.0 0300: 10de:0311 (rev a1)]
on a VIA KT133 on AGP.

My software is:
Linux 2.6.27.2 (vanilla)
Xserver 1.6.0
xf86-video-nouveau git master 1c4a284a80ebed9f9d1e01c47b929481801566b5
libdrm + nouveau.ko + drm.ko git master
e96fc62e5339e3c8c8944dfe9f5163f769bccbd8
The system is otherwise a Slackware-current installation upgraded with just
enough Xorg componentry to build the new X server.

Thanks,
Jason


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
