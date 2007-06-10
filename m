From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10927] segmentation fault in NVUploadToScreen,
	called from exaPutImage
Date: Sun, 10 Jun 2007 15:24:32 -0700 (PDT)
Message-ID: <20070610222432.8908F13006D@annarchy.freedesktop.org>
References: <bug-10927-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10927-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10927





------- Comment #5 from chris-fdbugs-OsFVWbfNK3isTnJN9+BGXg@public.gmane.org  2007-06-10 15:24 PST -------
Once more, this time with glibc-debuginfo installed.  We're getting hit by the
glibc malloc detection stuff.

Program received signal SIGABRT, Aborted.
0x00b2a402 in __kernel_vsyscall ()
(gdb) bt
#0  0x00b2a402 in __kernel_vsyscall ()
#1  0x00428fa0 in *__GI_raise (sig=6)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
#2  0x0042a8b1 in *__GI_abort () at abort.c:88
#3  0x0045febb in __libc_message (do_abort=2, 
    fmt=0x526a44 "*** glibc detected *** %s: %s: 0x%s ***\n")
    at ../sysdeps/unix/sysv/linux/libc_fatal.c:170
#4  0x00467f41 in _int_free (av=0x551120, mem=0x97dd9f8) at malloc.c:5887
#5  0x0046b580 in *__GI___libc_free (mem=0x97dd9f8) at malloc.c:3622
#6  0x081bb5b0 in Xfree (ptr=0x97dd9f8) at utils.c:1472
#7  0x00c50a99 in fbDestroyPixmap (pPixmap=0x97dd9f8) at fbpixmap.c:107
#8  0x002576a5 in exaDestroyPixmap (pPixmap=0x97dd9f8) at exa.c:220
#9  0x0816f054 in damageDestroyPixmap (pPixmap=0x97dd9f8) at damage.c:1628
#10 0x002ae4e0 in XvDestroyPixmap (pPix=0x97dd9f8) at xvmain.c:393
#11 0x080825d5 in dixDestroyPixmap (value=0x97dd9f8, pid=4194747)
    at dispatch.c:1466
#12 0x08072bed in FreeResource (id=4194747, skipDeleteFuncType=0)
    at resource.c:536
#13 0x080841d3 in ProcFreePixmap (client=0x97ae9d8) at dispatch.c:1540
#14 0x0814efd1 in XaceCatchDispatchProc (client=0x97ae9d8) at xace.c:281
#15 0x0808936a in Dispatch () at dispatch.c:457
#16 0x080710a5 in main (argc=10, argv=0xbffbba54, envp=Cannot access memory at
address 0xa50
) at main.c:445


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
