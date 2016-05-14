From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Sat, 14 May 2016 22:23:14 +0000
Message-ID: <bug-59069-8800-5Qjgj4zlYo@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0645941425=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0645941425==
Content-Type: multipart/alternative; boundary="14632645942.4e24.16004";
 charset="UTF-8"


--14632645942.4e24.16004
Date: Sat, 14 May 2016 22:23:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D59069

--- Comment #39 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
"fail ttm_validate" usually means "you tried to use too much vram at once".
Unfortunately nouveau's mesa driver isn't particularly good at handling that
issue, which causes it to get much worse failures down the line.

If you have an IGP, please increase the size of the "VRAM" allocation.

Realistically, I doubt the plasma5 use-case fits well with nv30/nv40 hardwa=
re.
You're taking a 2015 compositor and running it on 2005 hardware.

You could (correctly) make the argument that nouveau should do a better job=
 at
this -- and you'd be right. However volunteers aren't falling over themselv=
es,
rushing to fix these issues.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14632645942.4e24.16004
Date: Sat, 14 May 2016 22:23:14 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069#c39">Commen=
t # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069">bug 59069<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>&quot;fail ttm_validate&quot; usually means &quot;you tried to=
 use too much vram at once&quot;.
Unfortunately nouveau's mesa driver isn't particularly good at handling that
issue, which causes it to get much worse failures down the line.

If you have an IGP, please increase the size of the &quot;VRAM&quot; alloca=
tion.

Realistically, I doubt the plasma5 use-case fits well with nv30/nv40 hardwa=
re.
You're taking a 2015 compositor and running it on 2005 hardware.

You could (correctly) make the argument that nouveau should do a better job=
 at
this -- and you'd be right. However volunteers aren't falling over themselv=
es,
rushing to fix these issues.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14632645942.4e24.16004--

--===============0645941425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0645941425==--
