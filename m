From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99505] New: Attempting to reclock GeForce GT740M
 (GK208) cause GPU and system to hang
Date: Mon, 23 Jan 2017 13:29:41 +0000
Message-ID: <bug-99505-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1299641132=="
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


--===============1299641132==
Content-Type: multipart/alternative; boundary="14851781810.1E7Da83f.29832";
 charset="UTF-8"


--14851781810.1E7Da83f.29832
Date: Mon, 23 Jan 2017 13:29:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99505

            Bug ID: 99505
           Summary: Attempting to reclock GeForce GT740M (GK208) cause GPU
                    and system to hang
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: stu_dby-KN7UnAbNpbg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 129107
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129107&action=3Dedit
The dmesg output after reclocking

When I tried to reclock the GT740M (the GK208 one) on my laptop with:
# echo "07" > /sys/kernel/debug/dri/1/pstate
The shell process in which I enter the command became unkillable (state D+ =
in
ps) and the GPU would hang (rendering stops). Attempting to shutdown the
computer would completely freeze the system, only force reset can be used.

My computer is an Thinkpad E431 laptop running Arch Linux, kernel version is
4.8.13-1-ARCH

Output of lspci:
00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM Controll=
er
(rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor
PCI Express Root Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset Fami=
ly
USB xHCI Host Controller (rev 04)
00:16.0 Communication controller: Intel Corporation 7 Series/C216 Chipset
Family MEI Controller #1 (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB
Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 7 Series/C216 Chipset Family High
Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 7 Series/C216 Chipset Family PCI Expr=
ess
Root Port 1 (rev c4)
00:1c.1 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family P=
CI
Express Root Port 2 (rev c4)
00:1c.3 PCI bridge: Intel Corporation 7 Series/C216 Chipset Family PCI Expr=
ess
Root Port 4 (rev c4)
00:1d.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB
Enhanced Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation HM77 Express Chipset LPC Controller (=
rev
04)
00:1f.2 SATA controller: Intel Corporation 7 Series Chipset Family 6-port S=
ATA
Controller [AHCI mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 7 Series/C216 Chipset Family SMBus Control=
ler
(rev 04)
01:00.0 3D controller: NVIDIA Corporation GK208M [GeForce GT 740M] (rev a1)
03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5229 PCI
Express Card Reader (rev 01)
04:00.0 Network controller: Broadcom Limited BCM43228 802.11a/b/g/n
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 07)

Output of /sys/kernel/debug/dri/1/pstate before reclocking:
07: core 405 MHz memory 810 MHz
0a: core 405-1058 MHz memory 1620 MHz
0f: core 405-1058 MHz memory 2002 MHz
AC: core 0 MHz memory 0 MHz

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14851781810.1E7Da83f.29832
Date: Mon, 23 Jan 2017 13:29:41 +0000
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
   title=3D"NEW - Attempting to reclock GeForce GT740M (GK208) cause GPU an=
d system to hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99505">99505</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Attempting to reclock GeForce GT740M (GK208) cause GPU and sy=
stem to hang
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
          <td>stu_dby&#64;126.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129107=
" name=3D"attach_129107" title=3D"The dmesg output after reclocking">attach=
ment 129107</a> <a href=3D"attachment.cgi?id=3D129107&amp;action=3Dedit" ti=
tle=3D"The dmesg output after reclocking">[details]</a></span>
The dmesg output after reclocking

When I tried to reclock the GT740M (the GK208 one) on my laptop with:
# echo &quot;07&quot; &gt; /sys/kernel/debug/dri/1/pstate
The shell process in which I enter the command became unkillable (state D+ =
in
ps) and the GPU would hang (rendering stops). Attempting to shutdown the
computer would completely freeze the system, only force reset can be used.

My computer is an Thinkpad E431 laptop running Arch Linux, kernel version is
4.8.13-1-ARCH

Output of lspci:
00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM Controll=
er
(rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor
PCI Express Root Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09)
00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset Fami=
ly
USB xHCI Host Controller (rev 04)
00:16.0 Communication controller: Intel Corporation 7 Series/C216 Chipset
Family MEI Controller #1 (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB
Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 7 Series/C216 Chipset Family High
Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 7 Series/C216 Chipset Family PCI Expr=
ess
Root Port 1 (rev c4)
00:1c.1 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family P=
CI
Express Root Port 2 (rev c4)
00:1c.3 PCI bridge: Intel Corporation 7 Series/C216 Chipset Family PCI Expr=
ess
Root Port 4 (rev c4)
00:1d.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB
Enhanced Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation HM77 Express Chipset LPC Controller (=
rev
04)
00:1f.2 SATA controller: Intel Corporation 7 Series Chipset Family 6-port S=
ATA
Controller [AHCI mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 7 Series/C216 Chipset Family SMBus Control=
ler
(rev 04)
01:00.0 3D controller: NVIDIA Corporation GK208M [GeForce GT 740M] (rev a1)
03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5229 PCI
Express Card Reader (rev 01)
04:00.0 Network controller: Broadcom Limited BCM43228 802.11a/b/g/n
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 07)

Output of /sys/kernel/debug/dri/1/pstate before reclocking:
07: core 405 MHz memory 810 MHz
0a: core 405-1058 MHz memory 1620 MHz
0f: core 405-1058 MHz memory 2002 MHz
AC: core 0 MHz memory 0 MHz</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14851781810.1E7Da83f.29832--

--===============1299641132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1299641132==--
