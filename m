From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Sat, 20 May 2017 16:46:43 +0000
Message-ID: <bug-89664-8800-VHDaLlmUxS@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1450687351=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1450687351==
Content-Type: multipart/alternative; boundary="14952988031.Dab5AE.3676";
 charset="UTF-8"


--14952988031.Dab5AE.3676
Date: Sat, 20 May 2017 16:46:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #22 from Miko=C5=82aj =C5=9Awi=C4=85tek <mikolaj.swiatek@gmail.=
com> ---
I think I'm suffering from the same bug, though I've only been able to
experience it after the VRAM detection problem was fixed in 4.12.

I have a MSI GTX 970 4GB feeding two 1080p monitors - one via HDMI and one =
via
DP.=20=20
With kernel 4.12-rc1, and a single monitor connected, everything works fine=
, on
both monitors individually. However, when I try to boot with both connected=
 at
the same time, I get corrupted output similar to what Omar described - a
coloured stripe at the top of the screen, and what looks like garbled text
below it. Output only appears on one monitor, second stays in standby mode.
This happens irrespective of whether I boot straight into X or single-user
mode. None of the nouveau.config options mentioned do anything different th=
an
what Omar reported.

I have some logs captured with nouveau.debug=3Ddebug, and can upload them if
needed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14952988031.Dab5AE.3676
Date: Sat, 20 May 2017 16:46:43 +0000
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
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c22">Commen=
t # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikolaj.swiatek&#64;gmail.com" title=3D"Miko=C5=82aj =C5=9Awi=C4=85tek &lt;=
mikolaj.swiatek&#64;gmail.com&gt;"> <span class=3D"fn">Miko=C5=82aj =C5=9Aw=
i=C4=85tek</span></a>
</span></b>
        <pre>I think I'm suffering from the same bug, though I've only been=
 able to
experience it after the VRAM detection problem was fixed in 4.12.

I have a MSI GTX 970 4GB feeding two 1080p monitors - one via HDMI and one =
via
DP.=20=20
With kernel 4.12-rc1, and a single monitor connected, everything works fine=
, on
both monitors individually. However, when I try to boot with both connected=
 at
the same time, I get corrupted output similar to what Omar described - a
coloured stripe at the top of the screen, and what looks like garbled text
below it. Output only appears on one monitor, second stays in standby mode.
This happens irrespective of whether I boot straight into X or single-user
mode. None of the nouveau.config options mentioned do anything different th=
an
what Omar reported.

I have some logs captured with nouveau.debug=3Ddebug, and can upload them if
needed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14952988031.Dab5AE.3676--

--===============1450687351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1450687351==--
