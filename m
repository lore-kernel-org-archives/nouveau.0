From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93454] Can't build with LLVM/clang 3.7.0 - SSSE3
 instruction set not enabled
Date: Sun, 20 Dec 2015 03:06:28 +0000
Message-ID: <bug-93454-8800-7n0J4ZCkhf@http.bugs.freedesktop.org/>
References: <bug-93454-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2142536585=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93454-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2142536585==
Content-Type: multipart/alternative; boundary="1450580787.a2D5E0C50.31235"; charset="UTF-8"


--1450580787.a2D5E0C50.31235
Date: Sun, 20 Dec 2015 03:06:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D93454

--- Comment #5 from Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)

> clang -E -dM - < /dev/null | grep GNUC

#define __GNUC_MINOR__ 9
#define __GNUC_PATCHLEVEL__ 1
#define __GNUC_STDC_INLINE__ 1
#define __GNUC__4

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1450580787.a2D5E0C50.31235
Date: Sun, 20 Dec 2015 03:06:27 +0000
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
   title=3D"NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set=
 not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93454#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Can't build with LLVM/clang 3.7.0 - SSSE3 instruction set=
 not enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93454">bug 93454<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tpgxyz&#64;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.=
com&gt;"> <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D934=
54#c4">comment #4</a>)

<span class=3D"quote">&gt; clang -E -dM - &lt; /dev/null | grep GNUC</span >

#define __GNUC_MINOR__ 9
#define __GNUC_PATCHLEVEL__ 1
#define __GNUC_STDC_INLINE__ 1
#define __GNUC__4</pre>
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

--1450580787.a2D5E0C50.31235--

--===============2142536585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2142536585==--
