From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Wed, 04 Dec 2013 21:35:28 +0000
Message-ID: <bug-70388-8800-1ySAvoBRAZ@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0167220885=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0167220885==
Content-Type: multipart/alternative; boundary="1386192928.F7362bE0.18664"; charset="us-ascii"


--1386192928.F7362bE0.18664
Date: Wed, 4 Dec 2013 21:35:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #17 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
...and /var/log/kdm.log has the similar backtraces like it was in a past:


(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0x21b) [0x81d4adb]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092f2c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e0a93]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70a5147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cff06]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb54b]
(EE) 6: ? (?+0x19b) [0xb77bf59a]
(EE) 7: ? (?+0x19b) [0xb77bf5af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb7335989]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb755dbf0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb75604ff]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d09146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x2019)
[0xb6d15cf9]
(EE) 13: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x6e2e) [0xb6cd48ae]
(EE) 14: /usr/bin/X (miFillUniqueSpanGroup+0x1adf) [0x81e65bf]
(EE) 15: /usr/bin/X (xf86I2CGetScreenBuses+0x1dfb) [0x81251ab]
(EE) 16: /usr/bin/X (dixDestroyPixmap+0x1ba9) [0x8078f79]
(EE) 17: /usr/bin/X (SendErrorToClient+0x3dd) [0x807aa5d]
(EE) 18: /usr/bin/X (_init+0x4665) [0x806c8c5]
(EE) 19: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7261963]
(EE) 20: /usr/bin/X (_start+0x21) [0x8068a5a]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0xe8) [0x81d49a8]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092f2c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e0a93]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70a5147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cff06]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb54b]
(EE) 6: ? (?+0x19b) [0xb77bf59a]
(EE) 7: ? (?+0x19b) [0xb77bf5af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb7335989]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb755dbf0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb75604ff]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d09146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x2019)
[0xb6d15cf9]
(EE) 13: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x6e2e) [0xb6cd48ae]
(EE) 14: /usr/bin/X (miFillUniqueSpanGroup+0x1adf) [0x81e65bf]
(EE) 15: /usr/bin/X (xf86I2CGetScreenBuses+0x1dfb) [0x81251ab]
(EE) 16: /usr/bin/X (dixDestroyPixmap+0x1ba9) [0x8078f79]
(EE) 17: /usr/bin/X (SendErrorToClient+0x3dd) [0x807aa5d]
(EE) 18: /usr/bin/X (_init+0x4665) [0x806c8c5]
(EE) 19: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7261963]
(EE) 20: /usr/bin/X (_start+0x21) [0x8068a5a]
(EE) 
(EE) [mi] EQ overflow continuing.  200 events have been dropped.

and so on...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386192928.F7362bE0.18664
Date: Wed, 4 Dec 2013 21:35:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>...and /var/log/kdm.log has the similar backtraces like it was in a past:


(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0x21b) [0x81d4adb]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092f2c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e0a93]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70a5147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cff06]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb54b]
(EE) 6: ? (?+0x19b) [0xb77bf59a]
(EE) 7: ? (?+0x19b) [0xb77bf5af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb7335989]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb755dbf0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb75604ff]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d09146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x2019)
[0xb6d15cf9]
(EE) 13: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x6e2e) [0xb6cd48ae]
(EE) 14: /usr/bin/X (miFillUniqueSpanGroup+0x1adf) [0x81e65bf]
(EE) 15: /usr/bin/X (xf86I2CGetScreenBuses+0x1dfb) [0x81251ab]
(EE) 16: /usr/bin/X (dixDestroyPixmap+0x1ba9) [0x8078f79]
(EE) 17: /usr/bin/X (SendErrorToClient+0x3dd) [0x807aa5d]
(EE) 18: /usr/bin/X (_init+0x4665) [0x806c8c5]
(EE) 19: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7261963]
(EE) 20: /usr/bin/X (_start+0x21) [0x8068a5a]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.
(EE) [mi] EQ overflow continuing.  100 events have been dropped.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (mieqEnqueue+0xe8) [0x81d49a8]
(EE) 1: /usr/bin/X (QueuePointerEvents+0x6c) [0x8092f2c]
(EE) 2: /usr/bin/X (xf86PostMotionEventM+0x253) [0x80e0a93]
(EE) 3: /usr/lib/xorg/modules/input/evdev_drv.so (_init+0x31c7) [0xb70a5147]
(EE) 4: /usr/bin/X (DPMSSupported+0xc6) [0x80cff06]
(EE) 5: /usr/bin/X (xf86SerialModemClearBits+0x19b) [0x80fb54b]
(EE) 6: ? (?+0x19b) [0xb77bf59a]
(EE) 7: ? (?+0x19b) [0xb77bf5af]
(EE) 8: /lib/libc.so.6 (ioctl+0x19) [0xb7335989]
(EE) 9: /lib/libdrm.so.2 (drmIoctl+0x40) [0xb755dbf0]
(EE) 10: /lib/libdrm.so.2 (drmCommandWrite+0x3f) [0xb75604ff]
(EE) 11: /lib/libdrm_nouveau.so.2 (nouveau_bo_wait+0xa6) [0xb6d09146]
(EE) 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (_init+0x2019)
[0xb6d15cf9]
(EE) 13: /usr/lib/xorg/modules/libexa.so (exaMoveOutPixmap+0x6e2e) [0xb6cd48ae]
(EE) 14: /usr/bin/X (miFillUniqueSpanGroup+0x1adf) [0x81e65bf]
(EE) 15: /usr/bin/X (xf86I2CGetScreenBuses+0x1dfb) [0x81251ab]
(EE) 16: /usr/bin/X (dixDestroyPixmap+0x1ba9) [0x8078f79]
(EE) 17: /usr/bin/X (SendErrorToClient+0x3dd) [0x807aa5d]
(EE) 18: /usr/bin/X (_init+0x4665) [0x806c8c5]
(EE) 19: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7261963]
(EE) 20: /usr/bin/X (_start+0x21) [0x8068a5a]
(EE) 
(EE) [mi] EQ overflow continuing.  200 events have been dropped.

and so on...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386192928.F7362bE0.18664--

--===============0167220885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0167220885==--
