From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Mon, 19 Sep 2016 03:33:28 +0000
Message-ID: <bug-97620-8800-f7f8kTbrDK@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0219149719=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0219149719==
Content-Type: multipart/alternative; boundary="14742560082.d1b8.14498";
 charset="UTF-8"


--14742560082.d1b8.14498
Date: Mon, 19 Sep 2016 03:33:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Luke Tidd from comment #14)
> kernel 4.7.4-1-ARCH
> nomodeset single
>=20
> # nvapeek 2240c
> ...
>=20
>=20
> testing working kernel now.

Hm, that means that the bit we're checking is 0, which indicates that the V=
BIOS
hasn't run. This is, of course, patently false, since it seems like this is=
 the
only video card in the system, and it's working (right? you're at the conso=
le,
the screen is on, etc?)

And, I'm guessing, in the new kernel we're now running the vbios whereas we
previously didn't use to. And running it a second time destroys the universe
for some reason.

Separately, I just happened to notice that you have vesafb turned on. I won=
der
if this somehow upsets matters. Any chance you could flip that off?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742560082.d1b8.14498
Date: Mon, 19 Sep 2016 03:33:28 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Luke Tidd from <a href=3D"show_bug.cgi?id=3D97620=
#c14">comment #14</a>)
<span class=3D"quote">&gt; kernel 4.7.4-1-ARCH
&gt; nomodeset single
&gt;=20
&gt; # nvapeek 2240c
&gt; ...
&gt;=20
&gt;=20
&gt; testing working kernel now.</span >

Hm, that means that the bit we're checking is 0, which indicates that the V=
BIOS
hasn't run. This is, of course, patently false, since it seems like this is=
 the
only video card in the system, and it's working (right? you're at the conso=
le,
the screen is on, etc?)

And, I'm guessing, in the new kernel we're now running the vbios whereas we
previously didn't use to. And running it a second time destroys the universe
for some reason.

Separately, I just happened to notice that you have vesafb turned on. I won=
der
if this somehow upsets matters. Any chance you could flip that off?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742560082.d1b8.14498--

--===============0219149719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0219149719==--
