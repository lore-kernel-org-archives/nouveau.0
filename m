From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] System freeze on wayland with nouveau on
 NV137 (GP107)
Date: Fri, 26 Jan 2018 08:49:04 +0000
Message-ID: <bug-104421-8800-ajxP3bF52x@http.bugs.freedesktop.org/>
References: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833275504=="
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


--===============0833275504==
Content-Type: multipart/alternative; boundary="15169565440.C6c9C.17391"
Content-Transfer-Encoding: 7bit


--15169565440.C6c9C.17391
Date: Fri, 26 Jan 2018 08:49:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

--- Comment #7 from Edwin Foss <mathg9-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org> ---
Also happens with my machine, Antergos/Gnome/Wayland latest repo update (no
AUR) with AMD FX8350 and NVIDIA GK104 [GeForce GTX 760] (rev a1)

First crash I was watching YouTube, in journalctl I got this:

kernel: nouveau 0000:01:00.0: Xwayland[1012]: channel 13 killed!
kernel: nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: channel 13: killed
kernel: nouveau 0000:01:00.0: fifo: read fault at 000a5e0000 engine 00 [GR]
client 04 [GPC0/T1_1] reason 02 [PTE] on channel 13 [007ed50000 Xwayland[10=
12]]
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: TRAP ch 13 [007ed50000 Xwayland[1012]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000009


Second time I was doing random things and I got this

kernel: nouveau 0000:01:00.0: Xwayland[1009]: channel 3 killed!
kernel: nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: channel 3: killed
kernel: nouveau 0000:01:00.0: fifo: read fault at 0002de2000 engine 00 [GR]
client 0f [GPC1/PROP_0] reason 02 [PTE] on channel 3 [007f82e000
Xwayland[1009]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3000d [OOR_REG]
kernel: nouveau 0000:01:00.0: gr: TRAP ch 3 [007f82e000 Xwayland[1009]]


Third time I got this which flooded my log with 500.000+ lines of same thing

kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []


I hope this help to find some fix, best regards

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15169565440.C6c9C.17391
Date: Fri, 26 Jan 2018 08:49:04 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mathg9&#64;outlook.com" title=3D"Edwin Foss &lt;mathg9&#64;outlook.com&gt;"=
> <span class=3D"fn">Edwin Foss</span></a>
</span></b>
        <pre>Also happens with my machine, Antergos/Gnome/Wayland latest re=
po update (no
AUR) with AMD FX8350 and NVIDIA GK104 [GeForce GTX 760] (rev a1)

First crash I was watching YouTube, in journalctl I got this:

kernel: nouveau 0000:01:00.0: Xwayland[1012]: channel 13 killed!
kernel: nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: channel 13: killed
kernel: nouveau 0000:01:00.0: fifo: read fault at 000a5e0000 engine 00 [GR]
client 04 [GPC0/T1_1] reason 02 [PTE] on channel 13 [007ed50000 Xwayland[10=
12]]
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: TRAP ch 13 [007ed50000 Xwayland[1012]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000009
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000009


Second time I was doing random things and I got this

kernel: nouveau 0000:01:00.0: Xwayland[1009]: channel 3 killed!
kernel: nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: channel 3: killed
kernel: nouveau 0000:01:00.0: fifo: read fault at 0002de2000 engine 00 [GR]
client 0f [GPC1/PROP_0] reason 02 [PTE] on channel 3 [007f82e000
Xwayland[1009]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3000d [OOR_REG]
kernel: nouveau 0000:01:00.0: gr: TRAP ch 3 [007f82e000 Xwayland[1009]]


Third time I got this which flooded my log with 500.000+ lines of same thing

kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []


I hope this help to find some fix, best regards</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15169565440.C6c9C.17391--

--===============0833275504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0833275504==--
