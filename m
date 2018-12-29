From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Sat, 29 Dec 2018 18:43:05 +0000
Message-ID: <bug-100423-8800-EquPuoITA3@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0495480730=="
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


--===============0495480730==
Content-Type: multipart/alternative; boundary="15461089852.6ddD8beFf.28443"
Content-Transfer-Encoding: 7bit


--15461089852.6ddD8beFf.28443
Date: Sat, 29 Dec 2018 18:43:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #26 from Jan <jv1-CmkmPbn3yAE@public.gmane.org> ---
I have a similar issue with my NP900X5N laptop with Kaby Lake and 940MX car=
d,
on 4.20.0 and Kali Linux.

My output:
root@kali:/etc/modprobe.d# dmesg | grep nouveau=20=20
[   35.888423] nouveau: detected PR support, will not use DSM
[   35.888447] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[   35.888582] nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)
[   35.900141] nouveau 0000:01:00.0: bios: version 82.08.67.00.04
[   35.984081] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[   35.984104] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[   35.997510] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   36.035684] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   36.035686] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   36.035688] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   36.035690] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   36.036798] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   36.036915] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[   37.551790] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15461089852.6ddD8beFf.28443
Date: Sat, 29 Dec 2018 18:43:05 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jv1&#64;home.nl" title=3D"Jan &lt;jv1&#64;home.nl&gt;"> <span class=3D"fn">=
Jan</span></a>
</span></b>
        <pre>I have a similar issue with my NP900X5N laptop with Kaby Lake =
and 940MX card,
on 4.20.0 and Kali Linux.

My output:
root&#64;kali:/etc/modprobe.d# dmesg | grep nouveau=20=20
[   35.888423] nouveau: detected PR support, will not use DSM
[   35.888447] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[   35.888582] nouveau 0000:01:00.0: NVIDIA GM108 (1180d0a2)
[   35.900141] nouveau 0000:01:00.0: bios: version 82.08.67.00.04
[   35.984081] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[   35.984104] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[   35.997510] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   36.035684] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   36.035686] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   36.035688] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   36.035690] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   36.036798] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   36.036915] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[   37.551790] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15461089852.6ddD8beFf.28443--

--===============0495480730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0495480730==--
