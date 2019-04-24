From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110500] X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
Date: Wed, 24 Apr 2019 10:45:03 +0000
Message-ID: <bug-110500-8800-xp9MoOUZVD@http.bugs.freedesktop.org/>
References: <bug-110500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848140920=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1848140920==
Content-Type: multipart/alternative; boundary="15561027030.2a4a3B58.24708"
Content-Transfer-Encoding: 7bit


--15561027030.2a4a3B58.24708
Date: Wed, 24 Apr 2019 10:45:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

--- Comment #8 from Jordan Belfort <jordanbelfort533-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The mistake messages originate from _glamor_create_tex() which is called by
glamor_create_fbo(), and when this happens, pixmap_priv->fbo is set to NULL
since, well, the FBO couldn't be distributed.
http://www.domyassignmentforme.com/help-homework

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15561027030.2a4a3B58.24708
Date: Wed, 24 Apr 2019 10:45:03 +0000
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
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">bug 11050=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jordanbelfort533&#64;gmail.com" title=3D"Jordan Belfort &lt;jordanbelfort53=
3&#64;gmail.com&gt;"> <span class=3D"fn">Jordan Belfort</span></a>
</span></b>
        <pre>The mistake messages originate from _glamor_create_tex() which=
 is called by
glamor_create_fbo(), and when this happens, pixmap_priv-&gt;fbo is set to N=
ULL
since, well, the FBO couldn't be distributed.
<a href=3D"http://www.domyassignmentforme.com/help-homework">http://www.dom=
yassignmentforme.com/help-homework</a></pre>
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

--15561027030.2a4a3B58.24708--

--===============1848140920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1848140920==--
