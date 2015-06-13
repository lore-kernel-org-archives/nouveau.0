From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90967] [NV92] System freeze using nouveau
Date: Sat, 13 Jun 2015 16:01:57 +0000
Message-ID: <bug-90967-8800-FSCrSdnwpa@http.bugs.freedesktop.org/>
References: <bug-90967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1028512720=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90967-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1028512720==
Content-Type: multipart/alternative; boundary="1434211316.4d4dBe6A2.5958"; charset="UTF-8"


--1434211316.4d4dBe6A2.5958
Date: Sat, 13 Jun 2015 16:01:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90967

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to J=C3=A9r=C3=B4me from comment #5)
> I don't have it.
>=20
> ls: cannot access /lib/firmware/nouveau: No such file or directory
>=20
> I blurrily remember trying to install it once to see if it would solve th=
ose
> tearing issues I sometimes get, but I didn't succeed so I removed
> everything. I can't remember exactly what the problem was.

OK, that also makes sense... the symptom there was an insta-hang on vdpau
usage.

Do you perchance have libdrm 2.4.60? If so, switch to a different version
(either .59 or .61).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1434211316.4d4dBe6A2.5958
Date: Sat, 13 Jun 2015 16:01:56 +0000
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
   title=3D"NEW - [NV92] System freeze using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90967#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] System freeze using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90967">bug 90967<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to J=C3=A9r=C3=B4me from <a href=3D"show_bug.cgi?id=
=3D90967#c5">comment #5</a>)
<span class=3D"quote">&gt; I don't have it.
&gt;=20
&gt; ls: cannot access /lib/firmware/nouveau: No such file or directory
&gt;=20
&gt; I blurrily remember trying to install it once to see if it would solve=
 those
&gt; tearing issues I sometimes get, but I didn't succeed so I removed
&gt; everything. I can't remember exactly what the problem was.</span >

OK, that also makes sense... the symptom there was an insta-hang on vdpau
usage.

Do you perchance have libdrm 2.4.60? If so, switch to a different version
(either .59 or .61).</pre>
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

--1434211316.4d4dBe6A2.5958--

--===============1028512720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1028512720==--
