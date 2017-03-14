From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Tue, 14 Mar 2017 22:04:02 +0000
Message-ID: <bug-94990-8800-VPq4xmY4Bu@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0407493835=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0407493835==
Content-Type: multipart/alternative; boundary="14895290410.DfD2d133.11195";
 charset="UTF-8"


--14895290410.DfD2d133.11195
Date: Tue, 14 Mar 2017 22:04:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #116 from fariouche-Qt13gs6zZMY@public.gmane.org ---
Hi,

Just to let you know that I'v just tested the patch (remove last 512MB)
Indeed, the kernel can boot (4.10.1 with latest fw) but I'm loosing the scr=
een
while the kernel tries to switch to nouveau.
A hotplug brings back the console (with corrupted top lines)
My setup: 1 DVI screen at 1600x1200 (main), 1 DP 4K screen (black) and 1 HD=
MI
TV (black too)

If I have some time, I will try to remove all the displays and check for
errors.

One day it will work :) But having an open source driver is really challeng=
ing
these days :(

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14895290410.DfD2d133.11195
Date: Tue, 14 Mar 2017 22:04:01 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c116">Comme=
nt # 116</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fariouche&#64;yahoo.fr" title=3D"fariouche&#64;yahoo.fr">fariouche&#64;yaho=
o.fr</a>
</span></b>
        <pre>Hi,

Just to let you know that I'v just tested the patch (remove last 512MB)
Indeed, the kernel can boot (4.10.1 with latest fw) but I'm loosing the scr=
een
while the kernel tries to switch to nouveau.
A hotplug brings back the console (with corrupted top lines)
My setup: 1 DVI screen at 1600x1200 (main), 1 DP 4K screen (black) and 1 HD=
MI
TV (black too)

If I have some time, I will try to remove all the displays and check for
errors.

One day it will work :) But having an open source driver is really challeng=
ing
these days :(</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14895290410.DfD2d133.11195--

--===============0407493835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0407493835==--
