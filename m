From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106994] [PATCH] Fix null pointer dereference in
 drmmode_output_dpms
Date: Thu, 21 Jun 2018 15:45:45 +0000
Message-ID: <bug-106994-8800-y1RcJM5qSw@http.bugs.freedesktop.org/>
References: <bug-106994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0356291659=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106994-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0356291659==
Content-Type: multipart/alternative; boundary="15295959451.DcEbB8c0e.19420"
Content-Transfer-Encoding: 7bit


--15295959451.DcEbB8c0e.19420
Date: Thu, 21 Jun 2018 15:45:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106994

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to John Lindgren from comment #3)
> Ilia, I tested your tree and it behaves as you expected -- it fixes the
> crash on undocking (I see that it adds the same koutput =3D=3D NULL check=
) but
> doesn't find the external displays on docking again.  I'm not sure what
> further information you want me to provide.

The xorg log with my various additional prints + the output of "xrandr" aft=
er
you reconnect the external displays would be a good start.

>=20
> I understand that you would like to finish the larger project and get
> external DP displays working 100%, but is there any reason why we couldn't
> start by committing the koutput =3D=3D NULL check to fix the crash?

Absolutely, I think that's a good idea. [I can't do it this second, but will
try to get to it soon.]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15295959451.DcEbB8c0e.19420
Date: Thu, 21 Jun 2018 15:45:45 +0000
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
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [PATCH] Fix null pointer dereference in drmmode_output_dp=
ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106994">bug 10699=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to John Lindgren from <a href=3D"show_bug.cgi?id=3D1=
06994#c3">comment #3</a>)
<span class=3D"quote">&gt; Ilia, I tested your tree and it behaves as you e=
xpected -- it fixes the
&gt; crash on undocking (I see that it adds the same koutput =3D=3D NULL ch=
eck) but
&gt; doesn't find the external displays on docking again.  I'm not sure what
&gt; further information you want me to provide.</span >

The xorg log with my various additional prints + the output of &quot;xrandr=
&quot; after
you reconnect the external displays would be a good start.

<span class=3D"quote">&gt;=20
&gt; I understand that you would like to finish the larger project and get
&gt; external DP displays working 100%, but is there any reason why we coul=
dn't
&gt; start by committing the koutput =3D=3D NULL check to fix the crash?</s=
pan >

Absolutely, I think that's a good idea. [I can't do it this second, but will
try to get to it soon.]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15295959451.DcEbB8c0e.19420--

--===============0356291659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0356291659==--
