From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Sun, 06 Nov 2016 22:31:56 +0000
Message-ID: <bug-93828-8800-3s1z0qRnf1@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0816803922=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0816803922==
Content-Type: multipart/alternative; boundary="14784715162.210a2d.32636";
 charset="UTF-8"


--14784715162.210a2d.32636
Date: Sun, 6 Nov 2016 22:31:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #11 from derrierdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
With newer kernel I've got new messages... If it can help.

ov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 13
[flux[28527]] get 0000000000 put 0000000000 ib_get 00000000 ib_put 00000002
state c0000000 (err: MEM_FAULT) push 00400040
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fb: trapped read at
0020010000 on channel 13 [3eebf000 flux[28527]] engine 05 [PFIFO] client 08
[PFIFO_READ] subclient 00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 13
[flux[28527]] get 0000000000 put 0000000000 ib_get 00000002 ib_put 00000004
state c0000000 (err: MEM_FAULT) push 00400040
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fb: trapped read at
0020010010 on channel 13 [3eebf000 flux[28527]] engine 05 [PFIFO] client 08
[PFIFO_READ] subclient 00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 13
[flux[28527]] get 0000000000 put 0000000000 ib_get 00000004 ib_put 00000007
state c0000000 (err: MEM_FAULT) push 00400040
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fb: trapped read at
0020010020 on channel 13 [3eebf000 flux[28527]] engine 05 [PFIFO] client 08
[PFIFO_READ] subclient 00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14784715162.210a2d.32636
Date: Sun, 6 Nov 2016 22:31:56 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
derrierdo&#64;gmail.com" title=3D"derrierdo&#64;gmail.com">derrierdo&#64;gm=
ail.com</a>
</span></b>
        <pre>With newer kernel I've got new messages... If it can help.

ov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 13
[flux[28527]] get 0000000000 put 0000000000 ib_get 00000000 ib_put 00000002
state c0000000 (err: MEM_FAULT) push 00400040
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fb: trapped read at
0020010000 on channel 13 [3eebf000 flux[28527]] engine 05 [PFIFO] client 08
[PFIFO_READ] subclient 00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 13
[flux[28527]] get 0000000000 put 0000000000 ib_get 00000002 ib_put 00000004
state c0000000 (err: MEM_FAULT) push 00400040
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fb: trapped read at
0020010010 on channel 13 [3eebf000 flux[28527]] engine 05 [PFIFO] client 08
[PFIFO_READ] subclient 00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 13
[flux[28527]] get 0000000000 put 0000000000 ib_get 00000004 ib_put 00000007
state c0000000 (err: MEM_FAULT) push 00400040
Nov  6 16:26:49 wizz kernel: nouveau 0000:01:00.0: fb: trapped read at
0020010020 on channel 13 [3eebf000 flux[28527]] engine 05 [PFIFO] client 08
[PFIFO_READ] subclient 00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14784715162.210a2d.32636--

--===============0816803922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0816803922==--
