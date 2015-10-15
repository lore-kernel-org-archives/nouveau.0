From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92438] Segfault in pushbuf_kref when running the
 android emulator (qemu) on nv50
Date: Thu, 15 Oct 2015 19:32:33 +0000
Message-ID: <bug-92438-8800-GQ9RQEIbCc@http.bugs.freedesktop.org/>
References: <bug-92438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945640308=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0945640308==
Content-Type: multipart/alternative; boundary="1444937552.5de2dC61.25830"; charset="UTF-8"


--1444937552.5de2dC61.25830
Date: Thu, 15 Oct 2015 19:32:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92438

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[35345.800105] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 6
[emulator-x86[1371]] get 0x00200f9878 put 0x00200f98d0 ib_get 0x000000ed ib_put
0x000000f6 state 0x80000000 (err: INVALID_CMD) push 0x00406040

This is a long-standing and utterly undiagnosed issue. Somehow an invalid
command manages to make it onto the pushbuf. [A command as in a FIFO command,
like "BEGIN_NV04" style, not like the actual data being fed to the engine.]

There has never been a reproducible way of triggering it. Only seems to happen
on tesla GPUs. Either something *very* subtle is going on in mesa, or we're
driving the hardware wrong, or... who knows.

Search around for 406040 -- tons of bugs open about this.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444937552.5de2dC61.25830
Date: Thu, 15 Oct 2015 19:32:32 +0000
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
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Segfault in pushbuf_kref when running the android emulator (qemu) on nv50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92438">bug 92438</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[35345.800105] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 6
[emulator-x86[1371]] get 0x00200f9878 put 0x00200f98d0 ib_get 0x000000ed ib_put
0x000000f6 state 0x80000000 (err: INVALID_CMD) push 0x00406040

This is a long-standing and utterly undiagnosed issue. Somehow an invalid
command manages to make it onto the pushbuf. [A command as in a FIFO command,
like &quot;BEGIN_NV04&quot; style, not like the actual data being fed to the engine.]

There has never been a reproducible way of triggering it. Only seems to happen
on tesla GPUs. Either something *very* subtle is going on in mesa, or we're
driving the hardware wrong, or... who knows.

Search around for 406040 -- tons of bugs open about this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444937552.5de2dC61.25830--

--===============0945640308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0945640308==--
