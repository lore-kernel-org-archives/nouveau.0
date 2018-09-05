From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107829] nouveau crash/freeze [MULTIPLE_WARP_ERRORS]
 warp 3f0009 [ILLEGAL_INSTR_ENCODING]
Date: Wed, 05 Sep 2018 12:13:14 +0000
Message-ID: <bug-107829-8800-nJBO23dYQ6@http.bugs.freedesktop.org/>
References: <bug-107829-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0407713133=="
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


--===============0407713133==
Content-Type: multipart/alternative; boundary="15361495941.2333356c2.8022"
Content-Transfer-Encoding: 7bit


--15361495941.2333356c2.8022
Date: Wed, 5 Sep 2018 12:13:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107829

--- Comment #1 from sassmann-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org ---
error on kernel 4.18.5 looked a little bit different.
[11735.012648] nouveau 0000:01:00.0: gr: TRAP ch 5 [00ff35f000 Xorg[2601]]
[11735.012660] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 000e [OOR_ADDR]
[11735.012666] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3000e [OOR_ADDR]
[11735.012672] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000000=
 []
warp 000e [OOR_ADDR]
[11735.012678] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000000=
 []
warp 000e [OOR_ADDR]
[11735.012701] nouveau 0000:01:00.0: gr: TRAP ch 5 [00ff35f000 Xorg[2601]]
[11735.012709] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 9000e [OOR_ADDR]
[11735.012715] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 2000e [OOR_ADDR]
[11735.012720] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 6000e [OOR_ADDR]
[11735.012726] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 4000e [OOR_ADDR]
[11735.013192] nouveau 0000:01:00.0: gr: TRAP ch 4 [00ff8a7000
systemd-logind[1203]]
[11735.013201] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000000=
 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[11735.013208] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000000=
 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[11735.013214] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[11735.013219] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000000=
 []
warp 10009 [ILLEGAL_INSTR_ENCODING]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15361495941.2333356c2.8022
Date: Wed, 5 Sep 2018 12:13:14 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829#c1">Commen=
t # 1</a>
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
        <pre>error on kernel 4.18.5 looked a little bit different.
[11735.012648] nouveau 0000:01:00.0: gr: TRAP ch 5 [00ff35f000 Xorg[2601]]
[11735.012660] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 000e [OOR_ADDR]
[11735.012666] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3000e [OOR_ADDR]
[11735.012672] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000000=
 []
warp 000e [OOR_ADDR]
[11735.012678] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000000=
 []
warp 000e [OOR_ADDR]
[11735.012701] nouveau 0000:01:00.0: gr: TRAP ch 5 [00ff35f000 Xorg[2601]]
[11735.012709] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 9000e [OOR_ADDR]
[11735.012715] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 2000e [OOR_ADDR]
[11735.012720] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 6000e [OOR_ADDR]
[11735.012726] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 4000e [OOR_ADDR]
[11735.013192] nouveau 0000:01:00.0: gr: TRAP ch 4 [00ff8a7000
systemd-logind[1203]]
[11735.013201] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000000=
 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[11735.013208] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000000=
 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[11735.013214] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[11735.013219] nouveau 0000:01:00.0: gr: GPC0/TPC3/MP trap: global 00000000=
 []
warp 10009 [ILLEGAL_INSTR_ENCODING]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15361495941.2333356c2.8022--

--===============0407713133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0407713133==--
