From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111218] Segmentation fault in
 nv50_ir::NVC0LegalizeSSA::handleDIV when dividing result of textureSize
Date: Fri, 26 Jul 2019 12:43:12 +0000
Message-ID: <bug-111218-8800-qCrKvnaw2V@http.bugs.freedesktop.org/>
References: <bug-111218-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1018879951=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111218-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1018879951==
Content-Type: multipart/alternative; boundary="15641449911.b9E1C5CB5.7102"
Content-Transfer-Encoding: 7bit


--15641449911.b9E1C5CB5.7102
Date: Fri, 26 Jul 2019 12:43:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111218

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to mmgrqnv from comment #4)
> I'm trying to build from source, but I can't get meson to produce the
> nouveau_dri.so library. The documentation says:
>=20
>   If you built the DRI hardware drivers, you'll also see the DRI drivers:
>     -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i915_dri.so
>     -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i965_dri.so
>     -rwxr-xr-x   1 brian users 11849858 Jul 21 12:12 r200_dri.so
>     -rwxr-xr-x   1 brian users 11757388 Jul 21 12:12 radeon_dri.so
>=20
> ... but that is not what I am seeing, the only libraries I get are:
>=20
>   $ find . -iname "*dri*.so"=20
>   ./builddir/src/mesa/drivers/dri/libmesa_dri_drivers.so
>   ./builddir/src/gallium/targets/dri/libgallium_dri.so

This looks correct.

>=20
> I tried:
>=20
>   $ meson configure builddir/ -Ddri-drivers=3Dnouveau -Dgallium-drivers=
=3Dnouveau
>=20
> but that does not help.
> Could you please point me somewhere that explains how to get the
> nouveau_dri.so library?

I think you forgot to "install". I'd recommend putting it into some prefix,
e.g. ~/install (which you can tell meson to do with --prefix=3Dfoo), and th=
en you
can test with LD_LIBRARY_PATH=3D~/install ... (not 100% the '~' actually wo=
rks in
the LD_LIBRARY_PATH though)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15641449911.b9E1C5CB5.7102
Date: Fri, 26 Jul 2019 12:43:11 +0000
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
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segmentation fault in nv50_ir::NVC0LegalizeSSA::handleDIV=
 when dividing result of textureSize"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111218">bug 11121=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to mmgrqnv from <a href=3D"show_bug.cgi?id=3D111218#=
c4">comment #4</a>)
<span class=3D"quote">&gt; I'm trying to build from source, but I can't get=
 meson to produce the
&gt; nouveau_dri.so library. The documentation says:
&gt;=20
&gt;   If you built the DRI hardware drivers, you'll also see the DRI drive=
rs:
&gt;     -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i915_dri.so
&gt;     -rwxr-xr-x   1 brian users 16895413 Jul 21 12:11 i965_dri.so
&gt;     -rwxr-xr-x   1 brian users 11849858 Jul 21 12:12 r200_dri.so
&gt;     -rwxr-xr-x   1 brian users 11757388 Jul 21 12:12 radeon_dri.so
&gt;=20
&gt; ... but that is not what I am seeing, the only libraries I get are:
&gt;=20
&gt;   $ find . -iname &quot;*dri*.so&quot;=20
&gt;   ./builddir/src/mesa/drivers/dri/libmesa_dri_drivers.so
&gt;   ./builddir/src/gallium/targets/dri/libgallium_dri.so</span >

This looks correct.

<span class=3D"quote">&gt;=20
&gt; I tried:
&gt;=20
&gt;   $ meson configure builddir/ -Ddri-drivers=3Dnouveau -Dgallium-driver=
s=3Dnouveau
&gt;=20
&gt; but that does not help.
&gt; Could you please point me somewhere that explains how to get the
&gt; nouveau_dri.so library?</span >

I think you forgot to &quot;install&quot;. I'd recommend putting it into so=
me prefix,
e.g. ~/install (which you can tell meson to do with --prefix=3Dfoo), and th=
en you
can test with LD_LIBRARY_PATH=3D~/install ... (not 100% the '~' actually wo=
rks in
the LD_LIBRARY_PATH though)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15641449911.b9E1C5CB5.7102--

--===============1018879951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1018879951==--
