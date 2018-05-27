From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Sun, 27 May 2018 09:30:20 +0000
Message-ID: <bug-93629-8800-H0zJzI5jKd@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1232849214=="
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


--===============1232849214==
Content-Type: multipart/alternative; boundary="15274134202.f52AaD.22147"
Content-Transfer-Encoding: 7bit


--15274134202.f52AaD.22147
Date: Sun, 27 May 2018 09:30:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #44 from Z=C3=A9fling <zefling-6V45rIXBuxjR7s880joybQ@public.gmane.org> ---
Same problem for me, with Kubuntu 18.04 with nouveau and GF770:

~$ journalctl --no-pager -b -2 -p err
-- Logs begin at Thu 2018-05-10 18:08:45 CEST, end at Sun 2018-05-27 11:27:=
52
CEST. --
mai 27 08:36:29 zefling-1 kernel: [Firmware Bug]: TSC_DEADLINE disabled due=
 to
Errata; please update microcode to version: 0x22 (or later)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: [DSSP] Namespace lookup failu=
re,
AE_NOT_FOUND (20170831/psargs-364)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: Method parse/execution failed
\_SB.PCI0.SAT0.SPT4._GTF, AE_NOT_FOUND (20170831/psparse-550)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: [DSSP] Namespace lookup failu=
re,
AE_NOT_FOUND (20170831/psargs-364)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: Method parse/execution failed
\_SB.PCI0.SAT0.SPT4._GTF, AE_NOT_FOUND (20170831/psparse-550)
mai 27 08:36:35 zefling-1 spice-vdagent[1617]: Cannot access vdagent virtio
channel /dev/virtio-ports/com.redhat.spice.0
mai 27 08:36:35 zefling-1 pulseaudio[1708]: [pulseaudio] pid.c: Daemon alre=
ady
running.
mai 27 08:36:35 zefling-1 pulseaudio[1710]: [pulseaudio] pid.c: Daemon alre=
ady
running.
mai 27 08:37:00 zefling-1 pulseaudio[1474]: [pulseaudio] bluez5-util.c:
GetManagedObjects() failed: org.freedesktop.DBus.Error.TimedOut: Failed to
activate service 'org.bluez': timed out (service_start_timeout=3D25000ms)
mai 27 08:57:30 zefling-1 kernel: nouveau 0000:01:00.0: fifo: write fault at
00002e0000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on channe=
l 2
[007f9a2000 Xorg[931]]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15274134202.f52AaD.22147
Date: Sun, 27 May 2018 09:30:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c44">Commen=
t # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
zefling&#64;ikilote.net" title=3D"Z=C3=A9fling &lt;zefling&#64;ikilote.net&=
gt;"> <span class=3D"fn">Z=C3=A9fling</span></a>
</span></b>
        <pre>Same problem for me, with Kubuntu 18.04 with nouveau and GF770:

~$ journalctl --no-pager -b -2 -p err
-- Logs begin at Thu 2018-05-10 18:08:45 CEST, end at Sun 2018-05-27 11:27:=
52
CEST. --
mai 27 08:36:29 zefling-1 kernel: [Firmware Bug]: TSC_DEADLINE disabled due=
 to
Errata; please update microcode to version: 0x22 (or later)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: [DSSP] Namespace lookup failu=
re,
AE_NOT_FOUND (20170831/psargs-364)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: Method parse/execution failed
\_SB.PCI0.SAT0.SPT4._GTF, AE_NOT_FOUND (20170831/psparse-550)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: [DSSP] Namespace lookup failu=
re,
AE_NOT_FOUND (20170831/psargs-364)
mai 27 08:36:29 zefling-1 kernel: ACPI Error: Method parse/execution failed
\_SB.PCI0.SAT0.SPT4._GTF, AE_NOT_FOUND (20170831/psparse-550)
mai 27 08:36:35 zefling-1 spice-vdagent[1617]: Cannot access vdagent virtio
channel /dev/virtio-ports/com.redhat.spice.0
mai 27 08:36:35 zefling-1 pulseaudio[1708]: [pulseaudio] pid.c: Daemon alre=
ady
running.
mai 27 08:36:35 zefling-1 pulseaudio[1710]: [pulseaudio] pid.c: Daemon alre=
ady
running.
mai 27 08:37:00 zefling-1 pulseaudio[1474]: [pulseaudio] bluez5-util.c:
GetManagedObjects() failed: org.freedesktop.DBus.Error.TimedOut: Failed to
activate service 'org.bluez': timed out (service_start_timeout=3D25000ms)
mai 27 08:57:30 zefling-1 kernel: nouveau 0000:01:00.0: fifo: write fault at
00002e0000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on channe=
l 2
[007f9a2000 Xorg[931]]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15274134202.f52AaD.22147--

--===============1232849214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1232849214==--
