From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26555] nouveau fails to fully resume nforce1 (nv1a)
	after S3
Date: Sat, 14 Sep 2013 15:03:10 +0000
Message-ID: <bug-26555-8800-zi6IOmcvYS@http.bugs.freedesktop.org/>
References: <bug-26555-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1435641505=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26555-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1435641505==
Content-Type: multipart/alternative; boundary="1379170990.aB2D1.14247"; charset="us-ascii"


--1379170990.aB2D1.14247
Date: Sat, 14 Sep 2013 15:03:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=26555

--- Comment #3 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
This still applies, with patches (attachment 84758 from bug #50375, or
attachment 85214 and attachment 85215 from bug #50375) applied.

One one attempt with first patch applied on top of 3.11 I got some more-or-less
tiled pattern with black tile content and random borders (big tiles).

One one attempt with the set of two patches I got rather uniform noise.

Writing to /dev/fb0 (from /dev/zero or /dev/urandom) does not seem to affect
the noise displayed on the monitor.

Resume kernel log related to nouveau/gpu:
[  428.123511] nouveau  [     DRM] re-enabling device...
[  428.123519] nouveau  [     DRM] resuming kernel object tree...
[  428.123536] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  428.280097] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  428.287423] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  428.287444] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  428.287489] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  428.287493] nouveau  [     DRM] resuming client object trees...
[  428.287729] nouveau  [     DRM] resuming display...
[  428.294906] nouveau  [     DRM] 0xAFD8: Parsing digital output script table

Starting Xorg after resume produces:
[  960.420232] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.427227] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.430017] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.430017] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.430017] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
...
[  960.430017] nouveau E[   PFIFO][0000:02:00.0] still angry after 101 spins,
halt
and monitor displays noise (more colored) on the upper display half and black
on the lower half

Starting a X client causes Xorg to complain with:
(EE) [mi] EQ overflow continuing.  200 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: Xorg (xorg_backtrace+0x49) [0x81f3af9]
(EE) 1: Xorg (mieqEnqueue+0xfc) [0x81d1e1c]
(EE) 2: Xorg (0x8048000+0x4b3cd) [0x80933cd]
(EE) 3: Xorg (xf86PostMotionEventM+0x26b) [0x80d27ab]
(EE) 4: /usr/lib/xorg/modules/input/evdev_drv.so (0xb7197000+0x413d)
[0xb719b13d]
(EE) 5: /usr/lib/xorg/modules/input/evdev_drv.so (0xb7197000+0x5713)
[0xb719c713]
(EE) 6: Xorg (0x8048000+0x791f1) [0x80c11f1]
(EE) 7: Xorg (0x8048000+0xa6896) [0x80ee896]
(EE) 8: linux-gate.so.1 (__kernel_sigreturn+0x0) [0xb778e400]
(EE) 9: linux-gate.so.1 (__kernel_vsyscall+0x10) [0xb778e424]
(EE) 10: /lib/libc.so.6 (ioctl+0x19) [0xb7536ae9]
(EE) 11: /usr/lib/libdrm.so.2 (drmIoctl+0x34) [0xb76b06c4]
(EE) 12: /usr/lib/libdrm.so.2 (drmCommandWrite+0x3c) [0xb76b31ec]
(EE) 13: /usr/lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xaa) [0xb778651a]
(EE) 14: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0xb7280000+0x5875)
[0xb7285875]
(EE) 15: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x59c0) [0xb72449c0]
(EE) 16: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x5e35) [0xb7244e35]
(EE) 17: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x8787) [0xb7247787]
(EE) 18: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x490c) [0xb724390c]
(EE) 19: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x11a98) [0xb7250a98]
(EE) 20: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x8c50) [0xb7247c50]
(EE) 21: Xorg (miFillGeneralPoly+0x4f9) [0x81df049]
(EE) 22: Xorg (miFillPolygon+0x66) [0x81de486]
(EE) 23: Xorg (0x8048000+0x129deb) [0x8171deb]
(EE) 24: Xorg (0x8048000+0x312c1) [0x80792c1]
(EE) 25: Xorg (0x8048000+0x3504d) [0x807d04d]
(EE) 26: Xorg (0x8048000+0x2267a) [0x806a67a]
(EE) 27: /lib/libc.so.6 (__libc_start_main+0xe6) [0xb746d596]
(EE) 28: Xorg (0x8048000+0x22a19) [0x806aa19]
[x11-drivers/xf86-video-nouveau-1.0.9, x11-libs/libdrm-2.4.46,
media-libs/mesa-9.1.6]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379170990.aB2D1.14247
Date: Sat, 14 Sep 2013 15:03:10 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - nouveau fails to fully resume nforce1 (nv1a) after S3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26555#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - nouveau fails to fully resume nforce1 (nv1a) after S3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26555">bug 26555</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>This still applies, with patches (<span class="bz_obsolete"><a href="attachment.cgi?id=84758" name="attach_84758" title="patch to treat nv1a as pre-nv17">attachment 84758</a> <a href="attachment.cgi?id=84758&amp;action=edit" title="patch to treat nv1a as pre-nv17">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=26555&amp;attachment=84758'>[review]</a> from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="show_bug.cgi?id=50375">bug #50375</a>, or
<span class=""><a href="attachment.cgi?id=85214" name="attach_85214" title="add nv11 card type">attachment 85214</a> <a href="attachment.cgi?id=85214&amp;action=edit" title="add nv11 card type">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=26555&amp;attachment=85214'>[review]</a> and <span class=""><a href="attachment.cgi?id=85215" name="attach_85215" title="fix nv1a chipset checks">attachment 85215</a> <a href="attachment.cgi?id=85215&amp;action=edit" title="fix nv1a chipset checks">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=26555&amp;attachment=85215'>[review]</a> from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty switch"
   href="show_bug.cgi?id=50375">bug #50375</a>) applied.

One one attempt with first patch applied on top of 3.11 I got some more-or-less
tiled pattern with black tile content and random borders (big tiles).

One one attempt with the set of two patches I got rather uniform noise.

Writing to /dev/fb0 (from /dev/zero or /dev/urandom) does not seem to affect
the noise displayed on the monitor.

Resume kernel log related to nouveau/gpu:
[  428.123511] nouveau  [     DRM] re-enabling device...
[  428.123519] nouveau  [     DRM] resuming kernel object tree...
[  428.123536] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  428.280097] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  428.287423] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  428.287444] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  428.287489] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  428.287493] nouveau  [     DRM] resuming client object trees...
[  428.287729] nouveau  [     DRM] resuming display...
[  428.294906] nouveau  [     DRM] 0xAFD8: Parsing digital output script table

Starting Xorg after resume produces:
[  960.420232] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.427227] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.430017] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.430017] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
[  960.430017] nouveau W[   PFIFO][0000:02:00.0] unknown intr 0x00010000, ch 1
...
[  960.430017] nouveau E[   PFIFO][0000:02:00.0] still angry after 101 spins,
halt
and monitor displays noise (more colored) on the upper display half and black
on the lower half

Starting a X client causes Xorg to complain with:
(EE) [mi] EQ overflow continuing.  200 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: Xorg (xorg_backtrace+0x49) [0x81f3af9]
(EE) 1: Xorg (mieqEnqueue+0xfc) [0x81d1e1c]
(EE) 2: Xorg (0x8048000+0x4b3cd) [0x80933cd]
(EE) 3: Xorg (xf86PostMotionEventM+0x26b) [0x80d27ab]
(EE) 4: /usr/lib/xorg/modules/input/evdev_drv.so (0xb7197000+0x413d)
[0xb719b13d]
(EE) 5: /usr/lib/xorg/modules/input/evdev_drv.so (0xb7197000+0x5713)
[0xb719c713]
(EE) 6: Xorg (0x8048000+0x791f1) [0x80c11f1]
(EE) 7: Xorg (0x8048000+0xa6896) [0x80ee896]
(EE) 8: linux-gate.so.1 (__kernel_sigreturn+0x0) [0xb778e400]
(EE) 9: linux-gate.so.1 (__kernel_vsyscall+0x10) [0xb778e424]
(EE) 10: /lib/libc.so.6 (ioctl+0x19) [0xb7536ae9]
(EE) 11: /usr/lib/libdrm.so.2 (drmIoctl+0x34) [0xb76b06c4]
(EE) 12: /usr/lib/libdrm.so.2 (drmCommandWrite+0x3c) [0xb76b31ec]
(EE) 13: /usr/lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xaa) [0xb778651a]
(EE) 14: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0xb7280000+0x5875)
[0xb7285875]
(EE) 15: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x59c0) [0xb72449c0]
(EE) 16: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x5e35) [0xb7244e35]
(EE) 17: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x8787) [0xb7247787]
(EE) 18: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x490c) [0xb724390c]
(EE) 19: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x11a98) [0xb7250a98]
(EE) 20: /usr/lib/xorg/modules/libexa.so (0xb723f000+0x8c50) [0xb7247c50]
(EE) 21: Xorg (miFillGeneralPoly+0x4f9) [0x81df049]
(EE) 22: Xorg (miFillPolygon+0x66) [0x81de486]
(EE) 23: Xorg (0x8048000+0x129deb) [0x8171deb]
(EE) 24: Xorg (0x8048000+0x312c1) [0x80792c1]
(EE) 25: Xorg (0x8048000+0x3504d) [0x807d04d]
(EE) 26: Xorg (0x8048000+0x2267a) [0x806a67a]
(EE) 27: /lib/libc.so.6 (__libc_start_main+0xe6) [0xb746d596]
(EE) 28: Xorg (0x8048000+0x22a19) [0x806aa19]
[x11-drivers/xf86-video-nouveau-1.0.9, x11-libs/libdrm-2.4.46,
media-libs/mesa-9.1.6]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379170990.aB2D1.14247--

--===============1435641505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1435641505==--
