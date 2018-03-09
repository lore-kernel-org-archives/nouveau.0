From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Fri, 09 Mar 2018 18:51:31 +0000
Message-ID: <bug-98386-8800-jIK90tXOYw@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1050687761=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1050687761==
Content-Type: multipart/alternative; boundary="15206214912.abd56f26.353"
Content-Transfer-Encoding: 7bit


--15206214912.abd56f26.353
Date: Fri, 9 Mar 2018 18:51:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #19 from baybay <lujofu-tJ6BQdzZN76ZuzBka8ofvg@public.gmane.org> ---
I own an HP Envy 17 with a Geforce 750M and i'm still getting this bug as of
latest stable version.

[    8.645369] nouveau: detected PR support, will not use DSM
[    8.645393] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    8.645549] nouveau 0000:01:00.0: NVIDIA GK107 (0e7240a2)
[    8.692092] nouveau 0000:01:00.0: bios: version 80.07.b6.00.0e
[    8.779211] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    8.779496] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[    8.866980] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    8.866981] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    8.866985] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    8.866986] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    8.869447] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    8.869457] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

I can use nouveau fine with DRI_PRIME=3D1 (it's very slow however). However=
, any
attempt at reclocking the card, even at the lowest speed possible (07), res=
ults
in a freeze.
However, i am unsure if this is caused by this bug or another one.
The proprietary driver works fine with this card.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15206214912.abd56f26.353
Date: Fri, 9 Mar 2018 18:51:31 +0000
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
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lujofu&#64;eth2btc.info" title=3D"baybay &lt;lujofu&#64;eth2btc.info&gt;"> =
<span class=3D"fn">baybay</span></a>
</span></b>
        <pre>I own an HP Envy 17 with a Geforce 750M and i'm still getting =
this bug as of
latest stable version.

[    8.645369] nouveau: detected PR support, will not use DSM
[    8.645393] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    8.645549] nouveau 0000:01:00.0: NVIDIA GK107 (0e7240a2)
[    8.692092] nouveau 0000:01:00.0: bios: version 80.07.b6.00.0e
[    8.779211] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    8.779496] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[    8.866980] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    8.866981] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    8.866985] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    8.866986] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    8.869447] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    8.869457] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

I can use nouveau fine with DRI_PRIME=3D1 (it's very slow however). However=
, any
attempt at reclocking the card, even at the lowest speed possible (07), res=
ults
in a freeze.
However, i am unsure if this is caused by this bug or another one.
The proprietary driver works fine with this card.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15206214912.abd56f26.353--

--===============1050687761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1050687761==--
