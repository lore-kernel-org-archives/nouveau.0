From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Thu, 01 Mar 2018 18:21:20 +0000
Message-ID: <bug-105173-8800-w9lqp0obkZ@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1115828258=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1115828258==
Content-Type: multipart/alternative; boundary="15199284803.b2C7e.20144"
Content-Transfer-Encoding: 7bit


--15199284803.b2C7e.20144
Date: Thu, 1 Mar 2018 18:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #13 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 137730
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D137730&action=3Dedit
Proposed patch

Okay, thank you for the confirmation. So, I am still failing to reproduce t=
he
NULL pointer dereference, but I can reproduce the other errors, so that=E2=
=80=99s a
start.
Could you please try the attached patch (from
https://github.com/skeggsb/nouveau/pull/1)? It fixes the errors on my end at
least.

@Sergio You might want to give that patch a try as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199284803.b2C7e.20144
Date: Thu, 1 Mar 2018 18:21:20 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D137730=
" name=3D"attach_137730" title=3D"Proposed patch">attachment 137730</a> <a =
href=3D"attachment.cgi?id=3D137730&amp;action=3Dedit" title=3D"Proposed pat=
ch">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D1=
05173&amp;attachment=3D137730'>[review]</a>
Proposed patch

Okay, thank you for the confirmation. So, I am still failing to reproduce t=
he
NULL pointer dereference, but I can reproduce the other errors, so that=E2=
=80=99s a
start.
Could you please try the attached patch (from
<a href=3D"https://github.com/skeggsb/nouveau/pull/1">https://github.com/sk=
eggsb/nouveau/pull/1</a>)? It fixes the errors on my end at
least.

&#64;Sergio You might want to give that patch a try as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199284803.b2C7e.20144--

--===============1115828258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1115828258==--
