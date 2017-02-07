From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99532] Compute shader doesn't give right result
 under some circumstances
Date: Tue, 07 Feb 2017 12:01:11 +0000
Message-ID: <bug-99532-8800-lRWMa1IDYl@http.bugs.freedesktop.org/>
References: <bug-99532-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0745431468=="
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


--===============0745431468==
Content-Type: multipart/alternative; boundary="14864688700.3CAD4c0.968";
 charset="UTF-8"


--14864688700.3CAD4c0.968
Date: Tue, 7 Feb 2017 12:01:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99532

--- Comment #14 from Boyan Ding <stu_dby-KN7UnAbNpbg@public.gmane.org> ---
Created attachment 129380
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129380&action=3Dedit
A minimal reproducer

I wrote another much simpler program today to find the real cause of this b=
ug.
Turns out that compute shader is unable to sample from depth texture.

The attached program first renders a shape to a FBO. Then a compute shader =
is
used to copy the color and depth textures attached to the former FBO to a
shader image, which is drawn to the screen. The depth part is different bet=
ween
nouveau and other drivers.

Compile the program with gcc test.c -lglfw -lGLEW -lGL

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14864688700.3CAD4c0.968
Date: Tue, 7 Feb 2017 12:01:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Compute shader doesn't give right result under some circu=
mstances"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99532">bug 99532<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stu_dby&#64;126.com" title=3D"Boyan Ding &lt;stu_dby&#64;126.com&gt;"> <spa=
n class=3D"fn">Boyan Ding</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129380=
" name=3D"attach_129380" title=3D"A minimal reproducer">attachment 129380</=
a> <a href=3D"attachment.cgi?id=3D129380&amp;action=3Dedit" title=3D"A mini=
mal reproducer">[details]</a></span>
A minimal reproducer

I wrote another much simpler program today to find the real cause of this b=
ug.
Turns out that compute shader is unable to sample from depth texture.

The attached program first renders a shape to a FBO. Then a compute shader =
is
used to copy the color and depth textures attached to the former FBO to a
shader image, which is drawn to the screen. The depth part is different bet=
ween
nouveau and other drivers.

Compile the program with gcc test.c -lglfw -lGLEW -lGL</pre>
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

--14864688700.3CAD4c0.968--

--===============0745431468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0745431468==--
