From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Fri, 18 Oct 2013 19:52:37 +0000
Message-ID: <bug-70388-8800-qPr1vuwXh7@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1419768011=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1419768011==
Content-Type: multipart/alternative; boundary="1382125957.2b1C0.6903"; charset="us-ascii"


--1382125957.2b1C0.6903
Date: Fri, 18 Oct 2013 19:52:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #12 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #6)
> For setting agpmode:
> 
> Add nouveau.agpmode=4 (or =0) on the kernel command line.

I tried both and neither had helped.

Fortunatelly I've found backtraces like following in /var/log/kdm.log-20131014
and in /var/log/kdm.log

(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0x21b) [0x81d417b]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092c5c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e06d3]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70d7147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cfb56]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb15b]
(EE) 6: ? (?+0x19b) [0xb77d259a]
(EE) 7: ? (?+0x19b) [0xb77d25af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb73669a9]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb758ebd0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb759147f]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d38146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x693a)
[0xb6d4df2a]
(EE) 13: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x6f91)
[0xb6d4eb11]
(EE) 14: /usr/bin/X (DRI2SwapBuffers+0x36e) [0x81c48ce]
(EE) 15: /usr/bin/X (DRI2GetParam+0xcc4) [0x81c65e4]
(EE) 16: /usr/bin/X (SendErrorToClient+0x3dd) [0x807a87d]
(EE) 17: /usr/bin/X (_init+0x4659) [0x806c6d9]
(EE) 18: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7292963]
(EE) 19: /usr/bin/X (_start+0x21) [0x806887a]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0xe8) [0x81d4048]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092c5c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e06d3]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70d7147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cfb56]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb15b]
(EE) 6: ? (?+0x19b) [0xb77d259a]
(EE) 7: ? (?+0x19b) [0xb77d25af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb73669a9]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb758ebd0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb759147f]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d38146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x693a)
[0xb6d4df2a]
(EE) 13: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x6f91)
[0xb6d4eb11]
(EE) 14: /usr/bin/X (DRI2SwapBuffers+0x36e) [0x81c48ce]
(EE) 15: /usr/bin/X (DRI2GetParam+0xcc4) [0x81c65e4]
(EE) 16: /usr/bin/X (SendErrorToClient+0x3dd) [0x807a87d]
(EE) 17: /usr/bin/X (_init+0x4659) [0x806c6d9]
(EE) 18: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7292963]
(EE) 19: /usr/bin/X (_start+0x21) [0x806887a]


As you can see it had crashed during nouveau_bo_wait+0xa6. Does it help to
understand what is going on here?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382125957.2b1C0.6903
Date: Fri, 18 Oct 2013 19:52:37 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70388#c6">comment #6</a>)
<span class="quote">&gt; For setting agpmode:
&gt; 
&gt; Add nouveau.agpmode=4 (or =0) on the kernel command line.</span >

I tried both and neither had helped.

Fortunatelly I've found backtraces like following in /var/log/kdm.log-20131014
and in /var/log/kdm.log

(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0x21b) [0x81d417b]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092c5c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e06d3]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70d7147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cfb56]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb15b]
(EE) 6: ? (?+0x19b) [0xb77d259a]
(EE) 7: ? (?+0x19b) [0xb77d25af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb73669a9]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb758ebd0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb759147f]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d38146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x693a)
[0xb6d4df2a]
(EE) 13: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x6f91)
[0xb6d4eb11]
(EE) 14: /usr/bin/X (DRI2SwapBuffers+0x36e) [0x81c48ce]
(EE) 15: /usr/bin/X (DRI2GetParam+0xcc4) [0x81c65e4]
(EE) 16: /usr/bin/X (SendErrorToClient+0x3dd) [0x807a87d]
(EE) 17: /usr/bin/X (_init+0x4659) [0x806c6d9]
(EE) 18: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7292963]
(EE) 19: /usr/bin/X (_start+0x21) [0x806887a]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0xe8) [0x81d4048]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092c5c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e06d3]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70d7147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cfb56]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb15b]
(EE) 6: ? (?+0x19b) [0xb77d259a]
(EE) 7: ? (?+0x19b) [0xb77d25af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb73669a9]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb758ebd0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb759147f]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d38146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x693a)
[0xb6d4df2a]
(EE) 13: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x6f91)
[0xb6d4eb11]
(EE) 14: /usr/bin/X (DRI2SwapBuffers+0x36e) [0x81c48ce]
(EE) 15: /usr/bin/X (DRI2GetParam+0xcc4) [0x81c65e4]
(EE) 16: /usr/bin/X (SendErrorToClient+0x3dd) [0x807a87d]
(EE) 17: /usr/bin/X (_init+0x4659) [0x806c6d9]
(EE) 18: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7292963]
(EE) 19: /usr/bin/X (_start+0x21) [0x806887a]


As you can see it had crashed during nouveau_bo_wait+0xa6. Does it help to
understand what is going on here?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382125957.2b1C0.6903--

--===============1419768011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1419768011==--
