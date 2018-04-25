From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104835] MMIO read of 00000000 FAULT at 10ac08 [ IBUS
 ]
Date: Wed, 25 Apr 2018 15:15:30 +0000
Message-ID: <bug-104835-8800-GjL1pPFbrU@http.bugs.freedesktop.org/>
References: <bug-104835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2112582235=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2112582235==
Content-Type: multipart/alternative; boundary="15246693300.dFAbCC.3769"
Content-Transfer-Encoding: 7bit


--15246693300.dFAbCC.3769
Date: Wed, 25 Apr 2018 15:15:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

--- Comment #3 from Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> ---
Same here:
Hardware: Asus g751j; GTX860M
OS: Debian testing
Kernel/Nouveau version: 4.15.0-2-amd64

Here is my dmesg snippet, note the first MMIO fault isn't at the same addre=
ss.
[   17.431190] nouveau 0000:01:00.0: NVIDIA GM107 (117120a2)
[   17.589096] nouveau 0000:01:00.0: bios: version 82.07.3a.00.02
[   17.694025] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   17.694037] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 3c=
af10
[ IBUS ]
[   17.700612] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   19.000836] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   19.000837] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   19.000840] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   19.000862] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   19.001291] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   19.001300] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15246693300.dFAbCC.3769
Date: Wed, 25 Apr 2018 15:15:30 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835">bug 10483=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gary.bisson&#64;boundarydevices.com" title=3D"Gary Bisson &lt;gary.bisson&#=
64;boundarydevices.com&gt;"> <span class=3D"fn">Gary Bisson</span></a>
</span></b>
        <pre>Same here:
Hardware: Asus g751j; GTX860M
OS: Debian testing
Kernel/Nouveau version: 4.15.0-2-amd64

Here is my dmesg snippet, note the first MMIO fault isn't at the same addre=
ss.
[   17.431190] nouveau 0000:01:00.0: NVIDIA GM107 (117120a2)
[   17.589096] nouveau 0000:01:00.0: bios: version 82.07.3a.00.02
[   17.694025] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   17.694037] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 3c=
af10
[ IBUS ]
[   17.700612] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   19.000836] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   19.000837] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   19.000840] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   19.000862] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   19.001291] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   19.001300] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
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

--15246693300.dFAbCC.3769--

--===============2112582235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2112582235==--
