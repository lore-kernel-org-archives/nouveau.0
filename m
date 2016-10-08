From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98149] EDID doesn't detect resolution 1440x900
 correctly NV34 FX5200Go
Date: Sat, 08 Oct 2016 00:46:11 +0000
Message-ID: <bug-98149-8800-yKNSHBRRQj@http.bugs.freedesktop.org/>
References: <bug-98149-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0416012746=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98149-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0416012746==
Content-Type: multipart/alternative; boundary="14758875711.DD64aC.15079";
 charset="UTF-8"


--14758875711.DD64aC.15079
Date: Sat, 8 Oct 2016 00:46:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98149

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like the included EDID in the VBIOS is:

00000000  00 ff ff ff ff ff ff 00  2e 0d 00 00 00 00 00 00  |..............=
..|
00000010  04 09 01 02 80 00 00 00  e2 00 00 00 00 00 00 00  |..............=
..|
00000020  00 00 00 00 08 00 01 01  01 01 01 01 01 01 01 01  |..............=
..|
00000030  01 01 01 01 01 01 64 19  00 40 41 00 26 30 18 88  |......d..@A.&0=
..|
00000040  36 00 00 00 00 00 00 18  00 00 00 00 00 00 00 00  |6.............=
..|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 ff  |..............=
..|

Which decodes to

Checksum Correct

Section "Monitor"
        Identifier ""
        ModelName ""
        VendorName "KPM"
        # Monitor Manufactured week 4 of 1999
        # EDID version 1.2
        # Digital Display
        # Display Physical Size not given. Normal for projectors.
        Gamma 1.00
        Option "DPMS" "true"
        Modeline        "Mode 0" -hsync -vsync=20
EndSection

Which is obviously crap - no modelines are given, that's why we pick the
default 1024x768 & co modelines. Investigating further about how this used =
to
work. (Also manufactured in early 1999 seems surprising given that this is a
probably 2004 or so laptop...) But the checksum checks out, so we happily u=
se
it.

Would you be so kind as include a dmesg with drm.debug=3D0x1e nouveau.debug=
=3Ddebug
from a working kernel?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14758875711.DD64aC.15079
Date: Sat, 8 Oct 2016 00:46:11 +0000
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
   title=3D"NEW - EDID doesn't detect resolution 1440x900 correctly NV34 FX=
5200Go"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98149#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - EDID doesn't detect resolution 1440x900 correctly NV34 FX=
5200Go"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98149">bug 98149<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like the included EDID in the VBIOS is:

00000000  00 ff ff ff ff ff ff 00  2e 0d 00 00 00 00 00 00  |..............=
..|
00000010  04 09 01 02 80 00 00 00  e2 00 00 00 00 00 00 00  |..............=
..|
00000020  00 00 00 00 08 00 01 01  01 01 01 01 01 01 01 01  |..............=
..|
00000030  01 01 01 01 01 01 64 19  00 40 41 00 26 30 18 88  |......d..&#64;=
A.&amp;0..|
00000040  36 00 00 00 00 00 00 18  00 00 00 00 00 00 00 00  |6.............=
..|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 ff  |..............=
..|

Which decodes to

Checksum Correct

Section &quot;Monitor&quot;
        Identifier &quot;&quot;
        ModelName &quot;&quot;
        VendorName &quot;KPM&quot;
        # Monitor Manufactured week 4 of 1999
        # EDID version 1.2
        # Digital Display
        # Display Physical Size not given. Normal for projectors.
        Gamma 1.00
        Option &quot;DPMS&quot; &quot;true&quot;
        Modeline        &quot;Mode 0&quot; -hsync -vsync=20
EndSection

Which is obviously crap - no modelines are given, that's why we pick the
default 1024x768 &amp; co modelines. Investigating further about how this u=
sed to
work. (Also manufactured in early 1999 seems surprising given that this is a
probably 2004 or so laptop...) But the checksum checks out, so we happily u=
se
it.

Would you be so kind as include a dmesg with drm.debug=3D0x1e nouveau.debug=
=3Ddebug
from a working kernel?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14758875711.DD64aC.15079--

--===============0416012746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0416012746==--
