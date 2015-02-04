From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Wed, 04 Feb 2015 08:21:36 +0000
Message-ID: <bug-87819-8800-zQ39TxdRwR@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0350806056=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0350806056==
Content-Type: multipart/alternative; boundary="1423038095.3ae4D1.21568"; charset="UTF-8"


--1423038095.3ae4D1.21568
Date: Wed, 4 Feb 2015 08:21:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #5 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
I'll put a "me too" up.  I can toss up logs for X.org however I've got a
challenge trying to get dmesg out of the machine: local console becomes
unresponsive and I have to hard-reboot to recover.

An exerpt from X.org logs:
(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x4f) [0x7f17a02c94bf]
(EE) 1: /usr/bin/X (mieqEnqueue+0x2b3) [0x7f17a02a81d3]
(EE) 2: /usr/bin/X (0x7f17a00e8000+0x73a6a) [0x7f17a015ba6a]
(EE) 3: /usr/bin/X (xf86PostMotionEvent+0xd0) [0x7f17a019e580]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7f17979fc000+0x5694)
[0x7f1797a01694]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7f17979fc000+0x71f2)
[0x7f1797a031f2]
(EE) 6: /usr/bin/X (0x7f17a00e8000+0xa3a57) [0x7f17a018ba57]
(EE) 7: /usr/bin/X (0x7f17a00e8000+0xd34a0) [0x7f17a01bb4a0]
(EE) 8: /lib64/libpthread.so.0 (0x7f179f27a000+0x11250) [0x7f179f28b250]
(EE) 9: /lib64/libc.so.6 (ioctl+0x7) [0x7f179dfab297]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x38) [0x7f179f0704b8]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x2b) [0x7f179f07335b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f179aa7a0e9]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f179ac7f000+0xd0ae)
[0x7f179ac8c0ae]
(EE) 14: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f179ac7f000+0xd601)
[0x7f179ac8c601]
(EE) 15: /usr/bin/X (DRI2SwapBuffers+0x27d) [0x7f17a029642d]
(EE) 16: /usr/bin/X (0x7f17a00e8000+0x1afa30) [0x7f17a0297a30]
(EE) 17: /usr/bin/X (0x7f17a00e8000+0x5bbbe) [0x7f17a0143bbe]
(EE) 18: /usr/bin/X (0x7f17a00e8000+0x6017a) [0x7f17a014817a]
(EE) 19: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7f179deead55]
(EE) 20: /usr/bin/X (0x7f17a00e8000+0x47fed) [0x7f17a012ffed]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.


I don't have a second machine handy to use SSH with right now.

My host is running Gentoo AMD64 with Linux kernel 3.18.5, X.org server 1.15.2,
xf86-video-nouveau 1.0.10 and mesa 10.2.6.  The machine is an Apple MacBook
A1278 with a NVidia GeForce 9400M.

The kernel was built this morning from git sources (linux-stable git tree).

I'm finding OpenSCAD 2014.03 triggers the bug pretty reliably.  I can be booted
in X running Firefox, Thunderbird, QTerminal and FVWM for *days*, but after
about 5 minutes of fiddling with models in OpenSCAD, *boom*, nouveau
accidentally says something insulting to the GPU and the GPU stops
communicating.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423038095.3ae4D1.21568
Date: Wed, 4 Feb 2015 08:21:35 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:stuartl&#64;longlandclan.yi.org" title="Stuart Longland &lt;stuartl&#64;longlandclan.yi.org&gt;"> <span class="fn">Stuart Longland</span></a>
</span></b>
        <pre>I'll put a &quot;me too&quot; up.  I can toss up logs for X.org however I've got a
challenge trying to get dmesg out of the machine: local console becomes
unresponsive and I have to hard-reboot to recover.

An exerpt from X.org logs:
(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x4f) [0x7f17a02c94bf]
(EE) 1: /usr/bin/X (mieqEnqueue+0x2b3) [0x7f17a02a81d3]
(EE) 2: /usr/bin/X (0x7f17a00e8000+0x73a6a) [0x7f17a015ba6a]
(EE) 3: /usr/bin/X (xf86PostMotionEvent+0xd0) [0x7f17a019e580]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7f17979fc000+0x5694)
[0x7f1797a01694]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7f17979fc000+0x71f2)
[0x7f1797a031f2]
(EE) 6: /usr/bin/X (0x7f17a00e8000+0xa3a57) [0x7f17a018ba57]
(EE) 7: /usr/bin/X (0x7f17a00e8000+0xd34a0) [0x7f17a01bb4a0]
(EE) 8: /lib64/libpthread.so.0 (0x7f179f27a000+0x11250) [0x7f179f28b250]
(EE) 9: /lib64/libc.so.6 (ioctl+0x7) [0x7f179dfab297]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x38) [0x7f179f0704b8]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x2b) [0x7f179f07335b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x99) [0x7f179aa7a0e9]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f179ac7f000+0xd0ae)
[0x7f179ac8c0ae]
(EE) 14: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f179ac7f000+0xd601)
[0x7f179ac8c601]
(EE) 15: /usr/bin/X (DRI2SwapBuffers+0x27d) [0x7f17a029642d]
(EE) 16: /usr/bin/X (0x7f17a00e8000+0x1afa30) [0x7f17a0297a30]
(EE) 17: /usr/bin/X (0x7f17a00e8000+0x5bbbe) [0x7f17a0143bbe]
(EE) 18: /usr/bin/X (0x7f17a00e8000+0x6017a) [0x7f17a014817a]
(EE) 19: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7f179deead55]
(EE) 20: /usr/bin/X (0x7f17a00e8000+0x47fed) [0x7f17a012ffed]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.


I don't have a second machine handy to use SSH with right now.

My host is running Gentoo AMD64 with Linux kernel 3.18.5, X.org server 1.15.2,
xf86-video-nouveau 1.0.10 and mesa 10.2.6.  The machine is an Apple MacBook
A1278 with a NVidia GeForce 9400M.

The kernel was built this morning from git sources (linux-stable git tree).

I'm finding OpenSCAD 2014.03 triggers the bug pretty reliably.  I can be booted
in X running Firefox, Thunderbird, QTerminal and FVWM for *days*, but after
about 5 minutes of fiddling with models in OpenSCAD, *boom*, nouveau
accidentally says something insulting to the GPU and the GPU stops
communicating.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423038095.3ae4D1.21568--

--===============0350806056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0350806056==--
