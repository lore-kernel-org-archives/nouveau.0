From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Fri, 23 Mar 2018 08:47:16 +0000
Message-ID: <bug-100423-8800-p3oTgePOUo@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1644379435=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1644379435==
Content-Type: multipart/alternative; boundary="15217948360.B06EdaAb.5053"
Content-Transfer-Encoding: 7bit


--15217948360.B06EdaAb.5053
Date: Fri, 23 Mar 2018 08:47:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #17 from Mikael T <mika8560-mVuRI66OGLPQT0dZR+AlfA@public.gmane.org> ---
still there with 4.13.0-37 ubuntu on HP Spectre, Core i7 7500U, intel HD
Graphics 620, GM108M (GeForce 940MX) :

nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)=20=20=20=20=20=20=20=20
nouveau 0000:01:00.0: bios: version 82.08.62.00.15=20=20=20
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5=20=20=20=20=20=20=20=20=20=20=20=
=20=20
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 612004 [ IBUS ]=
=20=20=20=20=20=20=20
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]=
=20=20=20=20=20=20=20
 nvme0n1: p1 p2 p3=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[drm] Memory usable by graphics device =3D 4096M

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15217948360.B06EdaAb.5053
Date: Fri, 23 Mar 2018 08:47:16 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mika8560&#64;icloud.com" title=3D"Mikael T &lt;mika8560&#64;icloud.com&gt;"=
> <span class=3D"fn">Mikael T</span></a>
</span></b>
        <pre>still there with 4.13.0-37 ubuntu on HP Spectre, Core i7 7500U=
, intel HD
Graphics 620, GM108M (GeForce 940MX) :

nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)=20=20=20=20=20=20=20=20
nouveau 0000:01:00.0: bios: version 82.08.62.00.15=20=20=20
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5=20=20=20=20=20=20=20=20=20=20=20=
=20=20
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 612004 [ IBUS ]=
=20=20=20=20=20=20=20
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]=
=20=20=20=20=20=20=20
 nvme0n1: p1 p2 p3=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[drm] Memory usable by graphics device =3D 4096M</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15217948360.B06EdaAb.5053--

--===============1644379435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1644379435==--
