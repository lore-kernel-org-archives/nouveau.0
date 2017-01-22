From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99487] [NV110] HP Pavilion 15 with Maxwell 950M
 fails to read BIOS (fix included)
Date: Sun, 22 Jan 2017 04:37:21 +0000
Message-ID: <bug-99487-8800-UwVDUnc4z8@http.bugs.freedesktop.org/>
References: <bug-99487-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1806644884=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99487-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1806644884==
Content-Type: multipart/alternative; boundary="14850598410.b2f32eDAe.5051";
 charset="UTF-8"


--14850598410.b2f32eDAe.5051
Date: Sun, 22 Jan 2017 04:37:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99487

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
So the *idea* is that the fast method should fail in your case, because it
should require the checksum to match.

Hmmm... the logic was added in Ben's tree in commit

https://github.com/skeggsb/nouveau/commit/2f693ef05fc8ca4627535a85900d8563b=
66032e9

However I can't see that commit in the upstream kernel. That's rather odd.
Either way, can you try applying that patch and seeing if that forces the f=
ast
method to error out?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14850598410.b2f32eDAe.5051
Date: Sun, 22 Jan 2017 04:37:21 +0000
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
   title=3D"NEW - [NV110] HP Pavilion 15 with Maxwell 950M fails to read BI=
OS (fix included)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99487#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV110] HP Pavilion 15 with Maxwell 950M fails to read BI=
OS (fix included)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99487">bug 99487<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>So the *idea* is that the fast method should fail in your case=
, because it
should require the checksum to match.

Hmmm... the logic was added in Ben's tree in commit

<a href=3D"https://github.com/skeggsb/nouveau/commit/2f693ef05fc8ca4627535a=
85900d8563b66032e9">https://github.com/skeggsb/nouveau/commit/2f693ef05fc8c=
a4627535a85900d8563b66032e9</a>

However I can't see that commit in the upstream kernel. That's rather odd.
Either way, can you try applying that patch and seeing if that forces the f=
ast
method to error out?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14850598410.b2f32eDAe.5051--

--===============1806644884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1806644884==--
