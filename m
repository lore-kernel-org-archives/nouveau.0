From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91231] [NV92] Psychonauts (native) segfaults on
 start when DRI3 enabled
Date: Mon, 06 Jul 2015 07:09:52 +0000
Message-ID: <bug-91231-8800-ZzjguZ98Cz@http.bugs.freedesktop.org/>
References: <bug-91231-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1387054993=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91231-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1387054993==
Content-Type: multipart/alternative; boundary="1436166592.6dC786EC1.896"; charset="UTF-8"


--1436166592.6dC786EC1.896
Date: Mon, 6 Jul 2015 07:09:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D91231

--- Comment #4 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
If you have a Steam account and Steam for Linux installed you can reproduce=
 the
segfault with these native Linux demos on Steam:
- 'Running with Rifles' demo (note: I had to remove libstdc++.so.6 and
libxcb.so.1 from ./lib).
- Torchlight II demo (the game starts with default settings, you need to en=
able
anti-aliasing in-game option and restart the game to reproduce this bug).

All those games crash on start with
>nv50/nv50_miptree.c:132: nv50_mt_choose_storage_type: Assertion `ms =3D=3D=
 0' failed.
when DRI3 is enabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1436166592.6dC786EC1.896
Date: Mon, 6 Jul 2015 07:09:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] Psychonauts (native) segfaults on start when DRI3 =
enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91231#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] Psychonauts (native) segfaults on start when DRI3 =
enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91231">bug 91231<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>If you have a Steam account and Steam for Linux installed you =
can reproduce the
segfault with these native Linux demos on Steam:
- 'Running with Rifles' demo (note: I had to remove libstdc++.so.6 and
libxcb.so.1 from ./lib).
- Torchlight II demo (the game starts with default settings, you need to en=
able
anti-aliasing in-game option and restart the game to reproduce this bug).

All those games crash on start with
<span class=3D"quote">&gt;nv50/nv50_miptree.c:132: nv50_mt_choose_storage_t=
ype: Assertion `ms =3D=3D 0' failed.</span >
when DRI3 is enabled.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436166592.6dC786EC1.896--

--===============1387054993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1387054993==--
