From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10927] segmentation fault in NVUploadToScreen,
	called from exaPutImage
Date: Sun, 10 Jun 2007 11:41:27 -0700 (PDT)
Message-ID: <20070610184127.B177513006A@annarchy.freedesktop.org>
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





------- Comment #1 from pq-X3B1VOXEql0@public.gmane.org  2007-06-10 11:41 PST -------
Finally I had some time to do poking, but somehow I could not get gdb to
understand nouveau_drv.so anymore. Any hints?

Anyway, I found that the following patch for the DDX seems to eliminate this
segmentation fault of the X server.

--- a/src/nv_exa.c
+++ b/src/nv_exa.c
@@ -345,10 +345,14 @@ static Bool NVUploadToScreen(PixmapPtr pDst,
        while (h > 0) {
                NVDEBUG("     max_lines=%d, h=%d\n", max_lines, h);
                int nlines = h > max_lines ? max_lines : h;
+               int nadj = src_pitch - line_length;

                /* reset the notification object */
                memset(pNv->Notifier0->map, 0xff, pNv->Notifier0->size);
-               memcpy(pNv->AGPScratch->map, src, nlines*src_pitch);
+               if(h - nlines > 0)
+                       memcpy(pNv->AGPScratch->map, src, nlines*src_pitch);
+               else
+                       memcpy(pNv->AGPScratch->map, src, nlines*src_pitch -
+                              nadj);
                NVDmaStart(pNv, NvSubMemFormat, MEMFORMAT_NOTIFY, 1);
                NVDmaNext (pNv, 0);

I do not propose this as the fix, because I do not really know what
NVUploadToScreen should do. This patch prevents copying the stride padding of
the last pixel row. I hope someone knows what to do with this.

With this patch applied, sylpheed-claws starts all the way and can even run for
a while, but sooner than later it will hit either SIGFPE in NVUploadToScreen,
or SIGABORT probably due to illegal free(), like this:
(gdb) bt
#0  0x00002ac5f9842885 in raise () from /lib/libc.so.6
#1  0x00002ac5f9843b3e in abort () from /lib/libc.so.6
#2  0x00002ac5f9878a27 in __libc_message () from /lib/libc.so.6
#3  0x00002ac5f987db1d in malloc_printerr () from /lib/libc.so.6
#4  0x00002ac5f987f146 in free () from /lib/libc.so.6
#5  0x000000000061161e in Xfree (ptr=0xc9cc50) at utils.c:1470
#6  0x00002ac5fbfa612c in fbDestroyPixmap (pPixmap=0xc9cc50) at fbpixmap.c:105
#7  0x00002ac5fc0cb7f3 in exaDestroyPixmap (pPixmap=0xc9cc50) at exa.c:218
#8  0x00000000005a3dc2 in damageDestroyPixmap (pPixmap=0xc9cc50)
    at damage.c:1628
#9  0x00002ac5f9fc73b1 in XvDestroyPixmap (pPix=0xc9cc50) at xvmain.c:393
#10 0x000000000044dd70 in dixDestroyPixmap (value=0xc9cc50, pid=16789834)
    at dispatch.c:1466
#11 0x00000000004356e7 in FreeResource (id=16789834, skipDeleteFuncType=0)
    at resource.c:536
#12 0x000000000044e03a in ProcFreePixmap (client=0x9c5260) at dispatch.c:1540
#13 0x000000000056d0d0 in XaceCatchDispatchProc (client=0x9c5260) at xace.c:281
#14 0x000000000044b5f7 in Dispatch () at dispatch.c:457
#15 0x0000000000432dcc in main (argc=9, argv=0x7fffb1bafa18, 
    envp=0x7fffb1bafa68) at main.c:445

More over, some of the fonts are garbled, until the GUI widget is redrawn. I
did not attach a screen capture as these are likely a different problem than
this bug.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
