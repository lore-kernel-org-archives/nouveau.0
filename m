From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Thu, 13 Dec 2018 18:09:03 +0000
Message-ID: <bug-108980-8800-jVxjVYNDPw@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650905540=="
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


--===============1650905540==
Content-Type: multipart/alternative; boundary="15447245420.A4eF.12274"
Content-Transfer-Encoding: 7bit


--15447245420.A4eF.12274
Date: Thu, 13 Dec 2018 18:09:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #13 from Johnny B. Goode <adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org> ---
Now it is clean

dmesg | grep nouveau
[   14.413889] nouveau: detected PR support, will not use DSM
[   14.414961] nouveau 0000:08:00.0: enabling device (0006 -> 0007)
[   14.416192] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   14.438204] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   14.522882] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.185221] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   15.186151] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   15.187077] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   15.188001] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   15.190738] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   15.191642] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15447245420.A4eF.12274
Date: Thu, 13 Dec 2018 18:09:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adamos&#64;hell.factory.net.pl" title=3D"Johnny B. Goode &lt;adamos&#64;hel=
l.factory.net.pl&gt;"> <span class=3D"fn">Johnny B. Goode</span></a>
</span></b>
        <pre>Now it is clean

dmesg | grep nouveau
[   14.413889] nouveau: detected PR support, will not use DSM
[   14.414961] nouveau 0000:08:00.0: enabling device (0006 -&gt; 0007)
[   14.416192] nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[   14.438204] nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[   14.522882] nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[   15.185221] nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[   15.186151] nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[   15.187077] nouveau 0000:08:00.0: DRM: Pointer to TMDS table invalid
[   15.188001] nouveau 0000:08:00.0: DRM: DCB version 4.0
[   15.190738] nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer copies
[   15.191642] [drm] Initialized nouveau 1.3.1 20120801 for 0000:08:00.0 on
minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15447245420.A4eF.12274--

--===============1650905540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1650905540==--
