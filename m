From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103721] New: Frequent freezes with nouveau on
	Thinkpad P50
Date: Mon, 13 Nov 2017 15:42:22 +0000
Message-ID: <bug-103721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1263060663=="
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


--===============1263060663==
Content-Type: multipart/alternative; boundary="15105877421.C3A34C84A.6309";
 charset="UTF-8"


--15105877421.C3A34C84A.6309
Date: Mon, 13 Nov 2017 15:42:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

            Bug ID: 103721
           Summary: Frequent freezes with nouveau on Thinkpad P50
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: will.newton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135437
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135437&action=3Dedit
Output of journalctl -k -b-1

I have been experiencing frequent freezes of xorg/wayland with the nouveau
driver on a Thinkpad P50 20EN.

The freezes seem to be related to system load and occur several times per-d=
ay.

I'm running Fedora 26 with kernel 4.13.11-200.fc26.x86_64 and the crashes s=
eem
to happen with Xorg and Wayland. I'm running with discrete graphics enabled=
 in
the BIOS as enabling Hybrid prevents the system from booting (there is no
option to run purely integrated graphics).

I have attached the kernel logs to the ticket.

I've also reported the issue in the Fedora bug tracker where there are some
more logs but had no response there as yet:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1509294

lspci:

00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen C=
ore
Processor Host Bridge/DRAM Registers (rev 07)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Co=
re
Processor PCIe Controller (x16) (rev 07)
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
Controller (rev 31)
00:14.2 Signal processing controller: Intel Corporation Sunrise Point-H The=
rmal
subsystem (rev 31)
00:16.0 Communication controller: Intel Corporation Sunrise Point-H CSME HE=
CI
#1 (rev 31)
00:16.3 Serial controller: Intel Corporation Sunrise Point-H KT Redirection
(rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA controller
[AHCI mode] (rev 31)
00:1c.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #1
(rev f1)
00:1c.2 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #3
(rev f1)
00:1c.4 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #5
(rev f1)
00:1d.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #13
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 3=
1)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219=
-LM
(rev 31)
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)
01:00.1 Audio device: NVIDIA Corporation Device 0fbc (rev a1)
04:00.0 Network controller: Intel Corporation Wireless 8260 (rev 3a)
3e:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A PCI
Express Card Reader (rev 01)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15105877421.C3A34C84A.6309
Date: Mon, 13 Nov 2017 15:42:22 +0000
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
   title=3D"NEW - Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">103721</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Frequent freezes with nouveau on Thinkpad P50
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>will.newton&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135437=
" name=3D"attach_135437" title=3D"Output of journalctl -k -b-1">attachment =
135437</a> <a href=3D"attachment.cgi?id=3D135437&amp;action=3Dedit" title=
=3D"Output of journalctl -k -b-1">[details]</a></span>
Output of journalctl -k -b-1

I have been experiencing frequent freezes of xorg/wayland with the nouveau
driver on a Thinkpad P50 20EN.

The freezes seem to be related to system load and occur several times per-d=
ay.

I'm running Fedora 26 with kernel 4.13.11-200.fc26.x86_64 and the crashes s=
eem
to happen with Xorg and Wayland. I'm running with discrete graphics enabled=
 in
the BIOS as enabling Hybrid prevents the system from booting (there is no
option to run purely integrated graphics).

I have attached the kernel logs to the ticket.

I've also reported the issue in the Fedora bug tracker where there are some
more logs but had no response there as yet:
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1509294">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1509294</a>

lspci:

00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen C=
ore
Processor Host Bridge/DRAM Registers (rev 07)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Co=
re
Processor PCIe Controller (x16) (rev 07)
00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
Controller (rev 31)
00:14.2 Signal processing controller: Intel Corporation Sunrise Point-H The=
rmal
subsystem (rev 31)
00:16.0 Communication controller: Intel Corporation Sunrise Point-H CSME HE=
CI
#1 (rev 31)
00:16.3 Serial controller: Intel Corporation Sunrise Point-H KT Redirection
(rev 31)
00:17.0 SATA controller: Intel Corporation Sunrise Point-H SATA controller
[AHCI mode] (rev 31)
00:1c.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #1
(rev f1)
00:1c.2 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #3
(rev f1)
00:1c.4 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #5
(rev f1)
00:1d.0 PCI bridge: Intel Corporation Sunrise Point-H PCI Express Root Port=
 #13
(rev f1)
00:1f.0 ISA bridge: Intel Corporation Sunrise Point-H LPC Controller (rev 3=
1)
00:1f.2 Memory controller: Intel Corporation Sunrise Point-H PMC (rev 31)
00:1f.3 Audio device: Intel Corporation Sunrise Point-H HD Audio (rev 31)
00:1f.4 SMBus: Intel Corporation Sunrise Point-H SMBus (rev 31)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I219=
-LM
(rev 31)
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)
01:00.1 Audio device: NVIDIA Corporation Device 0fbc (rev a1)
04:00.0 Network controller: Intel Corporation Wireless 8260 (rev 3a)
3e:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A PCI
Express Card Reader (rev 01)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15105877421.C3A34C84A.6309--

--===============1263060663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1263060663==--
