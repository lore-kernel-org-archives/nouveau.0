From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 19:43:22 +0000
Message-ID: <bug-87942-8800-HkVNco8wkh@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0271176750=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87942-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0271176750==
Content-Type: multipart/alternative; boundary="1420141402.f1dab2302.23084"; charset="UTF-8"


--1420141402.f1dab2302.23084
Date: Thu, 1 Jan 2015 19:43:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to bruno.pagani from comment #8)
> (In reply to Ilia Mirkin from comment #7)
> > This means you're not going to get acceleration no matter how hard you =
try
> > to change your config, I'm afraid. See bug 70354.
> >
>=20
> So in fact PRIME would not be working either?

The GPU's graph unit, responsible for all acceleration, is having trouble
initializing. You would still be able to use reverse-prime though, I think.
(i.e. use the intel gpu to render to screens attached to the nvidia gpu --
sometimes HDMI/etc are that way).

>=20=20
> > X has to start after nouveau loads, otherwise it doesn't know about the
> > nouveau adapter. (This may no longer be the case with DRI3-based offloa=
ding
> > actually...)
>=20
> Then, is there a way to force nouveau to load at boot, and else, is
> restarting X after loading nouveau supposed to work (for the record, tried
> that, and it doesn=E2=80=99t work either, but I=E2=80=99m not sure if it =
is supposed to work
> since it looks like I=E2=80=99m indeed affected by the issue you=E2=80=99=
ve linked).

Depends on the "it" that you're talking about. You should be seeing
NOUVEAU(GPU-0) messages in your xorg log if you start X after nouveau has
loaded. Do you not?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420141402.f1dab2302.23084
Date: Thu, 1 Jan 2015 19:43:22 +0000
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
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to bruno.pagani from <a href=3D"show_bug.cgi?id=3D87=
942#c8">comment #8</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D87942#c7">comment #7</a>)
&gt; &gt; This means you're not going to get acceleration no matter how har=
d you try
&gt; &gt; to change your config, I'm afraid. See <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"show_bug.cgi?id=3D70354">bug 70354</a>.
&gt; &gt;
&gt;=20
&gt; So in fact PRIME would not be working either?</span >

The GPU's graph unit, responsible for all acceleration, is having trouble
initializing. You would still be able to use reverse-prime though, I think.
(i.e. use the intel gpu to render to screens attached to the nvidia gpu --
sometimes HDMI/etc are that way).

<span class=3D"quote">&gt;=20=20
&gt; &gt; X has to start after nouveau loads, otherwise it doesn't know abo=
ut the
&gt; &gt; nouveau adapter. (This may no longer be the case with DRI3-based =
offloading
&gt; &gt; actually...)
&gt;=20
&gt; Then, is there a way to force nouveau to load at boot, and else, is
&gt; restarting X after loading nouveau supposed to work (for the record, t=
ried
&gt; that, and it doesn=E2=80=99t work either, but I=E2=80=99m not sure if =
it is supposed to work
&gt; since it looks like I=E2=80=99m indeed affected by the issue you=E2=80=
=99ve linked).</span >

Depends on the &quot;it&quot; that you're talking about. You should be seei=
ng
NOUVEAU(GPU-0) messages in your xorg log if you start X after nouveau has
loaded. Do you not?</pre>
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

--1420141402.f1dab2302.23084--

--===============0271176750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0271176750==--
