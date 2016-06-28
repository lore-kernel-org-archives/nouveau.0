From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96553] Xorg freezes
Date: Tue, 28 Jun 2016 12:27:49 +0000
Message-ID: <bug-96553-8800-bEtrmbFGr3@http.bugs.freedesktop.org/>
References: <bug-96553-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1138997480=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96553-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1138997480==
Content-Type: multipart/alternative; boundary="14671168691.A2D138.1723";
 charset="UTF-8"


--14671168691.A2D138.1723
Date: Tue, 28 Jun 2016 12:27:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96553

--- Comment #1 from Agostino Sarubbo <ago-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> ---
When the problem happens, In dmesg there is the following messages:

[11449.585126] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[11449.585132] nouveau 0000:01:00.0: fifo: sw engine fault on channel 2,
recovering...
[11451.584882] nouveau 0000:01:00.0: fifo: runlist 0 update timeout
[11453.880225] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]

bug 72180 seems to mention the same message error, but that bug was resolve=
d as
INVALID
I didn't read all comments, but the last comment seems to indicate that the
problem is fixed in 4.1.
I'm using 4.4 and it is not fixed here.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14671168691.A2D138.1723
Date: Tue, 28 Jun 2016 12:27:49 +0000
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
   title=3D"NEW - Xorg freezes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96553#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96553">bug 96553<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ago&#64;gentoo.org" title=3D"Agostino Sarubbo &lt;ago&#64;gentoo.org&gt;"> =
<span class=3D"fn">Agostino Sarubbo</span></a>
</span></b>
        <pre>When the problem happens, In dmesg there is the following mess=
ages:

[11449.585126] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[11449.585132] nouveau 0000:01:00.0: fifo: sw engine fault on channel 2,
recovering...
[11451.584882] nouveau 0000:01:00.0: fifo: runlist 0 update timeout
[11453.880225] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]

<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [NVE6] Random GPU Lockups, works with blob P=
GRAPH fw"
   href=3D"show_bug.cgi?id=3D72180">bug 72180</a> seems to mention the same=
 message error, but that bug was resolved as
INVALID
I didn't read all comments, but the last comment seems to indicate that the
problem is fixed in 4.1.
I'm using 4.4 and it is not fixed here.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14671168691.A2D138.1723--

--===============1138997480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1138997480==--
