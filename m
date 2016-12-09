From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99033] [NV67] Incomplete implementation of OpenGL 2.1
Date: Fri, 09 Dec 2016 13:42:36 +0000
Message-ID: <bug-99033-8800-DH00yp9rv7@http.bugs.freedesktop.org/>
References: <bug-99033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0250508847=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99033-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0250508847==
Content-Type: multipart/alternative; boundary="14812909560.BdcEBE4.30389";
 charset="UTF-8"


--14812909560.BdcEBE4.30389
Date: Fri, 9 Dec 2016 13:42:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99033

--- Comment #3 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Looking at the OpenGL 2.1 specification, I haven=E2=80=99t been able to fin=
d any
extension, that was promoted to a core feature in OpenGL <=3D 2.1, that is =
not
implemented by Nouveau.

Some of the extensions exposed by NVIDIA are clearly not part of the OpenGL=
 2.1
specification, such as GL_ARB_shading_language_420pack [0], which was appro=
ved
in 2011, whereas the OpenGL 2.1 specification is from Dec. 2006.
I had a quick look at about 10 extensions exposed by NVIDIA but not by Nouv=
eau,
and they were mostly approved >2008. One extension,
GL_EXT_framebuffer_multisample [1], was approved in 2005, but it became a c=
ore
feature only in OpenGL 3.0.

From what I understand (correct me if I am wrong), OpenGL extensions, as lo=
ng
as they haven=E2=80=99t been made into a core feature, are completely optio=
nal in order
to support a given OpenGL version.

[0]: https://www.opengl.org/registry/specs/ARB/shading_language_420pack.txt
[1]: https://www.opengl.org/registry/specs/EXT/framebuffer_multisample.txt

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14812909560.BdcEBE4.30389
Date: Fri, 9 Dec 2016 13:42:36 +0000
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
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033">bug 99033<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Looking at the OpenGL 2.1 specification, I haven=E2=80=99t bee=
n able to find any
extension, that was promoted to a core feature in OpenGL &lt;=3D 2.1, that =
is not
implemented by Nouveau.

Some of the extensions exposed by NVIDIA are clearly not part of the OpenGL=
 2.1
specification, such as GL_ARB_shading_language_420pack [0], which was appro=
ved
in 2011, whereas the OpenGL 2.1 specification is from Dec. 2006.
I had a quick look at about 10 extensions exposed by NVIDIA but not by Nouv=
eau,
and they were mostly approved &gt;2008. One extension,
GL_EXT_framebuffer_multisample [1], was approved in 2005, but it became a c=
ore
feature only in OpenGL 3.0.

From what I understand (correct me if I am wrong), OpenGL extensions, as lo=
ng
as they haven=E2=80=99t been made into a core feature, are completely optio=
nal in order
to support a given OpenGL version.

[0]: <a href=3D"https://www.opengl.org/registry/specs/ARB/shading_language_=
420pack.txt">https://www.opengl.org/registry/specs/ARB/shading_language_420=
pack.txt</a>
[1]: <a href=3D"https://www.opengl.org/registry/specs/EXT/framebuffer_multi=
sample.txt">https://www.opengl.org/registry/specs/EXT/framebuffer_multisamp=
le.txt</a></pre>
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

--14812909560.BdcEBE4.30389--

--===============0250508847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0250508847==--
