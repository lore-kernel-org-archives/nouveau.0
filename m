From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100760] Rapid flickering when an app is placed on
 the second Nouveau ZaphodHeads display
Date: Sun, 23 Apr 2017 02:31:54 +0000
Message-ID: <bug-100760-8800-RfDLt62AGD@http.bugs.freedesktop.org/>
References: <bug-100760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2089445064=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100760-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2089445064==
Content-Type: multipart/alternative; boundary="14929147130.92d43ea39.14680";
 charset="UTF-8"


--14929147130.92d43ea39.14680
Date: Sun, 23 Apr 2017 02:31:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100760

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
While Zaphod is considered a legacy feature, that doesn't mean that things
should break. Just that it's unlikely to be extended to support new things.

There has recently been some bugs introduced into xserver which break
non-xrandr setups. There are also some issues in the nouveau driver. One of
those was fixed in xf86-video-nouveau 1.0.15. For the xserver issues, see b=
ug
#100293.

I cannot comment on any bugs that happen in MATE/whatever other software as=
 a
result of multi-screen displays. Note that these are not commonly tested. If
you can do 'DISPLAY=3D:0.1 xterm', then everything else is down to the X cl=
ients.

Please try the above fixes and see if they improve things. If they don't,
you're going to have to debug this, or provide sufficient info for others to
debug it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14929147130.92d43ea39.14680
Date: Sun, 23 Apr 2017 02:31:53 +0000
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
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760">bug 10076=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>While Zaphod is considered a legacy feature, that doesn't mean=
 that things
should break. Just that it's unlikely to be extended to support new things.

There has recently been some bugs introduced into xserver which break
non-xrandr setups. There are also some issues in the nouveau driver. One of
those was fixed in xf86-video-nouveau 1.0.15. For the xserver issues, see b=
ug
#100293.

I cannot comment on any bugs that happen in MATE/whatever other software as=
 a
result of multi-screen displays. Note that these are not commonly tested. If
you can do 'DISPLAY=3D:0.1 xterm', then everything else is down to the X cl=
ients.

Please try the above fixes and see if they improve things. If they don't,
you're going to have to debug this, or provide sufficient info for others to
debug it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14929147130.92d43ea39.14680--

--===============2089445064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2089445064==--
