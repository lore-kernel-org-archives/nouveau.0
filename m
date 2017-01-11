From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99354] [G71] "Assertion `bkref' failed" reproducible
 with glmark2
Date: Wed, 11 Jan 2017 01:58:15 +0000
Message-ID: <bug-99354-8800-TuYYSi1Qne@http.bugs.freedesktop.org/>
References: <bug-99354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0231316980=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0231316980==
Content-Type: multipart/alternative; boundary="14840998941.B2BfA1A74.14565";
 charset="UTF-8"


--14840998941.B2BfA1A74.14565
Date: Wed, 11 Jan 2017 01:58:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99354

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
While I was not able to hit the issue by replaying your trace, I grabbed
glmark2, and with

MESA_GL_VERSION_OVERRIDE=3D2.0 ./build/src/glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.99:update-fra=
ction=3D0.5:update-method=3Dsubdata:buffer-usage=3Dstatic

(built with the x11-gl target) it indeed fails on my NV34. Will start diggi=
ng.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14840998941.B2BfA1A74.14565
Date: Wed, 11 Jan 2017 01:58:14 +0000
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
   title=3D"NEW - [G71] &quot;Assertion `bkref' failed&quot; reproducible w=
ith glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G71] &quot;Assertion `bkref' failed&quot; reproducible w=
ith glmark2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99354">bug 99354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>While I was not able to hit the issue by replaying your trace,=
 I grabbed
glmark2, and with

MESA_GL_VERSION_OVERRIDE=3D2.0 ./build/src/glmark2 -b
buffer:columns=3D200:interleave=3Dfalse:update-dispersion=3D0.99:update-fra=
ction=3D0.5:update-method=3Dsubdata:buffer-usage=3Dstatic

(built with the x11-gl target) it indeed fails on my NV34. Will start diggi=
ng.</pre>
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

--14840998941.B2BfA1A74.14565--

--===============0231316980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0231316980==--
