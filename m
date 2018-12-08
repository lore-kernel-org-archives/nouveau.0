From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Sat, 08 Dec 2018 22:02:27 +0000
Message-ID: <bug-93629-8800-ViZfLNRrCS@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0273517777=="
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


--===============0273517777==
Content-Type: multipart/alternative; boundary="15443065471.5b06E8a.20248"
Content-Transfer-Encoding: 7bit


--15443065471.5b06E8a.20248
Date: Sat, 8 Dec 2018 22:02:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #46 from Franco Forza <ucx-hi6Y0CQ0nG0@public.gmane.org> ---
I've tested the 'NvGrUseFw=3D1' kernel cmdline argument (as stated in old
comments from 2016 above) but it doesn't help anymore (the 4 requested fw f=
iles
by nouveau during early boot were served properly and the errors about miss=
ing
firmware files vanished as well).

The system freezes maybe once per week. Mostly hard crash with two keyboard
leds blinking and hard reset after some time. Sometimes the kernel survives=
 and
dmesg can be read out. It shows this:
[ 7896.354441] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 7896.354452] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
[ 7896.354458] nouveau 0000:01:00.0: fifo: channel 2: killed
[ 7896.354464] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[ 7896.354879] nouveau 0000:01:00.0: systemd-logind[473]: channel 2 killed!

If there's something we can do to help debug this let me know.

Arch Linux 4.19.4
xf86-video-nouveau 1.0.15 modesetting
mesa 18.2.6
xorg-server 1.20.3
Nvidia GTX770 (NVE4/GK104/Kepler)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15443065471.5b06E8a.20248
Date: Sat, 8 Dec 2018 22:02:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c46">Commen=
t # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ucx&#64;gmx.net" title=3D"Franco Forza &lt;ucx&#64;gmx.net&gt;"> <span clas=
s=3D"fn">Franco Forza</span></a>
</span></b>
        <pre>I've tested the 'NvGrUseFw=3D1' kernel cmdline argument (as st=
ated in old
comments from 2016 above) but it doesn't help anymore (the 4 requested fw f=
iles
by nouveau during early boot were served properly and the errors about miss=
ing
firmware files vanished as well).

The system freezes maybe once per week. Mostly hard crash with two keyboard
leds blinking and hard reset after some time. Sometimes the kernel survives=
 and
dmesg can be read out. It shows this:
[ 7896.354441] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 7896.354452] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
[ 7896.354458] nouveau 0000:01:00.0: fifo: channel 2: killed
[ 7896.354464] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[ 7896.354879] nouveau 0000:01:00.0: systemd-logind[473]: channel 2 killed!

If there's something we can do to help debug this let me know.

Arch Linux 4.19.4
xf86-video-nouveau 1.0.15 modesetting
mesa 18.2.6
xorg-server 1.20.3
Nvidia GTX770 (NVE4/GK104/Kepler)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15443065471.5b06E8a.20248--

--===============0273517777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0273517777==--
