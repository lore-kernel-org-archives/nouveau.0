From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109654] Nouveau picks bad mode setting 640x480
 resolution
Date: Sat, 16 Feb 2019 20:07:01 +0000
Message-ID: <bug-109654-8800-JlmATBbD6b@http.bugs.freedesktop.org/>
References: <bug-109654-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1635990787=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109654-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1635990787==
Content-Type: multipart/alternative; boundary="15503476211.dB0B.31147"
Content-Transfer-Encoding: 7bit


--15503476211.dB0B.31147
Date: Sat, 16 Feb 2019 20:07:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109654

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 143385
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143385&action=3Dedit
monitor edid

Nouveau doesn't pick these things -- it does what it's told.

It does, however, allow it. Sounds like something about the monitor should =
make
that illegal, but it's unclear what that would be.

Attaching EDID sent via ML. The interesting bits decode as

Established timings supported:
  720x400@70Hz 9:5 HorFreq: 31469 Hz Clock: 28.320 MHz
  640x480@60Hz 4:3 HorFreq: 31469 Hz Clock: 25.175 MHz
  640x480@75Hz 4:3 HorFreq: 37500 Hz Clock: 31.500 MHz
  800x600@60Hz 4:3 HorFreq: 37900 Hz Clock: 40.000 MHz
  800x600@75Hz 4:3 HorFreq: 46900 Hz Clock: 49.500 MHz
  1024x768@60Hz 4:3 HorFreq: 48400 Hz Clock: 65.000 MHz
  1024x768@75Hz 4:3 HorFreq: 60000 Hz Clock: 78.750 MHz
  1280x1024@75Hz 5:4 HorFreq: 80000 Hz Clock: 135.000 MHz
Standard timings supported:
  1920x1080@60Hz 16:9
  1600x1200@60Hz 4:3 HorFreq: 75000 Hz Clock: 162.000 MHz
  1280x1024@60Hz 5:4 HorFreq: 64000 Hz Clock: 108.000 MHz
  1280x800@60Hz 16:10
  1152x864@75Hz 4:3 HorFreq: 67500 Hz Clock: 108.000 MHz

CTA extension block
Extension version: 3
25 bytes of CTA data
  Video data block
...
    VIC   3 720x480@60Hz 16:9  HorFreq: 31469 Hz Clock: 27.000 MHz
    VIC   2 720x480@60Hz 4:3  HorFreq: 31469 Hz Clock: 27.000 MHz
    VIC   1 640x480@60Hz 4:3  HorFreq: 31469 Hz Clock: 25.175 MHz


So it certainly seems like 640x480@60 should work OK.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15503476211.dB0B.31147
Date: Sat, 16 Feb 2019 20:07:01 +0000
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
   title=3D"NEW - Nouveau picks bad mode setting 640x480 resolution"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109654#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau picks bad mode setting 640x480 resolution"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109654">bug 10965=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143385=
" name=3D"attach_143385" title=3D"monitor edid">attachment 143385</a> <a hr=
ef=3D"attachment.cgi?id=3D143385&amp;action=3Dedit" title=3D"monitor edid">=
[details]</a></span>
monitor edid

Nouveau doesn't pick these things -- it does what it's told.

It does, however, allow it. Sounds like something about the monitor should =
make
that illegal, but it's unclear what that would be.

Attaching EDID sent via ML. The interesting bits decode as

Established timings supported:
  720x400&#64;70Hz 9:5 HorFreq: 31469 Hz Clock: 28.320 MHz
  640x480&#64;60Hz 4:3 HorFreq: 31469 Hz Clock: 25.175 MHz
  640x480&#64;75Hz 4:3 HorFreq: 37500 Hz Clock: 31.500 MHz
  800x600&#64;60Hz 4:3 HorFreq: 37900 Hz Clock: 40.000 MHz
  800x600&#64;75Hz 4:3 HorFreq: 46900 Hz Clock: 49.500 MHz
  1024x768&#64;60Hz 4:3 HorFreq: 48400 Hz Clock: 65.000 MHz
  1024x768&#64;75Hz 4:3 HorFreq: 60000 Hz Clock: 78.750 MHz
  1280x1024&#64;75Hz 5:4 HorFreq: 80000 Hz Clock: 135.000 MHz
Standard timings supported:
  1920x1080&#64;60Hz 16:9
  1600x1200&#64;60Hz 4:3 HorFreq: 75000 Hz Clock: 162.000 MHz
  1280x1024&#64;60Hz 5:4 HorFreq: 64000 Hz Clock: 108.000 MHz
  1280x800&#64;60Hz 16:10
  1152x864&#64;75Hz 4:3 HorFreq: 67500 Hz Clock: 108.000 MHz

CTA extension block
Extension version: 3
25 bytes of CTA data
  Video data block
...
    VIC   3 720x480&#64;60Hz 16:9  HorFreq: 31469 Hz Clock: 27.000 MHz
    VIC   2 720x480&#64;60Hz 4:3  HorFreq: 31469 Hz Clock: 27.000 MHz
    VIC   1 640x480&#64;60Hz 4:3  HorFreq: 31469 Hz Clock: 25.175 MHz


So it certainly seems like 640x480&#64;60 should work OK.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15503476211.dB0B.31147--

--===============1635990787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1635990787==--
