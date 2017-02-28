From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99995] Dirt showdown very low fps (~3fps) after
	update mesa
Date: Tue, 28 Feb 2017 11:17:52 +0000
Message-ID: <bug-99995-8800-dWJnGi0xnO@http.bugs.freedesktop.org/>
References: <bug-99995-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1198854223=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99995-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1198854223==
Content-Type: multipart/alternative; boundary="14882806720.e2Ab.4860";
 charset="UTF-8"


--14882806720.e2Ab.4860
Date: Tue, 28 Feb 2017 11:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99995

--- Comment #3 from Kevin Puertas <kevin01010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)

> One difference is that 17.0 has GL 4.3 enabled for Maxwell (e.g. GTX 750),
> which perhaps causes the game to choose a different path, thus not really=
 be
> directly comparable. Try it with
>=20
> MESA_GL_VERSION_OVERRIDE=3D4.1

If I export this before opening steam, steam causes a segfault


> Or try it with
>=20
> MESA_EXTENSION_OVERRIDE=3D'-GL_ARB_shader_image_load_store
> -GL_ARB_compute_shader'

If I try this, game loads smooth and works about 45fps, better than with me=
sa
13



(In reply to Gregor M=C3=BCnch from comment #2)
>With higher GL versions, Dirt enables "advanced lighting" options in the g=
raphics menu.
At least for me, it is there, but Off in all the tests

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14882806720.e2Ab.4860
Date: Tue, 28 Feb 2017 11:17:52 +0000
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
   title=3D"NEW - Dirt showdown very low fps (~3fps) after update mesa"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99995#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dirt showdown very low fps (~3fps) after update mesa"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99995">bug 99995<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kevin01010&#64;gmail.com" title=3D"Kevin Puertas &lt;kevin01010&#64;gmail.c=
om&gt;"> <span class=3D"fn">Kevin Puertas</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D999=
95#c1">comment #1</a>)

<span class=3D"quote">&gt; One difference is that 17.0 has GL 4.3 enabled f=
or Maxwell (e.g. GTX 750),
&gt; which perhaps causes the game to choose a different path, thus not rea=
lly be
&gt; directly comparable. Try it with
&gt;=20
&gt; MESA_GL_VERSION_OVERRIDE=3D4.1</span >

If I export this before opening steam, steam causes a segfault


<span class=3D"quote">&gt; Or try it with
&gt;=20
&gt; MESA_EXTENSION_OVERRIDE=3D'-GL_ARB_shader_image_load_store
&gt; -GL_ARB_compute_shader'</span >

If I try this, game loads smooth and works about 45fps, better than with me=
sa
13



(In reply to Gregor M=C3=BCnch from <a href=3D"show_bug.cgi?id=3D99995#c2">=
comment #2</a>)
<span class=3D"quote">&gt;With higher GL versions, Dirt enables &quot;advan=
ced lighting&quot; options in the graphics menu.</span >
At least for me, it is there, but Off in all the tests</pre>
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

--14882806720.e2Ab.4860--

--===============1198854223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1198854223==--
