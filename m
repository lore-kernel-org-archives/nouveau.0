From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] New: [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Thu, 11 Dec 2014 19:58:05 +0000
Message-ID: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1985703551=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1985703551==
Content-Type: multipart/alternative; boundary="1418327885.Dba1E71.24955"; charset="UTF-8"


--1418327885.Dba1E71.24955
Date: Thu, 11 Dec 2014 19:58:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

            Bug ID: 87244
           Summary: [NV94] X hangs, logs show kernel: nouveau E[
                    PFIFO][0000:01:00.0] still angry after 101 spins, halt
                    followed by an X trace
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I just upgraded my desktop to Fedora Rawhide, and since then X has twice
crashed with the same symptoms. Oddly, I was using kernel 3.18 from
kernel-rawhide-nodebug before upgrading from F21 to Rawhide, and 21 and Rawhide
seem to have similar versions of the nouveau driver and Xorg components, so I'm
not sure what's changed - libdrm or mesa, perhaps?

Anyway, the non-debug log I have so far is:

Dec 11 11:42:05 adam.happyassassin.net kernel: nouveau E[  
PFIFO][0000:01:00.0] still angry after 101 spins, halt
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) [mi] EQ
overflowing.  Additional events will be discarded until existing events are
processed.
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE)
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) Backtrace:
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 0:
/usr/libexec/Xorg.bin (mieqEnqueue+0x24b) [0x5795ab]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 1:
/usr/libexec/Xorg.bin (QueuePointerEvents+0x52) [0x450af2]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 2:
/usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2eff) [0x7fa8c403295f]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 3:
/usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x3645) [0x7fa8c4033c25]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 4:
/usr/libexec/Xorg.bin (DPMSSupported+0xe8) [0x4774c8]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 5:
/usr/libexec/Xorg.bin (xf86SerialModemClearBits+0x277) [0x4a1f17]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 6:
/lib64/libc.so.6 (__restore_rt+0x0) [0x7fa8cf438e7f]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 7:
/lib64/libc.so.6 (ioctl+0x7) [0x7fa8cf4fde07]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 8:
/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fa8d07e96c8]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 9:
/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fa8d07ebefb]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 10:
/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7fa8c9f6f779]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 11:
/usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x2a3b) [0x7fa8ca17e80b]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 12:
/usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x123b) [0x7fa8c993289b]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 13:
/usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x39df) [0x7fa8c993780f]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 14:
/usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x493b)
[0x7fa8c9941ffb]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 15:
/usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x1690)
[0x7fa8c993bde0]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 16:
/usr/libexec/Xorg.bin (DamageRegionAppend+0x541) [0x51ef81]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 17:
/usr/libexec/Xorg.bin (AddTraps+0x4154) [0x518824]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 18:
/usr/libexec/Xorg.bin (SendErrorToClient+0x2f7) [0x4391b7]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 19:
/usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 20:
/lib64/libc.so.6 (__libc_start_main+0xf0) [0x7fa8cf4240e0]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 21:
/usr/libexec/Xorg.bin (_start+0x29) [0x4276f9]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 22: ? (?+0x29)
[0x29]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE)
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) [mi] These
backtraces from mieqEnqueue may point to a culprit higher up the stack.

then there's a bunch of similar X traces, I'll attach the whole thing. I'll try
and get drm.debug logs and attach those also.

There is one EE line during initial X start:

Dec 11 10:52:16 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) NOUVEAU(0):
[COPY] failed to allocate class.

but that line seems to be present in older boots where I didn't encounter this
problem, too.

I'm running GNOME Shell and have dual monitors attached to DVI, in portrait
orientation.

xorg-x11-drv-nouveau-1.0.11-1.fc22.x86_64
kernel-3.18.0-1.fc22.x86_64
xorg-x11-server-common-1.16.2.901-1.fc22.x86_64
mesa-dri-drivers-10.5.0-0.devel.3.29c7cf2.fc22.x86_64
libdrm-2.4.58-3.fc22.x86_64

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G94 [GeForce 9600
GT] [10de:0622] (rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418327885.Dba1E71.24955
Date: Thu, 11 Dec 2014 19:58:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">87244</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV94] X hangs, logs show kernel: nouveau E[   PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>adamw&#64;happyassassin.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I just upgraded my desktop to Fedora Rawhide, and since then X has twice
crashed with the same symptoms. Oddly, I was using kernel 3.18 from
kernel-rawhide-nodebug before upgrading from F21 to Rawhide, and 21 and Rawhide
seem to have similar versions of the nouveau driver and Xorg components, so I'm
not sure what's changed - libdrm or mesa, perhaps?

Anyway, the non-debug log I have so far is:

Dec 11 11:42:05 adam.happyassassin.net kernel: nouveau E[  
PFIFO][0000:01:00.0] still angry after 101 spins, halt
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) [mi] EQ
overflowing.  Additional events will be discarded until existing events are
processed.
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE)
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) Backtrace:
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 0:
/usr/libexec/Xorg.bin (mieqEnqueue+0x24b) [0x5795ab]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 1:
/usr/libexec/Xorg.bin (QueuePointerEvents+0x52) [0x450af2]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 2:
/usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2eff) [0x7fa8c403295f]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 3:
/usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x3645) [0x7fa8c4033c25]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 4:
/usr/libexec/Xorg.bin (DPMSSupported+0xe8) [0x4774c8]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 5:
/usr/libexec/Xorg.bin (xf86SerialModemClearBits+0x277) [0x4a1f17]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 6:
/lib64/libc.so.6 (__restore_rt+0x0) [0x7fa8cf438e7f]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 7:
/lib64/libc.so.6 (ioctl+0x7) [0x7fa8cf4fde07]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 8:
/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fa8d07e96c8]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 9:
/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fa8d07ebefb]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 10:
/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7fa8c9f6f779]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 11:
/usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x2a3b) [0x7fa8ca17e80b]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 12:
/usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x123b) [0x7fa8c993289b]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 13:
/usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x39df) [0x7fa8c993780f]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 14:
/usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x493b)
[0x7fa8c9941ffb]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 15:
/usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x1690)
[0x7fa8c993bde0]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 16:
/usr/libexec/Xorg.bin (DamageRegionAppend+0x541) [0x51ef81]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 17:
/usr/libexec/Xorg.bin (AddTraps+0x4154) [0x518824]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 18:
/usr/libexec/Xorg.bin (SendErrorToClient+0x2f7) [0x4391b7]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 19:
/usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 20:
/lib64/libc.so.6 (__libc_start_main+0xf0) [0x7fa8cf4240e0]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 21:
/usr/libexec/Xorg.bin (_start+0x29) [0x4276f9]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) 22: ? (?+0x29)
[0x29]
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE)
Dec 11 11:44:13 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) [mi] These
backtraces from mieqEnqueue may point to a culprit higher up the stack.

then there's a bunch of similar X traces, I'll attach the whole thing. I'll try
and get drm.debug logs and attach those also.

There is one EE line during initial X start:

Dec 11 10:52:16 adam.happyassassin.net gdm-Xorg-:0[1540]: (EE) NOUVEAU(0):
[COPY] failed to allocate class.

but that line seems to be present in older boots where I didn't encounter this
problem, too.

I'm running GNOME Shell and have dual monitors attached to DVI, in portrait
orientation.

xorg-x11-drv-nouveau-1.0.11-1.fc22.x86_64
kernel-3.18.0-1.fc22.x86_64
xorg-x11-server-common-1.16.2.901-1.fc22.x86_64
mesa-dri-drivers-10.5.0-0.devel.3.29c7cf2.fc22.x86_64
libdrm-2.4.58-3.fc22.x86_64

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G94 [GeForce 9600
GT] [10de:0622] (rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418327885.Dba1E71.24955--

--===============1985703551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1985703551==--
