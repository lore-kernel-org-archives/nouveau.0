From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Mon, 22 Jun 2015 12:24:02 +0000
Message-ID: <bug-90887-8800-Rm0x9YUYOr@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0988895172=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0988895172==
Content-Type: multipart/alternative; boundary="1434975842.cE8e1.8645"; charset="UTF-8"


--1434975842.cE8e1.8645
Date: Mon, 22 Jun 2015 12:24:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90887

--- Comment #13 from B=C3=A9la Gyebr=C3=B3szki <gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried the patch from comment #9 and it indeed fixed the rendering issues =
in
the games like Two Worlds 2, Trine: Enchanted Edition, Trine 2, XCOM:Enemy
Unknown, Stacking (running in Wine).
The patch greatly improves image quality but doesn't fix the rendering issu=
es
completely in Sonic Generations or in The Raven: Legacy of a Master Thief, =
see
the screenshot for comparison between unmodified and patched nouveau:
https://drive.google.com/open?id=3D0B-tTbLKBl-tOdldDb1pRNENnYUk

VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
Mesa 3D 10.6-branchpoint-541-g104bff0

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434975842.cE8e1.8645
Date: Mon, 22 Jun 2015 12:24:02 +0000
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
   title=3D"NEW - PhiMovesPass in register allocator broken"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PhiMovesPass in register allocator broken"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90887">bug 90887<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gyebro69&#64;gmail.com" title=3D"B=C3=A9la Gyebr=C3=B3szki &lt;gyebro69&#64=
;gmail.com&gt;"> <span class=3D"fn">B=C3=A9la Gyebr=C3=B3szki</span></a>
</span></b>
        <pre>I tried the patch from <a href=3D"show_bug.cgi?id=3D90887#c9">=
comment #9</a> and it indeed fixed the rendering issues in
the games like Two Worlds 2, Trine: Enchanted Edition, Trine 2, XCOM:Enemy
Unknown, Stacking (running in Wine).
The patch greatly improves image quality but doesn't fix the rendering issu=
es
completely in Sonic Generations or in The Raven: Legacy of a Master Thief, =
see
the screenshot for comparison between unmodified and patched nouveau:
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOdldDb1pRNENnYUk"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOdldDb1pRNENnYUk</a>

VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
Mesa 3D 10.6-branchpoint-541-g104bff0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434975842.cE8e1.8645--

--===============0988895172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0988895172==--
