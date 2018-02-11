From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105045] System freeze with nouveau
Date: Sun, 11 Feb 2018 17:55:34 +0000
Message-ID: <bug-105045-8800-Bx0bxJPPkp@http.bugs.freedesktop.org/>
References: <bug-105045-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1135434199=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105045-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1135434199==
Content-Type: multipart/alternative; boundary="15183717340.4D0beeAa.25071"
Content-Transfer-Encoding: 7bit


--15183717340.4D0beeAa.25071
Date: Sun, 11 Feb 2018 17:55:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105045

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This happens because GPU fault recovery currently leaves the process in a
totally broken state. (And all other processes that use the GPU, seemingly.)

The general approach has been to try to avoid the GPU faults in the first p=
lace
-- that will be printed before any of your other errors (i.e. before the
nv50_cal stuff).

Note that mesa 18.0 may have some relevant fixes, e.g.=20

commit adcd241b563f44b2e3e92f5d840e2f617bc25836
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Mon Jan 1 14:54:17 2018 -0500

    nvc0: ensure that pushbuf keeps ref to old text/tls bos

Perhaps worth a shot. (This could hit if gnome-shell were generating tons a=
nd
tons of silly shaders. Which it might be.)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15183717340.4D0beeAa.25071
Date: Sun, 11 Feb 2018 17:55:34 +0000
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
   title=3D"NEW - System freeze with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105045#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105045">bug 10504=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This happens because GPU fault recovery currently leaves the p=
rocess in a
totally broken state. (And all other processes that use the GPU, seemingly.)

The general approach has been to try to avoid the GPU faults in the first p=
lace
-- that will be printed before any of your other errors (i.e. before the
nv50_cal stuff).

Note that mesa 18.0 may have some relevant fixes, e.g.=20

commit adcd241b563f44b2e3e92f5d840e2f617bc25836
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Mon Jan 1 14:54:17 2018 -0500

    nvc0: ensure that pushbuf keeps ref to old text/tls bos

Perhaps worth a shot. (This could hit if gnome-shell were generating tons a=
nd
tons of silly shaders. Which it might be.)</pre>
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

--15183717340.4D0beeAa.25071--

--===============1135434199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1135434199==--
