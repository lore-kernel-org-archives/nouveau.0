From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Wed, 05 Apr 2017 16:18:18 +0000
Message-ID: <bug-100567-8800-smyRJGkd9B@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1503537812=="
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


--===============1503537812==
Content-Type: multipart/alternative; boundary="14914090980.3e77.14565";
 charset="UTF-8"


--14914090980.3e77.14565
Date: Wed, 5 Apr 2017 16:18:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #1 from Jeremy Booker <jeremy.booker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've tried downgrading to kernel 4.9.14, as the 4.10 series seems to have o=
ther
changes relating to video drives and nouveau (which are also causing crashe=
s).

I made it from ~8am to ~noon without a crash. Same basic log entries found =
in
journalctl output:


Apr 05 12:10:09 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Apr 05 12:10:09 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo: gr
engine fault on channel 10, recovering...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14914090980.3e77.14565
Date: Wed, 5 Apr 2017 16:18:18 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy.booker&#64;gmail.com" title=3D"Jeremy Booker &lt;jeremy.booker&#64;g=
mail.com&gt;"> <span class=3D"fn">Jeremy Booker</span></a>
</span></b>
        <pre>I've tried downgrading to kernel 4.9.14, as the 4.10 series se=
ems to have other
changes relating to video drives and nouveau (which are also causing crashe=
s).

I made it from ~8am to ~noon without a crash. Same basic log entries found =
in
journalctl output:


Apr 05 12:10:09 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Apr 05 12:10:09 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo: gr
engine fault on channel 10, recovering...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14914090980.3e77.14565--

--===============1503537812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1503537812==--
