From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Fri, 04 Sep 2015 12:45:55 +0000
Message-ID: <bug-90626-8800-4bcOwOkRQB@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2032440714=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2032440714==
Content-Type: multipart/alternative; boundary="1441370755.D8712.32608"; charset="UTF-8"


--1441370755.D8712.32608
Date: Fri, 4 Sep 2015 12:45:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #14 from vdanjean-GANU6spQydw@public.gmane.org <vdanjean.ml-GANU6spQydw@public.gmane.org> ---
Any progress on this bug? Any missing information?

I still get the same thing on a HP ZBook 15, too:

ao=C3=BBt 30 23:33:05 eyak kernel: nouveau 0000:01:00.0: enabling device (0=
004 ->
0007)
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0 =
 :
0x108390a1
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Chipse=
t: GK208
(NV108)
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Family=
 : NVE0
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] using =
image
from ACPI
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] BIT si=
gnature
found
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] version
80.28.52.00.09
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB he=
ader
validation failed
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB he=
ader
validation failed
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [ DEVINIT][0000:01:00.0] adapto=
r not
initialised
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] runnin=
g init
tables
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau E[   VBIOS][0000:01:00.0] 0xd075=
[0]:
unknown opcode 0xb1
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau E[ DEVINIT][0000:01:00.0] init f=
ailed,
-22
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau E[     DRM] failed to create 0x0=
0000080,
-22
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau: probe of 0000:01:00.0 failed wi=
th error
-22

Note that the "0xd075[0]: unknown opcode 0xb1" varies. The previous boot had
"0xce73[0]: unknown opcode 0x00"
And I did not upgrade the BIOS nor the kernel (4.2.0-rc8 from Debian).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1441370755.D8712.32608
Date: Fri, 4 Sep 2015 12:45:55 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vdanjean.ml&#64;free.fr" title=3D"vdanjean&#64;free.fr &lt;vdanjean.ml&#64;=
free.fr&gt;"> <span class=3D"fn">vdanjean&#64;free.fr</span></a>
</span></b>
        <pre>Any progress on this bug? Any missing information?

I still get the same thing on a HP ZBook 15, too:

ao=C3=BBt 30 23:33:05 eyak kernel: nouveau 0000:01:00.0: enabling device (0=
004 -&gt;
0007)
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0 =
 :
0x108390a1
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Chipse=
t: GK208
(NV108)
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Family=
 : NVE0
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] using =
image
from ACPI
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] BIT si=
gnature
found
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] version
80.28.52.00.09
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB he=
ader
validation failed
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB he=
ader
validation failed
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [ DEVINIT][0000:01:00.0] adapto=
r not
initialised
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] runnin=
g init
tables
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau E[   VBIOS][0000:01:00.0] 0xd075=
[0]:
unknown opcode 0xb1
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau E[ DEVINIT][0000:01:00.0] init f=
ailed,
-22
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau E[     DRM] failed to create 0x0=
0000080,
-22
ao=C3=BBt 30 23:33:05 eyak kernel: nouveau: probe of 0000:01:00.0 failed wi=
th error
-22

Note that the &quot;0xd075[0]: unknown opcode 0xb1&quot; varies. The previo=
us boot had
&quot;0xce73[0]: unknown opcode 0x00&quot;
And I did not upgrade the BIOS nor the kernel (4.2.0-rc8 from Debian).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441370755.D8712.32608--

--===============2032440714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2032440714==--
