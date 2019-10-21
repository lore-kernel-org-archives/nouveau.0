From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
Date: Mon, 21 Oct 2019 18:46:30 +0000
Message-ID: <bug-112070-8800-5i0TDksS1x@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0927965007=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-112070-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0927965007==
Content-Type: multipart/alternative; boundary="15716835920.Acea7bc.14220"
Content-Transfer-Encoding: 7bit


--15716835920.Acea7bc.14220
Date: Mon, 21 Oct 2019 18:46:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #16 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Doobz from comment #15)
> Quick update:-
>=20
> glmark2 runs fine on geforce 8200 laptop

G80+ support for nouveau is markedly better than pre-G80 (aka GeForce 8000 =
is
the cutoff). The hardware changed substantially for DX10, and has little in
common with its DX9 predecessors.

>=20
> But on the geforce 7100 (NV63) desktop it produces segmentation fault at
> same point as on my 7600GO laptop.
>=20
> I can try to upgrade from mesa 18.3.6 to 19.2.1-1 if you think it's worth
> doing.

Depending on the issue, it may or may not be worth it. Is there a backtrace
from the crash?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15716835920.Acea7bc.14220
Date: Mon, 21 Oct 2019 18:46:32 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Doobz from <a href=3D"show_bug.cgi?id=3D112070#c1=
5">comment #15</a>)
<span class=3D"quote">&gt; Quick update:-
&gt;=20
&gt; glmark2 runs fine on geforce 8200 laptop</span >

G80+ support for nouveau is markedly better than pre-G80 (aka GeForce 8000 =
is
the cutoff). The hardware changed substantially for DX10, and has little in
common with its DX9 predecessors.

<span class=3D"quote">&gt;=20
&gt; But on the geforce 7100 (NV63) desktop it produces segmentation fault =
at
&gt; same point as on my 7600GO laptop.
&gt;=20
&gt; I can try to upgrade from mesa 18.3.6 to 19.2.1-1 if you think it's wo=
rth
&gt; doing.</span >

Depending on the issue, it may or may not be worth it. Is there a backtrace
from the crash?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15716835920.Acea7bc.14220--

--===============0927965007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0927965007==--
