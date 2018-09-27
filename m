From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108080] GK106 [GeForce GTX 660] System Freeze - warp
 3d0009 [ILLEGAL_INSTR_ENCODING]
Date: Thu, 27 Sep 2018 02:14:47 +0000
Message-ID: <bug-108080-8800-jqRQyu98dp@http.bugs.freedesktop.org/>
References: <bug-108080-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0548805170=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108080-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0548805170==
Content-Type: multipart/alternative; boundary="15380144860.b51De496.23063"
Content-Transfer-Encoding: 7bit


--15380144860.b51De496.23063
Date: Thu, 27 Sep 2018 02:14:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108080

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
A number of GTX 660 users have a variety of issues with nouveau. Can you se=
e if
using blob grctx firmware helps? Follow the instructions at

https://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware

[make sure you use 325.15 and not another version]

This should get you the appropriate grctx firmware. You can then make use o=
f it
by booting with

nouveau.config=3DNvGrUseFW=3D1

(Make sure that the firmware ends up whereever the nouveau module is... if =
it's
loaded from initrd, then it should be in initrd, etc.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15380144860.b51De496.23063
Date: Thu, 27 Sep 2018 02:14:46 +0000
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
   title=3D"NEW - GK106 [GeForce GTX 660] System Freeze - warp 3d0009 [ILLE=
GAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108080#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GK106 [GeForce GTX 660] System Freeze - warp 3d0009 [ILLE=
GAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108080">bug 10808=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>A number of GTX 660 users have a variety of issues with nouvea=
u. Can you see if
using blob grctx firmware helps? Follow the instructions at

<a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware=
">https://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware</a>

[make sure you use 325.15 and not another version]

This should get you the appropriate grctx firmware. You can then make use o=
f it
by booting with

nouveau.config=3DNvGrUseFW=3D1

(Make sure that the firmware ends up whereever the nouveau module is... if =
it's
loaded from initrd, then it should be in initrd, etc.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15380144860.b51De496.23063--

--===============0548805170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0548805170==--
