From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100204] Crash: system still active, no video
Date: Tue, 14 Mar 2017 21:31:38 +0000
Message-ID: <bug-100204-8800-A1KspgabRG@http.bugs.freedesktop.org/>
References: <bug-100204-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1393579160=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100204-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1393579160==
Content-Type: multipart/alternative; boundary="14895270981.AD6fFBfb.7680";
 charset="UTF-8"


--14895270981.AD6fFBfb.7680
Date: Tue, 14 Mar 2017 21:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100204

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think you want commit f9c0715e39f09bd5ea6f6357a4ce7a969b673007, included =
in
v4.10-rc1:

commit f9c0715e39f09bd5ea6f6357a4ce7a969b673007
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed May 11 16:28:30 2016 +1000

    drm/nouveau/bar/nv50: fix bar2 vm size

    The BAR2 page table was being made WAY too big - oops.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14895270981.AD6fFBfb.7680
Date: Tue, 14 Mar 2017 21:31:38 +0000
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
   title=3D"NEW - Crash: system still active, no video"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100204#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash: system still active, no video"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100204">bug 10020=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think you want commit f9c0715e39f09bd5ea6f6357a4ce7a969b6730=
07, included in
v4.10-rc1:

commit f9c0715e39f09bd5ea6f6357a4ce7a969b673007
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date:   Wed May 11 16:28:30 2016 +1000

    drm/nouveau/bar/nv50: fix bar2 vm size

    The BAR2 page table was being made WAY too big - oops.

    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14895270981.AD6fFBfb.7680--

--===============1393579160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1393579160==--
