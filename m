From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Fri, 30 Jun 2017 07:39:47 +0000
Message-ID: <bug-100567-8800-1ATBFrsw3s@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0675694044=="
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


--===============0675694044==
Content-Type: multipart/alternative; boundary="14988083861.aA0bCc9.9289";
 charset="UTF-8"


--14988083861.aA0bCc9.9289
Date: Fri, 30 Jun 2017 07:39:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #9 from rahulmehra-BHOPoEIaRVNhmhkoCovsdw@public.gmane.org ---
I think I am experiencing the same problem on 4.10.0-24-generic on Ubuntu 1=
7.04
with GNOME 3.24. I have 1 monitor running an Nvidia card.

The desktop freezes between 20 mins to 5 hours of the system running from b=
oot.

This is the system log when it crashes

Jun 30 16:49:47 r-ubuntu kernel: [ 2282.503403] nouveau 0000:01:00.0: gr: T=
RAP
ch 2 [003fa29000 Xorg[1154]]
Jun 30 16:49:47 r-ubuntu kernel: [ 2282.503411] nouveau 0000:01:00.0: gr:
GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_=
REG]


Let me know if I need to provide more info

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14988083861.aA0bCc9.9289
Date: Fri, 30 Jun 2017 07:39:46 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rahulmehra&#64;techgeek.co.in" title=3D"rahulmehra&#64;techgeek.co.in">rahu=
lmehra&#64;techgeek.co.in</a>
</span></b>
        <pre>I think I am experiencing the same problem on 4.10.0-24-generi=
c on Ubuntu 17.04
with GNOME 3.24. I have 1 monitor running an Nvidia card.

The desktop freezes between 20 mins to 5 hours of the system running from b=
oot.

This is the system log when it crashes

Jun 30 16:49:47 r-ubuntu kernel: [ 2282.503403] nouveau 0000:01:00.0: gr: T=
RAP
ch 2 [003fa29000 Xorg[1154]]
Jun 30 16:49:47 r-ubuntu kernel: [ 2282.503411] nouveau 0000:01:00.0: gr:
GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_=
REG]


Let me know if I need to provide more info</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14988083861.aA0bCc9.9289--

--===============0675694044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0675694044==--
