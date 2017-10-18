From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103351] Nouveau fails when booting with a screen
 connected to displayport since 13a86519202c5d119d83640d6f781f3181205d2c
Date: Wed, 18 Oct 2017 20:52:14 +0000
Message-ID: <bug-103351-8800-vzc1G4J44f@http.bugs.freedesktop.org/>
References: <bug-103351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1752511856=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1752511856==
Content-Type: multipart/alternative; boundary="15083599340.Ef5789C.32179";
 charset="UTF-8"


--15083599340.Ef5789C.32179
Date: Wed, 18 Oct 2017 20:52:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103351

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This appears to be a GM204.

Note that 13a8651920 fixed a regression for most people precisely of the ty=
pe
that it caused for you, i.e. DDC failing.

So it sounds like the address-only transactions were actually working well =
for
you before (which basically is impossible since *size - 1 would have been
0xffffffff and have overwritten the whole ctrl), and these have now been
broken.

This leads me to believe that a different bit is now the address-only
transaction bit. In gm200_i2c_aux_xfer, we assume it's 0x100 (same as for
GF119+). Ben, did you trace it on GM200+ separately?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15083599340.Ef5789C.32179
Date: Wed, 18 Oct 2017 20:52:14 +0000
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
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351">bug 10335=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This appears to be a GM204.

Note that 13a8651920 fixed a regression for most people precisely of the ty=
pe
that it caused for you, i.e. DDC failing.

So it sounds like the address-only transactions were actually working well =
for
you before (which basically is impossible since *size - 1 would have been
0xffffffff and have overwritten the whole ctrl), and these have now been
broken.

This leads me to believe that a different bit is now the address-only
transaction bit. In gm200_i2c_aux_xfer, we assume it's 0x100 (same as for
GF119+). Ben, did you trace it on GM200+ separately?</pre>
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

--15083599340.Ef5789C.32179--

--===============1752511856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1752511856==--
