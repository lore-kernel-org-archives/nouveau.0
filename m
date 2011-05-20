From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37398] some applications (like wine) crash nouveau
 and leave it in an unworkable state
Date: Fri, 20 May 2011 02:06:40 -0700 (PDT)
Message-ID: <20110520090640.9FE9913004E@annarchy.freedesktop.org>
References: <bug-37398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37398

Andy Matteson <xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #46938|backtrace of crash type #2  |backtrace of crash type #2
        description|(ExaFallbackPrepareReg,     |(ExaCheckPolylines,
                   |exaPrepareAccessReg_mixed)  |exaPrepareAccessReg_mixed)

--- Comment #6 from Andy Matteson <xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-05-20 02:06:40 PDT ---
(From update of attachment 46938)
(gdb) bt
#0  __lll_lock_wait_private () at
../nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:97
#1  0x00007f207f8be80f in _L_lock_12013 () from /lib/x86_64-linux-gnu/libc.so.6
#2  0x00007f207f8bc8d8 in __libc_free (mem=0x7f207fbcf1c0) at malloc.c:3736
#3  0x00000000004a3a12 in _XSERVTransFreeConnInfo (ciptr=0x895f40) at
/usr/include/X11/Xtrans/Xtrans.c:138
#4  0x00000000004a3ef4 in _XSERVTransClose (ciptr=0x895f40) at
/usr/include/X11/Xtrans/Xtrans.c:930
#5  0x0000000000461f1f in CloseWellKnownConnections () at
../../os/connection.c:493
#6  0x000000000045e598 in SigAbortServer (signo=11) at ../../os/log.c:409
#7  0x000000000045f1d2 in FatalSignal (signo=11) at ../../os/log.c:541
#8  <signal handler called>
#9  _int_malloc (av=0x7f207fbcf1c0, bytes=<value optimized out>) at
malloc.c:4709
#10 0x00007f207f8bc31e in __libc_malloc (bytes=7056000) at malloc.c:3660
#11 0x00007f207d435b44 in exaPrepareAccessReg_mixed (pPixmap=0x298ca80,
index=0, pReg=0x0)
    at ../../exa/exa_migration_mixed.c:203
#12 0x00007f207d43fb36 in ExaCheckPolylines (pDrawable=0x23fcca0,
pGC=0x22812a0, mode=0, npt=4, ppt=<value optimized out>)
    at ../../exa/exa_unaccel.c:264
#13 0x00000000004e04d4 in damagePolylines (pDrawable=0x23fcca0, pGC=0x22812a0,
mode=0, npt=<value optimized out>, 
    ppt=<value optimized out>) at ../../../miext/damage/damage.c:1065
#14 0x0000000000424601 in ProcPolyLine (client=0x2ab5be0) at
../../dix/dispatch.c:1748
#15 0x0000000000428259 in Dispatch () at ../../dix/dispatch.c:431
#16 0x0000000000421a7e in main (argc=8, argv=<value optimized out>, envp=<value
optimized out>) at ../../dix/main.c:287

(gdb) bt full
#0  __lll_lock_wait_private () at
../nptl/sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:97
No locals.
#1  0x00007f207f8be80f in _L_lock_12013 () from /lib/x86_64-linux-gnu/libc.so.6
No symbol table info available.
#2  0x00007f207f8bc8d8 in __libc_free (mem=0x7f207fbcf1c0) at malloc.c:3736
        ar_ptr = 0x7f207fbcf1c0
        p = 0x895f90
        hook = <value optimized out>
#3  0x00000000004a3a12 in _XSERVTransFreeConnInfo (ciptr=0x895f40) at
/usr/include/X11/Xtrans/Xtrans.c:138
No locals.
#4  0x00000000004a3ef4 in _XSERVTransClose (ciptr=0x895f40) at
/usr/include/X11/Xtrans/Xtrans.c:930
        ret = 0
#5  0x0000000000461f1f in CloseWellKnownConnections () at
../../os/connection.c:493
        i = <value optimized out>
#6  0x000000000045e598 in SigAbortServer (signo=11) at ../../os/log.c:409
No locals.
#7  0x000000000045f1d2 in FatalSignal (signo=11) at ../../os/log.c:541
        beenhere = 1
#8  <signal handler called>
No symbol table info available.
#9  _int_malloc (av=0x7f207fbcf1c0, bytes=<value optimized out>) at
malloc.c:4709
        p = <value optimized out>
        iters = <value optimized out>
        nb = 7056016
        idx = 127
        bin = 0x7f207fbcf9f8
        victim = 0x331d7e0
        size = <value optimized out>
        victim_index = <value optimized out>
        remainder = 0x39d8270
        remainder_size = <value optimized out>
        block = <value optimized out>
        bit = <value optimized out>
        map = 2147479551
        fwd = <value optimized out>
        bck = <value optimized out>
        errstr = 0x0
        __func__ = "_int_malloc"
#10 0x00007f207f8bc31e in __libc_malloc (bytes=7056000) at malloc.c:3660
        ar_ptr = 0x7f207fbcf1c0
        victim = <value optimized out>
        hook = <value optimized out>
        __func__ = "__libc_malloc"
#11 0x00007f207d435b44 in exaPrepareAccessReg_mixed (pPixmap=0x298ca80,
index=0, pReg=0x0)
    at ../../exa/exa_migration_mixed.c:203
        pixmaps = {{as_dst = 1, as_src = 0, pPix = 0x7f207f8bc8e3, pReg =
0x7fff837226e8}}
        pExaPixmap = 0x298cad0
        has_gpu_copy = <value optimized out>
        success = <value optimized out>
#12 0x00007f207d43fb36 in ExaCheckPolylines (pDrawable=0x23fcca0,
pGC=0x22812a0, mode=0, npt=4, ppt=<value optimized out>)
    at ../../exa/exa_unaccel.c:264
        pExaScr = 0x8c5e90
        pExaGC = 0x2281368
#13 0x00000000004e04d4 in damagePolylines (pDrawable=0x23fcca0, pGC=0x22812a0,
mode=0, npt=<value optimized out>, 
    ppt=<value optimized out>) at ../../../miext/damage/damage.c:1065
        pGCPriv = 0x2281378
        oldFuncs = 0x7dfbc0
#14 0x0000000000424601 in ProcPolyLine (client=0x2ab5be0) at
../../dix/dispatch.c:1748
        npoint = 60654192
        pGC = 0x22812a0
        pDraw = 0x23fcca0
        stuff = 0x2337ba4
#15 0x0000000000428259 in Dispatch () at ../../dix/dispatch.c:431
        clientReady = 0xb2bda0
        result = <value optimized out>
        client = 0x2ab5be0
        nready = 0
        icheck = 0x7f1290
        start_tick = 10300
#16 0x0000000000421a7e in main (argc=8, argv=<value optimized out>, envp=<value
optimized out>) at ../../dix/main.c:287
        i = <value optimized out>
        alwaysCheckForInput = {0, 1}

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
