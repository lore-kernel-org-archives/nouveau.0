From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61854] [nv50]glClipPlane not clipping correctly for
	glsl
Date: Thu, 07 Mar 2013 19:43:17 +0000
Message-ID: <bug-61854-8800-0dJCQthCOJ@http.bugs.freedesktop.org/>
References: <bug-61854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1575726664=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61854-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1575726664==
Content-Type: multipart/alternative; boundary="1362685397.fB2EDcf1.16466"; charset="us-ascii"


--1362685397.fB2EDcf1.16466
Date: Thu, 7 Mar 2013 19:43:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D61854

Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #3 from Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> ---
blender's shader says:
"gl_ClipVertex works only on NVIDIA graphic cards so we have to check with
__GLSL_CG_DATA_TYPES"

The GL 2.0 spec says:
"If gl ClipVertex is not written by the vertex shader, its value is unde=EF=
=AC=81ned,
which implies that the results of clipping to any client-de=EF=AC=81ned cli=
p planes are
also undefined."

I don't know with which driver they tested this (maybe on a gallium driver
before gl_ClipVertex was handled, which came rather late ?), but they can't
expect undefined behaviour to work everywhere.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1362685397.fB2EDcf1.16466
Date: Thu, 7 Mar 2013 19:43:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:e0425955&=
#64;student.tuwien.ac.at" title=3D"Christoph Bumiller &lt;e0425955&#64;stud=
ent.tuwien.ac.at&gt;"> <span class=3D"fn">Christoph Bumiller</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - [nv50]glClipPlane not clipping correctly f=
or glsl"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D61854">bug 61854<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - [nv50]glClipPlane not clipping correctly f=
or glsl"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D61854#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - [nv50]glClipPlane not clipping correctly f=
or glsl"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D61854">bug 61854<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
e0425955&#64;student.tuwien.ac.at" title=3D"Christoph Bumiller &lt;e0425955=
&#64;student.tuwien.ac.at&gt;"> <span class=3D"fn">Christoph Bumiller</span=
></a>
</span></b>
        <pre>blender's shader says:
&quot;gl_ClipVertex works only on NVIDIA graphic cards so we have to check =
with
__GLSL_CG_DATA_TYPES&quot;

The GL 2.0 spec says:
&quot;If gl ClipVertex is not written by the vertex shader, its value is un=
de=EF=AC=81ned,
which implies that the results of clipping to any client-de=EF=AC=81ned cli=
p planes are
also undefined.&quot;

I don't know with which driver they tested this (maybe on a gallium driver
before gl_ClipVertex was handled, which came rather late ?), but they can't
expect undefined behaviour to work everywhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362685397.fB2EDcf1.16466--

--===============1575726664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1575726664==--
