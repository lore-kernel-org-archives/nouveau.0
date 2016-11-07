From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98630] Bad color and glitches on PPC64
Date: Mon, 07 Nov 2016 20:35:56 +0000
Message-ID: <bug-98630-8800-IYxyo3PXZq@http.bugs.freedesktop.org/>
References: <bug-98630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0961165729=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0961165729==
Content-Type: multipart/alternative; boundary="14785509561.eaB13EE.14850";
 charset="UTF-8"


--14785509561.eaB13EE.14850
Date: Mon, 7 Nov 2016 20:35:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98630

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Mingcong Bai from comment #5)
> (In reply to Ilia Mirkin from comment #4)
> > Probably RGB vs BGR confusion. Can you create an apitrace of the proble=
m?
> > I'll need to give this a whirl on my G5 ...
>=20
> Is it an application related issue then?

Nope. Just the trickiness of dealing with a BE cpu and a
LE-but-kinda-BE-sometimes GPU. Unfortunately I don't have a clear model in =
my
head of precisely what all the "BE" flag flips on these GPUs, which makes
things much trickier.

> > ... (hm, if I can - I have a GeForce FX 5200 in mine). I should try to =
track
> > down a PCI nv4x that I can plug in.
>=20
> Is it a Quad? I believe they are pretty cheap these days...

It's a PowerMac7,2 IIRC. It has an AGP slot (with the FX 5200) and some num=
ber
of PCI slots. I glanced at nv4x boards, but they're above my tolerance of
things I buy for the purpose of developing free drivers in my own time.

(In reply to Mingcong Bai from comment #6)
> Indeed, after removing nouveau_dri.so, the Plasma Discover at least rende=
rs
> the full interface now.
>=20
> However, it still shows bad coloring.

Oh interesting. That means the confusion is in the DDX. (Or disagreement
between mesa and the DDX.) Please confirm that you're running a semi-recent
version of xf86-video-nouveau (e.g. 1.0.12), and actually verify that it sa=
ys
NOUVEAU(0) in your xorg log.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14785509561.eaB13EE.14850
Date: Mon, 7 Nov 2016 20:35:56 +0000
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
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Bad color and glitches on PPC64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98630">bug 98630<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Mingcong Bai from <a href=3D"show_bug.cgi?id=3D98=
630#c5">comment #5</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D98630#c4">comment #4</a>)
&gt; &gt; Probably RGB vs BGR confusion. Can you create an apitrace of the =
problem?
&gt; &gt; I'll need to give this a whirl on my G5 ...
&gt;=20
&gt; Is it an application related issue then?</span >

Nope. Just the trickiness of dealing with a BE cpu and a
LE-but-kinda-BE-sometimes GPU. Unfortunately I don't have a clear model in =
my
head of precisely what all the &quot;BE&quot; flag flips on these GPUs, whi=
ch makes
things much trickier.

<span class=3D"quote">&gt; &gt; ... (hm, if I can - I have a GeForce FX 520=
0 in mine). I should try to track
&gt; &gt; down a PCI nv4x that I can plug in.
&gt;=20
&gt; Is it a Quad? I believe they are pretty cheap these days...</span >

It's a PowerMac7,2 IIRC. It has an AGP slot (with the FX 5200) and some num=
ber
of PCI slots. I glanced at nv4x boards, but they're above my tolerance of
things I buy for the purpose of developing free drivers in my own time.

(In reply to Mingcong Bai from <a href=3D"show_bug.cgi?id=3D98630#c6">comme=
nt #6</a>)
<span class=3D"quote">&gt; Indeed, after removing nouveau_dri.so, the Plasm=
a Discover at least renders
&gt; the full interface now.
&gt;=20
&gt; However, it still shows bad coloring.</span >

Oh interesting. That means the confusion is in the DDX. (Or disagreement
between mesa and the DDX.) Please confirm that you're running a semi-recent
version of xf86-video-nouveau (e.g. 1.0.12), and actually verify that it sa=
ys
NOUVEAU(0) in your xorg log.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14785509561.eaB13EE.14850--

--===============0961165729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0961165729==--
