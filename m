From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90967] [NV92] System freeze using nouveau
Date: Sat, 13 Jun 2015 21:04:54 +0000
Message-ID: <bug-90967-8800-9CQtiVBHsd@http.bugs.freedesktop.org/>
References: <bug-90967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1452644355=="
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


--===============1452644355==
Content-Type: multipart/alternative; boundary="1434229494.f0b5242.30189"; charset="UTF-8"


--1434229494.f0b5242.30189
Date: Sat, 13 Jun 2015 21:04:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90967

--- Comment #11 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to homer242 from comment #9)
> I think I have the same issue with my debian sid.
>=20
> One week ago, I used nvidia driver and I haven't this kind of problem. Ma=
ybe
> it's a coincidence because I did some upgrade of my packages.
>=20
> Like J=C3=A9r=C3=B4me, the problem occurs when I use vlc with "automatic =
output
> selection" after a couple of minutes (i think it's random but it's about =
20
> minutes). When I use "X11 video output (XCB)", the problem don't show up.
> The other cases where the problem happens are when I played a youtube vid=
eo
> on iceweasel. Juste a second before my computer is freeze, there is a big
> slow-down like a fork-bomb :)
>=20
> ----
> libdrm-nouveau2:amd64                     2.4.60-3
> libdrm-nouveau2:i386                      2.4.60-3
> xserver-xorg-video-nouveau                1:1.0.11-1+b1
> ----
>=20
> The most relevant part I think is this log from Xorg.log:

snip

> ----
>=20
> I can give you more information if you want. I can easily reproduce the
> problem.

Try using libdrm !=3D 2.4.60, that version causes problems, if the problem
persists you can come back! :)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1434229494.f0b5242.30189
Date: Sat, 13 Jun 2015 21:04:54 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90967#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] System freeze using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90967">bug 90967<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tobias.klausmann&#64;mni.thm.de" title=3D"Tobias Klausmann &lt;tobias.klaus=
mann&#64;mni.thm.de&gt;"> <span class=3D"fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to homer242 from <a href=3D"show_bug.cgi?id=3D90967#=
c9">comment #9</a>)
<span class=3D"quote">&gt; I think I have the same issue with my debian sid.
&gt;=20
&gt; One week ago, I used nvidia driver and I haven't this kind of problem.=
 Maybe
&gt; it's a coincidence because I did some upgrade of my packages.
&gt;=20
&gt; Like J=C3=A9r=C3=B4me, the problem occurs when I use vlc with &quot;au=
tomatic output
&gt; selection&quot; after a couple of minutes (i think it's random but it'=
s about 20
&gt; minutes). When I use &quot;X11 video output (XCB)&quot;, the problem d=
on't show up.
&gt; The other cases where the problem happens are when I played a youtube =
video
&gt; on iceweasel. Juste a second before my computer is freeze, there is a =
big
&gt; slow-down like a fork-bomb :)
&gt;=20
&gt; ----
&gt; libdrm-nouveau2:amd64                     2.4.60-3
&gt; libdrm-nouveau2:i386                      2.4.60-3
&gt; xserver-xorg-video-nouveau                1:1.0.11-1+b1
&gt; ----
&gt;=20
&gt; The most relevant part I think is this log from Xorg.log:</span >

snip

<span class=3D"quote">&gt; ----
&gt;=20
&gt; I can give you more information if you want. I can easily reproduce the
&gt; problem.</span >

Try using libdrm !=3D 2.4.60, that version causes problems, if the problem
persists you can come back! :)</pre>
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

--1434229494.f0b5242.30189--

--===============1452644355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1452644355==--
