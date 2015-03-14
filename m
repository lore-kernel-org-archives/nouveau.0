From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Sat, 14 Mar 2015 10:53:43 +0000
Message-ID: <bug-80901-8800-vuRTpEzsOX@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0343733306=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0343733306==
Content-Type: multipart/alternative; boundary="1426330423.fdFd53.9290"; charset="UTF-8"


--1426330423.fdFd53.9290
Date: Sat, 14 Mar 2015 10:53:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D80901

--- Comment #46 from K.-P. Schrage <kpschrage-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to poma from comment #45)

> And try this:
> /etc/systemd/system/gpu-fan.service=20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> [Unit]
> Description=3DGPU fan lower speed
>=20
> [Service]
> Type=3Doneshot
> ExecStart=3D/bin/sh -c '/bin/echo 1 >
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enabl=
e'
> ExecStart=3D/usr/local/bin/nvapoke e118 80000002
> StandardOutput=3Dnull
> StandardError=3Dnull
>=20
> [Install]
> WantedBy=3Dbasic.target
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> # systemctl enable gpu-fan.service
> # systemctl start gpu-fan.service
> # systemctl status gpu-fan.service
>=20
> If everything is OK:
> # systemctl reboot
> ...
>=20
> BOOT
> ...
> # systemctl status gpu-fan.service

After reboot:
[root@linux_keller kp]# systemctl status gpu-fan.service
=E2=97=8F gpu-fan.service - GPU fan lower speed
   Loaded: loaded (/etc/systemd/system/gpu-fan.service; enabled)
   Active: inactive (dead) since Sa 2015-03-14 11:40:03 CET; 33s ago
  Process: 683 ExecStart=3D/usr/local/bin/nvapoke e118 80000002 (code=3Dexi=
ted,
status=3D0/SUCCESS)
  Process: 672 ExecStart=3D/bin/sh -c /bin/echo 1 >
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable
(code=3Dexited, status=3D0/SUCCESS)
 Main PID: 683 (code=3Dexited, status=3D0/SUCCESS)

M=C3=A4r 14 11:40:03 linux_keller systemd[1]: Starting GPU fan lower speed.=
..
M=C3=A4r 14 11:40:03 linux_keller systemd[1]: Started GPU fan lower speed.
---------------
BUT: Fan speed is high, register e118 shows value 000000d8, not 00000002, as
expected. I have to restart the service manually to calm down the fan.

Let me be honest, poma: I am very grateful for all your help, but I think I=
'll
stick to the old-school method rc.local which seems to be rather
straightforward to me (although even that is now governed by systemd and no=
t so
old-school anymore).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1426330423.fdFd53.9290
Date: Sat, 14 Mar 2015 10:53:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVCF] PWM fan speed too high"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901#c46">Commen=
t # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVCF] PWM fan speed too high"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901">bug 80901<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kpschrage&#64;gmx.de" title=3D"K.-P. Schrage &lt;kpschrage&#64;gmx.de&gt;">=
 <span class=3D"fn">K.-P. Schrage</span></a>
</span></b>
        <pre>(In reply to poma from <a href=3D"show_bug.cgi?id=3D80901#c45"=
>comment #45</a>)

<span class=3D"quote">&gt; And try this:
&gt; /etc/systemd/system/gpu-fan.service=20
&gt; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
&gt; [Unit]
&gt; Description=3DGPU fan lower speed
&gt;=20
&gt; [Service]
&gt; Type=3Doneshot
&gt; ExecStart=3D/bin/sh -c '/bin/echo 1 &gt;
&gt; /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_en=
able'
&gt; ExecStart=3D/usr/local/bin/nvapoke e118 80000002
&gt; StandardOutput=3Dnull
&gt; StandardError=3Dnull
&gt;=20
&gt; [Install]
&gt; WantedBy=3Dbasic.target
&gt; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
&gt;=20
&gt; # systemctl enable gpu-fan.service
&gt; # systemctl start gpu-fan.service
&gt; # systemctl status gpu-fan.service
&gt;=20
&gt; If everything is OK:
&gt; # systemctl reboot
&gt; ...
&gt;=20
&gt; BOOT
&gt; ...
&gt; # systemctl status gpu-fan.service</span >

After reboot:
[root&#64;linux_keller kp]# systemctl status gpu-fan.service
=E2=97=8F gpu-fan.service - GPU fan lower speed
   Loaded: loaded (/etc/systemd/system/gpu-fan.service; enabled)
   Active: inactive (dead) since Sa 2015-03-14 11:40:03 CET; 33s ago
  Process: 683 ExecStart=3D/usr/local/bin/nvapoke e118 80000002 (code=3Dexi=
ted,
status=3D0/SUCCESS)
  Process: 672 ExecStart=3D/bin/sh -c /bin/echo 1 &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon1/pwm1_enable
(code=3Dexited, status=3D0/SUCCESS)
 Main PID: 683 (code=3Dexited, status=3D0/SUCCESS)

M=C3=A4r 14 11:40:03 linux_keller systemd[1]: Starting GPU fan lower speed.=
..
M=C3=A4r 14 11:40:03 linux_keller systemd[1]: Started GPU fan lower speed.
---------------
BUT: Fan speed is high, register e118 shows value 000000d8, not 00000002, as
expected. I have to restart the service manually to calm down the fan.

Let me be honest, poma: I am very grateful for all your help, but I think I=
'll
stick to the old-school method rc.local which seems to be rather
straightforward to me (although even that is now governed by systemd and no=
t so
old-school anymore).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426330423.fdFd53.9290--

--===============0343733306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0343733306==--
