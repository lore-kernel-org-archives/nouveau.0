From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Sat, 14 Feb 2015 10:47:16 +0000
Message-ID: <bug-87819-8800-LrIIwwMqHr@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1297573486=="
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


--===============1297573486==
Content-Type: multipart/alternative; boundary="1423910836.D244f1.31995"; charset="UTF-8"


--1423910836.D244f1.31995
Date: Sat, 14 Feb 2015 10:47:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87819

--- Comment #13 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
(In reply to Pierre Moreau from comment #12)
> Is it still an issue with 3.19? I tried Xonotic and video streaming with
> Firefox but was unable to trigger those isses using Nouveau's HEAD
> (currently at
> http://cgit.freedesktop.org/~darktama/nouveau/commit/
> ?id=3De616d549c78c27b6b4d4da25a2369b32bb2a99db).

I'll run it up the flagpole and see who salutes=E2=80=A6 Out of interest ho=
w much of
current 'nouveau' HEAD is in the mainline kernel at present?

(I realise I meant to try a git bisect to possibly locate the needed patche=
s, I
apologise for not getting to that.)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1423910836.D244f1.31995
Date: Sat, 14 Feb 2015 10:47:16 +0000
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
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819">bug 87819<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stuartl&#64;longlandclan.yi.org" title=3D"Stuart Longland &lt;stuartl&#64;l=
onglandclan.yi.org&gt;"> <span class=3D"fn">Stuart Longland</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href=3D"show_bug.cgi?id=3D8=
7819#c12">comment #12</a>)
<span class=3D"quote">&gt; Is it still an issue with 3.19? I tried Xonotic =
and video streaming with
&gt; Firefox but was unable to trigger those isses using Nouveau's HEAD
&gt; (currently at
&gt; <a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/">http=
://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; ?id=3De616d549c78c27b6b4d4da25a2369b32bb2a99db).</span >

I'll run it up the flagpole and see who salutes=E2=80=A6 Out of interest ho=
w much of
current 'nouveau' HEAD is in the mainline kernel at present?

(I realise I meant to try a git bisect to possibly locate the needed patche=
s, I
apologise for not getting to that.)</pre>
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

--1423910836.D244f1.31995--

--===============1297573486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1297573486==--
