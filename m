From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Sat, 22 Dec 2018 11:41:16 +0000
Message-ID: <bug-100567-8800-xNF4oNmTJi@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1295005641=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1295005641==
Content-Type: multipart/alternative; boundary="15454788761.dcE9.25420"
Content-Transfer-Encoding: 7bit


--15454788761.dcE9.25420
Date: Sat, 22 Dec 2018 11:41:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #17 from sassmann-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org ---
Same issue with Lenovo P50 on 4.20-rc7.

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GLM [Quad=
ro
M1000M] [10de:13b1] (rev a2) (prog-if 00 [VGA controller])

[162840.653595] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[162840.653610] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recove=
ry
[162840.653621] nouveau 0000:01:00.0: fifo: channel 4: killed
[162840.653631] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[162840.654013] nouveau 0000:01:00.0: systemd-logind[1383]: channel 4 kille=
d!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15454788761.dcE9.25420
Date: Sat, 22 Dec 2018 11:41:16 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sassmann&#64;redhat.com" title=3D"sassmann&#64;redhat.com">sassmann&#64;red=
hat.com</a>
</span></b>
        <pre>Same issue with Lenovo P50 on 4.20-rc7.

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GLM [Quad=
ro
M1000M] [10de:13b1] (rev a2) (prog-if 00 [VGA controller])

[162840.653595] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[162840.653610] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recove=
ry
[162840.653621] nouveau 0000:01:00.0: fifo: channel 4: killed
[162840.653631] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
[162840.654013] nouveau 0000:01:00.0: systemd-logind[1383]: channel 4 kille=
d!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15454788761.dcE9.25420--

--===============1295005641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1295005641==--
