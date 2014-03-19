From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76319] [NVE6] MMIO FAULT, black screen on QHD+ K2100M
Date: Wed, 19 Mar 2014 13:16:20 +0000
Message-ID: <bug-76319-8800-Qnsm4DFwMR@http.bugs.freedesktop.org/>
References: <bug-76319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1111763740=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1111763740==
Content-Type: multipart/alternative; boundary="1395234980.aed3ffc2.14369"; charset="us-ascii"


--1395234980.aed3ffc2.14369
Date: Wed, 19 Mar 2014 13:16:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D76319

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> Patched :
>=20
> $ diff nouveau/nvkm/engine/disp/dport.c.orig nouveau/nvkm/engine/disp/dpo=
rt.c
> 276c276
> < 	const u32 bw_list[] =3D { 270000, 162000, 0 };
> ---
> > 	const u32 bw_list[] =3D { 540000, 270000, 162000, 0 };
>=20
>=20
> Oh joy, I now do get a graphical screen (and high-res VT).

Great, so the display part of it is working? Image/resolution is all fine?
Could you also check with your external monitor? No one involved with nouve=
au
had such a screen, so we weren't sure it would work. I guess we can start
throwing that in when the HW supports it (hmmm... would have to figure out
which HW supports it...)

>=20
> Appearantly, I am also bitten by bug #70354 (witness errors.out) ?

Hmmm, looks like it -- but if you're running darktama's latest repo, it sho=
uld
have a fix for that
(http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=3D39b5507a36f01dc=
920fd9d21a70aed62fe4c0fdf)

You could also try using blob pgraph fw, although that is not known to help
that issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1395234980.aed3ffc2.14369
Date: Wed, 19 Mar 2014 13:16:20 +0000
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
   title=3D"NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76319#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76319">bug 76319<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D76319#c2">comment #2=
</a>)
<span class=3D"quote">&gt; Patched :
&gt;=20
&gt; $ diff nouveau/nvkm/engine/disp/dport.c.orig nouveau/nvkm/engine/disp/=
dport.c
&gt; 276c276
&gt; &lt; 	const u32 bw_list[] =3D { 270000, 162000, 0 };
&gt; ---
&gt; &gt; 	const u32 bw_list[] =3D { 540000, 270000, 162000, 0 };
&gt;=20
&gt;=20
&gt; Oh joy, I now do get a graphical screen (and high-res VT).</span >

Great, so the display part of it is working? Image/resolution is all fine?
Could you also check with your external monitor? No one involved with nouve=
au
had such a screen, so we weren't sure it would work. I guess we can start
throwing that in when the HW supports it (hmmm... would have to figure out
which HW supports it...)

<span class=3D"quote">&gt;=20
&gt; Appearantly, I am also bitten by <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw d=
oesn't help"
   href=3D"show_bug.cgi?id=3D70354">bug #70354</a> (witness errors.out) ?</=
span >

Hmmm, looks like it -- but if you're running darktama's latest repo, it sho=
uld
have a fix for that
(<a href=3D"http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=3D39b5=
507a36f01dc920fd9d21a70aed62fe4c0fdf">http://cgit.freedesktop.org/~darktama=
/nouveau/commit/?id=3D39b5507a36f01dc920fd9d21a70aed62fe4c0fdf</a>)

You could also try using blob pgraph fw, although that is not known to help
that issue.</pre>
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

--1395234980.aed3ffc2.14369--

--===============1111763740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1111763740==--
