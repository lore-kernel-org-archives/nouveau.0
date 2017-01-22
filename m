From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99487] New: [NV110] HP Pavilion 15 with Maxwell 950M
 fails to read BIOS (fix included)
Date: Sun, 22 Jan 2017 04:28:45 +0000
Message-ID: <bug-99487-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0011574027=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0011574027==
Content-Type: multipart/alternative; boundary="14850593250.47b9e1BCE.4587";
 charset="UTF-8"


--14850593250.47b9e1BCE.4587
Date: Sun, 22 Jan 2017 04:28:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99487

            Bug ID: 99487
           Summary: [NV110] HP Pavilion 15 with Maxwell 950M fails to read
                    BIOS (fix included)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nemesis-RBwgCYbvQ+vk1uMJSBkQmQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

(Please tell me what information to attach and I will attach it)

HP Pavilion 15 (Skylake) with Maxwell 950M fails to load the whole BIOS.  T=
he
ACPI "fast" method is selected first, which partially loads the BIOS with a
score of 6, which prevents the ACPI "slow" method which actually works from
ever being attempted.

To work around this I changed the name of the ACPI methods to "ACPIF" and
"ACPIS" respectively, so that I could issue this parameter to target the sl=
ow
method directly:
nouveau.config=3DNvBios=3DACPIS

Kernel log from trying to load nouveau normally of kernel 4.9.0:
Jan 21 17:47:33 achpee2 kernel: [ 1835.339060] ACPI Warning:
\_SB.PCI0.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requi=
res
[Package] (20160831/nsarguments-95)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339093] ACPI Warning:
\_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20160831/nsarguments-95)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339132] ACPI Warning:
\_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20160831/nsarguments-95)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339544] pci 0000:01:00.0: optimus
capabilities: enabled, status dynamic power,=20
Jan 21 17:47:33 achpee2 kernel: [ 1835.339547] VGA switcheroo: detected Opt=
imus
DSM method \_SB_.PCI0.PEG0.PEGP handle
Jan 21 17:47:33 achpee2 kernel: [ 1835.339689] nouveau 0000:01:00.0: NVIDIA
GM107 (1171a0a2)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339734] nouveau 0000:01:00.0: pci: M=
SI
enabled
Jan 21 17:47:33 achpee2 kernel: [ 1835.339736] nouveau 0000:01:00.0: bios:
trying PRAMIN...
Jan 21 17:47:33 achpee2 kernel: [ 1835.339748] nouveau 0000:01:00.0: bios: =
...
not enabled
Jan 21 17:47:33 achpee2 kernel: [ 1835.339749] nouveau 0000:01:00.0: bios:
trying PROM...
Jan 21 17:47:33 achpee2 kernel: [ 1835.344944] nouveau 0000:01:00.0: bios:
00000000: ROM signature (0000) unknown
Jan 21 17:47:33 achpee2 kernel: [ 1835.344945] nouveau 0000:01:00.0: bios:
image 0 invalid
Jan 21 17:47:33 achpee2 kernel: [ 1835.344950] nouveau 0000:01:00.0: bios:
scored 0
Jan 21 17:47:33 achpee2 kernel: [ 1835.344951] nouveau 0000:01:00.0: bios:
trying ACPI...
Jan 21 17:47:33 achpee2 kernel: [ 1835.345417] nouveau 0000:01:00.0: bios:
00000000: type 00, 65536 bytes
Jan 21 17:47:33 achpee2 kernel: [ 1835.345904] nouveau 0000:01:00.0: bios:
00000000: checksum failed
Jan 21 17:47:33 achpee2 kernel: [ 1835.346372] nouveau 0000:01:00.0: bios:
00010000: type e0, 37376 bytes
Jan 21 17:47:33 achpee2 kernel: [ 1835.346830] nouveau 0000:01:00.0: bios:
00019200: ROM signature (0000) unknown
Jan 21 17:47:33 achpee2 kernel: [ 1835.346832] nouveau 0000:01:00.0: bios:
image 2 invalid
Jan 21 17:47:33 achpee2 kernel: [ 1835.346833] nouveau 0000:01:00.0: bios:
scored 6
Jan 21 17:47:33 achpee2 kernel: [ 1835.346834] nouveau 0000:01:00.0: bios:
using image from ACPI
Jan 21 17:47:33 achpee2 kernel: [ 1835.346946] nouveau 0000:01:00.0: bios: =
BIT
signature found
Jan 21 17:47:33 achpee2 kernel: [ 1835.346949] nouveau 0000:01:00.0: bios:
version 82.07.9b.00.d1
Jan 21 17:47:33 achpee2 kernel: [ 1835.346953] nouveau 0000:01:00.0: bios: =
DCB
contains no useful data
Jan 21 17:47:33 achpee2 kernel: [ 1835.346954] nouveau 0000:01:00.0: bios: =
DCB
contains no useful data
Jan 21 17:47:33 achpee2 kernel: [ 1835.346956] nouveau 0000:01:00.0: mxm: no
VBIOS data, nothing to do
Jan 21 17:47:33 achpee2 kernel: [ 1835.346970] nouveau 0000:01:00.0: bios: =
DCB
contains no useful data

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14850593250.47b9e1BCE.4587
Date: Sun, 22 Jan 2017 04:28:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV110] HP Pavilion 15 with Maxwell 950M fails to read BI=
OS (fix included)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99487">99487</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV110] HP Pavilion 15 with Maxwell 950M fails to read BIOS (=
fix included)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>nemesis&#64;icequake.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>(Please tell me what information to attach and I will attach i=
t)

HP Pavilion 15 (Skylake) with Maxwell 950M fails to load the whole BIOS.  T=
he
ACPI &quot;fast&quot; method is selected first, which partially loads the B=
IOS with a
score of 6, which prevents the ACPI &quot;slow&quot; method which actually =
works from
ever being attempted.

To work around this I changed the name of the ACPI methods to &quot;ACPIF&q=
uot; and
&quot;ACPIS&quot; respectively, so that I could issue this parameter to tar=
get the slow
method directly:
nouveau.config=3DNvBios=3DACPIS

Kernel log from trying to load nouveau normally of kernel 4.9.0:
Jan 21 17:47:33 achpee2 kernel: [ 1835.339060] ACPI Warning:
\_SB.PCI0.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requi=
res
[Package] (20160831/nsarguments-95)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339093] ACPI Warning:
\_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20160831/nsarguments-95)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339132] ACPI Warning:
\_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20160831/nsarguments-95)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339544] pci 0000:01:00.0: optimus
capabilities: enabled, status dynamic power,=20
Jan 21 17:47:33 achpee2 kernel: [ 1835.339547] VGA switcheroo: detected Opt=
imus
DSM method \_SB_.PCI0.PEG0.PEGP handle
Jan 21 17:47:33 achpee2 kernel: [ 1835.339689] nouveau 0000:01:00.0: NVIDIA
GM107 (1171a0a2)
Jan 21 17:47:33 achpee2 kernel: [ 1835.339734] nouveau 0000:01:00.0: pci: M=
SI
enabled
Jan 21 17:47:33 achpee2 kernel: [ 1835.339736] nouveau 0000:01:00.0: bios:
trying PRAMIN...
Jan 21 17:47:33 achpee2 kernel: [ 1835.339748] nouveau 0000:01:00.0: bios: =
...
not enabled
Jan 21 17:47:33 achpee2 kernel: [ 1835.339749] nouveau 0000:01:00.0: bios:
trying PROM...
Jan 21 17:47:33 achpee2 kernel: [ 1835.344944] nouveau 0000:01:00.0: bios:
00000000: ROM signature (0000) unknown
Jan 21 17:47:33 achpee2 kernel: [ 1835.344945] nouveau 0000:01:00.0: bios:
image 0 invalid
Jan 21 17:47:33 achpee2 kernel: [ 1835.344950] nouveau 0000:01:00.0: bios:
scored 0
Jan 21 17:47:33 achpee2 kernel: [ 1835.344951] nouveau 0000:01:00.0: bios:
trying ACPI...
Jan 21 17:47:33 achpee2 kernel: [ 1835.345417] nouveau 0000:01:00.0: bios:
00000000: type 00, 65536 bytes
Jan 21 17:47:33 achpee2 kernel: [ 1835.345904] nouveau 0000:01:00.0: bios:
00000000: checksum failed
Jan 21 17:47:33 achpee2 kernel: [ 1835.346372] nouveau 0000:01:00.0: bios:
00010000: type e0, 37376 bytes
Jan 21 17:47:33 achpee2 kernel: [ 1835.346830] nouveau 0000:01:00.0: bios:
00019200: ROM signature (0000) unknown
Jan 21 17:47:33 achpee2 kernel: [ 1835.346832] nouveau 0000:01:00.0: bios:
image 2 invalid
Jan 21 17:47:33 achpee2 kernel: [ 1835.346833] nouveau 0000:01:00.0: bios:
scored 6
Jan 21 17:47:33 achpee2 kernel: [ 1835.346834] nouveau 0000:01:00.0: bios:
using image from ACPI
Jan 21 17:47:33 achpee2 kernel: [ 1835.346946] nouveau 0000:01:00.0: bios: =
BIT
signature found
Jan 21 17:47:33 achpee2 kernel: [ 1835.346949] nouveau 0000:01:00.0: bios:
version 82.07.9b.00.d1
Jan 21 17:47:33 achpee2 kernel: [ 1835.346953] nouveau 0000:01:00.0: bios: =
DCB
contains no useful data
Jan 21 17:47:33 achpee2 kernel: [ 1835.346954] nouveau 0000:01:00.0: bios: =
DCB
contains no useful data
Jan 21 17:47:33 achpee2 kernel: [ 1835.346956] nouveau 0000:01:00.0: mxm: no
VBIOS data, nothing to do
Jan 21 17:47:33 achpee2 kernel: [ 1835.346970] nouveau 0000:01:00.0: bios: =
DCB
contains no useful data</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14850593250.47b9e1BCE.4587--

--===============0011574027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0011574027==--
