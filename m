From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Mon, 25 Jul 2016 05:00:42 +0000
Message-ID: <bug-94990-8800-lggbxaerMi@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0350843995=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0350843995==
Content-Type: multipart/alternative; boundary="14694228425.FA27.13573";
 charset="UTF-8"


--14694228425.FA27.13573
Date: Mon, 25 Jul 2016 05:00:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #39 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Tried on a 4GB GM206 / 4.6.4, it passed without any issue:

[   12.410603] nouveau 0000:01:00.0: NVIDIA GM206 (1262f0a1)
[   12.493772] nouveau 0000:01:00.0: bios: version 84.06.01.0c.00
[   12.494306] nouveau 0000:01:00.0: disp: dcb 15 type 8 unknown
[   12.506916] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[   12.512991] INST: ffbd5000
[   12.513137]  PGD: ffbcd000
[   12.526018]  WPR: ffba0000
[   12.528160] BLOB: ffbca000
[   12.532053] BLOB: ffbc9000
[   12.532180] [TTM] Zone  kernel: Available graphics memory: 1024460 kiB

... and then I could run glmark2 without any error.

Tried messing with the WPR address to make it invalid and see if I could get
the same error. It happens to be different:

[   31.729804] nouveau 0000:01:00.0: priv: GPC0: 419df4 00000000 (1b40820e)
[   31.729846] nouveau 0000:01:00.0: priv: GPC1: 419df4 00000000 (1b40820e)
[   31.729894] nouveau 0000:01:00.0: priv: GPC0: 505884 c0000000 (1a40820e)
[   31.729924] nouveau 0000:01:00.0: priv: GPC1: 50d884 c0000000 (1a40820e)
[   33.731990] nouveau 0000:01:00.0: timeout at
../drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1469/gf100_gr_init_ctxctl=
()!
[   33.732035] nouveau 0000:01:00.0: gr: init failed, -16

So not sure where this REGION_VIOLATION comes from. Guess I will need to pi=
ng
the fw people at NVIDIA...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14694228425.FA27.13573
Date: Mon, 25 Jul 2016 05:00:42 +0000
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
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c39">Commen=
t # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gnurou&#64;gmail.com" title=3D"Alexandre Courbot &lt;gnurou&#64;gmail.com&g=
t;"> <span class=3D"fn">Alexandre Courbot</span></a>
</span></b>
        <pre>Tried on a 4GB GM206 / 4.6.4, it passed without any issue:

[   12.410603] nouveau 0000:01:00.0: NVIDIA GM206 (1262f0a1)
[   12.493772] nouveau 0000:01:00.0: bios: version 84.06.01.0c.00
[   12.494306] nouveau 0000:01:00.0: disp: dcb 15 type 8 unknown
[   12.506916] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[   12.512991] INST: ffbd5000
[   12.513137]  PGD: ffbcd000
[   12.526018]  WPR: ffba0000
[   12.528160] BLOB: ffbca000
[   12.532053] BLOB: ffbc9000
[   12.532180] [TTM] Zone  kernel: Available graphics memory: 1024460 kiB

... and then I could run glmark2 without any error.

Tried messing with the WPR address to make it invalid and see if I could get
the same error. It happens to be different:

[   31.729804] nouveau 0000:01:00.0: priv: GPC0: 419df4 00000000 (1b40820e)
[   31.729846] nouveau 0000:01:00.0: priv: GPC1: 419df4 00000000 (1b40820e)
[   31.729894] nouveau 0000:01:00.0: priv: GPC0: 505884 c0000000 (1a40820e)
[   31.729924] nouveau 0000:01:00.0: priv: GPC1: 50d884 c0000000 (1a40820e)
[   33.731990] nouveau 0000:01:00.0: timeout at
../drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1469/gf100_gr_init_ctxctl=
()!
[   33.732035] nouveau 0000:01:00.0: gr: init failed, -16

So not sure where this REGION_VIOLATION comes from. Guess I will need to pi=
ng
the fw people at NVIDIA...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14694228425.FA27.13573--

--===============0350843995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0350843995==--
