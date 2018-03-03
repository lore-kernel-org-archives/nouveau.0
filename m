From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75464] [nv4e] [vdpau] causes hangs
Date: Sat, 03 Mar 2018 20:56:17 +0000
Message-ID: <bug-75464-8800-UdMOY9j1aj@http.bugs.freedesktop.org/>
References: <bug-75464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0443975634=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0443975634==
Content-Type: multipart/alternative; boundary="15201105773.25CE370CF.10392"
Content-Transfer-Encoding: 7bit


--15201105773.25CE370CF.10392
Date: Sat, 3 Mar 2018 20:56:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75464

--- Comment #3 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Causes hangs when I seeking (pressing key left/right in mpv) with this erro=
r:

13:16:53.084345 zotac kernel: nouveau 0000:03:00.0: Xwayland[2069]: failed =
to
idle channel 25 [Xwayland[2069]]
13:17:08.078712 zotac kernel: nouveau 0000:03:00.0: Xwayland[2069]: failed =
to
idle channel 25 [Xwayland[2069]]
13:17:08.085015 zotac kernel: nouveau 0000:03:00.0: mspdec: intr 00000040
13:17:08.085548 zotac kernel: nouveau 0000:03:00.0: fb: trapped read at
0000000000 on channel 25 [0daa8000 Xwayland[2069]] engine 01 [PVP] client 0c
[PVP] subclient 07 [] reason 0000000f [DMAOBJ_LIMIT]

mpv 0.27.2:
Using hardware decoding (vdpau).
VO: [vdpau] 1280x720 vdpau[yuv420p]
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.

NVIDIA Corporation C79 [GeForce 9300 / nForce 730i] (rev b1)

kernel-4.16.0-0.rc3.git2.1.vanilla.knurd.1.fc27.x86_64
mesa-17.3.6

this happens a long time ago.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15201105773.25CE370CF.10392
Date: Sat, 3 Mar 2018 20:56:17 +0000
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
   title=3D"NEW - [nv4e] [vdpau] causes hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75464#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nv4e] [vdpau] causes hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75464">bug 75464<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvlbox&#64;gmail.com" title=3D"Nick Lee &lt;nvlbox&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Nick Lee</span></a>
</span></b>
        <pre>Causes hangs when I seeking (pressing key left/right in mpv) w=
ith this error:

13:16:53.084345 zotac kernel: nouveau 0000:03:00.0: Xwayland[2069]: failed =
to
idle channel 25 [Xwayland[2069]]
13:17:08.078712 zotac kernel: nouveau 0000:03:00.0: Xwayland[2069]: failed =
to
idle channel 25 [Xwayland[2069]]
13:17:08.085015 zotac kernel: nouveau 0000:03:00.0: mspdec: intr 00000040
13:17:08.085548 zotac kernel: nouveau 0000:03:00.0: fb: trapped read at
0000000000 on channel 25 [0daa8000 Xwayland[2069]] engine 01 [PVP] client 0c
[PVP] subclient 07 [] reason 0000000f [DMAOBJ_LIMIT]

mpv 0.27.2:
Using hardware decoding (vdpau).
VO: [vdpau] 1280x720 vdpau[yuv420p]
[vo/vdpau] Compositing window manager detected. Assuming timing info is
inaccurate.

NVIDIA Corporation C79 [GeForce 9300 / nForce 730i] (rev b1)

kernel-4.16.0-0.rc3.git2.1.vanilla.knurd.1.fc27.x86_64
mesa-17.3.6

this happens a long time ago.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15201105773.25CE370CF.10392--

--===============0443975634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0443975634==--
