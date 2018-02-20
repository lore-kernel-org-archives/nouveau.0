From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104835] MMIO read of 00000000 FAULT at 10ac08 [ IBUS
 ]
Date: Tue, 20 Feb 2018 13:36:43 +0000
Message-ID: <bug-104835-8800-tNr02STLqa@http.bugs.freedesktop.org/>
References: <bug-104835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1174130752=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1174130752==
Content-Type: multipart/alternative; boundary="15191338030.B78F.27241"
Content-Transfer-Encoding: 7bit


--15191338030.B78F.27241
Date: Tue, 20 Feb 2018 13:36:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

--- Comment #2 from Tom D <codsmack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hardware: Lenovo P50
Symptoms:
This problem did not happen until I dist-upgraded from Fedora 26 to 27.

If the laptop is connected to the dock during boot, I get the logs below and
nothing further. I cannot shift desktops, log in, etc. Due to the
configuration, I cannot remotely SSH in without changing the FW after loggi=
ng
in so I'm unsure about that behavior.

If I boot the system off of the doc and then place it into the doc before
logging in as a user, all seems to work well. I can then remove and re-seat=
 the
laptop without issue.

If I boot the system, log in and then place it on the doc, sometimes (I do =
not
understand the pattern), the second screen attached to the dock is not seen=
 at
all (does not show under displays).=20

Same symptoms on numerous docs.=20

I am concerned that the nouveau errors seen are unrelated to the actual
problems encountered.

Log snip
[    2.425868] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    2.427462] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15191338030.B78F.27241
Date: Tue, 20 Feb 2018 13:36:43 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835">bug 10483=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
codsmack&#64;gmail.com" title=3D"Tom D &lt;codsmack&#64;gmail.com&gt;"> <sp=
an class=3D"fn">Tom D</span></a>
</span></b>
        <pre>Hardware: Lenovo P50
Symptoms:
This problem did not happen until I dist-upgraded from Fedora 26 to 27.

If the laptop is connected to the dock during boot, I get the logs below and
nothing further. I cannot shift desktops, log in, etc. Due to the
configuration, I cannot remotely SSH in without changing the FW after loggi=
ng
in so I'm unsure about that behavior.

If I boot the system off of the doc and then place it into the doc before
logging in as a user, all seems to work well. I can then remove and re-seat=
 the
laptop without issue.

If I boot the system, log in and then place it on the doc, sometimes (I do =
not
understand the pattern), the second screen attached to the dock is not seen=
 at
all (does not show under displays).=20

Same symptoms on numerous docs.=20

I am concerned that the nouveau errors seen are unrelated to the actual
problems encountered.

Log snip
[    2.425868] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    2.427462] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15191338030.B78F.27241--

--===============1174130752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1174130752==--
