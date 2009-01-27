From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13257] using nouveau on NV17 kills the KDE VNC server
Date: Mon, 26 Jan 2009 19:18:45 -0800 (PST)
Message-ID: <20090127031845.D69CA130058@annarchy.freedesktop.org>
References: <bug-13257-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13257-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13257


Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |NOTOURBUG




--- Comment #6 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-01-26 19:18:45 PST ---
Reproduced using vncviewer 4.1.3, ddx cf65b875, drm e6a062c2, and krfb from KDE
3.5.7 (openSUSE 10.3) on nv34m.

Backtrace looks like:

#0  0xffffe410 in __kernel_vsyscall ()
#1  0xb6bd38f5 in *__GI_raise (sig=6)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
#2  0xb6bd51e1 in *__GI_abort () at abort.c:88
#3  0xb6c0a80c in __libc_message (do_abort=2,
    fmt=0xb6cc0f28 "*** glibc detected *** %s: %s: 0x%s ***\n")
    at ../sysdeps/unix/sysv/linux/libc_fatal.c:170
#4  0xb6c104b6 in malloc_printerr (action=2,
    str=0xb6cc1020 "double free or corruption (!prev)",
    ptr=<value optimized out>) at malloc.c:5887
#5  0xb6c12179 in *__GI___libc_free (mem=0x8275fb0) at malloc.c:3622
#6  0xb6e040f9 in _XDestroyImage (ximage=0x8274058) at ImUtil.c:438
#7  0x08056a0c in ~XUpdateScanner (this=0x8272f48)
    at ./krfb/krfb/xupdatescanner.cc:203
#8  0x0805781d in RFBController::stopServer (this=0xbf8f86d0, xtestUngrab=true)
    at ./krfb/krfb/rfbcontroller.cc:481
#9  0x0805a6b7 in ~RFBController (this=0xbf8f86d0)
    at ./krfb/krfb/rfbcontroller.cc:381
#10 0x0805f180 in main (argc=Cannot access memory at address 0x52f4
) at ./krfb/krfb/main.cpp:188
#11 0xb6bbffe0 in __libc_start_main (main=0x805e920 <main>, argc=3,
    ubp_av=0xbf8f8c64, init=0x8081c10 <__libc_csu_init>,
    fini=0x8081c00 <__libc_csu_fini>, rtld_fini=0xb7f20f60 <_dl_fini>,
    stack_end=0xbf8f8c5c) at libc-start.c:222
#12 0x08055601 in _start ()

I'm content to call this a krfb bug; it seems ridiculously easy to make the
tested KDE3 version fail in a number of ways.  The KDE4 (4.1.3) version of krfb
doesn't show it (though at depths != 16 it suffers
http://bugs.kde.org/show_bug.cgi?id=162493 ).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
