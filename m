From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107829] nouveau crash/freeze [MULTIPLE_WARP_ERRORS]
 warp 3f0009 [ILLEGAL_INSTR_ENCODING]
Date: Thu, 10 Jan 2019 16:45:35 +0000
Message-ID: <bug-107829-8800-k8i9XVXVir@http.bugs.freedesktop.org/>
References: <bug-107829-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1959430804=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107829-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1959430804==
Content-Type: multipart/alternative; boundary="15471387352.cfef0ACC.31619"
Content-Transfer-Encoding: 7bit


--15471387352.cfef0ACC.31619
Date: Thu, 10 Jan 2019 16:45:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107829

--- Comment #7 from sassmann-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org ---
Happened again, this time while starting firefox. No tabs opened yet.
nouveau 0000:01:00.0: disp: 0x000064a8[0]: INIT_GENERIC_CONDITON: unknown 0=
x07
nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: channel 4: killed
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: systemd-logind[1385]: channel 4 killed!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15471387352.cfef0ACC.31619
Date: Thu, 10 Jan 2019 16:45:35 +0000
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
   title=3D"NEW - nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp 3f0009 [=
ILLEGAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau crash/freeze [MULTIPLE_WARP_ERRORS] warp 3f0009 [=
ILLEGAL_INSTR_ENCODING]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829">bug 10782=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sassmann&#64;redhat.com" title=3D"sassmann&#64;redhat.com">sassmann&#64;red=
hat.com</a>
</span></b>
        <pre>Happened again, this time while starting firefox. No tabs open=
ed yet.
nouveau 0000:01:00.0: disp: 0x000064a8[0]: INIT_GENERIC_CONDITON: unknown 0=
x07
nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: channel 4: killed
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:01:00.0: systemd-logind[1385]: channel 4 killed!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15471387352.cfef0ACC.31619--

--===============1959430804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1959430804==--
