From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106227] GP107 hangs on boot
Date: Fri, 04 May 2018 02:17:01 +0000
Message-ID: <bug-106227-8800-u1VIi9aINV@http.bugs.freedesktop.org/>
References: <bug-106227-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1242765929=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106227-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1242765929==
Content-Type: multipart/alternative; boundary="15254002212.4af48AA5.990"
Content-Transfer-Encoding: 7bit


--15254002212.4af48AA5.990
Date: Fri, 4 May 2018 02:17:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106227

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
GPU lockup right on boot. nofbaccel makes fbdev not accelerated (and noacce=
l=3D1
makes userspace not able to access the accel features), so the gr unit is n=
ever
used. The GPU is still used, but only for outputs.

Perhaps PCIe PM is getting in the way? You could try killing it with
pcie_port_pm=3Doff although that hasn't helped a lot of people.

You could try adding nouveau.runpm=3D0 although since the hang is right on =
load,
I doubt that would affect matters.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15254002212.4af48AA5.990
Date: Fri, 4 May 2018 02:17:01 +0000
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
   title=3D"NEW - GP107 hangs on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106227#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GP107 hangs on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106227">bug 10622=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>GPU lockup right on boot. nofbaccel makes fbdev not accelerate=
d (and noaccel=3D1
makes userspace not able to access the accel features), so the gr unit is n=
ever
used. The GPU is still used, but only for outputs.

Perhaps PCIe PM is getting in the way? You could try killing it with
pcie_port_pm=3Doff although that hasn't helped a lot of people.

You could try adding nouveau.runpm=3D0 although since the hang is right on =
load,
I doubt that would affect matters.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15254002212.4af48AA5.990--

--===============1242765929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1242765929==--
