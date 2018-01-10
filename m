From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103721] [GM107] Frequent freezes with nouveau on
	Thinkpad P50
Date: Wed, 10 Jan 2018 17:17:11 +0000
Message-ID: <bug-103721-8800-If8AbQazgb@http.bugs.freedesktop.org/>
References: <bug-103721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0585285984=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0585285984==
Content-Type: multipart/alternative; boundary="15156046312.85fd10823.6447";
 charset="UTF-8"


--15156046312.85fd10823.6447
Date: Wed, 10 Jan 2018 17:17:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

--- Comment #4 from Will Newton <will.newton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I haven't been seeing crashes as frequently any more - I switched back to
wayland, not sure if there is anything else that changed besides installing
Fedora updates - but I just had another crash:

Jan 10 16:34:16 localhost.localdomain kernel: nouveau 0000:01:00.0: disp:
0x00006671[0]: INIT_GENERIC_CONDITON: unknown 0x07
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo: w=
rite
fault at 001bc5b000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 00 [PDE] =
on
channel 14 [00fdf1d000 Xwayland[1935]]
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
channel 14: killed
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
runlist 0: scheduled for recovery
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
engine 0: scheduled for recovery
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0:
Xwayland[1935]: channel 14 killed!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15156046312.85fd10823.6447
Date: Wed, 10 Jan 2018 17:17:11 +0000
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
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">bug 10372=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
will.newton&#64;gmail.com" title=3D"Will Newton &lt;will.newton&#64;gmail.c=
om&gt;"> <span class=3D"fn">Will Newton</span></a>
</span></b>
        <pre>I haven't been seeing crashes as frequently any more - I switc=
hed back to
wayland, not sure if there is anything else that changed besides installing
Fedora updates - but I just had another crash:

Jan 10 16:34:16 localhost.localdomain kernel: nouveau 0000:01:00.0: disp:
0x00006671[0]: INIT_GENERIC_CONDITON: unknown 0x07
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo: w=
rite
fault at 001bc5b000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 00 [PDE] =
on
channel 14 [00fdf1d000 Xwayland[1935]]
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
channel 14: killed
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
runlist 0: scheduled for recovery
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0: fifo:
engine 0: scheduled for recovery
Jan 10 17:09:15 localhost.localdomain kernel: nouveau 0000:01:00.0:
Xwayland[1935]: channel 14 killed!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15156046312.85fd10823.6447--

--===============0585285984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0585285984==--
