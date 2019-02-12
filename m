From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109613] New: nouveau: KMS is broken on last kernels
 (9700M GT)
Date: Tue, 12 Feb 2019 10:20:27 +0000
Message-ID: <bug-109613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1093181972=="
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


--===============1093181972==
Content-Type: multipart/alternative; boundary="15499668270.51bC.27118"
Content-Transfer-Encoding: 7bit


--15499668270.51bC.27118
Date: Tue, 12 Feb 2019 10:20:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109613

            Bug ID: 109613
           Summary: nouveau: KMS is broken on last kernels (9700M GT)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kurnevsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 143363
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143363&action=3Dedit
dmesg logs from different kernels

I have KMS broken on my laptop Acer Aspire 8930G after upgrading from 4.10.=
13
to 4.11.2 kernel (also checked 4.11.9, the last version 4.20.7 and some
versions between). With kernel parameter 'nouveau.modeset=3D0' it boots fin=
e.
Here is a picture how it looks on the screen after modeset:
https://imgur.com/a/kr3rbFJ

Laptops's lspci:

00:00.0 Host bridge: Intel Corporation Mobile 4 Series Chipset Memory
Controller Hub (rev 07)
00:01.0 PCI bridge: Intel Corporation Mobile 4 Series Chipset PCI Express
Graphics Port (rev 07)
00:1a.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #4 (rev 03)
00:1a.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #5 (rev 03)
00:1a.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2 EHCI
Controller #2 (rev 03)
00:1b.0 Audio device: Intel Corporation 82801I (ICH9 Family) HD Audio
Controller (rev 03)
00:1c.0 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 1
(rev 03)
00:1c.1 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 2
(rev 03)
00:1c.3 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 4
(rev 03)
00:1c.4 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 5
(rev 03)
00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #1 (rev 03)
00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #2 (rev 03)
00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #3 (rev 03)
00:1d.3 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #6 (rev 03)
00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2 EHCI
Controller #1 (rev 03)
00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev 93)
00:1f.0 ISA bridge: Intel Corporation ICH9M LPC Interface Controller (rev 0=
3)
00:1f.2 SATA controller: Intel Corporation 82801IBM/IEM (ICH9M/ICH9M-E) 4 p=
ort
SATA Controller [AHCI mode] (rev 03)
00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller (rev=
 03)
00:1f.6 Signal processing controller: Intel Corporation 82801I (ICH9 Family)
Thermal Subsystem (rev 03)
01:00.0 VGA compatible controller: NVIDIA Corporation G96M [GeForce 9700M G=
T]
(rev a1)
02:00.0 Ethernet controller: Qualcomm Atheros AR8121/AR8113/AR8114 Gigabit =
or
Fast Ethernet (rev b0)
05:00.0 Network controller: Intel Corporation WiFi Link 5100

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15499668270.51bC.27118
Date: Tue, 12 Feb 2019 10:20:27 +0000
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
   title=3D"NEW - nouveau: KMS is broken on last kernels (9700M GT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109613">109613</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau: KMS is broken on last kernels (9700M GT)
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
          <td>normal
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
          <td>kurnevsky&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143363=
" name=3D"attach_143363" title=3D"dmesg logs from different kernels">attach=
ment 143363</a> <a href=3D"attachment.cgi?id=3D143363&amp;action=3Dedit" ti=
tle=3D"dmesg logs from different kernels">[details]</a></span>
dmesg logs from different kernels

I have KMS broken on my laptop Acer Aspire 8930G after upgrading from 4.10.=
13
to 4.11.2 kernel (also checked 4.11.9, the last version 4.20.7 and some
versions between). With kernel parameter 'nouveau.modeset=3D0' it boots fin=
e.
Here is a picture how it looks on the screen after modeset:
<a href=3D"https://imgur.com/a/kr3rbFJ">https://imgur.com/a/kr3rbFJ</a>

Laptops's lspci:

00:00.0 Host bridge: Intel Corporation Mobile 4 Series Chipset Memory
Controller Hub (rev 07)
00:01.0 PCI bridge: Intel Corporation Mobile 4 Series Chipset PCI Express
Graphics Port (rev 07)
00:1a.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #4 (rev 03)
00:1a.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #5 (rev 03)
00:1a.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2 EHCI
Controller #2 (rev 03)
00:1b.0 Audio device: Intel Corporation 82801I (ICH9 Family) HD Audio
Controller (rev 03)
00:1c.0 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 1
(rev 03)
00:1c.1 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 2
(rev 03)
00:1c.3 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 4
(rev 03)
00:1c.4 PCI bridge: Intel Corporation 82801I (ICH9 Family) PCI Express Port=
 5
(rev 03)
00:1d.0 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #1 (rev 03)
00:1d.1 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #2 (rev 03)
00:1d.2 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #3 (rev 03)
00:1d.3 USB controller: Intel Corporation 82801I (ICH9 Family) USB UHCI
Controller #6 (rev 03)
00:1d.7 USB controller: Intel Corporation 82801I (ICH9 Family) USB2 EHCI
Controller #1 (rev 03)
00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev 93)
00:1f.0 ISA bridge: Intel Corporation ICH9M LPC Interface Controller (rev 0=
3)
00:1f.2 SATA controller: Intel Corporation 82801IBM/IEM (ICH9M/ICH9M-E) 4 p=
ort
SATA Controller [AHCI mode] (rev 03)
00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller (rev=
 03)
00:1f.6 Signal processing controller: Intel Corporation 82801I (ICH9 Family)
Thermal Subsystem (rev 03)
01:00.0 VGA compatible controller: NVIDIA Corporation G96M [GeForce 9700M G=
T]
(rev a1)
02:00.0 Ethernet controller: Qualcomm Atheros AR8121/AR8113/AR8114 Gigabit =
or
Fast Ethernet (rev b0)
05:00.0 Network controller: Intel Corporation WiFi Link 5100</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15499668270.51bC.27118--

--===============1093181972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1093181972==--
