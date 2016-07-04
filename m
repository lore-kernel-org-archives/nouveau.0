From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Mon, 04 Jul 2016 18:01:41 +0000
Message-ID: <bug-93629-8800-X4CyZiEjrV@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052783799=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1052783799==
Content-Type: multipart/alternative; boundary="14676553015.787ABf.25938";
 charset="UTF-8"


--14676553015.787ABf.25938
Date: Mon, 4 Jul 2016 18:01:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #32 from Ehsan Azar <dashesy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same issue:
$ uname -a
Linux dashesy.wavelet 4.5.7-200.fc23.x86_64 #1 SMP Wed Jun 8 17:41:50 UTC 2=
016
x86_64 x86_64 x86_64 GNU/Linux

$ lspci

01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Dell Device 1083
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D128M]
        Memory at d8000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at df000000 [disabled] [size=3D512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau


I get complete system hang:
$ journalctl --no-pager -b -1 -p err
Jul 03 05:37:30 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
086014 ffffffff (1c70820c)
Jul 03 12:37:58 dashesy.wavelet bluetoothd[881]: Failed to obtain handles f=
or
"Service Changed" characteristic
Jul 03 12:37:59 dashesy.wavelet mcelog[923]: Family 6 Model 5e CPU: only
decoding architectural errors
Jul 03 12:38:29 dashesy.wavelet spice-vdagent[1552]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 03 12:38:42 dashesy.wavelet spice-vdagent[2068]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 03 12:38:43 dashesy.wavelet pulseaudio[2190]: [pulseaudio] pid.c: Daemon
already running.
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0000260000 engine 00 [GR] client 04 [GPC0/T1_1] reason 02 [PTE] on chann=
el 6
[007fb61000 systemd-logind[917]]
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr: TRAP ch 6
[007fb61000 systemd-logind[917]]
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000049
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000049


Here from another boot:
$ journalctl --no-pager -b -2 -p err
-- Logs begin at Thu 2016-05-05 05:39:48 PDT, end at Mon 2016-07-04 10:53:42
PDT. --
Jun 29 13:43:01 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
086014 ffffffff (1b70820c)
Jun 29 20:43:16 dashesy.wavelet mcelog[895]: Family 6 Model 5e CPU: only
decoding architectural errors
Jun 29 20:43:17 dashesy.wavelet bluetoothd[885]: Failed to obtain handles f=
or
"Service Changed" characteristic
Jun 29 20:44:06 dashesy.wavelet spice-vdagent[1550]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jun 29 20:44:40 dashesy.wavelet spice-vdagent[2053]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jun 29 20:44:41 dashesy.wavelet pulseaudio[2181]: [pulseaudio] pid.c: Daemon
already running.
Jun 30 18:12:09 dashesy.wavelet systemd[1]: Failed to start dnf makecache.
Jul 03 08:56:52 dashesy.wavelet cinnamon-screensaver-dialog[14887]: gkr-pam:
the password for the login keyring was invalid.
Jul 03 12:35:23 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: write f=
ault
at 0000260000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on cha=
nnel
6 [007fb61000 systemd-logind[939]]
Jul 03 12:35:23 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...
dashesy@dashesy ~


Needless to say, recovering does not help, X hangs completely.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14676553015.787ABf.25938
Date: Mon, 4 Jul 2016 18:01:41 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c32">Commen=
t # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dashesy&#64;gmail.com" title=3D"Ehsan Azar &lt;dashesy&#64;gmail.com&gt;"> =
<span class=3D"fn">Ehsan Azar</span></a>
</span></b>
        <pre>I have the same issue:
$ uname -a
Linux dashesy.wavelet 4.5.7-200.fc23.x86_64 #1 SMP Wed Jun 8 17:41:50 UTC 2=
016
x86_64 x86_64 x86_64 GNU/Linux

$ lspci

01:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 730]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Dell Device 1083
        Flags: bus master, fast devsel, latency 0, IRQ 126
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D128M]
        Memory at d8000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at df000000 [disabled] [size=3D512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau


I get complete system hang:
$ journalctl --no-pager -b -1 -p err
Jul 03 05:37:30 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
086014 ffffffff (1c70820c)
Jul 03 12:37:58 dashesy.wavelet bluetoothd[881]: Failed to obtain handles f=
or
&quot;Service Changed&quot; characteristic
Jul 03 12:37:59 dashesy.wavelet mcelog[923]: Family 6 Model 5e CPU: only
decoding architectural errors
Jul 03 12:38:29 dashesy.wavelet spice-vdagent[1552]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 03 12:38:42 dashesy.wavelet spice-vdagent[2068]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jul 03 12:38:43 dashesy.wavelet pulseaudio[2190]: [pulseaudio] pid.c: Daemon
already running.
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: read fa=
ult
at 0000260000 engine 00 [GR] client 04 [GPC0/T1_1] reason 02 [PTE] on chann=
el 6
[007fb61000 systemd-logind[917]]
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr: TRAP ch 6
[007fb61000 systemd-logind[917]]
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC0/TEX: 80000049
Jul 04 09:12:02 dashesy.wavelet kernel: nouveau 0000:01:00.0: gr:
GPC0/TPC1/TEX: 80000049


Here from another boot:
$ journalctl --no-pager -b -2 -p err
-- Logs begin at Thu 2016-05-05 05:39:48 PDT, end at Mon 2016-07-04 10:53:42
PDT. --
Jun 29 13:43:01 dashesy.wavelet kernel: nouveau 0000:01:00.0: priv: HUB0:
086014 ffffffff (1b70820c)
Jun 29 20:43:16 dashesy.wavelet mcelog[895]: Family 6 Model 5e CPU: only
decoding architectural errors
Jun 29 20:43:17 dashesy.wavelet bluetoothd[885]: Failed to obtain handles f=
or
&quot;Service Changed&quot; characteristic
Jun 29 20:44:06 dashesy.wavelet spice-vdagent[1550]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jun 29 20:44:40 dashesy.wavelet spice-vdagent[2053]: Cannot access vdagent
virtio channel /dev/virtio-ports/com.redhat.spice.0
Jun 29 20:44:41 dashesy.wavelet pulseaudio[2181]: [pulseaudio] pid.c: Daemon
already running.
Jun 30 18:12:09 dashesy.wavelet systemd[1]: Failed to start dnf makecache.
Jul 03 08:56:52 dashesy.wavelet cinnamon-screensaver-dialog[14887]: gkr-pam:
the password for the login keyring was invalid.
Jul 03 12:35:23 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: write f=
ault
at 0000260000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on cha=
nnel
6 [007fb61000 systemd-logind[939]]
Jul 03 12:35:23 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...
dashesy&#64;dashesy ~


Needless to say, recovering does not help, X hangs completely.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14676553015.787ABf.25938--

--===============1052783799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1052783799==--
