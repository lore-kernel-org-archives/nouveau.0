From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99335] nouveau graphics often freezes when using KDE
	Plasma 5
Date: Wed, 11 Jan 2017 16:40:36 +0000
Message-ID: <bug-99335-8800-SWoD0hxVtq@http.bugs.freedesktop.org/>
References: <bug-99335-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1472386048=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99335-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1472386048==
Content-Type: multipart/alternative; boundary="14841528360.f84daeD.5269";
 charset="UTF-8"


--14841528360.f84daeD.5269
Date: Wed, 11 Jan 2017 16:40:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99335

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Alexander from comment #7)
> # glxinfo | grep -E "nouveau | llvmpipe"
>     Device: llvmpipe (LLVM 3.7, 128 bits) (0xffffffff)
> OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.7, 128 bits)

OK, so you're still using llvmpipe. You must have a LIBGL_ALWAYS_SOFTWARE=
=3D1
left somewhere. (check "env" to see whether that's the case.)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14841528360.f84daeD.5269
Date: Wed, 11 Jan 2017 16:40:36 +0000
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
   title=3D"NEW - nouveau graphics often freezes when using KDE Plasma 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99335#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics often freezes when using KDE Plasma 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99335">bug 99335<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Alexander from <a href=3D"show_bug.cgi?id=3D99335=
#c7">comment #7</a>)
<span class=3D"quote">&gt; # glxinfo | grep -E &quot;nouveau | llvmpipe&quo=
t;
&gt;     Device: llvmpipe (LLVM 3.7, 128 bits) (0xffffffff)
&gt; OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.7, 128 bits)</=
span >

OK, so you're still using llvmpipe. You must have a LIBGL_ALWAYS_SOFTWARE=
=3D1
left somewhere. (check &quot;env&quot; to see whether that's the case.)</pr=
e>
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

--14841528360.f84daeD.5269--

--===============1472386048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1472386048==--
