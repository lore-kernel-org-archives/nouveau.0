From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32453] New: SIGABRT caused by malloc around
 RegionCreate. Can only reproduce with nouveau not vesa.
Date: Thu, 16 Dec 2010 13:27:18 -0800 (PST)
Message-ID: <bug-32453-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32453

           Summary: SIGABRT caused by malloc around RegionCreate. Can only
                    reproduce with nouveau not vesa.
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: brandon-Qdl1sq8EXS0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=41187)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=41187)
Xorg.1.log from the machine

Using git nouveau kernel, libdrm, and nouveau xorg driver as of today on top of
openSUSE Factory Xorg. 

Backtrace from gdb:
#0  0x00007ff87fbb6ad5 in raise (sig=<value optimized out>)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
#1  0x00007ff87fbb7fd6 in abort () at abort.c:92
#2  0x00007ff87fbf75da in __malloc_assert (assertion=<value optimized out>, 
    file=<value optimized out>, line=<value optimized out>, 
    function=<value optimized out>) at malloc.c:352
#3  0x00007ff87fbf97a6 in sYSMALLOc (av=0x7ff87feece80, bytes=15335424)
    at malloc.c:3094
#4  _int_malloc (av=0x7ff87feece80, bytes=15335424) at malloc.c:4747
#5  0x00007ff87fbfbc69 in __libc_malloc (bytes=15335424) at malloc.c:3661
#6  0x00007ff87d146ef4 in exaPrepareAccessReg_mixed (pPixmap=0x1aef1a0, 
    index=1, pReg=0x0) at exa_migration_mixed.c:203
#7  0x00007ff87d143602 in exaChangeWindowAttributes (pWin=0x1ad5dc0, mask=1)
    at exa.c:652
#8  0x00000000005602d7 in compChangeWindowAttributes (pWin=0x1ad5dc0, mask=1)
    at compinit.c:114
#9  0x0000000000436c4d in ChangeWindowAttributes (pWin=<value optimized out>, 
    vmask=1, vlist=<value optimized out>, client=0xb870d0) at window.c:1459
#10 0x000000000043cb78 in ProcChangeWindowAttributes (client=0xb870d0)
    at dispatch.c:693
#11 0x00000000004428f1 in Dispatch () at dispatch.c:432
#12 0x0000000000425b5e in main (argc=9, argv=<value optimized out>, 
    envp=<value optimized out>) at main.c:291

If I use the vesa driver the system comes up fine. Reproducing by launching
emacs inside of a gnome session.

If I use MALLOC_CHECK_=3 /etc/init.d/xdm restart I can sometimes get Xorg w/
nouveau to work for a few days before crashing. But, that isn't a real
solution.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
