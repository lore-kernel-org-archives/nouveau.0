From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102430] nv4x - memory problems when starting
 graphical application - logs included
Date: Sun, 27 Aug 2017 14:20:34 +0000
Message-ID: <bug-102430-8800-noyBKS5k3p@http.bugs.freedesktop.org/>
References: <bug-102430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2059911275=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102430-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2059911275==
Content-Type: multipart/alternative; boundary="15038436330.A43ee903.6151";
 charset="UTF-8"


--15038436330.A43ee903.6151
Date: Sun, 27 Aug 2017 14:20:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102430

--- Comment #2 from caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org ---
I let it ran and got those messages:

[  417.536352] [TTM] Failed to find memory space for buffer 0xffff9e44c2076=
c00
eviction
[  417.544122] [TTM] No space for ffff9e44c2076c00 (1366 pages, 5464K, 5M)
[  417.550739] [TTM]   placement[0]=3D0x00070002 (1)
[  417.555265] [TTM]     has_type: 1
[  417.558577] [TTM]     use_type: 1
[  417.561889] [TTM]     flags: 0x0000000A
[  417.565718] [TTM]     gpu_offset: 0x00000000
[  417.569984] [TTM]     size: 131072
[  417.573383] [TTM]     available_caching: 0x00070000
[  417.578255] [TTM]     default_caching: 0x00010000
[  417.582957] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  417.588786] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  417.594702] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  417.735888] nouveau 0000:08:00.0: DRM: GPU lockup - switching to software
fbcon

The screen was black and had a flashing, white underscore.


Then i tried switching to tty and that worked. After switching to graphical
screen also that was in a broken way back again. This switching around have
produces those logs:

[  867.565080] [TTM] Failed to find memory space for buffer 0xffff9e44c2279=
400
eviction
[  867.572841] [TTM] No space for ffff9e44c2279400 (1366 pages, 5464K, 5M)
[  867.579450] [TTM]   placement[0]=3D0x00070002 (1)
[  867.583972] [TTM]     has_type: 1
[  867.587279] [TTM]     use_type: 1
[  867.590583] [TTM]     flags: 0x0000000A
[  867.594409] [TTM]     gpu_offset: 0x00000000
[  867.598670] [TTM]     size: 131072
[  867.602061] [TTM]     available_caching: 0x00070000
[  867.606928] [TTM]     default_caching: 0x00010000
[  867.611626] nouveau 0000:08:00.0: supertuxkart[1075]: fail ttm_validate
[  867.618230] nouveau 0000:08:00.0: supertuxkart[1075]: validating bo list
[  867.624919] nouveau 0000:08:00.0: supertuxkart[1075]: validate: -12


The RAM size of the card is 256MB.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15038436330.A43ee903.6151
Date: Sun, 27 Aug 2017 14:20:33 +0000
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
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430">bug 10243=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#=
64;go2vpn.net</a>
</span></b>
        <pre>I let it ran and got those messages:

[  417.536352] [TTM] Failed to find memory space for buffer 0xffff9e44c2076=
c00
eviction
[  417.544122] [TTM] No space for ffff9e44c2076c00 (1366 pages, 5464K, 5M)
[  417.550739] [TTM]   placement[0]=3D0x00070002 (1)
[  417.555265] [TTM]     has_type: 1
[  417.558577] [TTM]     use_type: 1
[  417.561889] [TTM]     flags: 0x0000000A
[  417.565718] [TTM]     gpu_offset: 0x00000000
[  417.569984] [TTM]     size: 131072
[  417.573383] [TTM]     available_caching: 0x00070000
[  417.578255] [TTM]     default_caching: 0x00010000
[  417.582957] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  417.588786] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  417.594702] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  417.735888] nouveau 0000:08:00.0: DRM: GPU lockup - switching to software
fbcon

The screen was black and had a flashing, white underscore.


Then i tried switching to tty and that worked. After switching to graphical
screen also that was in a broken way back again. This switching around have
produces those logs:

[  867.565080] [TTM] Failed to find memory space for buffer 0xffff9e44c2279=
400
eviction
[  867.572841] [TTM] No space for ffff9e44c2279400 (1366 pages, 5464K, 5M)
[  867.579450] [TTM]   placement[0]=3D0x00070002 (1)
[  867.583972] [TTM]     has_type: 1
[  867.587279] [TTM]     use_type: 1
[  867.590583] [TTM]     flags: 0x0000000A
[  867.594409] [TTM]     gpu_offset: 0x00000000
[  867.598670] [TTM]     size: 131072
[  867.602061] [TTM]     available_caching: 0x00070000
[  867.606928] [TTM]     default_caching: 0x00010000
[  867.611626] nouveau 0000:08:00.0: supertuxkart[1075]: fail ttm_validate
[  867.618230] nouveau 0000:08:00.0: supertuxkart[1075]: validating bo list
[  867.624919] nouveau 0000:08:00.0: supertuxkart[1075]: validate: -12


The RAM size of the card is 256MB.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15038436330.A43ee903.6151--

--===============2059911275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2059911275==--
