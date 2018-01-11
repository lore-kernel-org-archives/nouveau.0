From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] System freeze on wayland with nouveau on
	NV137 (GP107)
Date: Thu, 11 Jan 2018 13:02:55 +0000
Message-ID: <bug-104421-8800-3WAMVBiUww@http.bugs.freedesktop.org/>
References: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1285614502=="
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


--===============1285614502==
Content-Type: multipart/alternative; boundary="15156757750.ae39dAFa.16082";
 charset="UTF-8"


--15156757750.ae39dAFa.16082
Date: Thu, 11 Jan 2018 13:02:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

--- Comment #5 from Jan Vlug <jan.public-4zxwHqDmGJ7z+pZb47iToQ@public.gmane.org> ---
Today this happened again. I was still able to reach the machine via ssh.
There are extra lines in the logging compared to the previous freezes:

Jan 11 11:32:57 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 11:42:04 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 11:42:31 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 11:47:18 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 13:08:12 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 13:10:14 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00fdb51000
Xwayland[2381]]
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC0/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC1/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC2/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
000725c000 engine 00 [GR] client 0a [GPC0/T1_3] reason 02 [PTE] on channel =
14
[00fdb51000 Xwayland[2381]]
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]: channel 14
killed!
Jan 11 13:50:50 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]:
nv50cal_space: -16
Jan 11 13:50:50 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]:
nv50cal_space: -16
Jan 11 13:50:50 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]:
nv50cal_space: -16
<this last line keeps repeating sometimes several times per second>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15156757750.ae39dAFa.16082
Date: Thu, 11 Jan 2018 13:02:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jan.public&#64;famvlug.nl" title=3D"Jan Vlug &lt;jan.public&#64;famvlug.nl&=
gt;"> <span class=3D"fn">Jan Vlug</span></a>
</span></b>
        <pre>Today this happened again. I was still able to reach the machi=
ne via ssh.
There are extra lines in the logging compared to the previous freezes:

Jan 11 11:32:57 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 11:42:04 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 11:42:31 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 11:47:18 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 13:08:12 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 13:10:14 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00fdb51000
Xwayland[2381]]
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC0/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC1/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC2/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
000725c000 engine 00 [GR] client 0a [GPC0/T1_3] reason 02 [PTE] on channel =
14
[00fdb51000 Xwayland[2381]]
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Jan 11 13:49:37 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]: channel 14
killed!
Jan 11 13:50:50 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]:
nv50cal_space: -16
Jan 11 13:50:50 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]:
nv50cal_space: -16
Jan 11 13:50:50 nyx kernel: nouveau 0000:23:00.0: Xwayland[2381]:
nv50cal_space: -16
&lt;this last line keeps repeating sometimes several times per second&gt;</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15156757750.ae39dAFa.16082--

--===============1285614502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1285614502==--
