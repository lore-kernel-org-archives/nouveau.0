From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Thu, 20 Apr 2017 14:44:24 +0000
Message-ID: <bug-100567-8800-SRltkvoZtD@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0135176602=="
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


--===============0135176602==
Content-Type: multipart/alternative; boundary="14926994640.0092067FB.26136";
 charset="UTF-8"


--14926994640.0092067FB.26136
Date: Thu, 20 Apr 2017 14:44:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #5 from kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org ---
Created attachment 130945
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130945&action=3Dedit
journalctl -kb of CTXSW_TIMEOUT on 4.10.10

Can reproduce on Linux 4.10.10 as well. Along with the initial CTXSW_TIMEOU=
T,
it seems to hang a few kernel tasks relating to atomic commits.

Relevant(?) snippet:

Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: TRAP ch 3 [007f7c20=
00
X[3611]]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC1/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC2/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: TRAP ch 3 [007f7c20=
00
X[3611]]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC1/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC1/TPC1/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC2/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC3/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC3/TPC1/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3d000d [OOR_REG]
Apr 20 10:06:07 jenny kernel: nouveau 0000:02:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
Apr 20 10:06:07 jenny kernel: nouveau 0000:02:00.0: fifo: gr engine fault on
channel 6, recovering...
Apr 20 10:06:18 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:18 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:19 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:19 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:19 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:20 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:20 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:20 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:21 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14926994640.0092067FB.26136
Date: Thu, 20 Apr 2017 14:44:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kevin&#64;potatofrom.space" title=3D"kevin&#64;potatofrom.space">kevin&#64;=
potatofrom.space</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130945=
" name=3D"attach_130945" title=3D"journalctl -kb of CTXSW_TIMEOUT on 4.10.1=
0">attachment 130945</a> <a href=3D"attachment.cgi?id=3D130945&amp;action=
=3Dedit" title=3D"journalctl -kb of CTXSW_TIMEOUT on 4.10.10">[details]</a>=
</span>
journalctl -kb of CTXSW_TIMEOUT on 4.10.10

Can reproduce on Linux 4.10.10 as well. Along with the initial CTXSW_TIMEOU=
T,
it seems to hang a few kernel tasks relating to atomic commits.

Relevant(?) snippet:

Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: TRAP ch 3 [007f7c20=
00
X[3611]]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC1/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC2/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: TRAP ch 3 [007f7c20=
00
X[3611]]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC1/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC1/TPC1/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC2/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC3/TPC0/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Apr 20 10:06:03 jenny kernel: nouveau 0000:02:00.0: gr: GPC3/TPC1/MP trap:
global 00000004 [MULTIPLE_WARP_ERRORS] warp 3d000d [OOR_REG]
Apr 20 10:06:07 jenny kernel: nouveau 0000:02:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
Apr 20 10:06:07 jenny kernel: nouveau 0000:02:00.0: fifo: gr engine fault on
channel 6, recovering...
Apr 20 10:06:18 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:18 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:19 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:19 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:19 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:20 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:20 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:20 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
Apr 20 10:06:21 jenny kernel: nouveau 0000:02:00.0: X[3611]: nv50cal_space:=
 -16
...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14926994640.0092067FB.26136--

--===============0135176602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0135176602==--
