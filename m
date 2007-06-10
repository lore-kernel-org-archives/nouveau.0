From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10927] segmentation fault in NVUploadToScreen,
	called from exaPutImage
Date: Sun, 10 Jun 2007 13:35:04 -0700 (PDT)
Message-ID: <20070610203504.B983313006D@annarchy.freedesktop.org>
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





------- Comment #2 from chris-fdbugs-OsFVWbfNK3isTnJN9+BGXg@public.gmane.org  2007-06-10 13:34 PST -------
I get the same SIGABRT (note, we're no longer talking about the segfault)
backtrace with a standard Fedora 7 install, straight after typing my username
into the gdm username field and hitting return:

Program received signal SIGABRT, Aborted.
0x006ed402 in __kernel_vsyscall ()
(gdb) bt
#0  0x006ed402 in __kernel_vsyscall ()
#1  0x00428fa0 in raise () from /lib/libc.so.6
#2  0x0042a8b1 in abort () from /lib/libc.so.6
#3  0x0045febb in __libc_message () from /lib/libc.so.6
#4  0x00467f41 in _int_free () from /lib/libc.so.6
#5  0x0046b580 in free () from /lib/libc.so.6
#6  0x081bb591 in Xfree (ptr=0x0) at utils.c:1470
#7  0x00fd5a4a in fbDestroyPixmap (pPixmap=0x6) at fbpixmap.c:105
#8  0x001f066b in exaDestroyPixmap (pPixmap=0x8d2c760) at exa.c:218
#9  0x0816f054 in damageDestroyPixmap (pPixmap=0x8d2c760) at damage.c:1628
#10 0x006164e0 in XvDestroyPixmap (pPix=0x8d2c760) at xvmain.c:393
#11 0x080825d5 in dixDestroyPixmap (value=0x8d2c760, pid=4194652)
    at dispatch.c:1466
#12 0x08072bed in FreeResource (id=4194652, skipDeleteFuncType=0)
    at resource.c:536
#13 0x080841d3 in ProcFreePixmap (client=0x8cfcaf0) at dispatch.c:1540
#14 0x0814efd1 in XaceCatchDispatchProc (client=0x8cfcaf0) at xace.c:281
#15 0x0808936a in Dispatch () at dispatch.c:457
#16 0x080710a5 in main (argc=10, argv=0xbfa84d24, envp=Cannot access memory at
address 0xf73
) at main.c:445
(gdb) f 6
#6  0x081bb591 in Xfree (ptr=0x0) at utils.c:1470
1470            free((char *)ptr); 
(gdb) f 7
#7  0x00fd5a4a in fbDestroyPixmap (pPixmap=0x6) at fbpixmap.c:105
105         xfree(pPixmap);
(gdb) l
100     Bool
101     fbDestroyPixmap (PixmapPtr pPixmap)
102     {
103         if(--pPixmap->refcnt)
104             return TRUE;
105         xfree(pPixmap);
106         return TRUE;
107     }
108
109     #define ADDRECT(reg,r,fr,rx1,ry1,rx2,ry2)                       \


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
