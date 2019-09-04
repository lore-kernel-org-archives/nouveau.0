From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111392] [NV117] bus: MMIO read of 00000000 FAULT at
 619444 [ IBUS ]
Date: Wed, 04 Sep 2019 21:13:49 +0000
Message-ID: <bug-111392-8800-JnwoNJfB2B@http.bugs.freedesktop.org/>
References: <bug-111392-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1332958378=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111392-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1332958378==
Content-Type: multipart/alternative; boundary="15676316290.dcf63e.11508"
Content-Transfer-Encoding: 7bit


--15676316290.dcf63e.11508
Date: Wed, 4 Sep 2019 21:13:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111392

--- Comment #2 from stf <fixpoint.combinator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am having the same problem, except that my XFCE sometimes freezes.

# cat /var/log/syslog | grep -i nouveau | cut -d' ' -f 7-
[48132.074803] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[    5.461491] nouveau: detected PR support, will not use DSM
[    5.463061] nouveau 0000:01:00.0: NVIDIA GM107 (117360a2)
[    5.582620] nouveau 0000:01:00.0: bios: version 82.07.b0.00.11
[    5.850055] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    5.850120] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    5.890448] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    5.949021] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    5.949024] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.949030] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    5.949041] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.949901] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    5.949923] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
nouveau-pci-0100
[   27.158915] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 3017.006179] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]

^^^^ This is the last line before the hard restart.

[    4.702574] nouveau: detected PR support, will not use DSM
[    4.704259] nouveau 0000:01:00.0: NVIDIA GM107 (117360a2)
[    4.814736] nouveau 0000:01:00.0: bios: version 82.07.b0.00.11
[    5.225233] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    5.225298] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    5.269825] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    5.328777] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    5.328779] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.328786] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    5.328789] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.329569] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    5.329589] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
nouveau-pci-0100
[   31.454736] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 1718.113435] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 1828.533646] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 1848.942938] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]

Linux kernel:
4.19.0-5-amd64 #1 SMP Debian 4.19.37-5+deb10u2 (2019-08-08) x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676316290.dcf63e.11508
Date: Wed, 4 Sep 2019 21:13:49 +0000
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
   title=3D"NEW - [NV117] bus: MMIO read of 00000000 FAULT at 619444 [ IBUS=
 ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111392#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV117] bus: MMIO read of 00000000 FAULT at 619444 [ IBUS=
 ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111392">bug 11139=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fixpoint.combinator&#64;gmail.com" title=3D"stf &lt;fixpoint.combinator&#64=
;gmail.com&gt;"> <span class=3D"fn">stf</span></a>
</span></b>
        <pre>I am having the same problem, except that my XFCE sometimes fr=
eezes.

# cat /var/log/syslog | grep -i nouveau | cut -d' ' -f 7-
[48132.074803] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[    5.461491] nouveau: detected PR support, will not use DSM
[    5.463061] nouveau 0000:01:00.0: NVIDIA GM107 (117360a2)
[    5.582620] nouveau 0000:01:00.0: bios: version 82.07.b0.00.11
[    5.850055] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    5.850120] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    5.890448] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    5.949021] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    5.949024] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.949030] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    5.949041] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.949901] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    5.949923] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
nouveau-pci-0100
[   27.158915] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 3017.006179] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]

^^^^ This is the last line before the hard restart.

[    4.702574] nouveau: detected PR support, will not use DSM
[    4.704259] nouveau 0000:01:00.0: NVIDIA GM107 (117360a2)
[    4.814736] nouveau 0000:01:00.0: bios: version 82.07.b0.00.11
[    5.225233] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    5.225298] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    5.269825] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    5.328777] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    5.328779] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.328786] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    5.328789] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.329569] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    5.329589] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
nouveau-pci-0100
[   31.454736] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 1718.113435] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 1828.533646] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[ 1848.942938] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]

Linux kernel:
4.19.0-5-amd64 #1 SMP Debian 4.19.37-5+deb10u2 (2019-08-08) x86_64 GNU/Linu=
x</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676316290.dcf63e.11508--

--===============1332958378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1332958378==--
