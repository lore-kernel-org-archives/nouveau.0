From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] System freeze on wayland with nouveau on
 NV137 (GP107) and NVE4 (GK104) and GK107
Date: Thu, 01 Feb 2018 19:50:02 +0000
Message-ID: <bug-104421-8800-Ojr3QYa5ul@http.bugs.freedesktop.org/>
References: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0141912627=="
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


--===============0141912627==
Content-Type: multipart/alternative; boundary="15175146020.8E6dFc0.8827"
Content-Transfer-Encoding: 7bit


--15175146020.8E6dFc0.8827
Date: Thu, 1 Feb 2018 19:50:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

--- Comment #13 from Jan Vlug <jan.public-4zxwHqDmGJ7z+pZb47iToQ@public.gmane.org> ---
Another crash, here some logging:

Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00fdb11000
Xwayland[3450]]
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
00039de000 engine 00 [GR] client 18 [GPC1/PE_5] reason 02 [PTE] on channel =
14
[00fdb11000 Xwayland[3450]]
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: Xwayland[3450]: channel 14
killed!
<snip>
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: kernel rejected
pushbuf: Device or resource busy
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: krec 0 pu=
shes
1 bufs 4 relocs 0
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
000
00000003 00000004 00000004 00000000
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
001
00000006 00000004 00000000 00000004
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
002
00000020 00000002 00000000 00000002
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
003
0000002e 00000004 00000004 00000000
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: psh 00000=
000
0000013e24 0000013eb4
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x20056=
080
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
0e6
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
000
<snip>
Feb 01 19:32:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x20046=
234
Feb 01 19:32:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
000
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: Xwayland[3450]:
nv50cal_space: -16
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: fifo: PBDMA0: 04000000
[ACQUIRE] ch 13 [00ffb82000 systemd-logind[2544]] subc 0 mthd 001c data
00001004
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: fifo: PBDMA0: 04000000
[ACQUIRE] ch 13 [00ffb82000 systemd-logind[2544]] subc 0 mthd 001c data
00001004
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: fifo: PBDMA0: 04000000
[ACQUIRE] ch 13 [00ffb82000 systemd-logind[2544]] subc 0 mthd 001c data
00001004
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: kernel rejected
pushbuf: Device or resource busy
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: krec 0 pu=
shes
1 bufs 4 relocs 0
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
000
00000004 00000004 00000004 00000000
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
001
00000006 00000004 00000000 00000004
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
002
00000019 00000002 00000000 00000002
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
003
0000000f 00000004 00000004 00000000
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: psh 00000=
000
0000001138 00000011c8
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x20056=
080
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
0e6
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15175146020.8E6dFc0.8827
Date: Thu, 1 Feb 2018 19:50:02 +0000
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
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107) an=
d NVE4 (GK104) and GK107"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107) an=
d NVE4 (GK104) and GK107"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jan.public&#64;famvlug.nl" title=3D"Jan Vlug &lt;jan.public&#64;famvlug.nl&=
gt;"> <span class=3D"fn">Jan Vlug</span></a>
</span></b>
        <pre>Another crash, here some logging:

Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00fdb11000
Xwayland[3450]]
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
00039de000 engine 00 [GR] client 18 [GPC1/PE_5] reason 02 [PTE] on channel =
14
[00fdb11000 Xwayland[3450]]
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Feb 01 18:32:23 nyx kernel: nouveau 0000:23:00.0: Xwayland[3450]: channel 14
killed!
&lt;snip&gt;
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: kernel rejected
pushbuf: Device or resource busy
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: krec 0 pu=
shes
1 bufs 4 relocs 0
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
000
00000003 00000004 00000004 00000000
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
001
00000006 00000004 00000000 00000004
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
002
00000020 00000002 00000000 00000002
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
003
0000002e 00000004 00000004 00000000
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: psh 00000=
000
0000013e24 0000013eb4
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x20056=
080
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
0e6
Feb 01 18:37:34 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
000
&lt;snip&gt;
Feb 01 19:32:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x20046=
234
Feb 01 19:32:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
000
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: Xwayland[3450]:
nv50cal_space: -16
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: fifo: PBDMA0: 04000000
[ACQUIRE] ch 13 [00ffb82000 systemd-logind[2544]] subc 0 mthd 001c data
00001004
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: fifo: PBDMA0: 04000000
[ACQUIRE] ch 13 [00ffb82000 systemd-logind[2544]] subc 0 mthd 001c data
00001004
Feb 01 19:32:00 nyx kernel: nouveau 0000:23:00.0: fifo: PBDMA0: 04000000
[ACQUIRE] ch 13 [00ffb82000 systemd-logind[2544]] subc 0 mthd 001c data
00001004
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: kernel rejected
pushbuf: Device or resource busy
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: krec 0 pu=
shes
1 bufs 4 relocs 0
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
000
00000004 00000004 00000004 00000000
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
001
00000006 00000004 00000000 00000004
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
002
00000019 00000002 00000000 00000002
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: buf 00000=
003
0000000f 00000004 00000004 00000000
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau: ch14: psh 00000=
000
0000001138 00000011c8
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x20056=
080
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
0e6
Feb 01 19:33:00 nyx org.gnome.Shell.desktop[3409]: nouveau:         0x00000=
000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15175146020.8E6dFc0.8827--

--===============0141912627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0141912627==--
