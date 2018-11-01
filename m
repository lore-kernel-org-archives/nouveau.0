From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108500] Crash when creating a depth buffer on
 GeForce 320M
Date: Thu, 01 Nov 2018 18:16:42 +0000
Message-ID: <bug-108500-8800-DJFZhnAcQR@http.bugs.freedesktop.org/>
References: <bug-108500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2109149916=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2109149916==
Content-Type: multipart/alternative; boundary="15410962010.feFaeA.16741"
Content-Transfer-Encoding: 7bit


--15410962010.feFaeA.16741
Date: Thu, 1 Nov 2018 18:16:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

--- Comment #9 from Timo Wiren <timo.wiren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #8)
> Could you edit
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c:nv50_vmm_valid, and cha=
nge
> it to set aper =3D 0 in the if (ram->stolen) case (so aper=3D0 in both of=
 the
> VRAM cases).

I tested it on kernel 4.18.16 and it caused a crash/hang on bootup. Some of=
 the
log messages (copied by hand):

nouveau 0000:04:00.0: fb: trapped read at 015bc9dedc on channel 2 [0fba0000
DRM] engine 05 [PFIFO] client 08 [PFIFO_READ] subclient 00 [PUSHBUF] reason
0000000b [PT_NOT_PRESENT]
nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 2 [DRM] get 015c25a7a4 put
015c25a7a4 ib_get 000000a2 ib_put 000000a7 state a0000000 (err: IB_EMPTY)
nouveau 0000:04:00.0: DRM: GPU lockup - switching to software fbcon
nouveau 0000:04:00.0: fb: trapped write at 0100131fc0 on channel -1 [0fedf0=
00
unknown] engine 06 [BAR] client 04 [PFIFO_WRITE] subclient 01 [IN] reason
000000b [VRAM_LIMIT]

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15410962010.feFaeA.16741
Date: Thu, 1 Nov 2018 18:16:41 +0000
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
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">bug 10850=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
timo.wiren&#64;gmail.com" title=3D"Timo Wiren &lt;timo.wiren&#64;gmail.com&=
gt;"> <span class=3D"fn">Timo Wiren</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D108=
500#c8">comment #8</a>)
<span class=3D"quote">&gt; Could you edit
&gt; drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c:nv50_vmm_valid, and =
change
&gt; it to set aper =3D 0 in the if (ram-&gt;stolen) case (so aper=3D0 in b=
oth of the
&gt; VRAM cases).</span >

I tested it on kernel 4.18.16 and it caused a crash/hang on bootup. Some of=
 the
log messages (copied by hand):

nouveau 0000:04:00.0: fb: trapped read at 015bc9dedc on channel 2 [0fba0000
DRM] engine 05 [PFIFO] client 08 [PFIFO_READ] subclient 00 [PUSHBUF] reason
0000000b [PT_NOT_PRESENT]
nouveau 0000:04:00.0: fifo: DMA_PUSHER - ch 2 [DRM] get 015c25a7a4 put
015c25a7a4 ib_get 000000a2 ib_put 000000a7 state a0000000 (err: IB_EMPTY)
nouveau 0000:04:00.0: DRM: GPU lockup - switching to software fbcon
nouveau 0000:04:00.0: fb: trapped write at 0100131fc0 on channel -1 [0fedf0=
00
unknown] engine 06 [BAR] client 04 [PFIFO_WRITE] subclient 01 [IN] reason
000000b [VRAM_LIMIT]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15410962010.feFaeA.16741--

--===============2109149916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2109149916==--
