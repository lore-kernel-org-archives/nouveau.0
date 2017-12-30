From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] System freeze on wayland with nouveau on
	NV137 (GP107)
Date: Sat, 30 Dec 2017 22:55:32 +0000
Message-ID: <bug-104421-8800-zOq8BfnyLZ@http.bugs.freedesktop.org/>
References: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0729529635=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104421-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0729529635==
Content-Type: multipart/alternative; boundary="15146745310.bcb7cD.32468";
 charset="UTF-8"


--15146745310.bcb7cD.32468
Date: Sat, 30 Dec 2017 22:55:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

--- Comment #2 from Jan Vlug <jan.public-4zxwHqDmGJ7z+pZb47iToQ@public.gmane.org> ---
Just after typing my previous comment, gnome-shell did restart in the end, =
this
is in the log:

Dec 30 23:51:31 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: failed to
idle channel 25 [Xwayland[5346]]
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: failed to
idle channel 25 [Xwayland[5346]]
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
0000013000 engine 06 [HOST0] client 07 [GPC0/T1_2] reason 02 [PTE] on chann=
el
25 [00fbf87000 Xwayland[5346]]
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: fifo: channel 25: killed
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: channel 25
killed!
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]:
nv50cal_space: -16
Dec 30 23:51:48 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 23:52:10 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07

I have a dual display setup (on HiDPI, using fractional scaling), after the
gnome-shell restart the configuration of the displays (how the are arranged,
and which display is primary changed).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15146745310.bcb7cD.32468
Date: Sat, 30 Dec 2017 22:55:31 +0000
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
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jan.public&#64;famvlug.nl" title=3D"Jan Vlug &lt;jan.public&#64;famvlug.nl&=
gt;"> <span class=3D"fn">Jan Vlug</span></a>
</span></b>
        <pre>Just after typing my previous comment, gnome-shell did restart=
 in the end, this
is in the log:

Dec 30 23:51:31 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: failed to
idle channel 25 [Xwayland[5346]]
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: failed to
idle channel 25 [Xwayland[5346]]
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
0000013000 engine 06 [HOST0] client 07 [GPC0/T1_2] reason 02 [PTE] on chann=
el
25 [00fbf87000 Xwayland[5346]]
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: fifo: channel 25: killed
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: channel 25
killed!
Dec 30 23:51:46 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]:
nv50cal_space: -16
Dec 30 23:51:48 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 23:52:10 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07

I have a dual display setup (on HiDPI, using fractional scaling), after the
gnome-shell restart the configuration of the displays (how the are arranged,
and which display is primary changed).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15146745310.bcb7cD.32468--

--===============0729529635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0729529635==--
