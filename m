From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34139] New: Seemingly random GUI lock-ups
Date: Thu, 10 Feb 2011 08:49:08 -0800 (PST)
Message-ID: <bug-34139-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34139

           Summary: Seemingly random GUI lock-ups
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: robert-LQ6HJt8JPPohMXb2rBuxr9BPR1lH4CV8@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


While using X, at some point everything on screen will freeze (except sometimes
the mouse). I've provided as much information as I can (no information in
Xorg.0.log it seems), let me know if there's any other information I can give
you.
$ Xorg -version:
X.Org X Server 1.9.4
Release Date: 2011-02-04
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.37-ARCH x86_64
Current Operating System: Linux defiant 2.6.37-ARCH #1 SMP PREEMPT Sat Jan 29
20:00:33 CET 2011 x86_64
Kernel command line:
root=/dev/disk/by-uuid/27ebece2-5dcb-41ed-b868-4e826761e3f0 ro
Build Date: 09 February 2011  06:15:16PM

Current version of pixman: 0.20.2

Backtrace from gdb:
(gdb) bt
#0  xf86SIGIO (sig=29) at ./../shared/sigio.c:108
#1  <signal handler called>
#2  0x00007fcc49fd7a28 in ioctl@plt () from /usr/lib/libdrm.so.2
#3  0x00007fcc49fd8268 in drmIoctl () from /usr/lib/libdrm.so.2
#4  0x00007fcc49fda59b in drmCommandWrite () from /usr/lib/libdrm.so.2
#5  0x00007fcc4999aead in ?? () from /usr/lib/libdrm_nouveau.so.1
#6  0x00007fcc4999b4ce in nouveau_bo_map_range () from
/usr/lib/libdrm_nouveau.so.1
#7  0x00007fcc49999f3d in ?? () from /usr/lib/libdrm_nouveau.so.1
#8  0x00007fcc4999a53f in nouveau_pushbuf_flush () from
/usr/lib/libdrm_nouveau.so.1
#9  0x00007fcc49566165 in exaFillRegionSolid (pDrawable=0x1d58f20,
pRegion=0x17d8f40, pixel=0, planemask=4294967295, alu=3,
    clientClipType=<value optimized out>) at exa_accel.c:1038
#10 0x00007fcc49568d31 in exaPolyFillRect (pDrawable=0x1d58f20, pGC=0x100c1a0,
nrect=1, prect=0x7fff285bab60) at exa_accel.c:817
#11 0x00000000004d7c17 in damagePolyFillRect (pDrawable=0x1d58f20,
pGC=0x100c1a0, nRects=1, pRects=0x7fff285bab60) at damage.c:1400
#12 0x00007fcc4956a398 in exaGlyphs (op=3 '\003', pSrc=0x1bae0d0,
pDst=0x1cb8000, maskFormat=0xfb0e88, xSrc=665, ySrc=354, nlist=1,
    list=0x7fff285bb540, glyphs=0x7fff285bad40) at exa_glyphs.c:785
#13 0x00000000004d7315 in damageGlyphs (op=3 '\003', pSrc=0x1bae0d0,
pDst=0x1cb8000, maskFormat=0xfb0e88, xSrc=665, ySrc=354,
    nlist=1, list=0x7fff285bb540, glyphs=0x7fff285bad40) at damage.c:718
#14 0x00000000004d0c6d in ProcRenderCompositeGlyphs (client=0x1aa2ae0) at
render.c:1435
#15 0x000000000042d201 in Dispatch () at dispatch.c:432
#16 0x000000000042131e in main (argc=6, argv=<value optimized out>, envp=<value
optimized out>) at main.c:291

Full backtrace:
http://xorg.pastebin.com/JUhCBwyp

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
