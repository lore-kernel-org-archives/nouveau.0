From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55832] New: xf86-video-nouveau-1.0.2 - Xorg crashes
 once a week : segmentation fault in NVRefreshArea
Date: Wed, 10 Oct 2012 10:01:37 +0000
Message-ID: <bug-55832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1538777396=="
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


--===============1538777396==
Content-Type: multipart/alternative; boundary="1349863297.8cC66311.3636"; charset="us-ascii"


--1349863297.8cC66311.3636
Date: Wed, 10 Oct 2012 10:01:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55832

          Priority: medium
            Bug ID: 55832
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: xf86-video-nouveau-1.0.2 - Xorg crashes once a week :
                    segmentation fault in NVRefreshArea
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: rose-L/08BfOuEgquzba0o+Ga+bNAH6kLmebB@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 7.4 (2008.09)
         Component: Driver/nouveau
           Product: xorg

About once in a week the X server is crashing at a system with a GeForce GT 520
due to segmentation fault, see also Gentoo bug at
https://bugs.gentoo.org/show_bug.cgi?id=437282. 

I tried to debug the xorg-drivers corresponding
http://www.x.org/wiki/Development/Documentation/ServerDebugging, i.e. I
recompiled xf86-video-nouveau xf86-video-modesetting xorg-drivers xorg-server
xorg-x11 with the debugging option (CFLAGS="-march=native -O2 -ggdb"). I
attached the debugger to /usr/bin/Xorg and got the following output:

root@leopard:/root(4)# gdb /usr/bin/Xorg $(pidof Xorg)
GNU gdb (Gentoo 7.5 p1) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
For bug reporting instructions, please see:
<http://bugs.gentoo.org/>...
Reading symbols from /usr/bin/Xorg...done.
Attaching to program: /usr/bin/Xorg, process 7210

warning: Could not load shared library symbols for linux-vdso.so.1.
Do you need "set solib-search-path" or "set sysroot"?
Reading symbols from /usr/lib64/libudev.so.1...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libudev.so.1
Reading symbols from /usr/lib64/libgcrypt.so.11...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libgcrypt.so.11
Reading symbols from /lib64/libdl.so.2...(no debugging symbols found)...done.
Loaded symbols for /lib64/libdl.so.2
Reading symbols from /usr/lib64/libpciaccess.so.0...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libpciaccess.so.0
Reading symbols from /lib64/libpthread.so.0...(no debugging symbols
found)...done.
[New LWP 7283]
[New LWP 7282]
[New LWP 7281]
[New LWP 7280]
[New LWP 7279]
[New LWP 7278]
[New LWP 7277]
[New LWP 7276]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Loaded symbols for /lib64/libpthread.so.0
Reading symbols from /usr/lib64/libdrm.so.2...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libdrm.so.2
Reading symbols from /usr/lib64/libpixman-1.so.0...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libpixman-1.so.0
Reading symbols from /usr/lib64/libXfont.so.1...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libXfont.so.1
...
Reading symbols from /usr/lib64/xorg/modules/extensions/libglx.so...done.
Loaded symbols for /usr/lib64/xorg/modules/extensions/libglx.so
Reading symbols from /usr/lib64/xorg/modules/drivers/nouveau_drv.so...done.
Loaded symbols for /usr/lib64/xorg/modules/drivers/nouveau_drv.so
Reading symbols from /usr/lib64/libdrm_nouveau.so.2...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libdrm_nouveau.so.2
Reading symbols from /usr/lib64/xorg/modules/libfb.so...done.
Loaded symbols for /usr/lib64/xorg/modules/libfb.so
Reading symbols from /usr/lib64/xorg/modules/libexa.so...done.
Loaded symbols for /usr/lib64/xorg/modules/libexa.so
Reading symbols from /usr/lib64/xorg/modules/libshadowfb.so...done.
Loaded symbols for /usr/lib64/xorg/modules/libshadowfb.so
Reading symbols from /usr/lib64/dri/swrast_dri.so...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/dri/swrast_dri.so
...
Reading symbols from /lib64/libnss_files.so.2...(no debugging symbols
found)...done.
Loaded symbols for /lib64/libnss_files.so.2
0x00007f1f92f4a0e3 in select () from /lib64/libc.so.6
(gdb) cont
Continuing.


After one day of working I see in the debugger window:

...
(gdb) cont
Continuing.


Program received signal SIGSEGV, Segmentation fault.
NVRefreshArea (pScrn=0x10c4420, num=<optimized out>, pbox=<optimized out>) at
/usr/include/bits/string3.h:52
52        return __builtin___memcpy_chk (__dest, __src, __len, __bos0
(__dest));


(gdb) bt f
#0  NVRefreshArea (pScrn=0x10c4420, num=<optimized out>, pbox=<optimized out>)
at /usr/include/bits/string3.h:52
        pNv = 0x10c49a0
        x1 = <optimized out>
        y1 = <optimized out>
        x2 = <optimized out>
        y2 = <optimized out>
        width = 1340
        height = <optimized out>
        cpp = 4
        FBPitch = 7680
        max_height = 1211
        src = <optimized out>
        dst = <optimized out>
\#1  0x00007f1f91019f5a in ShadowCopyArea (pSrc=0x3c39750, pDst=0x3f65130,
pGC=0x14fe0b0, srcx=<optimized out>, srcy=<optimized out>, 
    width=<optimized out>, height=75, dstx=0, dsty=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/shadowfb/shadow.c:618
        ret = <optimized out>
        box = {x1 = 1585, y1 = 1136, x2 = 2225, y2 = 1211}
        boxNotEmpty = 1
        pPriv = 0x10cd450
        pGCPriv = 0x14fe160
        oldFuncs = 0x7f1f9121e1c0 <ShadowGCFuncs>
#2  0x0000000000436f43 in ProcCopyArea (client=0x147b480)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dispatch.c:1622
        pDst = 0x3f65130
        pSrc = 0x3c39750
        pGC = 0x14fe0b0
        stuff = 0x3f416d8
        pRgn = <optimized out>
        rc = <optimized out>
#3  0x000000000043aee1 in Dispatch () at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dispatch.c:428
        clientReady = 0x13f60b0
        result = <optimized out>
        client = 0x147b480
        nready = 0
        icheck = 0x819eb0 <checkForInput>
        start_tick = 6080
#4  0x0000000000429b14 in main (argc=9, argv=<optimized out>, envp=<optimized
out>)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/main.c:295
        i = <optimized out>
        alwaysCheckForInput = {0, 1}

(gdb) cont
Continuing.

Program received signal SIGABRT, Aborted.
0x00007f1f92e9db65 in raise () from /lib64/libc.so.6


In Xorg.0.log I find:


rose@leopard:/home/rose(9)$ tail -n45 /var/log/Xorg.0.log.old 
[ 88071.660] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[ 88455.794] (EE) 
[ 88455.794] (EE) Backtrace:
[ 88455.816] (EE) 0: /usr/bin/Xorg (xorg_backtrace+0x34) [0x5954f4]
[ 88455.816] (EE) 1: /usr/bin/Xorg (0x400000+0x1992f9) [0x5992f9]
[ 88455.816] (EE) 2: /lib64/libpthread.so.0 (0x7f1f941ec000+0x10bf0)
[0x7f1f941fcbf0]
[ 88455.816] (EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f1f91cde000+0x10cf8) [0x7f1f91ceecf8]
[ 88455.816] (EE) 4: /usr/lib64/xorg/modules/libshadowfb.so
(0x7f1f91016000+0x3f5a) [0x7f1f91019f5a]
[ 88455.816] (EE) 5: /usr/bin/Xorg (0x400000+0x36f43) [0x436f43]
[ 88455.816] (EE) 6: /usr/bin/Xorg (0x400000+0x3aee1) [0x43aee1]
[ 88455.816] (EE) 7: /usr/bin/Xorg (0x400000+0x29b14) [0x429b14]
[ 88455.816] (EE) 8: /lib64/libc.so.6 (__libc_start_main+0xed) [0x7f1f92e8a60d]
[ 88455.816] (EE) 9: /usr/bin/Xorg (0x400000+0x29e5d) [0x429e5d]
[ 88455.816] (EE) 
[ 88455.816] (EE) Segmentation fault at address 0x7f1f9101e0d4
[ 88455.816] 
Fatal server error:
[ 88455.816] Caught signal 11 (Segmentation fault). Server aborting
[ 88455.816] 
[ 88455.816] (EE) 
Please consult the The X.Org Foundation support 
         at http://wiki.x.org
 for help. 
[ 88455.816] (EE) Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[ 88455.816] (EE) 
[ 88455.841] (II) evdev: Power Button: Close
[ 88455.841] (II) UnloadModule: "evdev"
[ 88455.857] (II) evdev: Power Button: Close
[ 88455.857] (II) UnloadModule: "evdev"
[ 88455.873] (II) evdev: Microsoft Wired Keyboard 600: Close
[ 88455.873] (II) UnloadModule: "evdev"
[ 88455.889] (II) evdev: Microsoft Wired Keyboard 600: Close
[ 88455.889] (II) UnloadModule: "evdev"
[ 88455.905] (II) evdev: Microsoft Wired Keyboard 600: Close
[ 88455.905] (II) UnloadModule: "evdev"
[ 88455.921] (II) evdev: HID 046a:0023: Close
[ 88455.921] (II) UnloadModule: "evdev"
[ 88455.937] (II) evdev: HID 046a:0023: Close
[ 88455.937] (II) UnloadModule: "evdev"
[ 88455.953] (II) evdev: Logitech USB-PS/2 Optical Mouse: Close
[ 88455.953] (II) UnloadModule: "evdev"
[ 88455.969] (II) evdev: Logitech USB-PS/2 Optical Mouse: Close
[ 88455.969] (II) UnloadModule: "evdev"
[ 88455.970] (II) NOUVEAU(0): NVLeaveVT is called.
[ 88456.005] Server terminated with error (1). Closing log file.





root@leopard:/usr/src(18)# lspci -v -s 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForce GT 520]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 83c1
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Memory at f8000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at fb000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Kernel driver in use: nouveau



The following xorg-nouveau related packages are now installed:

x11-drivers/xf86-video-nouveau-1.0.2
root@leopard:/root(3)# qlist -Iv xorg
x11-base/xorg-drivers-1.13
x11-base/xorg-server-1.13.0
x11-base/xorg-x11-7.4-r2
x11-misc/xorg-cf-files-1.0.4


But I experience this issue already about six months, i.e, starting with
xf86-video-nouveau-0.0.16_pre20120322 and xorg-server-1.12.0-r1.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349863297.8cC66311.3636
Date: Wed, 10 Oct 2012 10:01:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau-1.0.2 - Xorg crashes once a week : segmentation fault in NVRefreshArea"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55832">55832</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xf86-video-nouveau-1.0.2 - Xorg crashes once a week : segmentation fault in NVRefreshArea
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rose&#64;rz.uni-potsdam.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.4 (2008.09)
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>About once in a week the X server is crashing at a system with a GeForce GT 520
due to segmentation fault, see also Gentoo bug at
<a href="https://bugs.gentoo.org/show_bug.cgi?id=437282">https://bugs.gentoo.org/show_bug.cgi?id=437282</a>. 

I tried to debug the xorg-drivers corresponding
<a href="http://www.x.org/wiki/Development/Documentation/ServerDebugging">http://www.x.org/wiki/Development/Documentation/ServerDebugging</a>, i.e. I
recompiled xf86-video-nouveau xf86-video-modesetting xorg-drivers xorg-server
xorg-x11 with the debugging option (CFLAGS=&quot;-march=native -O2 -ggdb&quot;). I
attached the debugger to /usr/bin/Xorg and got the following output:

root&#64;leopard:/root(4)# gdb /usr/bin/Xorg $(pidof Xorg)
GNU gdb (Gentoo 7.5 p1) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<a href="http://gnu.org/licenses/gpl.html">http://gnu.org/licenses/gpl.html</a>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type &quot;show copying&quot;
and &quot;show warranty&quot; for details.
This GDB was configured as &quot;x86_64-pc-linux-gnu&quot;.
For bug reporting instructions, please see:
&lt;<a href="http://bugs.gentoo.org/">http://bugs.gentoo.org/</a>&gt;...
Reading symbols from /usr/bin/Xorg...done.
Attaching to program: /usr/bin/Xorg, process 7210

warning: Could not load shared library symbols for linux-vdso.so.1.
Do you need &quot;set solib-search-path&quot; or &quot;set sysroot&quot;?
Reading symbols from /usr/lib64/libudev.so.1...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libudev.so.1
Reading symbols from /usr/lib64/libgcrypt.so.11...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libgcrypt.so.11
Reading symbols from /lib64/libdl.so.2...(no debugging symbols found)...done.
Loaded symbols for /lib64/libdl.so.2
Reading symbols from /usr/lib64/libpciaccess.so.0...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libpciaccess.so.0
Reading symbols from /lib64/libpthread.so.0...(no debugging symbols
found)...done.
[New LWP 7283]
[New LWP 7282]
[New LWP 7281]
[New LWP 7280]
[New LWP 7279]
[New LWP 7278]
[New LWP 7277]
[New LWP 7276]
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;/lib64/libthread_db.so.1&quot;.
Loaded symbols for /lib64/libpthread.so.0
Reading symbols from /usr/lib64/libdrm.so.2...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libdrm.so.2
Reading symbols from /usr/lib64/libpixman-1.so.0...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libpixman-1.so.0
Reading symbols from /usr/lib64/libXfont.so.1...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libXfont.so.1
...
Reading symbols from /usr/lib64/xorg/modules/extensions/libglx.so...done.
Loaded symbols for /usr/lib64/xorg/modules/extensions/libglx.so
Reading symbols from /usr/lib64/xorg/modules/drivers/nouveau_drv.so...done.
Loaded symbols for /usr/lib64/xorg/modules/drivers/nouveau_drv.so
Reading symbols from /usr/lib64/libdrm_nouveau.so.2...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/libdrm_nouveau.so.2
Reading symbols from /usr/lib64/xorg/modules/libfb.so...done.
Loaded symbols for /usr/lib64/xorg/modules/libfb.so
Reading symbols from /usr/lib64/xorg/modules/libexa.so...done.
Loaded symbols for /usr/lib64/xorg/modules/libexa.so
Reading symbols from /usr/lib64/xorg/modules/libshadowfb.so...done.
Loaded symbols for /usr/lib64/xorg/modules/libshadowfb.so
Reading symbols from /usr/lib64/dri/swrast_dri.so...(no debugging symbols
found)...done.
Loaded symbols for /usr/lib64/dri/swrast_dri.so
...
Reading symbols from /lib64/libnss_files.so.2...(no debugging symbols
found)...done.
Loaded symbols for /lib64/libnss_files.so.2
0x00007f1f92f4a0e3 in select () from /lib64/libc.so.6
(gdb) cont
Continuing.


After one day of working I see in the debugger window:

...
(gdb) cont
Continuing.


Program received signal SIGSEGV, Segmentation fault.
NVRefreshArea (pScrn=0x10c4420, num=&lt;optimized out&gt;, pbox=&lt;optimized out&gt;) at
/usr/include/bits/string3.h:52
52        return __builtin___memcpy_chk (__dest, __src, __len, __bos0
(__dest));


(gdb) bt f
#0  NVRefreshArea (pScrn=0x10c4420, num=&lt;optimized out&gt;, pbox=&lt;optimized out&gt;)
at /usr/include/bits/string3.h:52
        pNv = 0x10c49a0
        x1 = &lt;optimized out&gt;
        y1 = &lt;optimized out&gt;
        x2 = &lt;optimized out&gt;
        y2 = &lt;optimized out&gt;
        width = 1340
        height = &lt;optimized out&gt;
        cpp = 4
        FBPitch = 7680
        max_height = 1211
        src = &lt;optimized out&gt;
        dst = &lt;optimized out&gt;
\#1  0x00007f1f91019f5a in ShadowCopyArea (pSrc=0x3c39750, pDst=0x3f65130,
pGC=0x14fe0b0, srcx=&lt;optimized out&gt;, srcy=&lt;optimized out&gt;, 
    width=&lt;optimized out&gt;, height=75, dstx=0, dsty=0)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/hw/xfree86/shadowfb/shadow.c:618
        ret = &lt;optimized out&gt;
        box = {x1 = 1585, y1 = 1136, x2 = 2225, y2 = 1211}
        boxNotEmpty = 1
        pPriv = 0x10cd450
        pGCPriv = 0x14fe160
        oldFuncs = 0x7f1f9121e1c0 &lt;ShadowGCFuncs&gt;
#2  0x0000000000436f43 in ProcCopyArea (client=0x147b480)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dispatch.c:1622
        pDst = 0x3f65130
        pSrc = 0x3c39750
        pGC = 0x14fe0b0
        stuff = 0x3f416d8
        pRgn = &lt;optimized out&gt;
        rc = &lt;optimized out&gt;
#3  0x000000000043aee1 in Dispatch () at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/dispatch.c:428
        clientReady = 0x13f60b0
        result = &lt;optimized out&gt;
        client = 0x147b480
        nready = 0
        icheck = 0x819eb0 &lt;checkForInput&gt;
        start_tick = 6080
#4  0x0000000000429b14 in main (argc=9, argv=&lt;optimized out&gt;, envp=&lt;optimized
out&gt;)
    at
/var/tmp/portage/x11-base/xorg-server-1.13.0/work/xorg-server-1.13.0/dix/main.c:295
        i = &lt;optimized out&gt;
        alwaysCheckForInput = {0, 1}

(gdb) cont
Continuing.

Program received signal SIGABRT, Aborted.
0x00007f1f92e9db65 in raise () from /lib64/libc.so.6


In Xorg.0.log I find:


rose&#64;leopard:/home/rose(9)$ tail -n45 /var/log/Xorg.0.log.old 
[ 88071.660] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[ 88455.794] (EE) 
[ 88455.794] (EE) Backtrace:
[ 88455.816] (EE) 0: /usr/bin/Xorg (xorg_backtrace+0x34) [0x5954f4]
[ 88455.816] (EE) 1: /usr/bin/Xorg (0x400000+0x1992f9) [0x5992f9]
[ 88455.816] (EE) 2: /lib64/libpthread.so.0 (0x7f1f941ec000+0x10bf0)
[0x7f1f941fcbf0]
[ 88455.816] (EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f1f91cde000+0x10cf8) [0x7f1f91ceecf8]
[ 88455.816] (EE) 4: /usr/lib64/xorg/modules/libshadowfb.so
(0x7f1f91016000+0x3f5a) [0x7f1f91019f5a]
[ 88455.816] (EE) 5: /usr/bin/Xorg (0x400000+0x36f43) [0x436f43]
[ 88455.816] (EE) 6: /usr/bin/Xorg (0x400000+0x3aee1) [0x43aee1]
[ 88455.816] (EE) 7: /usr/bin/Xorg (0x400000+0x29b14) [0x429b14]
[ 88455.816] (EE) 8: /lib64/libc.so.6 (__libc_start_main+0xed) [0x7f1f92e8a60d]
[ 88455.816] (EE) 9: /usr/bin/Xorg (0x400000+0x29e5d) [0x429e5d]
[ 88455.816] (EE) 
[ 88455.816] (EE) Segmentation fault at address 0x7f1f9101e0d4
[ 88455.816] 
Fatal server error:
[ 88455.816] Caught signal 11 (Segmentation fault). Server aborting
[ 88455.816] 
[ 88455.816] (EE) 
Please consult the The X.Org Foundation support 
         at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[ 88455.816] (EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for
additional information.
[ 88455.816] (EE) 
[ 88455.841] (II) evdev: Power Button: Close
[ 88455.841] (II) UnloadModule: &quot;evdev&quot;
[ 88455.857] (II) evdev: Power Button: Close
[ 88455.857] (II) UnloadModule: &quot;evdev&quot;
[ 88455.873] (II) evdev: Microsoft Wired Keyboard 600: Close
[ 88455.873] (II) UnloadModule: &quot;evdev&quot;
[ 88455.889] (II) evdev: Microsoft Wired Keyboard 600: Close
[ 88455.889] (II) UnloadModule: &quot;evdev&quot;
[ 88455.905] (II) evdev: Microsoft Wired Keyboard 600: Close
[ 88455.905] (II) UnloadModule: &quot;evdev&quot;
[ 88455.921] (II) evdev: HID 046a:0023: Close
[ 88455.921] (II) UnloadModule: &quot;evdev&quot;
[ 88455.937] (II) evdev: HID 046a:0023: Close
[ 88455.937] (II) UnloadModule: &quot;evdev&quot;
[ 88455.953] (II) evdev: Logitech USB-PS/2 Optical Mouse: Close
[ 88455.953] (II) UnloadModule: &quot;evdev&quot;
[ 88455.969] (II) evdev: Logitech USB-PS/2 Optical Mouse: Close
[ 88455.969] (II) UnloadModule: &quot;evdev&quot;
[ 88455.970] (II) NOUVEAU(0): NVLeaveVT is called.
[ 88456.005] Server terminated with error (1). Closing log file.





root&#64;leopard:/usr/src(18)# lspci -v -s 01:00.0
01:00.0 VGA compatible controller: NVIDIA Corporation GF119 [GeForce GT 520]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 83c1
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Memory at f8000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at fb000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Kernel driver in use: nouveau



The following xorg-nouveau related packages are now installed:

x11-drivers/xf86-video-nouveau-1.0.2
root&#64;leopard:/root(3)# qlist -Iv xorg
x11-base/xorg-drivers-1.13
x11-base/xorg-server-1.13.0
x11-base/xorg-x11-7.4-r2
x11-misc/xorg-cf-files-1.0.4


But I experience this issue already about six months, i.e, starting with
xf86-video-nouveau-0.0.16_pre20120322 and xorg-server-1.12.0-r1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349863297.8cC66311.3636--

--===============1538777396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1538777396==--
