From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22253] KMS Nouveau - wfb crash
Date: Wed, 24 Jun 2009 07:46:20 -0700 (PDT)
Message-ID: <20090624144621.15B42130016@annarchy.freedesktop.org>
References: <bug-22253-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-22253-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22253





--- Comment #14 from okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-06-24 07:46:20 PST ---
Here is complete bt :-)

(gdb) continue
Continuing.

Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f96211626f0 (LWP 7427)]
nouveau_wfb_setup_wrap (pRead=0x7f961bc715d8, pWrite=0x7f961bc715d0,
    pDraw=<value optimized out>) at nouveau_wfb.c:153
153     nouveau_wfb.c: No such file or directory.
        in nouveau_wfb.c
(gdb)  continue
Continuing.

Program received signal SIGABRT, Aborted.
0x00007f961e5f1285 in raise () from /lib/libc.so.6
(gdb) bt
#0  0x00007f961e5f1285 in raise () from /lib/libc.so.6
#1  0x00007f961e5f2642 in abort () from /lib/libc.so.6
#2  0x000000000046540f in ddxGiveUp () at xf86Init.c:1396
#3  0x00000000004654c9 in AbortDDX () at xf86Init.c:1441
#4  0x0000000000455fb3 in AbortServer () at log.c:404
#5  0x000000000045658c in FatalError (
    f=0x55a608 "Caught signal %d (%s). Server aborting\n") at log.c:529
#6  0x000000000045998b in OsSigHandler (signo=11, sip=0x7f961d4fa1b0,
    unused=<value optimized out>) at osinit.c:152
#7  <signal handler called>
#8  nouveau_wfb_setup_wrap (pRead=0x7f961bc715d8, pWrite=0x7f961bc715d0,
    pDraw=<value optimized out>) at nouveau_wfb.c:153
#9  0x00007f961ba63131 in wfbFill (pDrawable=0x1ce20d0, pGC=0x1ce1f70, x=26,
    y=26, width=192, height=17) at fbfill.c:116
#10 0x00007f961ba63497 in wfbPolyFillRect (pDrawable=0x1ce20d0, pGC=0x1ce1f70,
    nrect=<value optimized out>, prect=0x1d0c954) at fbfillrect.c:77
#11 0x00007f961b625040 in ExaCheckPolyFillRect (pDrawable=0x1ce20d0,
    pGC=0x1ce1f70, nrect=1, prect=0x1d0c954) at exa_unaccel.c:249
#12 0x00007f961b61d74d in exaPolyFillRect (pDrawable=0x1ce20d0, pGC=0x1ce1f70,
    nrect=1, prect=0x1d0c954) at exa_accel.c:816
#13 0x00000000004b8604 in damagePolyFillRect (pDrawable=0x1ce20d0,
---Type <return> to continue, or q <return> to quit---
    pGC=0x1ce1f70, nRects=1, pRects=0x1d0c954) at damage.c:1404
#14 0x0000000000444330 in ProcPolyFillRectangle (client=0x1c4f830)
    at dispatch.c:1925
#15 0x00000000004462c4 in Dispatch () at dispatch.c:426
#16 0x0000000000425ed2 in main (argc=10, argv=0x7fff970d9f98,
    envp=<value optimized out>) at main.c:283
(gdb) quit
The program is running.  Quit anyway (and detach it)? (y or n) y
Detaching from program: /usr/bin/X, process 7427


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
