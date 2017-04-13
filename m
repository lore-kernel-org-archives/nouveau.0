From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
	]
Date: Thu, 13 Apr 2017 13:09:43 +0000
Message-ID: <bug-100423-8800-cHQUBlrZt3@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1189574976=="
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


--===============1189574976==
Content-Type: multipart/alternative; boundary="14920889821.3Cf1.16385";
 charset="UTF-8"


--14920889821.3Cf1.16385
Date: Thu, 13 Apr 2017 13:09:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

Arthur Borsboom <arthurborsboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 OS|All                         |Linux (All)
           Hardware|Other                       |x86-64 (AMD64)
                 CC|                            |arthurborsboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #2 from Arthur Borsboom <arthurborsboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same for: Intel i7-4710HQ + GM107M [GeForce GTX 850M]

[    1.950230] nouveau: detected PR support, will not use DSM
[    1.950384] nouveau 0000:01:00.0: NVIDIA GM107 (117110a2)
[    1.979948] nouveau 0000:01:00.0: bios: version 82.07.47.00.06
[    2.071839] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    2.071853] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    2.071913] nouveau 0000:01:00.0: priv: HUB0: 10ecc0 ffffffff (1840822c)
[    3.157435] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    3.157436] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    3.157438] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    3.157438] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    3.157439] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[    3.227691] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    3.286804] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    3.286815] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14920889821.3Cf1.16385
Date: Thu, 13 Apr 2017 13:09:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:arthurbor=
sboom&#64;gmail.com" title=3D"Arthur Borsboom &lt;arthurborsboom&#64;gmail.=
com&gt;"> <span class=3D"fn">Arthur Borsboom</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">OS</td>
           <td>All
           </td>
           <td>Linux (All)
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Hardware</td>
           <td>Other
           </td>
           <td>x86-64 (AMD64)
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>arthurborsboom&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
arthurborsboom&#64;gmail.com" title=3D"Arthur Borsboom &lt;arthurborsboom&#=
64;gmail.com&gt;"> <span class=3D"fn">Arthur Borsboom</span></a>
</span></b>
        <pre>Same for: Intel i7-4710HQ + GM107M [GeForce GTX 850M]

[    1.950230] nouveau: detected PR support, will not use DSM
[    1.950384] nouveau 0000:01:00.0: NVIDIA GM107 (117110a2)
[    1.979948] nouveau 0000:01:00.0: bios: version 82.07.47.00.06
[    2.071839] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    2.071853] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    2.071913] nouveau 0000:01:00.0: priv: HUB0: 10ecc0 ffffffff (1840822c)
[    3.157435] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    3.157436] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    3.157438] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    3.157438] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    3.157439] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[    3.227691] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    3.286804] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    3.286815] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
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

--14920889821.3Cf1.16385--

--===============1189574976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1189574976==--
