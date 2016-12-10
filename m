From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] KMail crash on starting (nouveau-related)
Date: Sat, 10 Dec 2016 15:46:51 +0000
Message-ID: <bug-98039-8800-GpEPRCIleT@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0141614480=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0141614480==
Content-Type: multipart/alternative; boundary="14813848103.eFbc4d.30861";
 charset="UTF-8"


--14813848103.eFbc4d.30861
Date: Sat, 10 Dec 2016 15:46:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

--- Comment #7 from Tomasz Pawe=C5=82 Gajc <tpgxyz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)
> Nope - none. Those patches are broken-by-design for the general case. Eit=
her
> don't use nouveau_dri.so or don't use [recent versions of] KDE.
>=20

You are saying, don't use anything that make use of multi-threaded OpenGL or
buy AMD/Intel gfx card :(

> I've heard some rumors that there's some sort of env var that'll disable =
GL
> use by KDE. Or maybe tell it not to run when it detects nouveau. I don't
> know the details.
>=20

QT_XCB_FORCE_SOFTWARE_OPENGL=3D1 which invokes LIBGL_ALWAYS_SOFTWARE

> I believe there's an effort underway to address this, but not from me.

Any hints who may be that special one ?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14813848103.eFbc4d.30861
Date: Sat, 10 Dec 2016 15:46:50 +0000
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
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tpgxyz&#64;gmail.com" title=3D"Tomasz Pawe=C5=82 Gajc &lt;tpgxyz&#64;gmail.=
com&gt;"> <span class=3D"fn">Tomasz Pawe=C5=82 Gajc</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D980=
39#c6">comment #6</a>)
<span class=3D"quote">&gt; Nope - none. Those patches are broken-by-design =
for the general case. Either
&gt; don't use nouveau_dri.so or don't use [recent versions of] KDE.
&gt; </span >

You are saying, don't use anything that make use of multi-threaded OpenGL or
buy AMD/Intel gfx card :(

<span class=3D"quote">&gt; I've heard some rumors that there's some sort of=
 env var that'll disable GL
&gt; use by KDE. Or maybe tell it not to run when it detects nouveau. I don=
't
&gt; know the details.
&gt; </span >

QT_XCB_FORCE_SOFTWARE_OPENGL=3D1 which invokes LIBGL_ALWAYS_SOFTWARE

<span class=3D"quote">&gt; I believe there's an effort underway to address =
this, but not from me.</span >

Any hints who may be that special one ?</pre>
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

--14813848103.eFbc4d.30861--

--===============0141614480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0141614480==--
