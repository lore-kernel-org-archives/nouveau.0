From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] [NVE6] Xorg random freeze
Date: Fri, 14 Jul 2017 08:15:36 +0000
Message-ID: <bug-92922-8800-bo6kAWLjkB@http.bugs.freedesktop.org/>
References: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0867532978=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0867532978==
Content-Type: multipart/alternative; boundary="15000201362.3bCDDC8.5251";
 charset="UTF-8"


--15000201362.3bCDDC8.5251
Date: Fri, 14 Jul 2017 08:15:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92922

--- Comment #8 from Ivan <pytnik89-JGs/UdohzUI@public.gmane.org> ---
On Arch 4.11.9-1-ARCH x86_64 with the following:
xorg-server 1.19.3-2
xf86-video-nouveau 1.0.15-1=20
(realy does't matter because of, this issue i have for a long time)
GK106 [GeForce GTX 650 Ti]
At random times but suspecting skypeforlinux-bin package (some times it's g=
oing
to core dump and do not produce any log in journal, some times it produce t=
his
kind of logs):=20

nouveau 0000:01:00.0: fifo: gr engine fault on channel 6, recovering...
nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp
nouveau 0000:01:00.0: gr: GPC1/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp
nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp
nouveau 0000:01:00.0: gr: TRAP ch 5 [003f8aa000 compton[470]]

nouveau 0000:01:00.0: compton[22165]: channel 5 killed!
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 40912c [ IBUS ]
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: channel 5: killed
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMA=
TCH]
x =3D 848,
nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMA=
TCH]
x =3D 832,
nouveau 0000:01:00.0: gr: TRAP ch 5 [003f8aa000 compton[22165]]

I think this things are related with this bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15000201362.3bCDDC8.5251
Date: Fri, 14 Jul 2017 08:15:36 +0000
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
   title=3D"NEW - [NVE6] Xorg random freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92922#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] Xorg random freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92922">bug 92922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pytnik89&#64;mail.ru" title=3D"Ivan &lt;pytnik89&#64;mail.ru&gt;"> <span cl=
ass=3D"fn">Ivan</span></a>
</span></b>
        <pre>On Arch 4.11.9-1-ARCH x86_64 with the following:
xorg-server 1.19.3-2
xf86-video-nouveau 1.0.15-1=20
(realy does't matter because of, this issue i have for a long time)
GK106 [GeForce GTX 650 Ti]
At random times but suspecting skypeforlinux-bin package (some times it's g=
oing
to core dump and do not produce any log in journal, some times it produce t=
his
kind of logs):=20

nouveau 0000:01:00.0: fifo: gr engine fault on channel 6, recovering...
nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp
nouveau 0000:01:00.0: gr: GPC1/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp
nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp
nouveau 0000:01:00.0: gr: TRAP ch 5 [003f8aa000 compton[470]]

nouveau 0000:01:00.0: compton[22165]: channel 5 killed!
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 40912c [ IBUS ]
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: channel 5: killed
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMA=
TCH]
x =3D 848,
nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMA=
TCH]
x =3D 832,
nouveau 0000:01:00.0: gr: TRAP ch 5 [003f8aa000 compton[22165]]

I think this things are related with this bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15000201362.3bCDDC8.5251--

--===============0867532978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0867532978==--
