From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Thu, 26 Jan 2017 00:26:52 +0000
Message-ID: <bug-92077-8800-2ND2QJYcuz@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2072979717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2072979717==
Content-Type: multipart/alternative; boundary="14853904123.aFa9CD.6927";
 charset="UTF-8"


--14853904123.aFa9CD.6927
Date: Thu, 26 Jan 2017 00:26:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92077

--- Comment #31 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
I've started to get a slightly different crash with update to kernel 4.9.5
and/or newer Plasma.

It usually happens while unlocking the screen (enter password, hit enter, a=
nd
boom -- left monitor is black, right monitor is frozen with a mouse cursor
(well, a glitch instead of a normal cursor) moving).


x11-base/xorg-server-1.18.4
x11-drivers/xf86-video-nouveau-1.0.12
media-libs/mesa-12.0.1
x11-libs/libdrm-2.4.70
kde-plasma/plasma-workspace-5.8.3-r4
kde-frameworks/plasma-5.29.0


[94521.089913] DMAR: DRHD: handling fault status reg 2
[94521.089940] DMAR: [DMA Read] Request device [03:00.0] fault addr edb60000
[fault reason 06] PTE Read access is not set
[94521.089947] DMAR: [DMA Read] Request device [03:00.0] fault addr edb60000
[fault reason 06] PTE Read access is not set
<snip>
[94521.090876] DMAR: [DMA Read] Request device [03:00.0] fault addr edba3000
[fault reason 06] PTE Read access is not set
[94521.090876] DMAR: [DMA Read] Request device [03:00.0] fault addr edba3000
[fault reason 06] PTE Read access is not set
[94521.096700] DMAR: DRHD: handling fault status reg 500
[94521.096729] nouveau 0000:03:00.0: fifo: write fault at 00029a7000 engine=
 15
[PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel 0 [001fe7=
2000
DRM]
[94521.096732] nouveau 0000:03:00.0: fifo: ce0 engine fault on channel 0,
recovering...


Xorg.log has usual (in such cases) EQ overflow errors:
(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x589af6]
(EE) 1: /usr/bin/X (mieqEnqueue+0x24b) [0x56bb6b]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x52) [0x44dd22]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fb450ad0000+0x623f)
[0x7fb450ad623f]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fb450ad0000+0x6acd)
[0x7fb450ad6acd]
(EE) 5: /usr/bin/X (0x400000+0x750c8) [0x4750c8]
(EE) 6: /usr/bin/X (0x400000+0x9a056) [0x49a056]
(EE) 7: /lib64/libc.so.6 (0x7fb45b990000+0x331f0) [0x7fb45b9c31f0]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fb45ba6fc75]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fb45cb1dc68]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fb45cb2098b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7fb4578fd=
44c]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fb457b02000+0xc=
5a7)
[0x7fb457b0e5a7]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fb457b02000+0xc=
fed)
[0x7fb457b0efed]
(EE) 14: /usr/bin/X (DRI2SwapBuffers+0x1c8) [0x55cd68]
(EE) 15: /usr/bin/X (0x400000+0x15e5ec) [0x55e5ec]
(EE) 16: /usr/bin/X (0x400000+0x355bf) [0x4355bf]
(EE) 17: /usr/bin/X (0x400000+0x39643) [0x439643]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7fb45b9b0790]
(EE) 19: /usr/bin/X (_start+0x29) [0x423939]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14853904123.aFa9CD.6927
Date: Thu, 26 Jan 2017 00:26:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077#c31">Commen=
t # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077">bug 92077<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ahippo&#64;yandex.ru" title=3D"Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <=
span class=3D"fn">Andrey Mazo</span></a>
</span></b>
        <pre>I've started to get a slightly different crash with update to =
kernel 4.9.5
and/or newer Plasma.

It usually happens while unlocking the screen (enter password, hit enter, a=
nd
boom -- left monitor is black, right monitor is frozen with a mouse cursor
(well, a glitch instead of a normal cursor) moving).


x11-base/xorg-server-1.18.4
x11-drivers/xf86-video-nouveau-1.0.12
media-libs/mesa-12.0.1
x11-libs/libdrm-2.4.70
kde-plasma/plasma-workspace-5.8.3-r4
kde-frameworks/plasma-5.29.0


[94521.089913] DMAR: DRHD: handling fault status reg 2
[94521.089940] DMAR: [DMA Read] Request device [03:00.0] fault addr edb60000
[fault reason 06] PTE Read access is not set
[94521.089947] DMAR: [DMA Read] Request device [03:00.0] fault addr edb60000
[fault reason 06] PTE Read access is not set
&lt;snip&gt;
[94521.090876] DMAR: [DMA Read] Request device [03:00.0] fault addr edba3000
[fault reason 06] PTE Read access is not set
[94521.090876] DMAR: [DMA Read] Request device [03:00.0] fault addr edba3000
[fault reason 06] PTE Read access is not set
[94521.096700] DMAR: DRHD: handling fault status reg 500
[94521.096729] nouveau 0000:03:00.0: fifo: write fault at 00029a7000 engine=
 15
[PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel 0 [001fe7=
2000
DRM]
[94521.096732] nouveau 0000:03:00.0: fifo: ce0 engine fault on channel 0,
recovering...


Xorg.log has usual (in such cases) EQ overflow errors:
(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x56) [0x589af6]
(EE) 1: /usr/bin/X (mieqEnqueue+0x24b) [0x56bb6b]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x52) [0x44dd22]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fb450ad0000+0x623f)
[0x7fb450ad623f]
(EE) 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7fb450ad0000+0x6acd)
[0x7fb450ad6acd]
(EE) 5: /usr/bin/X (0x400000+0x750c8) [0x4750c8]
(EE) 6: /usr/bin/X (0x400000+0x9a056) [0x49a056]
(EE) 7: /lib64/libc.so.6 (0x7fb45b990000+0x331f0) [0x7fb45b9c31f0]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fb45ba6fc75]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fb45cb1dc68]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fb45cb2098b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xbc) [0x7fb4578fd=
44c]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fb457b02000+0xc=
5a7)
[0x7fb457b0e5a7]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fb457b02000+0xc=
fed)
[0x7fb457b0efed]
(EE) 14: /usr/bin/X (DRI2SwapBuffers+0x1c8) [0x55cd68]
(EE) 15: /usr/bin/X (0x400000+0x15e5ec) [0x55e5ec]
(EE) 16: /usr/bin/X (0x400000+0x355bf) [0x4355bf]
(EE) 17: /usr/bin/X (0x400000+0x39643) [0x439643]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7fb45b9b0790]
(EE) 19: /usr/bin/X (_start+0x29) [0x423939]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14853904123.aFa9CD.6927--

--===============2072979717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2072979717==--
