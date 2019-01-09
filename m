From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107829] nouveau crash/freeze [MULTIPLE_WARP_ERRORS]
 warp 3f0009 [ILLEGAL_INSTR_ENCODING]
Date: Wed, 09 Jan 2019 17:52:27 +0000
Message-ID: <bug-107829-8800-V1iiNxCr47@http.bugs.freedesktop.org/>
References: <bug-107829-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0205555820=="
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


--===============0205555820==
Content-Type: multipart/alternative; boundary="15470563470.d23f4543B.6413"
Content-Transfer-Encoding: 7bit


--15470563470.d23f4543B.6413
Date: Wed, 9 Jan 2019 17:52:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107829

--- Comment #6 from sassmann-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org ---
So I went ahead and tried 5.0-rc1, playing video with chromium to put some =
load
on the gpu. After few hours it froze again.

[ 6603.232849] nouveau 0000:01:00.0: gr: TRAP ch 4 [00ff8a9000
systemd-logind[1385]]
[ 6603.232865] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000000=
 []
warp 3e0001 [STACK_ERROR]
[ 6603.246125] nouveau 0000:01:00.0: gr: TRAP ch 4 [00ff8a9000
systemd-logind[1385]]
[ 6603.246137] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000000=
 []
warp 3d0001 [STACK_ERROR]

I then logged in via ssh and chromium was running with 100% cpu. After kill=
ing
chromium the log went a bit further, but the screen did not recover and sta=
yed
frozen.

[ 6758.631306] nouveau 0000:01:00.0: Xorg[6494]: failed to idle channel 8
[Xorg[6494]]
[ 6773.631329] nouveau 0000:01:00.0: Xorg[6494]: failed to idle channel 8
[Xorg[6494]]
[ 6773.632334] nouveau 0000:01:00.0: fifo: fault 00 [READ] at 00000000000c2=
000
engine 07 [HOST0] client 06 [HUB/HOST] reason 42 [] on channel 8 [00fec69000
Xorg[6494]]
[ 6773.632347] nouveau 0000:01:00.0: fifo: channel 8: killed
[ 6773.632352] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
[ 6773.632366] nouveau 0000:01:00.0: fifo: engine 5: scheduled for recovery
[ 6773.632378] nouveau 0000:01:00.0: Xorg[6494]: channel 8 killed!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15470563470.d23f4543B.6413
Date: Wed, 9 Jan 2019 17:52:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107829#c6">Commen=
t # 6</a>
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
        <pre>So I went ahead and tried 5.0-rc1, playing video with chromium=
 to put some load
on the gpu. After few hours it froze again.

[ 6603.232849] nouveau 0000:01:00.0: gr: TRAP ch 4 [00ff8a9000
systemd-logind[1385]]
[ 6603.232865] nouveau 0000:01:00.0: gr: GPC0/TPC0/MP trap: global 00000000=
 []
warp 3e0001 [STACK_ERROR]
[ 6603.246125] nouveau 0000:01:00.0: gr: TRAP ch 4 [00ff8a9000
systemd-logind[1385]]
[ 6603.246137] nouveau 0000:01:00.0: gr: GPC0/TPC2/MP trap: global 00000000=
 []
warp 3d0001 [STACK_ERROR]

I then logged in via ssh and chromium was running with 100% cpu. After kill=
ing
chromium the log went a bit further, but the screen did not recover and sta=
yed
frozen.

[ 6758.631306] nouveau 0000:01:00.0: Xorg[6494]: failed to idle channel 8
[Xorg[6494]]
[ 6773.631329] nouveau 0000:01:00.0: Xorg[6494]: failed to idle channel 8
[Xorg[6494]]
[ 6773.632334] nouveau 0000:01:00.0: fifo: fault 00 [READ] at 00000000000c2=
000
engine 07 [HOST0] client 06 [HUB/HOST] reason 42 [] on channel 8 [00fec69000
Xorg[6494]]
[ 6773.632347] nouveau 0000:01:00.0: fifo: channel 8: killed
[ 6773.632352] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
[ 6773.632366] nouveau 0000:01:00.0: fifo: engine 5: scheduled for recovery
[ 6773.632378] nouveau 0000:01:00.0: Xorg[6494]: channel 8 killed!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15470563470.d23f4543B.6413--

--===============0205555820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0205555820==--
