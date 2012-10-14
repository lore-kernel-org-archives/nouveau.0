From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55980] X Segfault on second screen resize
Date: Sun, 14 Oct 2012 22:31:36 +0000
Message-ID: <bug-55980-8800-QQo2Xu1K9Q@http.bugs.freedesktop.org/>
References: <bug-55980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647469751=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0647469751==
Content-Type: multipart/alternative; boundary="1350253896.258eDDB1.376"; charset="us-ascii"


--1350253896.258eDDB1.376
Date: Sun, 14 Oct 2012 22:31:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55980

--- Comment #2 from Ge@@ru <geaaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
With gdb problem is happens after 5/6 resolutions change (I thinks that could
be relative to a delay required on driver to do this syscall).
However, after these resize this is gdb backtrace:

Program received signal SIGSEGV, Segmentation fault.
0x00007f46ee14f860 in ?? () from /lib64/libc.so.6
(gdb) bt
#0  0x00007f46ee14f860 in ?? () from /lib64/libc.so.6
#1  0x00007f46ec40eb75 in exaMemcpyBox (pbox=<optimized out>, src=<optimized
out>, src_pitch=448, dst=<optimized out>, dst_pitch=436, 
    pPixmap=<optimized out>) at /usr/include/bits/string3.h:52
#2  0x00007f46ec40eeb4 in exaCopyDirty (migrate=<optimized out>,
pValidDst=0x1e6b8e0, pValidSrc=0x1e6b8f0, transfer=0x7f46eceb9513,
fallback_index=1, 
    sync=0x7f46ec40d9c0 <exaWaitSync>) at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_migration_classic.c:240
#3  0x00007f46ec4117f0 in exaPrepareAccessReg_mixed (pPixmap=0x1e6b840,
index=<optimized out>, pReg=0x0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_migration_mixed.c:254
#4  0x00007f46ec41afe5 in ExaCheckPolyFillRect (pDrawable=0x20a7cc0,
pGC=0x1b3e8d0, nrect=1, prect=0x200ad40)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_unaccel.c:311
#5  0x00007f46ec41455c in exaPolyFillRect (pDrawable=0x20a7cc0, pGC=0x1b3e8d0,
nrect=1, prect=0x200ad40)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_accel.c:849
#6  0x00000000005057e7 in damagePolyFillRect (pDrawable=0x20a7cc0,
pGC=0x1b3e8d0, nRects=1, pRects=0x200ad40)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/miext/damage/damage.c:1250
#7  0x000000000055ad9c in miPaintWindow (pWin=<optimized out>, prgn=<optimized
out>, what=<optimized out>)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/mi/miexpose.c:641
#8  0x000000000055b01f in miWindowExposures (pWin=0x20a7cc0, prgn=0x22853c0,
other_exposed=0x0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/mi/miexpose.c:470
#9  0x0000000000487472 in xf86XVWindowExposures (pWin=0x20a7cc0,
reg1=0x22853c0, reg2=<optimized out>)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/common/xf86xv.c:1171
#10 0x0000000000570756 in miHandleValidateExposures (pWin=0x1b3ea60)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/mi/miwindow.c:223
#11 0x0000000000461274 in SetRootClip (pScreen=0x1ad5230, enable=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/window.c:3649
#12 0x00007f46ec40b9df in exaXorgEnableDisableFBAccess (pScrn=0x1ac93b0,
enable=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/exa/examodule.c:100
#13 0x00000000004b0293 in xf86CursorEnableDisableFBAccess (pScrn=0x1ac93b0,
enable=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/ramdac/xf86Cursor.c:226
#14 0x000000000046f2c5 in xf86VTSwitch () at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/common/xf86Events.c:441
#15 xf86Wakeup (blockData=<optimized out>, err=<optimized out>,
pReadmask=<optimized out>)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/common/xf86Events.c:285
#16 0x0000000000438597 in WakeupHandler (result=1, pReadmask=0x80ea60)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dixutils.c:423
#17 0x0000000000575477 in WaitForSomething (pClientsReady=0x1c94740)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/os/WaitFor.c:224
#18 0x0000000000434339 in Dispatch () at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dispatch.c:357
#19 0x00000000004248fa in main (argc=10, argv=<optimized out>, envp=<optimized
out>)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/main.c:295

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350253896.258eDDB1.376
Date: Sun, 14 Oct 2012 22:31:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X Segfault on second screen resize"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55980#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X Segfault on second screen resize"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55980">bug 55980</a>
              from <span class="vcard"><a class="email" href="mailto:geaaru&#64;gmail.com" title="Ge&#64;&#64;ru &lt;geaaru&#64;gmail.com&gt;"> <span class="fn">Ge&#64;&#64;ru</span></a>
</span></b>
        <pre>With gdb problem is happens after 5/6 resolutions change (I thinks that could
be relative to a delay required on driver to do this syscall).
However, after these resize this is gdb backtrace:

Program received signal SIGSEGV, Segmentation fault.
0x00007f46ee14f860 in ?? () from /lib64/libc.so.6
(gdb) bt
#0  0x00007f46ee14f860 in ?? () from /lib64/libc.so.6
#1  0x00007f46ec40eb75 in exaMemcpyBox (pbox=&lt;optimized out&gt;, src=&lt;optimized
out&gt;, src_pitch=448, dst=&lt;optimized out&gt;, dst_pitch=436, 
    pPixmap=&lt;optimized out&gt;) at /usr/include/bits/string3.h:52
#2  0x00007f46ec40eeb4 in exaCopyDirty (migrate=&lt;optimized out&gt;,
pValidDst=0x1e6b8e0, pValidSrc=0x1e6b8f0, transfer=0x7f46eceb9513,
fallback_index=1, 
    sync=0x7f46ec40d9c0 &lt;exaWaitSync&gt;) at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_migration_classic.c:240
#3  0x00007f46ec4117f0 in exaPrepareAccessReg_mixed (pPixmap=0x1e6b840,
index=&lt;optimized out&gt;, pReg=0x0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_migration_mixed.c:254
#4  0x00007f46ec41afe5 in ExaCheckPolyFillRect (pDrawable=0x20a7cc0,
pGC=0x1b3e8d0, nrect=1, prect=0x200ad40)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_unaccel.c:311
#5  0x00007f46ec41455c in exaPolyFillRect (pDrawable=0x20a7cc0, pGC=0x1b3e8d0,
nrect=1, prect=0x200ad40)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/exa/exa_accel.c:849
#6  0x00000000005057e7 in damagePolyFillRect (pDrawable=0x20a7cc0,
pGC=0x1b3e8d0, nRects=1, pRects=0x200ad40)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/miext/damage/damage.c:1250
#7  0x000000000055ad9c in miPaintWindow (pWin=&lt;optimized out&gt;, prgn=&lt;optimized
out&gt;, what=&lt;optimized out&gt;)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/mi/miexpose.c:641
#8  0x000000000055b01f in miWindowExposures (pWin=0x20a7cc0, prgn=0x22853c0,
other_exposed=0x0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/mi/miexpose.c:470
#9  0x0000000000487472 in xf86XVWindowExposures (pWin=0x20a7cc0,
reg1=0x22853c0, reg2=&lt;optimized out&gt;)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/common/xf86xv.c:1171
#10 0x0000000000570756 in miHandleValidateExposures (pWin=0x1b3ea60)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/mi/miwindow.c:223
#11 0x0000000000461274 in SetRootClip (pScreen=0x1ad5230, enable=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/window.c:3649
#12 0x00007f46ec40b9df in exaXorgEnableDisableFBAccess (pScrn=0x1ac93b0,
enable=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/exa/examodule.c:100
#13 0x00000000004b0293 in xf86CursorEnableDisableFBAccess (pScrn=0x1ac93b0,
enable=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/ramdac/xf86Cursor.c:226
#14 0x000000000046f2c5 in xf86VTSwitch () at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/common/xf86Events.c:441
#15 xf86Wakeup (blockData=&lt;optimized out&gt;, err=&lt;optimized out&gt;,
pReadmask=&lt;optimized out&gt;)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/common/xf86Events.c:285
#16 0x0000000000438597 in WakeupHandler (result=1, pReadmask=0x80ea60)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dixutils.c:423
#17 0x0000000000575477 in WaitForSomething (pClientsReady=0x1c94740)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/os/WaitFor.c:224
#18 0x0000000000434339 in Dispatch () at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dispatch.c:357
#19 0x00000000004248fa in main (argc=10, argv=&lt;optimized out&gt;, envp=&lt;optimized
out&gt;)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/main.c:295</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350253896.258eDDB1.376--

--===============0647469751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0647469751==--
