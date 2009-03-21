From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20780] nouveau corrupts at start,
 then crashes after a few drawing operations. 7800gt when
 NoAccel=false
Date: Fri, 20 Mar 2009 22:30:41 -0700 (PDT)
Message-ID: <20090321053042.05FB6130016@annarchy.freedesktop.org>
References: <bug-20780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20780





--- Comment #4 from Andy Matteson <xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-03-20 22:30:40 PST ---
Very sure it's related to this bug:
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nv/+bug/62230

and

http://www.nvnews.net/vbulletin/showthread.php?t=31858&pp=15&highlight=loop&page=27

The 'nv' driver freezes using XAA acceleration.

Backtrace of that: (gdb) backtrace
#0  0x00007f8f71f58dc7 in NVDmaWait () from
/usr/lib/xorg/modules/drivers//nv_drv.so
#1  0x00007f8f71f59e90 in ?? () from /usr/lib/xorg/modules/drivers//nv_drv.so
#2  0x00007f8f706d25c2 in XAATEGlyphRendererScanlineLSBFirst (pScrn=0x187c990,
x=63, y=250, w=228, h=7, skipleft=0, startline=5, glyphs=0x18a6a90,
glyphWidth=6, 
    fg=16777215, bg=0, rop=3, planemask=4294967295) at
../../../../hw/xfree86/xaa/./xaaTEGlyph.c:408
#3  0x00007f8f706acd6d in XAAGlyphBltTEColorExpansion (pScrn=0x187c990,
xInit=63, yInit=<value optimized out>, font=<value optimized out>, fg=16777215,
bg=0, 
    rop=3, planemask=4294967295, cclip=0x1b22d00, nglyph=38, gBase=0x0,
ppci=0x18a4230) at ../../../../hw/xfree86/xaa/xaaTEText.c:297
#4  0x00007f8f706ad123 in XAAImageText16TEColorExpansion (pDraw=0x1b22cb0,
pGC=0x1b1ba80, x=62, y=260, count=<value optimized out>, chars=0x1b8443c)
    at ../../../../hw/xfree86/xaa/xaaTEText.c:145
#5  0x00007f8f706e9068 in cwImageText16 (pDst=<value optimized out>,
pGC=0x1b1ba80, x=62, y=260, count=38, chars=0x1b8443c) at
../../../miext/cw/cw_ops.c:425
#6  0x000000000053d3d0 in damageImageText16 (pDrawable=0x1b22cb0,
pGC=0x1b1ba80, x=62, y=260, count=38, chars=0x1b8443c) at
../../../miext/damage/damage.c:1618
#7  0x0000000000450194 in doImageText (client=0x1b283b0, c=0x7fff7e1807e0) at
../../dix/dixfonts.c:1576
#8  0x00000000004503ac in ImageText (client=0x187d000, pDraw=<value optimized
out>, pGC=0xa28, nChars=0, data=0x14 <Address 0x14 out of bounds>,
xorg=1899069440, 
    yorg=260, reqType=<value optimized out>, did=2097197) at
../../dix/dixfonts.c:1627
#9  0x000000000044bce4 in ProcImageText16 (client=0x1b283b0) at
../../dix/dispatch.c:2205
#10 0x000000000044e354 in Dispatch () at ../../dix/dispatch.c:437
#11 0x0000000000433ddd in main (argc=4, argv=0x7fff7e180a18, envp=<value
optimized out>) at ../../dix/main.c:397
(gdb) backtrace full
#0  0x00007f8f71f58dc7 in NVDmaWait () from
/usr/lib/xorg/modules/drivers//nv_drv.so
No symbol table info available.
#1  0x00007f8f71f59e90 in ?? () from /usr/lib/xorg/modules/drivers//nv_drv.so
No symbol table info available.
#2  0x00007f8f706d25c2 in XAATEGlyphRendererScanlineLSBFirst (pScrn=0x187c990,
x=63, y=250, w=228, h=7, skipleft=0, startline=5, glyphs=0x18a6a90,
glyphWidth=6, 
    fg=16777215, bg=0, rop=3, planemask=4294967295) at
../../../../hw/xfree86/xaa/./xaaTEGlyph.c:408
        infoRec = (XAAInfoRecPtr) 0x18a38f0
        bufferNo = 1
        GlyphFunc = (GlyphScanlineFuncPtr) 0x7f8f706d1190
<DrawTETextScanlineWidth6>
#3  0x00007f8f706acd6d in XAAGlyphBltTEColorExpansion (pScrn=0x187c990,
xInit=63, yInit=<value optimized out>, font=<value optimized out>, fg=16777215,
bg=0, 
    rop=3, planemask=4294967295, cclip=0x1b22d00, nglyph=38, gBase=0x0,
ppci=0x18a4230) at ../../../../hw/xfree86/xaa/xaaTEText.c:297
        fallbackBits = <value optimized out>
        infoRec = (XAAInfoRecPtr) 0x18a38f0
        skippix = <value optimized out>
        skipglyphs = <value optimized out>
        Right = 291
        Top = 250
        Bottom = 263
        LeftEdge = 63
        RightEdge = 228
        ytop = 250
        ybot = 263
        nbox = <value optimized out>
        pbox = (BoxPtr) 0x1b22d00
        glyphs = (unsigned int **) 0x18a6a90
        glyphWidth = 6
#4  0x00007f8f706ad123 in XAAImageText16TEColorExpansion (pDraw=0x1b22cb0,
pGC=0x1b1ba80, x=62, y=260, count=<value optimized out>, chars=0x1b8443c)
    at ../../../../hw/xfree86/xaa/xaaTEText.c:145
        infoRec = (XAAInfoRecPtr) 0x18a38f0
        n = 38
#5  0x00007f8f706e9068 in cwImageText16 (pDst=<value optimized out>,
pGC=0x1b1ba80, x=62, y=260, count=38, chars=0x1b8443c) at
../../../miext/cw/cw_ops.c:425
        pGCPrivate = (cwGCPtr) 0x1b1b9c0
        dst_off_x = 0
        dst_off_y = 0
        pBackingDst = (DrawablePtr) 0x1b22cb0
        pBackingGC = (GCPtr) 0x1b1ba80
#6  0x000000000053d3d0 in damageImageText16 (pDrawable=0x1b22cb0,
pGC=0x1b1ba80, x=62, y=260, count=38, chars=0x1b8443c) at
../../../miext/damage/damage.c:1618
        pGCPriv = (DamageGCPrivPtr) 0x1b22a40
        oldFuncs = (GCFuncs *) 0x7cf3a0
#7  0x0000000000450194 in doImageText (client=0x1b283b0, c=0x7fff7e1807e0) at
../../dix/dixfonts.c:1576
        err = <value optimized out>
        lgerr = 2
        fpe = <value optimized out>
#8  0x00000000004503ac in ImageText (client=0x187d000, pDraw=<value optimized
out>, pGC=0xa28, nChars=0, data=0x14 <Address 0x14 out of bounds>,
xorg=1899069440, 
    yorg=260, reqType=<value optimized out>, did=2097197) at
../../dix/dixfonts.c:1627
        local_closure = {client = 0x1b283b0, pDraw = 0x1b22cb0, pGC =
0x1b1ba80, nChars = 38 '&', data = 0x1b8443c "", xorg = 62, yorg = 260, reqType
= 77 'M', 
  imageText = 0x53d290 <damageImageText16>, itemSize = 2, did = 2097197, slept
= 0}
#9  0x000000000044bce4 in ProcImageText16 (client=0x1b283b0) at
../../dix/dispatch.c:2205
        err = 2
        pDraw = (DrawablePtr) 0x1b22cb0
        pGC = (GC *) 0xa28
#10 0x000000000044e354 in Dispatch () at ../../dix/dispatch.c:437
---Type <return> to continue, or q <return> to quit---
        result = <value optimized out>
        client = (ClientPtr) 0x1b283b0
        nready = 0
        start_tick = 40
#11 0x0000000000433ddd in main (argc=4, argv=0x7fff7e180a18, envp=<value
optimized out>) at ../../dix/main.c:397
        i = 1
        alwaysCheckForInput = {0, 1}


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
