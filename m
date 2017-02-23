From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99913] [G96] Reclocking fails on voltage
Date: Thu, 23 Feb 2017 00:06:17 +0000
Message-ID: <bug-99913-8800-vmcxgbsCT1@http.bugs.freedesktop.org/>
References: <bug-99913-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1764921868=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99913-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1764921868==
Content-Type: multipart/alternative; boundary="14878083761.CcF7b665.21568";
 charset="UTF-8"


--14878083761.CcF7b665.21568
Date: Thu, 23 Feb 2017 00:06:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99913

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Huh. Well, this is what's in the vbios:

Voltage table at 0xd0c9. Version 32.
Header:
0x0000d0c9: 20 06 02 04 00 01                               mask =3D 0x1

2 entries
-- Vid =3D 0x0, voltage =3D 890000 <C2><B5>V --
-- GPIO tag 0x4(VID) data (logic 0) --
0x0000d0cf: 59 00 00 00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

-- Vid =3D 0x1, voltage =3D 1050000 <C2><B5>V --
-- GPIO tag 0x4(VID) data (logic 1) --
0x0000d0d3: 69 01 00 00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

-- ID 0x3 Core 169MHz Memory 100MHz Shader 338MHz Vdec 169MHz Dom6 208MHz
Voltage 89[*10mV] Timing 0 Fan 100 PCIe link width 1 --
-- ID 0x5 Core 275MHz Memory 300MHz Shader 550MHz Vdec 275MHz Dom6 277MHz
Voltage 89[*10mV] Timing 16 Fan 100 PCIe link width 16 --
-- ID 0x7 Core 400MHz Memory 300MHz Shader 800MHz Vdec 450MHz Dom6 416MHz
Voltage 89[*10mV] Timing 0 Fan 100 PCIe link width 16 --
-- ID 0xf Core 625MHz Memory 800MHz Shader 1563MHz Vdec 450MHz Dom6 416MHz
Voltage 116[*10mV] Timing 0 Fan 100 PCIe link width 16 --

Note that the 89 voltage is clearly covered by voltage entry 0, while the 1=
16
voltage is not available. It'd be instructional to see what the blob does. =
If
you have any mmiotrace (even a very old one) for this board, it'd be
interesting to look at.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14878083761.CcF7b665.21568
Date: Thu, 23 Feb 2017 00:06:16 +0000
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
   title=3D"NEW - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913">bug 99913<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Huh. Well, this is what's in the vbios:

Voltage table at 0xd0c9. Version 32.
Header:
0x0000d0c9: 20 06 02 04 00 01                               mask =3D 0x1

2 entries
-- Vid =3D 0x0, voltage =3D 890000 &lt;C2&gt;&lt;B5&gt;V --
-- GPIO tag 0x4(VID) data (logic 0) --
0x0000d0cf: 59 00 00 00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

-- Vid =3D 0x1, voltage =3D 1050000 &lt;C2&gt;&lt;B5&gt;V --
-- GPIO tag 0x4(VID) data (logic 1) --
0x0000d0d3: 69 01 00 00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

-- ID 0x3 Core 169MHz Memory 100MHz Shader 338MHz Vdec 169MHz Dom6 208MHz
Voltage 89[*10mV] Timing 0 Fan 100 PCIe link width 1 --
-- ID 0x5 Core 275MHz Memory 300MHz Shader 550MHz Vdec 275MHz Dom6 277MHz
Voltage 89[*10mV] Timing 16 Fan 100 PCIe link width 16 --
-- ID 0x7 Core 400MHz Memory 300MHz Shader 800MHz Vdec 450MHz Dom6 416MHz
Voltage 89[*10mV] Timing 0 Fan 100 PCIe link width 16 --
-- ID 0xf Core 625MHz Memory 800MHz Shader 1563MHz Vdec 450MHz Dom6 416MHz
Voltage 116[*10mV] Timing 0 Fan 100 PCIe link width 16 --

Note that the 89 voltage is clearly covered by voltage entry 0, while the 1=
16
voltage is not available. It'd be instructional to see what the blob does. =
If
you have any mmiotrace (even a very old one) for this board, it'd be
interesting to look at.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14878083761.CcF7b665.21568--

--===============1764921868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1764921868==--
