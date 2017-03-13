From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100177] [GM206] Misrendering in XCOM Ennemy Within
Date: Mon, 13 Mar 2017 02:27:55 +0000
Message-ID: <bug-100177-8800-V1MNOdhgWG@http.bugs.freedesktop.org/>
References: <bug-100177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1988562557=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100177-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1988562557==
Content-Type: multipart/alternative; boundary="14893720750.dcb0fb.32237";
 charset="UTF-8"


--14893720750.dcb0fb.32237
Date: Mon, 13 Mar 2017 02:27:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100177

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I have an unproven theory that this is related to polygon-offset failing on
GM20x. Can't figure out what we're missing. In the GM20x traces it seems li=
ke
it's jumping through crazy hoops to set all the polygon offset stuff by usi=
ng a
macro to write out the values. It's effectively conditional on the value in
some scratch register. I suspect it's to be able to apply a CSO without
recomputing it, and adjusting its effect by adjusting scratch registers.
However things are configured s.t. it does do the writes.

One thought is that there's a register somewhere that sets the value of "r",
i.e. the unit of polygon offset. This has traditionally been driven off the
depth format as a function of rasterization details, but perhaps now it's s=
et
explicitly. It'd be 1/1<<24 for Z24, 1/1<<16 for Z16, and "variable" for Z3=
2F.
However no such setting has been found, and there's nothing obvious in the
trace.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14893720750.dcb0fb.32237
Date: Mon, 13 Mar 2017 02:27:55 +0000
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
   title=3D"NEW - [GM206] Misrendering in XCOM Ennemy Within"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100177#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM206] Misrendering in XCOM Ennemy Within"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100177">bug 10017=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I have an unproven theory that this is related to polygon-offs=
et failing on
GM20x. Can't figure out what we're missing. In the GM20x traces it seems li=
ke
it's jumping through crazy hoops to set all the polygon offset stuff by usi=
ng a
macro to write out the values. It's effectively conditional on the value in
some scratch register. I suspect it's to be able to apply a CSO without
recomputing it, and adjusting its effect by adjusting scratch registers.
However things are configured s.t. it does do the writes.

One thought is that there's a register somewhere that sets the value of &qu=
ot;r&quot;,
i.e. the unit of polygon offset. This has traditionally been driven off the
depth format as a function of rasterization details, but perhaps now it's s=
et
explicitly. It'd be 1/1&lt;&lt;24 for Z24, 1/1&lt;&lt;16 for Z16, and &quot=
;variable&quot; for Z32F.
However no such setting has been found, and there's nothing obvious in the
trace.</pre>
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

--14893720750.dcb0fb.32237--

--===============1988562557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1988562557==--
