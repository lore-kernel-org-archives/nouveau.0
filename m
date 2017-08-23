From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102368] Since Archlinux testing migrate to mesa
 17.1.7, I got a pink overlay in webcam software.
Date: Wed, 23 Aug 2017 14:21:47 +0000
Message-ID: <bug-102368-8800-UGCk6Dd79d@http.bugs.freedesktop.org/>
References: <bug-102368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0058640522=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102368-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0058640522==
Content-Type: multipart/alternative; boundary="15034981071.dA119d4.32753";
 charset="UTF-8"


--15034981071.dA119d4.32753
Date: Wed, 23 Aug 2017 14:21:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102368

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If that doesn't fix it, there were two more nouveau patches in the 17.1.7
release:

https://cgit.freedesktop.org/mesa/mesa/commit/?h=3D17.1&id=3D75ce282ee24327=
2e937275c6d086b5a391f8ca47
https://cgit.freedesktop.org/mesa/mesa/commit/?h=3D17.1&id=3D37e61310e3673d=
e8c23fdb1c1c5181a5e1cdc116

The rest of the patches seem harmless. But I also don't immediately see why=
 any
of these would be broken. Could well be that some "other" issue gets trigge=
red
as a result of these fixes.

Please grab an apitrace of the application that reproduces the issue. This =
will
be required whether one of these patches is determined to be the cause or n=
ot.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15034981071.dA119d4.32753
Date: Wed, 23 Aug 2017 14:21:47 +0000
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
   title=3D"NEW - Since Archlinux testing migrate to mesa 17.1.7, I got a p=
ink overlay in webcam software."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102368#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Since Archlinux testing migrate to mesa 17.1.7, I got a p=
ink overlay in webcam software."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102368">bug 10236=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If that doesn't fix it, there were two more nouveau patches in=
 the 17.1.7
release:

<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?h=3D17.1&amp;id=
=3D75ce282ee243272e937275c6d086b5a391f8ca47">https://cgit.freedesktop.org/m=
esa/mesa/commit/?h=3D17.1&amp;id=3D75ce282ee243272e937275c6d086b5a391f8ca47=
</a>
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?h=3D17.1&amp;id=
=3D37e61310e3673de8c23fdb1c1c5181a5e1cdc116">https://cgit.freedesktop.org/m=
esa/mesa/commit/?h=3D17.1&amp;id=3D37e61310e3673de8c23fdb1c1c5181a5e1cdc116=
</a>

The rest of the patches seem harmless. But I also don't immediately see why=
 any
of these would be broken. Could well be that some &quot;other&quot; issue g=
ets triggered
as a result of these fixes.

Please grab an apitrace of the application that reproduces the issue. This =
will
be required whether one of these patches is determined to be the cause or n=
ot.</pre>
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

--15034981071.dA119d4.32753--

--===============0058640522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0058640522==--
