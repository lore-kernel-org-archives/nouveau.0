From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76818] New: Xorg EQ overflowing lock up
Date: Mon, 31 Mar 2014 05:57:25 +0000
Message-ID: <bug-76818-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0461175181=="
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


--===============0461175181==
Content-Type: multipart/alternative; boundary="1396245445.868bc411.7860"; charset="us-ascii"


--1396245445.868bc411.7860
Date: Mon, 31 Mar 2014 05:57:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76818

          Priority: medium
            Bug ID: 76818
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Xorg EQ overflowing lock up
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: max.snow-Po5arK1fDv3vnOemgxGiVw@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have been using 2 monitors (1080p), and I've just replaced one with a 1600p
monitor, and straight away I am getting frequent lock ups (several times a
day), with this in the error log:


 (EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0x22b) [0x58356b]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x52) [0x451472]
(EE) 2: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2d1d)
[0x7f7dc81d9c8d]
(EE) 3: /usr/bin/X (DPMSSupported+0xe8) [0x48b3b8]
(EE) 4: /usr/bin/X (xf86SerialModemClearBits+0x260) [0x4b4900]
(EE) 5: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 6: /lib64/libc.so.6 (ioctl+0x7) [0x36cc6ec067]
(EE) 7: /lib64/libdrm.so.2 (drmIoctl+0x34) [0x36e32036e4]
(EE) 8: /lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x36e3205fce]
(EE) 9: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f7dc87dd6e9]
(EE) 10: /lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xd1)
[0x7f7dc87de9e1]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1e3b1)
[0x7f7dc8a238c1]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1aa4)
[0x7f7dc89ea3e4]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x762f)
[0x7f7dc7b93c6f]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 15: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 16: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 17: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 18: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 19: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 20: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 21: ? (?+0x29) [0x29]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (QueuePointerEvents+0x52) [0x451472]
(EE) 1: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2d1d)
[0x7f7dc81d9c8d]
(EE) 2: /usr/bin/X (DPMSSupported+0xe8) [0x48b3b8]
(EE) 3: /usr/bin/X (xf86SerialModemClearBits+0x260) [0x4b4900]
(EE) 4: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 5: /lib64/libc.so.6 (ioctl+0x7) [0x36cc6ec067]
(EE) 6: /lib64/libdrm.so.2 (drmIoctl+0x34) [0x36e32036e4]
(EE) 7: /lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x36e3205fce]
(EE) 8: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f7dc87dd6e9]
(EE) 9: /lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xd1)
[0x7f7dc87de9e1]
(EE) 10: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1e3b1)
[0x7f7dc8a238c1]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1aa4)
[0x7f7dc89ea3e4]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x762f)
[0x7f7dc7b93c6f]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 14: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 15: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 16: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 17: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 19: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 20: ? (?+0x29) [0x29]
(EE) 
(EE) [mi] EQ overflow continuing.  200 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (QueuePointerEvents+0x52) [0x451472]
(EE) 1: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2d1d)
[0x7f7dc81d9c8d]
(EE) 2: /usr/bin/X (DPMSSupported+0xe8) [0x48b3b8]
(EE) 3: /usr/bin/X (xf86SerialModemClearBits+0x260) [0x4b4900]
(EE) 4: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 5: /lib64/libc.so.6 (ioctl+0x7) [0x36cc6ec067]
(EE) 6: /lib64/libdrm.so.2 (drmIoctl+0x34) [0x36e32036e4]
(EE) 7: /lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x36e3205fce]
(EE) 8: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f7dc87dd6e9]
(EE) 9: /lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xd1)
[0x7f7dc87de9e1]
(EE) 10: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1e3b1)
[0x7f7dc8a238c1]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1aa4)
[0x7f7dc89ea3e4]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x762f)
[0x7f7dc7b93c6f]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 14: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 15: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 16: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 17: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 19: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 20: ? (?+0x29) [0x29]
(EE) 
nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores tiling
nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores tiling
nouveau_exa_download_from_screen:299 - falling back to memcpy ignores tiling
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (OsLookupColor+0x129) [0x473759]
(EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 2: /lib64/libc.so.6 (__memcpy_sse2_unaligned+0x20) [0x36cc693f40]
(EE) 3: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0xed6)
[0x7f7dc7b877a6]
(EE) 4: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x13a3)
[0x7f7dc7b87e53]
(EE) 5: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x3aca)
[0x7f7dc7b8cd4a]
(EE) 6: /usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x4a8f)
[0x7f7dc7b9786f]
(EE) 7: /usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x1684)
[0x7f7dc7b913f4]
(EE) 8: /usr/bin/X (DamageRegionAppend+0x5d4) [0x52bc04]
(EE) 9: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x73fb)
[0x7f7dc7b93a3b]
(EE) 10: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 11: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 12: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 13: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 14: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 15: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 16: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 17: ? (?+0x29) [0x29]
(EE) 
(EE) Segmentation fault at address 0x0
(EE) 
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting


Generally when a lot of stuff is happening on the screen (ie. videos, etc).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396245445.868bc411.7860
Date: Mon, 31 Mar 2014 05:57:25 +0000
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
   title="NEW --- - Xorg EQ overflowing lock up"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76818">76818</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg EQ overflowing lock up
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
          <td>max.snow&#64;4mation.com.au
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
          <td>unspecified
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
        <pre>I have been using 2 monitors (1080p), and I've just replaced one with a 1600p
monitor, and straight away I am getting frequent lock ups (several times a
day), with this in the error log:


 (EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0x22b) [0x58356b]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x52) [0x451472]
(EE) 2: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2d1d)
[0x7f7dc81d9c8d]
(EE) 3: /usr/bin/X (DPMSSupported+0xe8) [0x48b3b8]
(EE) 4: /usr/bin/X (xf86SerialModemClearBits+0x260) [0x4b4900]
(EE) 5: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 6: /lib64/libc.so.6 (ioctl+0x7) [0x36cc6ec067]
(EE) 7: /lib64/libdrm.so.2 (drmIoctl+0x34) [0x36e32036e4]
(EE) 8: /lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x36e3205fce]
(EE) 9: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f7dc87dd6e9]
(EE) 10: /lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xd1)
[0x7f7dc87de9e1]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1e3b1)
[0x7f7dc8a238c1]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1aa4)
[0x7f7dc89ea3e4]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x762f)
[0x7f7dc7b93c6f]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 15: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 16: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 17: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 18: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 19: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 20: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 21: ? (?+0x29) [0x29]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (QueuePointerEvents+0x52) [0x451472]
(EE) 1: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2d1d)
[0x7f7dc81d9c8d]
(EE) 2: /usr/bin/X (DPMSSupported+0xe8) [0x48b3b8]
(EE) 3: /usr/bin/X (xf86SerialModemClearBits+0x260) [0x4b4900]
(EE) 4: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 5: /lib64/libc.so.6 (ioctl+0x7) [0x36cc6ec067]
(EE) 6: /lib64/libdrm.so.2 (drmIoctl+0x34) [0x36e32036e4]
(EE) 7: /lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x36e3205fce]
(EE) 8: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f7dc87dd6e9]
(EE) 9: /lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xd1)
[0x7f7dc87de9e1]
(EE) 10: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1e3b1)
[0x7f7dc8a238c1]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1aa4)
[0x7f7dc89ea3e4]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x762f)
[0x7f7dc7b93c6f]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 14: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 15: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 16: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 17: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 19: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 20: ? (?+0x29) [0x29]
(EE) 
(EE) [mi] EQ overflow continuing.  200 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (QueuePointerEvents+0x52) [0x451472]
(EE) 1: /usr/lib64/xorg/modules/input/evdev_drv.so (_init+0x2d1d)
[0x7f7dc81d9c8d]
(EE) 2: /usr/bin/X (DPMSSupported+0xe8) [0x48b3b8]
(EE) 3: /usr/bin/X (xf86SerialModemClearBits+0x260) [0x4b4900]
(EE) 4: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 5: /lib64/libc.so.6 (ioctl+0x7) [0x36cc6ec067]
(EE) 6: /lib64/libdrm.so.2 (drmIoctl+0x34) [0x36e32036e4]
(EE) 7: /lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x36e3205fce]
(EE) 8: /lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f7dc87dd6e9]
(EE) 9: /lib64/libdrm_nouveau.so.2 (nouveau_pushbuf_space+0xd1)
[0x7f7dc87de9e1]
(EE) 10: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1e3b1)
[0x7f7dc8a238c1]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x1aa4)
[0x7f7dc89ea3e4]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x762f)
[0x7f7dc7b93c6f]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 14: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 15: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 16: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 17: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 19: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 20: ? (?+0x29) [0x29]
(EE) 
nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores tiling
nouveau_exa_upload_to_screen:384 - falling back to memcpy ignores tiling
nouveau_exa_download_from_screen:299 - falling back to memcpy ignores tiling
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (OsLookupColor+0x129) [0x473759]
(EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x36cce0f74f]
(EE) 2: /lib64/libc.so.6 (__memcpy_sse2_unaligned+0x20) [0x36cc693f40]
(EE) 3: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0xed6)
[0x7f7dc7b877a6]
(EE) 4: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x13a3)
[0x7f7dc7b87e53]
(EE) 5: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x3aca)
[0x7f7dc7b8cd4a]
(EE) 6: /usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x4a8f)
[0x7f7dc7b9786f]
(EE) 7: /usr/lib64/xorg/modules/libexa.so (exaEnableDisableFBAccess+0x1684)
[0x7f7dc7b913f4]
(EE) 8: /usr/bin/X (DamageRegionAppend+0x5d4) [0x52bc04]
(EE) 9: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x73fb)
[0x7f7dc7b93a3b]
(EE) 10: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x7da1)
[0x7f7dc7b950b1]
(EE) 11: /usr/bin/X (DamageRegionAppend+0x87f) [0x52c14f]
(EE) 12: /usr/bin/X (AddTraps+0x453a) [0x5293ca]
(EE) 13: /usr/bin/X (SendErrorToClient+0x427) [0x43a3a7]
(EE) 14: /usr/bin/X (_init+0x3b0a) [0x42c00a]
(EE) 15: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x36cc621d65]
(EE) 16: /usr/bin/X (_start+0x29) [0x428c35]
(EE) 17: ? (?+0x29) [0x29]
(EE) 
(EE) Segmentation fault at address 0x0
(EE) 
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting


Generally when a lot of stuff is happening on the screen (ie. videos, etc).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396245445.868bc411.7860--

--===============0461175181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0461175181==--
