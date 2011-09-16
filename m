From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Thu, 15 Sep 2011 21:35:18 -0700 (PDT)
Message-ID: <20110916043518.9CE931300B1@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #61 from Arun Raghavan <arun-SJV6IgfXIPzk1uMJSBkQmQ@public.gmane.org> 2011-09-15 21:35:14 PDT ---
Using 3.0.4, this bug is very much still there (or at least the backgrace looks
very similar). Happy to help provide more information or debug if pointed in
the right direction.

(gdb) bt
#0  0x00007f5af04f3007 in ioctl ()
    at ../sysdeps/unix/syscall-template.S:82
#1  0x00007f5aeea8f878 in drmIoctl (fd=9,
    request=1074291842, arg=0x7fff50cac510)
    at /usr/src/debug/x11-libs/libdrm-2.4.26/libdrm-2.4.26/xf86drm.c:167
#2  0x00007f5aeea91c2b in drmCommandWrite (
    fd=<optimized out>, drmCommandIndex=<optimized out>,
    data=<optimized out>, size=<optimized out>)
    at /usr/src/debug/x11-libs/libdrm-2.4.26/libdrm-2.4.26/xf86drm.c:2422
#3  0x00007f5aee44311d in nouveau_bo_wait (bo=0x1b75420,
    cpu_write=<optimized out>, no_wait=<optimized out>,
    no_block=<optimized out>)
    at
/usr/src/debug/x11-libs/libdrm-2.4.26/libdrm-2.4.26/nouveau/nouveau_bo.c:390
#4  0x00007f5aee443703 in nouveau_bo_map_range (
    bo=0x1b75420, delta=0, size=<optimized out>, flags=4)
    at
/usr/src/debug/x11-libs/libdrm-2.4.26/libdrm-2.4.26/nouveau/nouveau_bo.c:433
#5  0x00007f5aee64d2b5 in NVAccelDownloadM2MF (
    dst_pitch=3740, dst=0x2c96644 "", h=20, w=1,
    y=<optimized out>, x=237, pspix=0x29275f0)
    at
/usr/src/debug/x11-drivers/xf86-video-nouveau-0.0.16_pre20110801/xf86-video-nouveau-0.0.16_pre20110801/src/nouveau_exa.c:132
#6  nouveau_exa_download_from_screen (pspix=0x29275f0,
    x=237, y=348, w=1, h=20, dst=0x2c96644 "",
    dst_pitch=3740)
    at
/usr/src/debug/x11-drivers/xf86-video-nouveau-0.0.16_pre20110801/xf86-video-nouveau-0.0.16_pre20110801/src/nouveau_exa.c:386
#7  0x00007f5aed9f81ee in exaCopyDirty (
    migrate=<optimized out>, pValidDst=0x2927680,
    pValidSrc=0x2927690,
    transfer=0x7f5aee64cd80 <nouveau_exa_download_from_screen>,
fallback_index=1, sync=0x7f5aed9f69b0 <exaWaitSync>)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/exa/exa_migration_classic.c:220
#8  0x00007f5aed9fac41 in exaPrepareAccessReg_mixed (
    pPixmap=0x29275f0, index=0, pReg=0x0)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/exa/exa_migration_mixed.c:254
#9  0x00007f5aeda061d0 in ExaPrepareCompositeReg (
    height=20, width=1, yDst=31, xDst=234, yMask=0,
    xMask=0, ySrc=0, xSrc=0, pDst=0x28a94e0, pMask=0x0,
    pSrc=0x28a9e20, op=57 '9', pScreen=<optimized out>)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/exa/exa_unaccel.c:600
#10 ExaCheckComposite (op=57 '9', pSrc=0x28a9e20,
    pMask=0x0, pDst=0x28a94e0, xSrc=0, ySrc=0, xMask=0,
    yMask=0, xDst=234, yDst=31, width=1, height=20)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/exa/exa_unaccel.c:625
#11 0x00007f5aeda02189 in exaComposite (op=57 '9',
    pSrc=0x28a9e20, pMask=0x0, pDst=0x28a94e0,
    xSrc=<optimized out>, ySrc=<optimized out>, xMask=0,
    yMask=0, xDst=<optimized out>, yDst=<optimized out>,
    width=1, height=20)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/exa/exa_render.c:1066
#12 0x00000000004db50a in damageComposite (op=57 '9',
    pSrc=0x28a9e20, pMask=0x0, pDst=0x28a94e0, xSrc=0,
    ySrc=0, xMask=0, yMask=0, xDst=234, yDst=31, width=1,
    height=20)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/miext/damage/damage.c:617
#13 0x000000000056b4a8 in miCompositeRects (op=57 '9',
    pDst=0x28a94e0, color=<optimized out>,
    nRect=<optimized out>, rects=0x29ebd84)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/render/mirect.c:168
#14 0x00000000004d47f3 in ProcRenderFillRectangles (
    client=0x2595fb0)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/render/render.c:1481
#15 0x0000000000431aa1 in Dispatch ()
    at /usr/src/debug/x11-base/xorg-server-1.10.4/xorg-serve---Type <return> to
continue, or q <return> to quit---
r-1.10.4/dix/dispatch.c:431
#16 0x0000000000425a95 in main (argc=<optimized out>,
    argv=0x7fff50cacd48, envp=<optimized out>)
    at
/usr/src/debug/x11-base/xorg-server-1.10.4/xorg-server-1.10.4/dix/main.c:287

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
