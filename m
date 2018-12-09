From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Sun, 09 Dec 2018 09:19:02 +0000
Message-ID: <bug-108980-8800-GTMs723j6K@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0151077156=="
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


--===============0151077156==
Content-Type: multipart/alternative; boundary="15443471421.01d4Cf80D.30405"
Content-Transfer-Encoding: 7bit


--15443471421.01d4Cf80D.30405
Date: Sun, 9 Dec 2018 09:19:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #6 from Johnny B. Goode <adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org> ---
After commenting out "nvkm_lockvgac"

dmesg | grep nouveau
[   15.460433] nouveau: detected PR support, will not use DSM
[   15.460460] nouveau 0000:08:00.0: enabling device (0006 -> 0007)
[   15.542557] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.572939] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.656684] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.674657] nouveau 0000:08:00.0: volt: couldn't find speedo value, volt=
ing
not possible
[   15.674671] nouveau 0000:08:00.0: bus: MMIO read of 00000000 FAULT at 08=
4048
[ IBUS ]
[   16.325269] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   16.326428] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   16.327626] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   16.328896] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   16.331925] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   16.333193] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1

Now it is MMIO read of 00000000 FAULT at 084048 [ IBUS ]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15443471421.01d4Cf80D.30405
Date: Sun, 9 Dec 2018 09:19:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adamos&#64;hell.factory.net.pl" title=3D"Johnny B. Goode &lt;adamos&#64;hel=
l.factory.net.pl&gt;"> <span class=3D"fn">Johnny B. Goode</span></a>
</span></b>
        <pre>After commenting out &quot;nvkm_lockvgac&quot;

dmesg | grep nouveau
[   15.460433] nouveau: detected PR support, will not use DSM
[   15.460460] nouveau 0000:08:00.0: enabling device (0006 -&gt; 0007)
[   15.542557] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   15.572939] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   15.656684] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.674657] nouveau 0000:08:00.0: volt: couldn't find speedo value, volt=
ing
not possible
[   15.674671] nouveau 0000:08:00.0: bus: MMIO read of 00000000 FAULT at 08=
4048
[ IBUS ]
[   16.325269] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   16.326428] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   16.327626] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   16.328896] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   16.331925] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   16.333193] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 1

Now it is MMIO read of 00000000 FAULT at 084048 [ IBUS ]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15443471421.01d4Cf80D.30405--

--===============0151077156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0151077156==--
