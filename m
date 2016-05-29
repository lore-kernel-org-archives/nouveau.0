From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95095] NV46 (G72) Full screen artifacts in Freespace
 2 SW OT mod
Date: Sun, 29 May 2016 13:01:43 +0000
Message-ID: <bug-95095-8800-1XVAbYwBrA@http.bugs.freedesktop.org/>
References: <bug-95095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1205960566=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1205960566==
Content-Type: multipart/alternative; boundary="14645269020.15BF.27584";
 charset="UTF-8"


--14645269020.15BF.27584
Date: Sun, 29 May 2016 13:01:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95095

--- Comment #5 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 124156
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124156&action=3Dedit
Screenshots of qapitrace retracer error log

This is a merge of two screen snapshots of qapitrace error logs
It is provided to check about the following errors.

GL_INVALID_VALUE on glTexImage2D(InternalFormat=3DGL_RGBA16F)
Comment, this seems mixed formats, is it correct?

GL_INVALID_ENUM on glFramebufferTexture2D(invalid attachment
GL_COLOR_ATTACHMENT4)

GL_INVALID_FRAMEBUFFER_OPERATION

and the shader compilers errors, with one referring to mat3 requiring
GLSL1.20and HW TNL is GLSL1.10 on nouveau, while on Windows GLSL is 1.20
(looking at GPU capsviewer)

Does this mean that the root cause of "exploding in the face" X-Wing shader=
s is
GLSL version and by using SW_TNL and exposing forces GLSL 1.20 is a workaro=
und?
The problem is that with SW_TNL the fs2_open does not work with full assets=
 of
a mission.

Is there a way to normalize by approximation in HW_TNL (just asking I don't
even fully know what I'm saying..) or by using less articulated models.
Ilia, I remember you were saying that this models are huge for a space comb=
at
simulation.

What would be the requirement to be compatible with current nouveau nv30?
What formats?
GLSL 1.10 only shaders?

Thanks
Mauro

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14645269020.15BF.27584
Date: Sun, 29 May 2016 13:01:42 +0000
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
   title=3D"NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95095#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95095">bug 95095<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
issor.oruam&#64;gmail.com" title=3D"Mauro Rossi &lt;issor.oruam&#64;gmail.c=
om&gt;"> <span class=3D"fn">Mauro Rossi</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124156=
" name=3D"attach_124156" title=3D"Screenshots of qapitrace retracer error l=
og">attachment 124156</a> <a href=3D"attachment.cgi?id=3D124156&amp;action=
=3Dedit" title=3D"Screenshots of qapitrace retracer error log">[details]</a=
></span>
Screenshots of qapitrace retracer error log

This is a merge of two screen snapshots of qapitrace error logs
It is provided to check about the following errors.

GL_INVALID_VALUE on glTexImage2D(InternalFormat=3DGL_RGBA16F)
Comment, this seems mixed formats, is it correct?

GL_INVALID_ENUM on glFramebufferTexture2D(invalid attachment
GL_COLOR_ATTACHMENT4)

GL_INVALID_FRAMEBUFFER_OPERATION

and the shader compilers errors, with one referring to mat3 requiring
GLSL1.20and HW TNL is GLSL1.10 on nouveau, while on Windows GLSL is 1.20
(looking at GPU capsviewer)

Does this mean that the root cause of &quot;exploding in the face&quot; X-W=
ing shaders is
GLSL version and by using SW_TNL and exposing forces GLSL 1.20 is a workaro=
und?
The problem is that with SW_TNL the fs2_open does not work with full assets=
 of
a mission.

Is there a way to normalize by approximation in HW_TNL (just asking I don't
even fully know what I'm saying..) or by using less articulated models.
Ilia, I remember you were saying that this models are huge for a space comb=
at
simulation.

What would be the requirement to be compatible with current nouveau nv30?
What formats?
GLSL 1.10 only shaders?

Thanks
Mauro</pre>
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

--14645269020.15BF.27584--

--===============1205960566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1205960566==--
