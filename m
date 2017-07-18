From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99889] nouveau preventing shutdown after
	suspend-resume
Date: Tue, 18 Jul 2017 07:04:29 +0000
Message-ID: <bug-99889-8800-DIfCJC2Qnd@http.bugs.freedesktop.org/>
References: <bug-99889-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1712810735=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99889-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1712810735==
Content-Type: multipart/alternative; boundary="15003614682.Ffdedd.28301";
 charset="UTF-8"


--15003614682.Ffdedd.28301
Date: Tue, 18 Jul 2017 07:04:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99889

--- Comment #6 from Olivier van der Toorn <oliviervdtoorn+freedesktop@gmail=
.com> ---
I can confirm this bug happens too on an Asus X556UQK machine running Gento=
o.
Currently running the latest kernel (4.13_rc1), and the bug is still presen=
t.

What I think has the same cause, is that when the laptop awakes from suspen=
d,
the screen is frozen after some 30 seconds after the waking up. It freezes =
for
about ten seconds, and then continues as if nothing happened. After that in
dmesg the line:

nouveau 0000:01:00.0: DRM: failed to idle channel 0 [DRM]

shows up in red.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15003614682.Ffdedd.28301
Date: Tue, 18 Jul 2017 07:04:28 +0000
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
   title=3D"NEW - nouveau preventing shutdown after suspend-resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99889#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau preventing shutdown after suspend-resume"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99889">bug 99889<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
oliviervdtoorn+freedesktop&#64;gmail.com" title=3D"Olivier van der Toorn &l=
t;oliviervdtoorn+freedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Olivier=
 van der Toorn</span></a>
</span></b>
        <pre>I can confirm this bug happens too on an Asus X556UQK machine =
running Gentoo.
Currently running the latest kernel (4.13_rc1), and the bug is still presen=
t.

What I think has the same cause, is that when the laptop awakes from suspen=
d,
the screen is frozen after some 30 seconds after the waking up. It freezes =
for
about ten seconds, and then continues as if nothing happened. After that in
dmesg the line:

nouveau 0000:01:00.0: DRM: failed to idle channel 0 [DRM]

shows up in red.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15003614682.Ffdedd.28301--

--===============1712810735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1712810735==--
