From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
Date: Sat, 11 May 2019 00:59:02 +0000
Message-ID: <bug-110660-8800-xD6AKjMLXL@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0701142624=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0701142624==
Content-Type: multipart/alternative; boundary="15575363421.D72652.29942"
Content-Transfer-Encoding: 7bit


--15575363421.D72652.29942
Date: Sat, 11 May 2019 00:59:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hm. Curious. Based on the EDID data supplied, you only have a single real m=
ode
in there. And nouveau has logic to enable scaling in such cases. However it
only checks for DRM_MODE_TYPE_DRIVER, but should probably check USERDEF in
there as well? I don't know that logic too well.

---

EDID version: 1.4
Manufacturer: APP Model a022 Serial Number 0
Made in week 4 of 2013
Digital display
8 bits per primary color channel
DisplayPort interface
Maximum image size: 33 cm x 21 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
First detailed timing includes the native pixel format and preferred refresh
rate
Display x,y Chromaticity:
  Red:   0.6533, 0.3339
  Green: 0.2998, 0.6201
  Blue:  0.1464, 0.0498
  White: 0.3125, 0.3291
Established timings supported:
Standard timings supported:
Detailed mode: Clock 337.750 MHz, 331 mm x 207 mm
               2880 2928 2960 3040 hborder 0
               1800 1803 1809 1852 vborder 0
               +hsync -vsync=20
               VertFreq: 59 Hz, HorFreq: 111101 Hz
Monitor name: Color LCD
Dummy block
Dummy block
Checksum: 0xde (valid)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15575363421.D72652.29942
Date: Sat, 11 May 2019 00:59:02 +0000
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hm. Curious. Based on the EDID data supplied, you only have a =
single real mode
in there. And nouveau has logic to enable scaling in such cases. However it
only checks for DRM_MODE_TYPE_DRIVER, but should probably check USERDEF in
there as well? I don't know that logic too well.

---

EDID version: 1.4
Manufacturer: APP Model a022 Serial Number 0
Made in week 4 of 2013
Digital display
8 bits per primary color channel
DisplayPort interface
Maximum image size: 33 cm x 21 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
First detailed timing includes the native pixel format and preferred refresh
rate
Display x,y Chromaticity:
  Red:   0.6533, 0.3339
  Green: 0.2998, 0.6201
  Blue:  0.1464, 0.0498
  White: 0.3125, 0.3291
Established timings supported:
Standard timings supported:
Detailed mode: Clock 337.750 MHz, 331 mm x 207 mm
               2880 2928 2960 3040 hborder 0
               1800 1803 1809 1852 vborder 0
               +hsync -vsync=20
               VertFreq: 59 Hz, HorFreq: 111101 Hz
Monitor name: Color LCD
Dummy block
Dummy block
Checksum: 0xde (valid)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15575363421.D72652.29942--

--===============0701142624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0701142624==--
