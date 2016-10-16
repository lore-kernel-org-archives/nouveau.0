From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95520] Error when recovering from suspend mode:
 fifo: ce0 engine fault on channel 0
Date: Sun, 16 Oct 2016 13:11:40 +0000
Message-ID: <bug-95520-8800-97eTyVmgRp@http.bugs.freedesktop.org/>
References: <bug-95520-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1733791526=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95520-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1733791526==
Content-Type: multipart/alternative; boundary="14766235000.88f34.5125";
 charset="UTF-8"


--14766235000.88f34.5125
Date: Sun, 16 Oct 2016 13:11:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95520

--- Comment #2 from rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org ---
Created attachment 127330
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127330&action=3Dedit
ps -el output

Linux kernel 4.7.5
desktop  kde plasma 5
xorg-x11-server 7.6
libdrm_nouveau2  2.4.70
xf86-video-nouveau  1.0.13

System was coming out of suspend, and I typed in my password to the unlock
screen.  The mouse would move but the system locked up.  I couldn't switch =
to
another virtual terminal.

I remote logged in but I couldn't exit several processes including Xorg.
Many processes were waiting on 'SyS_po' or 'SyS_ep'.
I don't know if the nouveau fifo read fault error is valid as it does often.

2016-10-16T07:00:35.743887-05:00 mothra kernel: [470577.068256] nouveau
0000:01:00.0: DRM: suspending console...
2016-10-16T07:00:35.743889-05:00 mothra kernel: [470577.068260] nouveau
0000:01:00.0: DRM: suspending display...
2016-10-16T07:00:35.743890-05:00 mothra kernel: [470577.068357] nouveau
0000:01:00.0: DRM: evicting buffers...
2016-10-16T07:00:35.743893-05:00 mothra kernel: [470577.458254] nouveau
0000:01:00.0: DRM: waiting for kernel channels to go idle...
2016-10-16T07:00:35.743895-05:00 mothra kernel: [470577.458284] nouveau
0000:01:00.0: DRM: suspending client object trees...
2016-10-16T07:00:35.743896-05:00 mothra kernel: [470577.458794] nouveau
0000:01:00.0: DRM: suspending kernel object tree...
2016-10-16T07:00:35.743967-05:00 mothra kernel: [470581.707062] nouveau
0000:01:00.0: DRM: resuming kernel object tree...
2016-10-16T07:00:35.743972-05:00 mothra kernel: [470581.998697] nouveau
0000:01:00.0: DRM: resuming client object trees...
2016-10-16T07:00:35.743974-05:00 mothra kernel: [470581.999113] nouveau
0000:01:00.0: DRM: resuming display...
2016-10-16T07:00:35.743992-05:00 mothra kernel: [470582.315418] nouveau
0000:01:00.0: DRM: resuming console...
2016-10-16T07:00:35.856377-05:00 mothra kernel: [470583.307500] nouveau
0000:01:00.0: fifo: read fault at 0001234000 engine 15 [PCE0] client 01
[PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel 0 [003fe12000 DRM]
2016-10-16T07:00:35.856387-05:00 mothra kernel: [470583.307504] nouveau
0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...

(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/Xorg (xorg_backtrace+0x4a) [0x59c85a]
(EE) 1: /usr/bin/Xorg (mieqEnqueue+0x253) [0x57e1e3]
(EE) 2: /usr/bin/Xorg (QueuePointerEvents+0x52) [0x4533d2]
(EE) 3: /usr/bin/Xorg (xf86PostMotionEvent+0xb9) [0x48c079]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x53=
c4)
[0x7fbd0fd0f3c4]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x78=
b2)
[0x7fbd0fd118b2]
(EE) 6: /usr/bin/Xorg (0x400000+0x7c708) [0x47c708]
(EE) 7: /usr/bin/Xorg (0x400000+0xa1d42) [0x4a1d42]
(EE) 8: /lib64/libc.so.6 (0x7fbd1dec6000+0x34650) [0x7fbd1defa650]
(EE) 9: /lib64/libc.so.6 (ioctl+0x5) [0x7fbd1dfa76e5]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fbd1f2e9bf8]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fbd1f2ec90b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xc2) [0x7fbd19882=
5b2]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fbd19a88000+0x8=
65a)
[0x7fbd19a9065a]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x5b9f)
[0x7fbd1966cb9f]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8280)
[0x7fbd1966f280]
(EE) 16: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x1057d)
[0x7fbd1967757d]
(EE) 17: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8ae4)
[0x7fbd1966fae4]
(EE) 18: /usr/bin/Xorg (0x400000+0x124f13) [0x524f13]
(EE) 19: /usr/bin/Xorg (0x400000+0xd90b0) [0x4d90b0]
(EE) 20: /usr/bin/Xorg (0x400000+0xda905) [0x4da905]
(EE) 21: /usr/bin/Xorg (0x400000+0x3a7af) [0x43a7af]
(EE) 22: /usr/bin/Xorg (0x400000+0x3e7b3) [0x43e7b3]
(EE) 23: /lib64/libc.so.6 (__libc_start_main+0xf1) [0x7fbd1dee6291]
(EE) 24: /usr/bin/Xorg (_start+0x29) [0x428759]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/Xorg (xorg_backtrace+0x4a) [0x59c85a]
(EE) 1: /usr/bin/Xorg (QueuePointerEvents+0x52) [0x4533d2]
(EE) 2: /usr/bin/Xorg (xf86PostMotionEvent+0xb9) [0x48c079]
(EE) 3: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x53=
c4)
[0x7fbd0fd0f3c4]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x78=
b2)
[0x7fbd0fd118b2]
(EE) 5: /usr/bin/Xorg (0x400000+0x7c708) [0x47c708]
(EE) 6: /usr/bin/Xorg (0x400000+0xa1d42) [0x4a1d42]
(EE) 7: /lib64/libc.so.6 (0x7fbd1dec6000+0x34650) [0x7fbd1defa650]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fbd1dfa76e5]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fbd1f2e9bf8]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fbd1f2ec90b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xc2) [0x7fbd19882=
5b2]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fbd19a88000+0x8=
65a)
[0x7fbd19a9065a]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x5b9f)
[0x7fbd1966cb9f]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8280)
[0x7fbd1966f280]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x1057d)
[0x7fbd1967757d]
(EE) 16: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8ae4)
[0x7fbd1966fae4]
(EE) 17: /usr/bin/Xorg (0x400000+0x124f13) [0x524f13]
(EE) 18: /usr/bin/Xorg (0x400000+0xd90b0) [0x4d90b0]
(EE) 19: /usr/bin/Xorg (0x400000+0xda905) [0x4da905]
(EE) 20: /usr/bin/Xorg (0x400000+0x3a7af) [0x43a7af]
(EE) 21: /usr/bin/Xorg (0x400000+0x3e7b3) [0x43e7b3]
(EE) 22: /lib64/libc.so.6 (__libc_start_main+0xf1) [0x7fbd1dee6291]
(EE) 23: /usr/bin/Xorg (_start+0x29) [0x428759]
(EE)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14766235000.88f34.5125
Date: Sun, 16 Oct 2016 13:11:40 +0000
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
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520">bug 95520<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rcoe&#64;wi.rr.com" title=3D"rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127330=
" name=3D"attach_127330" title=3D"ps -el output">attachment 127330</a> <a h=
ref=3D"attachment.cgi?id=3D127330&amp;action=3Dedit" title=3D"ps -el output=
">[details]</a></span>
ps -el output

Linux kernel 4.7.5
desktop  kde plasma 5
xorg-x11-server 7.6
libdrm_nouveau2  2.4.70
xf86-video-nouveau  1.0.13

System was coming out of suspend, and I typed in my password to the unlock
screen.  The mouse would move but the system locked up.  I couldn't switch =
to
another virtual terminal.

I remote logged in but I couldn't exit several processes including Xorg.
Many processes were waiting on 'SyS_po' or 'SyS_ep'.
I don't know if the nouveau fifo read fault error is valid as it does often.

2016-10-16T07:00:35.743887-05:00 mothra kernel: [470577.068256] nouveau
0000:01:00.0: DRM: suspending console...
2016-10-16T07:00:35.743889-05:00 mothra kernel: [470577.068260] nouveau
0000:01:00.0: DRM: suspending display...
2016-10-16T07:00:35.743890-05:00 mothra kernel: [470577.068357] nouveau
0000:01:00.0: DRM: evicting buffers...
2016-10-16T07:00:35.743893-05:00 mothra kernel: [470577.458254] nouveau
0000:01:00.0: DRM: waiting for kernel channels to go idle...
2016-10-16T07:00:35.743895-05:00 mothra kernel: [470577.458284] nouveau
0000:01:00.0: DRM: suspending client object trees...
2016-10-16T07:00:35.743896-05:00 mothra kernel: [470577.458794] nouveau
0000:01:00.0: DRM: suspending kernel object tree...
2016-10-16T07:00:35.743967-05:00 mothra kernel: [470581.707062] nouveau
0000:01:00.0: DRM: resuming kernel object tree...
2016-10-16T07:00:35.743972-05:00 mothra kernel: [470581.998697] nouveau
0000:01:00.0: DRM: resuming client object trees...
2016-10-16T07:00:35.743974-05:00 mothra kernel: [470581.999113] nouveau
0000:01:00.0: DRM: resuming display...
2016-10-16T07:00:35.743992-05:00 mothra kernel: [470582.315418] nouveau
0000:01:00.0: DRM: resuming console...
2016-10-16T07:00:35.856377-05:00 mothra kernel: [470583.307500] nouveau
0000:01:00.0: fifo: read fault at 0001234000 engine 15 [PCE0] client 01
[PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel 0 [003fe12000 DRM]
2016-10-16T07:00:35.856387-05:00 mothra kernel: [470583.307504] nouveau
0000:01:00.0: fifo: ce0 engine fault on channel 0, recovering...

(EE) [mi] EQ overflowing.  Additional events will be discarded until existi=
ng
events are processed.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/Xorg (xorg_backtrace+0x4a) [0x59c85a]
(EE) 1: /usr/bin/Xorg (mieqEnqueue+0x253) [0x57e1e3]
(EE) 2: /usr/bin/Xorg (QueuePointerEvents+0x52) [0x4533d2]
(EE) 3: /usr/bin/Xorg (xf86PostMotionEvent+0xb9) [0x48c079]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x53=
c4)
[0x7fbd0fd0f3c4]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x78=
b2)
[0x7fbd0fd118b2]
(EE) 6: /usr/bin/Xorg (0x400000+0x7c708) [0x47c708]
(EE) 7: /usr/bin/Xorg (0x400000+0xa1d42) [0x4a1d42]
(EE) 8: /lib64/libc.so.6 (0x7fbd1dec6000+0x34650) [0x7fbd1defa650]
(EE) 9: /lib64/libc.so.6 (ioctl+0x5) [0x7fbd1dfa76e5]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fbd1f2e9bf8]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fbd1f2ec90b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xc2) [0x7fbd19882=
5b2]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fbd19a88000+0x8=
65a)
[0x7fbd19a9065a]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x5b9f)
[0x7fbd1966cb9f]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8280)
[0x7fbd1966f280]
(EE) 16: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x1057d)
[0x7fbd1967757d]
(EE) 17: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8ae4)
[0x7fbd1966fae4]
(EE) 18: /usr/bin/Xorg (0x400000+0x124f13) [0x524f13]
(EE) 19: /usr/bin/Xorg (0x400000+0xd90b0) [0x4d90b0]
(EE) 20: /usr/bin/Xorg (0x400000+0xda905) [0x4da905]
(EE) 21: /usr/bin/Xorg (0x400000+0x3a7af) [0x43a7af]
(EE) 22: /usr/bin/Xorg (0x400000+0x3e7b3) [0x43e7b3]
(EE) 23: /lib64/libc.so.6 (__libc_start_main+0xf1) [0x7fbd1dee6291]
(EE) 24: /usr/bin/Xorg (_start+0x29) [0x428759]
(EE)=20
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE)=20
(EE) Backtrace:
(EE) 0: /usr/bin/Xorg (xorg_backtrace+0x4a) [0x59c85a]
(EE) 1: /usr/bin/Xorg (QueuePointerEvents+0x52) [0x4533d2]
(EE) 2: /usr/bin/Xorg (xf86PostMotionEvent+0xb9) [0x48c079]
(EE) 3: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x53=
c4)
[0x7fbd0fd0f3c4]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7fbd0fd0a000+0x78=
b2)
[0x7fbd0fd118b2]
(EE) 5: /usr/bin/Xorg (0x400000+0x7c708) [0x47c708]
(EE) 6: /usr/bin/Xorg (0x400000+0xa1d42) [0x4a1d42]
(EE) 7: /lib64/libc.so.6 (0x7fbd1dec6000+0x34650) [0x7fbd1defa650]
(EE) 8: /lib64/libc.so.6 (ioctl+0x5) [0x7fbd1dfa76e5]
(EE) 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7fbd1f2e9bf8]
(EE) 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7fbd1f2ec90b]
(EE) 11: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0xc2) [0x7fbd19882=
5b2]
(EE) 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7fbd19a88000+0x8=
65a)
[0x7fbd19a9065a]
(EE) 13: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x5b9f)
[0x7fbd1966cb9f]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8280)
[0x7fbd1966f280]
(EE) 15: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x1057d)
[0x7fbd1967757d]
(EE) 16: /usr/lib64/xorg/modules/libexa.so (0x7fbd19667000+0x8ae4)
[0x7fbd1966fae4]
(EE) 17: /usr/bin/Xorg (0x400000+0x124f13) [0x524f13]
(EE) 18: /usr/bin/Xorg (0x400000+0xd90b0) [0x4d90b0]
(EE) 19: /usr/bin/Xorg (0x400000+0xda905) [0x4da905]
(EE) 20: /usr/bin/Xorg (0x400000+0x3a7af) [0x43a7af]
(EE) 21: /usr/bin/Xorg (0x400000+0x3e7b3) [0x43e7b3]
(EE) 22: /lib64/libc.so.6 (__libc_start_main+0xf1) [0x7fbd1dee6291]
(EE) 23: /usr/bin/Xorg (_start+0x29) [0x428759]
(EE)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14766235000.88f34.5125--

--===============1733791526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1733791526==--
