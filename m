From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92971] [GF110] KDE plasma locks randomly due to
 crash of nouveau driver
Date: Mon, 16 Nov 2015 23:37:25 +0000
Message-ID: <bug-92971-8800-v3589qFftA@http.bugs.freedesktop.org/>
References: <bug-92971-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0874390042=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92971-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0874390042==
Content-Type: multipart/alternative; boundary="1447717044.d08c8Af70.24838"; charset="UTF-8"


--1447717044.d08c8Af70.24838
Date: Mon, 16 Nov 2015 23:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92971

--- Comment #5 from Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> ---
hello,

it is kde5  (KF5).=20
With opensuse Tumbleweed we do a global update (snapshot). Difficult to see
thereafter if this is due to KDE or the kernel.=20

Three examples from journalctl:

the very first error after the boot message: the lock occurred during
reactivation of the session:

Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: timeout at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpf=
ifo_engine_fini()!
Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: channel 14
[xembedsniproxy[2209]] kick timeout
Nov 14 18:02:58 hpprol2 kernel: nouveau:
xembedsniproxy[2209]:cccc0000:0000906f: detach gr failed, -16
Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: timeout at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpf=
ifo_engine_fini()!
Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: channel 20
[xembedsniproxy[2229]] kick timeout
Nov 14 18:02:58 hpprol2 kernel: nouveau:
xembedsniproxy[2229]:cccc0000:0000906f: detach gr failed, -16
Nov 14 18:02:59 hpprol2 audit[2124]: ANOM_ABEND auid=3D1000 uid=3D1000 gid=
=3D100
ses=3D1 pid=3D2124 comm=3D"kactivitymanage" exe=3D"/usr/bin/kactivitymanage=
rd" sig=3D11


2) the first errors with a corrupt screen followed by a lock when loading Y=
ast

Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 y2controlcenter[25892]] subc 0 mthd 0000 data 00000000
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8004000=
0 []
ch 30 [007e6ab000 y2controlcenter[25892]] subc 0 mthd 0000 data 00000000
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 y2controlcenter[25892]] subc 0 mthd 0000 data 00000000
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: read fault at
0000000000 engine 07 [PFIFO] client 06 [PFIFO] reason 00 [PT_NOT_PRESENT] on
channel 30 [007e6ab000 y2controlcenter[25892]]
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: fifo engine fau=
lt
on channel 30, recovering...
Nov 15 10:36:37 hpprol2 kernel: nouveau 0000:0a:00.0: DRM: GPU lockup -
switching to software fbcon

3) the system locked in the night 15-16 and the first error message are
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8004000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000


there are a lot of this messages  and then errors about kscreenlocker=20
ov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: read fault at
2000000000 engine 07 [PFIFO] client 06 [PFIFO] reason 00 [PT_NOT_PRESENT] on
channel 30 [007e6ab000 kscreenlocker_g[14277]]
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: fifo engine fau=
lt
on channel 30, recovering...

the only common process in all case is nouveau=20
Regards
Philippe

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447717044.d08c8Af70.24838
Date: Mon, 16 Nov 2015 23:37:24 +0000
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
   title=3D"NEW - [GF110] KDE plasma locks randomly due to crash of nouveau=
 driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GF110] KDE plasma locks randomly due to crash of nouveau=
 driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92971">bug 92971<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>hello,

it is kde5  (KF5).=20
With opensuse Tumbleweed we do a global update (snapshot). Difficult to see
thereafter if this is due to KDE or the kernel.=20

Three examples from journalctl:

the very first error after the boot message: the lock occurred during
reactivation of the session:

Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: timeout at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpf=
ifo_engine_fini()!
Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: channel 14
[xembedsniproxy[2209]] kick timeout
Nov 14 18:02:58 hpprol2 kernel: nouveau:
xembedsniproxy[2209]:cccc0000:0000906f: detach gr failed, -16
Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: timeout at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c:66/gf100_fifo_gpf=
ifo_engine_fini()!
Nov 14 18:02:58 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: channel 20
[xembedsniproxy[2229]] kick timeout
Nov 14 18:02:58 hpprol2 kernel: nouveau:
xembedsniproxy[2229]:cccc0000:0000906f: detach gr failed, -16
Nov 14 18:02:59 hpprol2 audit[2124]: ANOM_ABEND auid=3D1000 uid=3D1000 gid=
=3D100
ses=3D1 pid=3D2124 comm=3D&quot;kactivitymanage&quot; exe=3D&quot;/usr/bin/=
kactivitymanagerd&quot; sig=3D11


2) the first errors with a corrupt screen followed by a lock when loading Y=
ast

Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 y2controlcenter[25892]] subc 0 mthd 0000 data 00000000
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8004000=
0 []
ch 30 [007e6ab000 y2controlcenter[25892]] subc 0 mthd 0000 data 00000000
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 y2controlcenter[25892]] subc 0 mthd 0000 data 00000000
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: read fault at
0000000000 engine 07 [PFIFO] client 06 [PFIFO] reason 00 [PT_NOT_PRESENT] on
channel 30 [007e6ab000 y2controlcenter[25892]]
Nov 15 10:36:29 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: fifo engine fau=
lt
on channel 30, recovering...
Nov 15 10:36:37 hpprol2 kernel: nouveau 0000:0a:00.0: DRM: GPU lockup -
switching to software fbcon

3) the system locked in the night 15-16 and the first error message are
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8004000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: PBDMA0: 8000000=
0 []
ch 30 [007e6ab000 kscreenlocker_g[14277]] subc 0 mthd 0000 data 00000000


there are a lot of this messages  and then errors about kscreenlocker=20
ov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: read fault at
2000000000 engine 07 [PFIFO] client 06 [PFIFO] reason 00 [PT_NOT_PRESENT] on
channel 30 [007e6ab000 kscreenlocker_g[14277]]
Nov 16 00:10:32 hpprol2 kernel: nouveau 0000:0a:00.0: fifo: fifo engine fau=
lt
on channel 30, recovering...

the only common process in all case is nouveau=20
Regards
Philippe</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447717044.d08c8Af70.24838--

--===============0874390042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0874390042==--
