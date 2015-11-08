From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] [NVE6] GPU lockups
Date: Sun, 08 Nov 2015 17:54:54 +0000
Message-ID: <bug-69882-8800-TQ7VbCtLke@http.bugs.freedesktop.org/>
References: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0141196162=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69882-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0141196162==
Content-Type: multipart/alternative; boundary="1447005294.ACebeCd2.25646"; charset="UTF-8"


--1447005294.ACebeCd2.25646
Date: Sun, 8 Nov 2015 17:54:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69882

--- Comment #17 from Dainius Masili=C5=ABnas <pastas4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 119484
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D119484&action=3Dedit
Journal (fifo read fault and drm_crtc.h)

Reading a bit more into the kernel log, I see that the drm_crtc.h warning m=
ight
have been triggered by nouveau after all, because above that I have:

nouveau 0000:01:00.0: fifo: read fault at 6ff792f000 engine 07 [PBDMA0] cli=
ent
06 [HOST] reason 00 [PDE] on channel 31 [023e0c9000 xembedsniproxy[2833]]
nouveau 0000:01:00.0: fifo: fifo engine fault on channel 31, recovering...
------------[ cut here ]------------
WARNING: CPU: 0 PID: 4 at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h:73
gk104_fifo_recover_work+0x22a/0x290 [nouveau]()

Attached the systemd journal of this. The warning above is at line 1834. The
Xorg.0.log file does not have any errors or warnings at all.

I'm not sure if this should be a yet another bug report?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1447005294.ACebeCd2.25646
Date: Sun, 8 Nov 2015 17:54:54 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882#c17">Commen=
t # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE6] GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69882">bug 69882<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pastas4&#64;gmail.com" title=3D"Dainius Masili=C5=ABnas &lt;pastas4&#64;gma=
il.com&gt;"> <span class=3D"fn">Dainius Masili=C5=ABnas</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D119484=
" name=3D"attach_119484" title=3D"Journal (fifo read fault and drm_crtc.h)"=
>attachment 119484</a> <a href=3D"attachment.cgi?id=3D119484&amp;action=3De=
dit" title=3D"Journal (fifo read fault and drm_crtc.h)">[details]</a></span>
Journal (fifo read fault and drm_crtc.h)

Reading a bit more into the kernel log, I see that the drm_crtc.h warning m=
ight
have been triggered by nouveau after all, because above that I have:

nouveau 0000:01:00.0: fifo: read fault at 6ff792f000 engine 07 [PBDMA0] cli=
ent
06 [HOST] reason 00 [PDE] on channel 31 [023e0c9000 xembedsniproxy[2833]]
nouveau 0000:01:00.0: fifo: fifo engine fault on channel 31, recovering...
------------[ cut here ]------------
WARNING: CPU: 0 PID: 4 at
../drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h:73
gk104_fifo_recover_work+0x22a/0x290 [nouveau]()

Attached the systemd journal of this. The warning above is at line 1834. The
Xorg.0.log file does not have any errors or warnings at all.

I'm not sure if this should be a yet another bug report?</pre>
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

--1447005294.ACebeCd2.25646--

--===============0141196162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0141196162==--
