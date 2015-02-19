From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Thu, 19 Feb 2015 06:39:27 +0000
Message-ID: <bug-87819-8800-PgFGjnI4si@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0239476793=="
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


--===============0239476793==
Content-Type: multipart/alternative; boundary="1424327967.6BcB2.23855"; charset="UTF-8"


--1424327967.6BcB2.23855
Date: Thu, 19 Feb 2015 06:39:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #18 from Oleg Kravchenko <oleg-CGGh1czddphUq1AO9QMCaQ@public.gmane.org> ---
Hello! I have the same issue, after restoring from memory suspend ("echo mem >
/sys/power/state")

(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x42) [0x57bfe2]
(EE) 1: /usr/bin/X (mieqEnqueue+0x213) [0x55e83b]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x5a) [0x44bf4a]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f227fb18000+0x5704)
[0x7f227fb1d704]
(EE) 4: /usr/bin/X (0x400000+0x71558) [0x471558]
(EE) 5: /usr/bin/X (0x400000+0x98bd6) [0x498bd6]
(EE) 6: /lib64/libpthread.so.0 (0x7f2286ee8000+0x116b0) [0x7f2286ef96b0]
(EE) 7: /lib64/libc.so.6 (ioctl+0x7) [0x7f2285c15907]
(EE) 8: /usr/lib64/libdrm.so.2 (drmIoctl+0x34) [0x7f2286cdb984]
(EE) 9: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x7f2286cddb36]
(EE) 10: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89) [0x7f22827025c9]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f2282908000+0x6a93)
[0x7f228290ea93]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (0x7f2281a78000+0xac47)
[0x7f2281a82c47]
(EE) 13: /usr/bin/X (0x400000+0x16d363) [0x56d363]
(EE) 14: /usr/bin/X (0x400000+0xbcce5) [0x4bcce5]
(EE) 15: /usr/bin/X (0x400000+0x32bae) [0x432bae]
(EE) 16: /usr/bin/X (0x400000+0x3561e) [0x43561e]
(EE) 17: /usr/bin/X (0x400000+0x3937a) [0x43937a]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7f2285b54df5]
(EE) 19: /usr/bin/X (0x400000+0x24de1) [0x424de1]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424327967.6BcB2.23855
Date: Thu, 19 Feb 2015 06:39:27 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:oleg&#64;kaa.org.ua" title="Oleg Kravchenko &lt;oleg&#64;kaa.org.ua&gt;"> <span class="fn">Oleg Kravchenko</span></a>
</span></b>
        <pre>Hello! I have the same issue, after restoring from memory suspend (&quot;echo mem &gt;
/sys/power/state&quot;)

(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x42) [0x57bfe2]
(EE) 1: /usr/bin/X (mieqEnqueue+0x213) [0x55e83b]
(EE) 2: /usr/bin/X (QueuePointerEvents+0x5a) [0x44bf4a]
(EE) 3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f227fb18000+0x5704)
[0x7f227fb1d704]
(EE) 4: /usr/bin/X (0x400000+0x71558) [0x471558]
(EE) 5: /usr/bin/X (0x400000+0x98bd6) [0x498bd6]
(EE) 6: /lib64/libpthread.so.0 (0x7f2286ee8000+0x116b0) [0x7f2286ef96b0]
(EE) 7: /lib64/libc.so.6 (ioctl+0x7) [0x7f2285c15907]
(EE) 8: /usr/lib64/libdrm.so.2 (drmIoctl+0x34) [0x7f2286cdb984]
(EE) 9: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1e) [0x7f2286cddb36]
(EE) 10: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89) [0x7f22827025c9]
(EE) 11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f2282908000+0x6a93)
[0x7f228290ea93]
(EE) 12: /usr/lib64/xorg/modules/libexa.so (0x7f2281a78000+0xac47)
[0x7f2281a82c47]
(EE) 13: /usr/bin/X (0x400000+0x16d363) [0x56d363]
(EE) 14: /usr/bin/X (0x400000+0xbcce5) [0x4bcce5]
(EE) 15: /usr/bin/X (0x400000+0x32bae) [0x432bae]
(EE) 16: /usr/bin/X (0x400000+0x3561e) [0x43561e]
(EE) 17: /usr/bin/X (0x400000+0x3937a) [0x43937a]
(EE) 18: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7f2285b54df5]
(EE) 19: /usr/bin/X (0x400000+0x24de1) [0x424de1]
(EE) 
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424327967.6BcB2.23855--

--===============0239476793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0239476793==--
