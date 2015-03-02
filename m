From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69349] Random image corruptions (in Debian Wheezy
 with Linux 3.2)
Date: Mon, 02 Mar 2015 07:47:43 +0000
Message-ID: <bug-69349-8800-2xjSrV4JH0@http.bugs.freedesktop.org/>
References: <bug-69349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1851328588=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1851328588==
Content-Type: multipart/alternative; boundary="1425282463.c3021c2.17109"; charset="UTF-8"


--1425282463.c3021c2.17109
Date: Mon, 2 Mar 2015 07:47:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69349

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Paul Menzel from comment #5)
> (In reply to Tobias Klausmann from comment #4)
> > Is this still a problem with newer software (kernel/xf86-video-nouveau)?
>=20
> Yes, I am still able to reproduce this with Debian Jessie/testing, which
> currently has Linux kernel 3.19.x and `xserver-xorg-video-nouveau`
> 1:1.0.11-1.
>=20
> Suddenly the corruptions start on the left side of the monitor and then I
> can see how slow the window of uxterm is rendered line by line (takes may=
be
> two seconds). If I do not shut the system down, it=E2=80=99ll eventually =
freeze.

Are there any messages in dmesg when this happens? I assume this is still w=
ith
the G98?

What environment do you use? Gnome? KDE? Redirecting compositor which uses =
GL?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1425282463.c3021c2.17109
Date: Mon, 2 Mar 2015 07:47:43 +0000
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
   title=3D"NEW - Random image corruptions (in Debian Wheezy with Linux 3.2=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random image corruptions (in Debian Wheezy with Linux 3.2=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349">bug 69349<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Paul Menzel from <a href=3D"show_bug.cgi?id=3D693=
49#c5">comment #5</a>)
<span class=3D"quote">&gt; (In reply to Tobias Klausmann from <a href=3D"sh=
ow_bug.cgi?id=3D69349#c4">comment #4</a>)
&gt; &gt; Is this still a problem with newer software (kernel/xf86-video-no=
uveau)?
&gt;=20
&gt; Yes, I am still able to reproduce this with Debian Jessie/testing, whi=
ch
&gt; currently has Linux kernel 3.19.x and `xserver-xorg-video-nouveau`
&gt; 1:1.0.11-1.
&gt;=20
&gt; Suddenly the corruptions start on the left side of the monitor and the=
n I
&gt; can see how slow the window of uxterm is rendered line by line (takes =
maybe
&gt; two seconds). If I do not shut the system down, it=E2=80=99ll eventual=
ly freeze.</span >

Are there any messages in dmesg when this happens? I assume this is still w=
ith
the G98?

What environment do you use? Gnome? KDE? Redirecting compositor which uses =
GL?</pre>
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

--1425282463.c3021c2.17109--

--===============1851328588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1851328588==--
