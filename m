From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105884] [GP106] Firefox causes a crash / X lockup in
 the nouveau driver on GTX 1060
Date: Thu, 12 Apr 2018 14:54:31 +0000
Message-ID: <bug-105884-8800-xAZJUoPqFZ@http.bugs.freedesktop.org/>
References: <bug-105884-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0230704629=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105884-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0230704629==
Content-Type: multipart/alternative; boundary="15235448700.1dd52E.17892"
Content-Transfer-Encoding: 7bit


--15235448700.1dd52E.17892
Date: Thu, 12 Apr 2018 14:54:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105884

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Artem S. Tashkinov from comment #5)
> (In reply to Ilia Mirkin from comment #4)
> > 4.15 had a number of things added to it.
> >=20
> > One thing is using hugepages in ttm, which a lot of people have reported
> > issues with. Try disabling CONFIG_SWIOTLB (not really needed on modern =
hw,
> > afaik).
> >=20
> > Also nouveau's vm got a rewrite. Some fixes needed to be applied, I thi=
nk
> > they're all in 4.16, not as sure about 4.15.x.
> >=20
>=20
> I'd be glad to disable this option but I'm on Fedora 27 and I use the dis=
tro
> kernel, so I'm not sure how I can do that. Aren't you employed by
> RedHat/Fedora, Ilia? I guess it's in your power to raise this issue
> internally.

I don't think so. Perhaps you know something I don't?

Either way, this is the upstream bug system. If you have an issue with $dis=
tro,
bring up the problem with $distro.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15235448700.1dd52E.17892
Date: Thu, 12 Apr 2018 14:54:30 +0000
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
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP106] Firefox causes a crash / X lockup in the nouveau =
driver on GTX 1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105884">bug 10588=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Artem S. Tashkinov from <a href=3D"show_bug.cgi?i=
d=3D105884#c5">comment #5</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D105884#c4">comment #4</a>)
&gt; &gt; 4.15 had a number of things added to it.
&gt; &gt;=20
&gt; &gt; One thing is using hugepages in ttm, which a lot of people have r=
eported
&gt; &gt; issues with. Try disabling CONFIG_SWIOTLB (not really needed on m=
odern hw,
&gt; &gt; afaik).
&gt; &gt;=20
&gt; &gt; Also nouveau's vm got a rewrite. Some fixes needed to be applied,=
 I think
&gt; &gt; they're all in 4.16, not as sure about 4.15.x.
&gt; &gt;=20
&gt;=20
&gt; I'd be glad to disable this option but I'm on Fedora 27 and I use the =
distro
&gt; kernel, so I'm not sure how I can do that. Aren't you employed by
&gt; RedHat/Fedora, Ilia? I guess it's in your power to raise this issue
&gt; internally.</span >

I don't think so. Perhaps you know something I don't?

Either way, this is the upstream bug system. If you have an issue with $dis=
tro,
bring up the problem with $distro.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15235448700.1dd52E.17892--

--===============0230704629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0230704629==--
