From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24555] New: X server crash
Date: Thu, 15 Oct 2009 10:31:10 -0700 (PDT)
Message-ID: <bug-24555-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24555

           Summary: X server crash
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


gmpc's on-screen display plugin triggers a nouveau crash:

Program received signal SIGABRT, Aborted.
0x0000003a95e33575 in raise (sig=<value optimized out>)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
64   return INLINE_SYSCALL (tgkill, 3, pid, selftid, sig);
(gdb) bt
#0  0x0000003a95e33575 in raise (sig=<value optimized out>)
    at ../nptl/sysdeps/unix/sysv/linux/raise.c:64
#1  0x0000003a95e34d55 in abort () at abort.c:92
#2  0x0000003a95e2c655 in __assert_fail (assertion=0x7f26b358288a "ret == 0", 
    file=<value optimized out>, line=289, 
    function=0x7f26b3582910 "nouveau_pushbuf_flush") at assert.c:81
#3  0x00007f26b35810d1 in nouveau_pushbuf_flush (chan=0x902c50, min=951)
    at nouveau_pushbuf.c:289
#4  0x00007f26b37e8376 in WAIT_RING (size=<value optimized out>, chan=0x902c50)
    at /usr/include/nouveau/nouveau_pushbuf.h:79
#5  NV50EXAUploadSIFC (size=<value optimized out>, chan=0x902c50)
    at nv50_exa.c:399
#6  0x00007f26b37b9675 in nouveau_exa_upload_to_screen (pdpix=0x15edfd0, 
    x=<value optimized out>, y=4, w=950, h=1, 
    src=0x182ae48
"Dq\206\377Hu\212\377Kz\217\377L{\220\377M|\222\377P\177\225\377P\201\227\377M~\224\377R\203\231\377Q\202\230\377P\201\227\377O\200\226\377O\200\226\377P\201\227\377P\201\227\377Q\202\230\377Q\203\227\377O\201\225\377O~\223\377O~\223\377R\202\224\377T\204\226\377S\203\225\377S\201\223\377Q\177\220\377R~\217\377O{\214\377Kw\210\377Fr\203\377@l}\377=hy\377:ev\377:ev\377\065`q\377\064\\n\377\066^p\377\070`r\377\071as\377;cu\377=ew\377<bt\377<bt\377:`r\377\071_q\377:`r\377?ew\377Bhz\377Ci{\377@ey\377=bv\377"..., 
    src_pitch=<value optimized out>) at nouveau_exa.c:516
#7  0x00007f26b197a50f in exaCopyDirty (migrate=<value optimized out>, 
---Type <return> to continue, or q <return> to quit---
    pValidDst=<value optimized out>, pValidSrc=<value optimized out>, 
    transfer=0x7f26b37b9400 <nouveau_exa_upload_to_screen>, 
    fallback_index=<value optimized out>, sync=<value optimized out>)
    at exa_migration_classic.c:217
#8  0x00007f26b197c350 in exaDoMigration_mixed (pixmaps=<value optimized out>, 
    npixmaps=1, can_accel=<value optimized out>) at exa_migration_mixed.c:103
#9  0x00007f26b197c223 in exaMoveInPixmap_mixed (pPixmap=<value optimized out>)
    at exa_migration_mixed.c:120
#10 0x00007f26b1979032 in exaFinishAccess (pDrawable=<value optimized out>, 
    index=0) at exa.c:421
#11 0x00007f26b1984963 in ExaCheckPolyGlyphBlt (pDrawable=0x15edfd0, 
    pGC=0x15e43c0, x=906, y=23, nglyph=<value optimized out>, 
    ppci=<value optimized out>, pglyphBase=<value optimized out>)
    at exa_unaccel.c:286
#12 0x00000000004d51ea in damageText (pDrawable=<value optimized out>, 
    pGC=0x15e43c0, x=906, y=<value optimized out>, 
    count=<value optimized out>, chars=<value optimized out>, 
    fontEncoding=<value optimized out>, textType=<value optimized out>)
    at damage.c:1536
#13 0x00000000004d56d0 in damagePolyText8 (pDrawable=0x15edfd0, pGC=0x15e43c0, 
    x=<value optimized out>, y=23, count=1, chars=<value optimized out>)
    at damage.c:1554
#14 0x000000000042f4ac in doPolyText (client=0x15c4850, c=0x7fff0aba25b0)
---Type <return> to continue, or q <return> to quit---
    at dixfonts.c:1394
#15 0x000000000042fa50 in PolyText (client=<value optimized out>, 
    pDraw=<value optimized out>, pGC=<value optimized out>, 
    pElt=<value optimized out>, endReq=<value optimized out>, 
    xorg=<value optimized out>, yorg=<value optimized out>, 
    reqType=<value optimized out>, did=<value optimized out>)
    at dixfonts.c:1467
#16 0x000000000042ae4f in ProcPolyText (client=0x15c4850) at dispatch.c:2348
#17 0x000000000042c60c in Dispatch () at dispatch.c:445
#18 0x0000000000421c9a in main (argc=<value optimized out>, 
    argv=<value optimized out>, envp=<value optimized out>) at main.c:285
(gdb) 


The kernel says '[drm] nouveau 0000:01:00.0: validate: -85' when this happens,
because ttm_bo_wait_cpu() is returning -ERESTART. If I convert that to
returning -EINTR, it just goes into an endless loop calling it over and over
again instead of aborting.

This is a MacBook Pro with GeForce 8600M GT
Running current packages from Fedora 12 rawhide.

https://bugzilla.redhat.com/show_bug.cgi?id=528005


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
