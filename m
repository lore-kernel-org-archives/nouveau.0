From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Sun, 09 Dec 2018 04:59:24 +0000
Message-ID: <bug-108980-8800-DWvMqb2Mnd@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1161887209=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1161887209==
Content-Type: multipart/alternative; boundary="15443315631.Bb81Eee.25706"
Content-Transfer-Encoding: 7bit


--15443315631.Bb81Eee.25706
Date: Sun, 9 Dec 2018 04:59:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This is quite confusing. It would appear it's happening in volt's oneinit
function:

[   17.475047] kernel: nouveau 0000:08:00.0: volt: init running...
[   17.475749] kernel: nouveau 0000:08:00.0: volt: one-time init running...
[   17.476499] kernel: nouveau 0000:08:00.0: volt: couldn't find speedo val=
ue,
volting not possible
[   17.476513] kernel: nouveau 0000:08:00.0: bus: MMIO write of ffff881f FA=
ULT
at 6013d4 [ IBUS ]
[   17.477150] kernel: nouveau 0000:08:00.0: volt: one-time init completed =
in
668us
[   17.478504] kernel: nouveau 0000:08:00.0: volt: current voltage unknown
[   17.479174] kernel: nouveau 0000:08:00.0: volt: init completed in 3426us

However nothing in there could cause that... of course the notification only
comes in later (via interrupt servicing), so it may not be directly correla=
ted
to these messages.

Auditing the other common suspects, nothing in the bios will try to use any=
 of
the IO/etc commands which generally trigger these.

AHA! I have a theory.

devinit's preinit calls nvkm_lockvgac(). Can you try commenting that out?

drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c:nvkm_devinit_preinit -- =
just
comment out the call to "nvkm_lockvgac".

If that doesn't help, then I'm out of ideas, and we have to take more of a
shotgun approach -- add a

WARN() at the top of drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c:nvkm_wr=
port
and rdport, and see who's calling them. No one should be on a GF117, I beli=
eve.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15443315631.Bb81Eee.25706
Date: Sun, 9 Dec 2018 04:59:23 +0000
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
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This is quite confusing. It would appear it's happening in vol=
t's oneinit
function:

[   17.475047] kernel: nouveau 0000:08:00.0: volt: init running...
[   17.475749] kernel: nouveau 0000:08:00.0: volt: one-time init running...
[   17.476499] kernel: nouveau 0000:08:00.0: volt: couldn't find speedo val=
ue,
volting not possible
[   17.476513] kernel: nouveau 0000:08:00.0: bus: MMIO write of ffff881f FA=
ULT
at 6013d4 [ IBUS ]
[   17.477150] kernel: nouveau 0000:08:00.0: volt: one-time init completed =
in
668us
[   17.478504] kernel: nouveau 0000:08:00.0: volt: current voltage unknown
[   17.479174] kernel: nouveau 0000:08:00.0: volt: init completed in 3426us

However nothing in there could cause that... of course the notification only
comes in later (via interrupt servicing), so it may not be directly correla=
ted
to these messages.

Auditing the other common suspects, nothing in the bios will try to use any=
 of
the IO/etc commands which generally trigger these.

AHA! I have a theory.

devinit's preinit calls nvkm_lockvgac(). Can you try commenting that out?

drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c:nvkm_devinit_preinit -- =
just
comment out the call to &quot;nvkm_lockvgac&quot;.

If that doesn't help, then I'm out of ideas, and we have to take more of a
shotgun approach -- add a

WARN() at the top of drivers/gpu/drm/nouveau/nvkm/engine/disp/vga.c:nvkm_wr=
port
and rdport, and see who's calling them. No one should be on a GF117, I beli=
eve.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15443315631.Bb81Eee.25706--

--===============1161887209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1161887209==--
