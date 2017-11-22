From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100146] nouveau system lockup -> fifo: read fault
 engine 15 [PCE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel
Date: Wed, 22 Nov 2017 14:33:41 +0000
Message-ID: <bug-100146-8800-MxM3SqYmOf@http.bugs.freedesktop.org/>
References: <bug-100146-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0886229817=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100146-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0886229817==
Content-Type: multipart/alternative; boundary="15113612200.Ffc5EBc2.16935";
 charset="UTF-8"


--15113612200.Ffc5EBc2.16935
Date: Wed, 22 Nov 2017 14:33:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100146

--- Comment #1 from t-IX <tixgnm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think i have same problem.
Can reproduce error by play 4k video in mpv.
Or start Steam bigscreen mode.

I'm trying to install nvidia firmware, but system feels very slow and
unresponsive, and i can't test video or steam.


Linux 4.12.12-gentoo x86_64 Gentoo

Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: gr: TRAP ch 5 [003fb72000
X[12943]]
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 2048, y =3D 1024, format =3D 18, storage type =
=3D 0
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: fifo: write fault at 00096120=
00
engine 00 [PGRAPH] client 0f [GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on ch=
ann
el 5 [003fb72000 X[12943]]
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: fifo: gr engine fault on chan=
nel
5, recovering...
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: X[12943]: channel 5 killed!
Nov 22 00:52:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
10 [X[12943]]
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
10 [X[12943]]
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: fifo: read fault at 0000013000
engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on chan=
nel=20
10 [003f8ae000 X[12943]]
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: fifo: fifo engine fault on
channel 10, recovering...
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: X[12943]: channel 10 killed!
Nov 22 00:53:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
13 [X[12943]]
Nov 22 00:53:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
13 [X[12943]]
Nov 22 00:53:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
9 [X[12943]]
Nov 22 00:54:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
9 [X[12943]]
Nov 22 00:54:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
6 [X[12943]]
Nov 22 00:54:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
6 [X[12943]]
Nov 22 00:54:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
12 [X[12943]]
Nov 22 00:55:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
12 [X[12943]]
Nov 22 00:55:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
7 [X[12943]]
Nov 22 00:55:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
7 [X[12943]]
Nov 22 00:55:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
4 [X[12943]]
Nov 22 00:56:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
4 [X[12943]]
Nov 22 00:56:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
3 [X[12943]]
Nov 22 00:56:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
3 [X[12943]]
Nov 22 00:56:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
2 [X[12943]]
Nov 22 00:57:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
2 [X[12943]]

Chipset: "NVIDIA NVC1"
NVIDIA Corporation GF108 [GeForce GT 430] (rev a1)
Digital interface is DisplayPort

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15113612200.Ffc5EBc2.16935
Date: Wed, 22 Nov 2017 14:33:40 +0000
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
   title=3D"NEW - nouveau system lockup -&gt; fifo: read fault engine 15 [P=
CE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100146#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau system lockup -&gt; fifo: read fault engine 15 [P=
CE0] client 01 [PCOPY0] reason 02 [PAGE_NOT_PRESENT] on channel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100146">bug 10014=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tixgnm&#64;gmail.com" title=3D"t-IX &lt;tixgnm&#64;gmail.com&gt;"> <span cl=
ass=3D"fn">t-IX</span></a>
</span></b>
        <pre>I think i have same problem.
Can reproduce error by play 4k video in mpv.
Or start Steam bigscreen mode.

I'm trying to install nvidia firmware, but system feels very slow and
unresponsive, and i can't test video or steam.


Linux 4.12.12-gentoo x86_64 Gentoo

Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: gr: TRAP ch 5 [003fb72000
X[12943]]
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 2048, y =3D 1024, format =3D 18, storage type =
=3D 0
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: fifo: write fault at 00096120=
00
engine 00 [PGRAPH] client 0f [GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on ch=
ann
el 5 [003fb72000 X[12943]]
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: fifo: gr engine fault on chan=
nel
5, recovering...
Nov 22 00:51:36 kernel: nouveau 0000:01:00.0: X[12943]: channel 5 killed!
Nov 22 00:52:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
10 [X[12943]]
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
10 [X[12943]]
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: fifo: read fault at 0000013000
engine 07 [PFIFO] client 07 [BAR_READ] reason 02 [PAGE_NOT_PRESENT] on chan=
nel=20
10 [003f8ae000 X[12943]]
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: fifo: fifo engine fault on
channel 10, recovering...
Nov 22 00:53:04 kernel: nouveau 0000:01:00.0: X[12943]: channel 10 killed!
Nov 22 00:53:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
13 [X[12943]]
Nov 22 00:53:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
13 [X[12943]]
Nov 22 00:53:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
9 [X[12943]]
Nov 22 00:54:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
9 [X[12943]]
Nov 22 00:54:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
6 [X[12943]]
Nov 22 00:54:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
6 [X[12943]]
Nov 22 00:54:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
12 [X[12943]]
Nov 22 00:55:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
12 [X[12943]]
Nov 22 00:55:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
7 [X[12943]]
Nov 22 00:55:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
7 [X[12943]]
Nov 22 00:55:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
4 [X[12943]]
Nov 22 00:56:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
4 [X[12943]]
Nov 22 00:56:19 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
3 [X[12943]]
Nov 22 00:56:34 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
3 [X[12943]]
Nov 22 00:56:49 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
2 [X[12943]]
Nov 22 00:57:04 kernel: nouveau 0000:01:00.0: X[12943]: failed to idle chan=
nel
2 [X[12943]]

Chipset: &quot;NVIDIA NVC1&quot;
NVIDIA Corporation GF108 [GeForce GT 430] (rev a1)
Digital interface is DisplayPort</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15113612200.Ffc5EBc2.16935--

--===============0886229817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0886229817==--
