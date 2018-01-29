From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] System freeze on wayland with nouveau on
 NV137 (GP107)
Date: Mon, 29 Jan 2018 10:47:22 +0000
Message-ID: <bug-104421-8800-RksJVHyEpU@http.bugs.freedesktop.org/>
References: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1825841447=="
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


--===============1825841447==
Content-Type: multipart/alternative; boundary="15172228420.CffC.17832"
Content-Transfer-Encoding: 7bit


--15172228420.CffC.17832
Date: Mon, 29 Jan 2018 10:47:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

--- Comment #8 from Jan Vlug <jan.public-4zxwHqDmGJ7z+pZb47iToQ@public.gmane.org> ---
Another crash:

Jan 29 09:57:25 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 10:43:21 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 10:50:18 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 10:51:28 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 11:26:22 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 11:42:22 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00fdb11000
Xwayland[2952]]
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC0/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC1/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC2/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
0002c7d000 engine 00 [GR] client 18 [GPC1/PE_5] reason 02 [PTE] on channel =
14
[00fdb11000 Xwayland[2952]]
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: Xwayland[2952]: channel 14
killed!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15172228420.CffC.17832
Date: Mon, 29 Jan 2018 10:47:22 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jan.public&#64;famvlug.nl" title=3D"Jan Vlug &lt;jan.public&#64;famvlug.nl&=
gt;"> <span class=3D"fn">Jan Vlug</span></a>
</span></b>
        <pre>Another crash:

Jan 29 09:57:25 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 10:43:21 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 10:50:18 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 10:51:28 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 11:26:22 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 11:42:22 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00fdb11000
Xwayland[2952]]
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC0/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC1/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC2/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
0002c7d000 engine 00 [GR] client 18 [GPC1/PE_5] reason 02 [PTE] on channel =
14
[00fdb11000 Xwayland[2952]]
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Jan 29 11:43:06 nyx kernel: nouveau 0000:23:00.0: Xwayland[2952]: channel 14
killed!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15172228420.CffC.17832--

--===============1825841447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1825841447==--
