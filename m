From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99532] Compute shader doesn't give right result
 under some circumstances
Date: Mon, 13 Feb 2017 01:31:19 +0000
Message-ID: <bug-99532-8800-SegzuPUgj8@http.bugs.freedesktop.org/>
References: <bug-99532-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1113910872=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99532-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1113910872==
Content-Type: multipart/alternative; boundary="14869494790.83cb15948.26841";
 charset="UTF-8"


--14869494790.83cb15948.26841
Date: Mon, 13 Feb 2017 01:31:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99532

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Also likely relevant is the fact that all these fail, even on GM107. But the
ones for other shader stages do pass. We're clearly missing some setting of
some kind.

dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.sampler2darrayshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.isampler2d,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_expressio=
n.compute.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_expressio=
n.compute.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_expressio=
n.compute.sampler2darrayshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.uniform.compute=
.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.uniform.compute=
.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.uniform.compute=
.sampler2darrayshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dynamically_uni=
form.compute.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dynamically_uni=
form.compute.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dynamically_uni=
form.compute.sampler2darrayshadow,Fail

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14869494790.83cb15948.26841
Date: Mon, 13 Feb 2017 01:31:19 +0000
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
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532">bug 99532<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Also likely relevant is the fact that all these fail, even on =
GM107. But the
ones for other shader stages do pass. We're clearly missing some setting of
some kind.

dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.sampler2darrayshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_literal.c=
ompute.isampler2d,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_expressio=
n.compute.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_expressio=
n.compute.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.const_expressio=
n.compute.sampler2darrayshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.uniform.compute=
.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.uniform.compute=
.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.uniform.compute=
.sampler2darrayshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dynamically_uni=
form.compute.sampler2dshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dynamically_uni=
form.compute.samplercubeshadow,Fail
dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dynamically_uni=
form.compute.sampler2darrayshadow,Fail</pre>
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

--14869494790.83cb15948.26841--

--===============1113910872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1113910872==--
