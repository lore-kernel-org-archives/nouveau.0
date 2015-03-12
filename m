From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] New: Unknown chipset error for GeForce 840M
Date: Thu, 12 Mar 2015 11:19:04 +0000
Message-ID: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0660343125=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0660343125==
Content-Type: multipart/alternative; boundary="1426159144.eFd6b2ce1.6797"; charset="UTF-8"


--1426159144.eFd6b2ce1.6797
Date: Thu, 12 Mar 2015 11:19:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

            Bug ID: 89558
           Summary: Unknown chipset error for GeForce 840M
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: b.rowlingson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Installed Linux Mint 17.1, installed all package updates to current
(12/Mar/2015).

Reboot, dmesg reports unknown chipset from the nouveau kernel module:

[    1.048477] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.RP05.PEGP
handle
[    1.048495] checking generic (d0000000 580000) vs hw (e0000000 10000000)
[    1.048497] checking generic (d0000000 580000) vs hw (f0000000 2000000)
[    1.049793] [drm] hdmi device  not found 8 0 1
[    1.049924] nouveau E[  DEVICE][0000:08:00.0] unknown chipset, 0x118010a2
[    1.049927] nouveau E[     DRM] failed to create 0x80000080, -22
[    1.050665] nouveau: probe of 0000:08:00.0 failed with error -22

X starts up, there's no mention of nouveau in the Xorg.0.log, and it uses the
intel X driver because the system has i915 and nvidia graphics. With
intel-driven X11 there's a GPU hang bug, so I wanted to get the nvidia working,
first via nouveau.

lspci lists the intel graphics as VGA controller and the nvidia graphics as "3D
controller":

# lspci
00:00.0 Host bridge: Intel Corporation Broadwell-U Host Bridge -OPI (rev 09)
00:02.0 VGA compatible controller: Intel Corporation Broadwell-U Integrated
Graphics (rev 09)
00:03.0 Audio device: Intel Corporation Broadwell-U Audio Controller (rev 09)
00:14.0 USB controller: Intel Corporation Wildcat Point-LP USB xHCI Controller
(rev 03)
00:16.0 Communication controller: Intel Corporation Wildcat Point-LP MEI
Controller #1 (rev 03)
00:1b.0 Audio device: Intel Corporation Wildcat Point-LP High Definition Audio
Controller (rev 03)
00:1c.0 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #1
(rev e3)
00:1c.2 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #3
(rev e3)
00:1c.3 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #4
(rev e3)
00:1c.4 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #5
(rev e3)
00:1d.0 USB controller: Intel Corporation Wildcat Point-LP USB EHCI Controller
(rev 03)
00:1f.0 ISA bridge: Intel Corporation Wildcat Point-LP LPC Controller (rev 03)
00:1f.2 SATA controller: Intel Corporation Wildcat Point-LP SATA Controller
[AHCI Mode] (rev 03)
00:1f.3 SMBus: Intel Corporation Wildcat Point-LP SMBus Controller (rev 03)
06:00.0 Network controller: Qualcomm Atheros QCA9565 / AR9565 Wireless Network
Adapter (rev 01)
07:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8101E/RTL8102E
PCI Express Fast Ethernet controller (rev 07)
08:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 840M] (rev a2)

Details on the Nvidia are:

08:00.0 3D controller [0302]: NVIDIA Corporation GM108M [GeForce 840M]
[10de:1341] (rev a2)
    Subsystem: Dell Device [1028:0656]
    Flags: fast devsel, IRQ 16
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at d000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [250] Latency Tolerance Reporting
    Capabilities: [258] L1 PM Substates
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Capabilities: [900] #19


At some point in the past two days of messing with this laptop I have had the
system recognise the card and "nouveau" be part of the Xorg log, but that may
have been after installing the proprietary drivers or something else. At the
moment I think the nouveau kernel is simply not recognising the chipset code of
the card.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426159144.eFd6b2ce1.6797
Date: Thu, 12 Mar 2015 11:19:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Unknown chipset error for GeForce 840M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">89558</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unknown chipset error for GeForce 840M
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
          <td>b.rowlingson&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Installed Linux Mint 17.1, installed all package updates to current
(12/Mar/2015).

Reboot, dmesg reports unknown chipset from the nouveau kernel module:

[    1.048477] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.RP05.PEGP
handle
[    1.048495] checking generic (d0000000 580000) vs hw (e0000000 10000000)
[    1.048497] checking generic (d0000000 580000) vs hw (f0000000 2000000)
[    1.049793] [drm] hdmi device  not found 8 0 1
[    1.049924] nouveau E[  DEVICE][0000:08:00.0] unknown chipset, 0x118010a2
[    1.049927] nouveau E[     DRM] failed to create 0x80000080, -22
[    1.050665] nouveau: probe of 0000:08:00.0 failed with error -22

X starts up, there's no mention of nouveau in the Xorg.0.log, and it uses the
intel X driver because the system has i915 and nvidia graphics. With
intel-driven X11 there's a GPU hang bug, so I wanted to get the nvidia working,
first via nouveau.

lspci lists the intel graphics as VGA controller and the nvidia graphics as &quot;3D
controller&quot;:

# lspci
00:00.0 Host bridge: Intel Corporation Broadwell-U Host Bridge -OPI (rev 09)
00:02.0 VGA compatible controller: Intel Corporation Broadwell-U Integrated
Graphics (rev 09)
00:03.0 Audio device: Intel Corporation Broadwell-U Audio Controller (rev 09)
00:14.0 USB controller: Intel Corporation Wildcat Point-LP USB xHCI Controller
(rev 03)
00:16.0 Communication controller: Intel Corporation Wildcat Point-LP MEI
Controller #1 (rev 03)
00:1b.0 Audio device: Intel Corporation Wildcat Point-LP High Definition Audio
Controller (rev 03)
00:1c.0 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #1
(rev e3)
00:1c.2 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #3
(rev e3)
00:1c.3 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #4
(rev e3)
00:1c.4 PCI bridge: Intel Corporation Wildcat Point-LP PCI Express Root Port #5
(rev e3)
00:1d.0 USB controller: Intel Corporation Wildcat Point-LP USB EHCI Controller
(rev 03)
00:1f.0 ISA bridge: Intel Corporation Wildcat Point-LP LPC Controller (rev 03)
00:1f.2 SATA controller: Intel Corporation Wildcat Point-LP SATA Controller
[AHCI Mode] (rev 03)
00:1f.3 SMBus: Intel Corporation Wildcat Point-LP SMBus Controller (rev 03)
06:00.0 Network controller: Qualcomm Atheros QCA9565 / AR9565 Wireless Network
Adapter (rev 01)
07:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8101E/RTL8102E
PCI Express Fast Ethernet controller (rev 07)
08:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 840M] (rev a2)

Details on the Nvidia are:

08:00.0 3D controller [0302]: NVIDIA Corporation GM108M [GeForce 840M]
[10de:1341] (rev a2)
    Subsystem: Dell Device [1028:0656]
    Flags: fast devsel, IRQ 16
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at d000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [250] Latency Tolerance Reporting
    Capabilities: [258] L1 PM Substates
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Capabilities: [900] #19


At some point in the past two days of messing with this laptop I have had the
system recognise the card and &quot;nouveau&quot; be part of the Xorg log, but that may
have been after installing the proprietary drivers or something else. At the
moment I think the nouveau kernel is simply not recognising the chipset code of
the card.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426159144.eFd6b2ce1.6797--

--===============0660343125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0660343125==--
