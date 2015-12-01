From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93195] New: Direct firmware load for
 nouveau/nve4_fuc084 failed with error -2
Date: Tue, 01 Dec 2015 18:24:49 +0000
Message-ID: <bug-93195-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1937334152=="
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


--===============1937334152==
Content-Type: multipart/alternative; boundary="1448994289.Bafb680.27338"; charset="UTF-8"


--1448994289.Bafb680.27338
Date: Tue, 1 Dec 2015 18:24:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93195

            Bug ID: 93195
           Summary: Direct firmware load for nouveau/nve4_fuc084 failed
                    with error -2
           Product: Mesa
           Version: 11.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: askondro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When opening VLC in xfce and playing a video I get this message with dmesg:

[ 3814.759551] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve4_fuc084 failed with error -2
[ 3814.759562] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve4_fuc084d failed with error -2
[ 3814.759564] nouveau 0000:01:00.0: msvld: unable to load firmware data
[ 3814.759566] nouveau 0000:01:00.0: msvld: init failed, -19

otherwise, the video plays ok (disregarding tearing).


I'm using Arch Linux
- Linux 4.4.0-rc3-ARCH-00005-g2255702 #10 SMP PREEMPT Tue Dec 1 17:59:34 CET
2015 x86_64 GNU/Linux
- 01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 770]
(rev a1)

hwinfo:

21: PCI 100.0: 0300 VGA compatible controller (VGA)
  [Created at pci.328]
  Unique ID: VCu0.m9CZZByo01D
  Parent ID: vSkL.L3QNiGMcNjA
  SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: "nVidia VGA compatible controller"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x1184 
  SubVendor: pci 0x10b0 "CardExpert Technology"
  SubDevice: pci 0x1184 
  Revision: 0xa1
  Driver: "nouveau"
  Driver Modules: "drm"
  Memory Range: 0xea000000-0xeaffffff (rw,non-prefetchable)
  Memory Range: 0xe0000000-0xe7ffffff (ro,non-prefetchable)
  Memory Range: 0xe8000000-0xe9ffffff (ro,non-prefetchable)
  I/O Ports: 0xe000-0xefff (rw)
  Memory Range: 0xeb000000-0xeb07ffff (ro,non-prefetchable,disabled)
  IRQ: 27 (858918 events)
  Module Alias: "pci:v000010DEd00001184sv000010B0sd00001184bc03sc00i00"
  Driver Info #0:
    Driver Status: nouveau is active
    Driver Activation Cmd: "modprobe nouveau"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #7 (PCI bridge)

Primary display adapter: #21


Do you need some other logs?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448994289.Bafb680.27338
Date: Tue, 1 Dec 2015 18:24:49 +0000
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
   title="NEW - Direct firmware load for nouveau/nve4_fuc084 failed with error -2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93195">93195</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Direct firmware load for nouveau/nve4_fuc084 failed with error -2
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>minor
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>askondro&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When opening VLC in xfce and playing a video I get this message with dmesg:

[ 3814.759551] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve4_fuc084 failed with error -2
[ 3814.759562] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve4_fuc084d failed with error -2
[ 3814.759564] nouveau 0000:01:00.0: msvld: unable to load firmware data
[ 3814.759566] nouveau 0000:01:00.0: msvld: init failed, -19

otherwise, the video plays ok (disregarding tearing).


I'm using Arch Linux
- Linux 4.4.0-rc3-ARCH-00005-g2255702 #10 SMP PREEMPT Tue Dec 1 17:59:34 CET
2015 x86_64 GNU/Linux
- 01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 770]
(rev a1)

hwinfo:

21: PCI 100.0: 0300 VGA compatible controller (VGA)
  [Created at pci.328]
  Unique ID: VCu0.m9CZZByo01D
  Parent ID: vSkL.L3QNiGMcNjA
  SysFS ID: /devices/pci0000:00/0000:00:01.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: &quot;nVidia VGA compatible controller&quot;
  Vendor: pci 0x10de &quot;nVidia Corporation&quot;
  Device: pci 0x1184 
  SubVendor: pci 0x10b0 &quot;CardExpert Technology&quot;
  SubDevice: pci 0x1184 
  Revision: 0xa1
  Driver: &quot;nouveau&quot;
  Driver Modules: &quot;drm&quot;
  Memory Range: 0xea000000-0xeaffffff (rw,non-prefetchable)
  Memory Range: 0xe0000000-0xe7ffffff (ro,non-prefetchable)
  Memory Range: 0xe8000000-0xe9ffffff (ro,non-prefetchable)
  I/O Ports: 0xe000-0xefff (rw)
  Memory Range: 0xeb000000-0xeb07ffff (ro,non-prefetchable,disabled)
  IRQ: 27 (858918 events)
  Module Alias: &quot;pci:v000010DEd00001184sv000010B0sd00001184bc03sc00i00&quot;
  Driver Info #0:
    Driver Status: nouveau is active
    Driver Activation Cmd: &quot;modprobe nouveau&quot;
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #7 (PCI bridge)

Primary display adapter: #21


Do you need some other logs?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448994289.Bafb680.27338--

--===============1937334152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1937334152==--
