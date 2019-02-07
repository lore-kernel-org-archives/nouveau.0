From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Thu, 07 Feb 2019 00:09:26 +0000
Message-ID: <bug-100567-8800-c5JL0YPOwd@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052434449=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1052434449==
Content-Type: multipart/alternative; boundary="15494981666.1aa5e.6056"
Content-Transfer-Encoding: 7bit


--15494981666.1aa5e.6056
Date: Thu, 7 Feb 2019 00:09:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #25 from kenorb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Another one from today:

nouveau 0000:65:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: runlist 0:
scheduled for recovery
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: channel 4: ki=
lled
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: engine 0:
scheduled for recovery
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: kernel
rejected pushbuf: Device or resource busy
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:
krec 0 pushes 1 bufs 4 relocs 0
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000000 00000005 00000004 00000004 00000000
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000001 00000006 00000004 00000000 00000004
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000002 000000c6 00000002 00000000 00000002
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000003 000000ec 00000004 00000004 00000000
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 psh
00000000 000001736c 00000173fc

Full log: https://gist.github.com/kenorb/2e70f27aa25e9ba1d89f34fe186b3c53

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15494981666.1aa5e.6056
Date: Thu, 7 Feb 2019 00:09:26 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kenorb&#64;gmail.com" title=3D"kenorb&#64;gmail.com">kenorb&#64;gmail.com</=
a>
</span></b>
        <pre>Another one from today:

nouveau 0000:65:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: runlist 0:
scheduled for recovery
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: channel 4: ki=
lled
Feb 06 23:42:47 Ubuntu-PC kernel: nouveau 0000:65:00.0: fifo: engine 0:
scheduled for recovery
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: kernel
rejected pushbuf: Device or resource busy
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:
krec 0 pushes 1 bufs 4 relocs 0
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000000 00000005 00000004 00000004 00000000
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000001 00000006 00000004 00000000 00000004
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000002 000000c6 00000002 00000000 00000002
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 buf
00000003 000000ec 00000004 00000004 00000000
Feb 06 23:42:59 Ubuntu-PC /usr/lib/gdm3/gdm-x-session[6370]: nouveau: ch12:=
 psh
00000000 000001736c 00000173fc

Full log: <a href=3D"https://gist.github.com/kenorb/2e70f27aa25e9ba1d89f34f=
e186b3c53">https://gist.github.com/kenorb/2e70f27aa25e9ba1d89f34fe186b3c53<=
/a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15494981666.1aa5e.6056--

--===============1052434449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1052434449==--
