From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Wed, 12 Dec 2018 18:12:34 +0000
Message-ID: <bug-108980-8800-ljsS6dAHEo@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1930378546=="
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


--===============1930378546==
Content-Type: multipart/alternative; boundary="15446383541.C2fE11.21879"
Content-Transfer-Encoding: 7bit


--15446383541.C2fE11.21879
Date: Wed, 12 Dec 2018 18:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #10 from Johnny B. Goode <adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org> ---
It's like chasing rabbits.

dmesg | grep nouveau
[   14.869172] nouveau: detected PR support, will not use DSM
[   14.869201] nouveau 0000:08:00.0: enabling device (0006 -> 0007)
[   14.979493] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.005578] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.089370] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.106637] nouveau 0000:08:00.0: volt: couldn't find speedo value, volt=
ing
not possible
[   15.106651] nouveau 0000:08:00.0: bus: MMIO read of 00000000 FAULT at 02=
12cc
[ IBUS ]
[   15.753323] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   15.754432] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   15.755693] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   15.756797] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   15.760007] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   15.761582] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15446383541.C2fE11.21879
Date: Wed, 12 Dec 2018 18:12:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adamos&#64;hell.factory.net.pl" title=3D"Johnny B. Goode &lt;adamos&#64;hel=
l.factory.net.pl&gt;"> <span class=3D"fn">Johnny B. Goode</span></a>
</span></b>
        <pre>It's like chasing rabbits.

dmesg | grep nouveau
[   14.869172] nouveau: detected PR support, will not use DSM
[   14.869201] nouveau 0000:08:00.0: enabling device (0006 -&gt; 0007)
[   14.979493] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.005578] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.089370] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.106637] nouveau 0000:08:00.0: volt: couldn't find speedo value, volt=
ing
not possible
[   15.106651] nouveau 0000:08:00.0: bus: MMIO read of 00000000 FAULT at 02=
12cc
[ IBUS ]
[   15.753323] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   15.754432] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   15.755693] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   15.756797] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   15.760007] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   15.761582] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15446383541.C2fE11.21879--

--===============1930378546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1930378546==--
