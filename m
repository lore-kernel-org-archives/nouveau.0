From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91402] New: linux-4.1 nv108 Invalid ROM contents
Date: Mon, 20 Jul 2015 13:18:08 +0000
Message-ID: <bug-91402-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0658145968=="
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


--===============0658145968==
Content-Type: multipart/alternative; boundary="1437398288.81611.26838"; charset="UTF-8"


--1437398288.81611.26838
Date: Mon, 20 Jul 2015 13:18:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91402

            Bug ID: 91402
           Summary: linux-4.1 nv108 Invalid ROM contents
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vdanjean.ml-GANU6spQydw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I'm mainly using Debian compiled kernels.
With 3.19.0-trunk-amd64, 4.0.0-1-amd64 and 4.0.0-2-amd64, I got dmesg output
similar what is present in #89047. For example:

[...]
Jul 17 22:52:11 eyak kernel: Kernel command line:
BOOT_IMAGE=/vmlinuz-4.0.0-2-amd64 root=/dev/mapper/eyak-root ro acpi_osi=Linux
"acpi_osi=!Windows 2012" acpi=force acpi_enforce_resources=lax
i915.enable_rc6=1 i915.enable_fbc=1 i915.lvds_downclock=1 i915.semaph
ores=1 drm.vblankoffdelay=1 acpi_backlight=vendor apparmor=1 security=apparmor
quiet
[...]
Jul 17 22:52:11 eyak kernel: VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEGP.DGFX handle
Jul 17 22:52:11 eyak kernel: checking generic (a0000000 7e9000) vs hw (50000000
10000000)
Jul 17 22:52:11 eyak kernel: checking generic (a0000000 7e9000) vs hw (60000000
2000000)
Jul 17 22:52:11 eyak kernel: nouveau 0000:01:00.0: enabling device (0004 ->
0007)
Jul 17 22:52:11 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x108390a1
Jul 17 22:52:11 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208
(NV108)
Jul 17 22:52:11 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
Jul 17 22:52:11 eyak kernel: rtsx_pci 0000:5d:00.0: enabling device (0000 ->
0002)
Jul 17 22:52:11 eyak kernel: rtsx_pci 0000:5d:00.0: rtsx_pci_acquire_irq:
pcr->msi_en = 1, pci->irq = 28
Jul 17 22:52:11 eyak kernel: nouveau 0000:01:00.0: Invalid ROM contents
Jul 17 22:52:11 eyak kernel: nouveau ![   VBIOS][0000:01:00.0] unable to locate
usable image
Jul 17 22:52:11 eyak kernel: nouveau E[  DEVICE][0000:01:00.0] failed to create
0x10000001, -22
Jul 17 22:52:11 eyak kernel: nouveau E[     DRM] failed to create 0x00000080,
-22
Jul 17 22:52:11 eyak kernel: nouveau: probe of 0000:01:00.0 failed with error
-22
[...]

As #89047 is claimed fixed in 4.1, I just tried on the new Debian
linux-image-4.1.0-trunk-amd64 package.
Now, the error message is different but the nouveau driver still do not load:

[...]
Jul 20 14:26:01 eyak kernel: Kernel command line:
BOOT_IMAGE=/vmlinuz-4.1.0-trunk-amd64 root=/dev/mapper/eyak-root ro
acpi_osi=Linux "acpi_osi=!Windows 2012" acpi=force acpi_enforce_resources=lax
i915.enable_rc6=1 i915.enable_fbc=1 i915.lvds_downclock=1 i915.se
maphores=1 drm.vblankoffdelay=1 acpi_backlight=vendor apparmor=1
security=apparmor quiet
[...]
Jul 20 14:26:01 eyak kernel: VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEGP.DGFX handle
Jul 20 14:26:01 eyak kernel: checking generic (a0000000 7e9000) vs hw (50000000
10000000)
Jul 20 14:26:01 eyak kernel: checking generic (a0000000 7e9000) vs hw (60000000
2000000)
Jul 20 14:26:01 eyak kernel: nouveau 0000:01:00.0: enabling device (0004 ->
0007)
Jul 20 14:26:01 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x108390a1
Jul 20 14:26:01 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208
(NV108)
Jul 20 14:26:01 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] using image from
ACPI
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature
found
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] version
80.28.52.00.09
Jul 20 14:26:01 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB version 0x49
unknown
Jul 20 14:26:01 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB version 0x49
unknown
Jul 20 14:26:01 eyak kernel: nouveau  [ DEVINIT][0000:01:00.0] adaptor not
initialised
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Jul 20 14:26:01 eyak kernel: nouveau E[   VBIOS][0000:01:00.0] 0x3830[0]:
unknown opcode 0x70
Jul 20 14:26:01 eyak kernel: nouveau E[ DEVINIT][0000:01:00.0] init failed, -22
Jul 20 14:26:01 eyak kernel: nouveau E[     DRM] failed to create 0x00000080,
-22
Jul 20 14:26:01 eyak kernel: nouveau: probe of 0000:01:00.0 failed with error
-22


So, it seems a little bit better but not yet working. It means that I must
stick with the intel graphic card that cannot use DVI and HDMI outputs (or use
the NVidia module)

My laptop is an HP ZBook 15 with the latest available BIOS (L70 Ver. 01.32)

Any ideas?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437398288.81611.26838
Date: Mon, 20 Jul 2015 13:18:08 +0000
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
   title="NEW - linux-4.1 nv108 Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91402">91402</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>linux-4.1 nv108 Invalid ROM contents
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
          <td>critical
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
          <td>vdanjean.ml&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm mainly using Debian compiled kernels.
With 3.19.0-trunk-amd64, 4.0.0-1-amd64 and 4.0.0-2-amd64, I got dmesg output
similar what is present in #89047. For example:

[...]
Jul 17 22:52:11 eyak kernel: Kernel command line:
BOOT_IMAGE=/vmlinuz-4.0.0-2-amd64 root=/dev/mapper/eyak-root ro acpi_osi=Linux
&quot;acpi_osi=!Windows 2012&quot; acpi=force acpi_enforce_resources=lax
i915.enable_rc6=1 i915.enable_fbc=1 i915.lvds_downclock=1 i915.semaph
ores=1 drm.vblankoffdelay=1 acpi_backlight=vendor apparmor=1 security=apparmor
quiet
[...]
Jul 17 22:52:11 eyak kernel: VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEGP.DGFX handle
Jul 17 22:52:11 eyak kernel: checking generic (a0000000 7e9000) vs hw (50000000
10000000)
Jul 17 22:52:11 eyak kernel: checking generic (a0000000 7e9000) vs hw (60000000
2000000)
Jul 17 22:52:11 eyak kernel: nouveau 0000:01:00.0: enabling device (0004 -&gt;
0007)
Jul 17 22:52:11 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x108390a1
Jul 17 22:52:11 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208
(NV108)
Jul 17 22:52:11 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
Jul 17 22:52:11 eyak kernel: rtsx_pci 0000:5d:00.0: enabling device (0000 -&gt;
0002)
Jul 17 22:52:11 eyak kernel: rtsx_pci 0000:5d:00.0: rtsx_pci_acquire_irq:
pcr-&gt;msi_en = 1, pci-&gt;irq = 28
Jul 17 22:52:11 eyak kernel: nouveau 0000:01:00.0: Invalid ROM contents
Jul 17 22:52:11 eyak kernel: nouveau ![   VBIOS][0000:01:00.0] unable to locate
usable image
Jul 17 22:52:11 eyak kernel: nouveau E[  DEVICE][0000:01:00.0] failed to create
0x10000001, -22
Jul 17 22:52:11 eyak kernel: nouveau E[     DRM] failed to create 0x00000080,
-22
Jul 17 22:52:11 eyak kernel: nouveau: probe of 0000:01:00.0 failed with error
-22
[...]

As #89047 is claimed fixed in 4.1, I just tried on the new Debian
linux-image-4.1.0-trunk-amd64 package.
Now, the error message is different but the nouveau driver still do not load:

[...]
Jul 20 14:26:01 eyak kernel: Kernel command line:
BOOT_IMAGE=/vmlinuz-4.1.0-trunk-amd64 root=/dev/mapper/eyak-root ro
acpi_osi=Linux &quot;acpi_osi=!Windows 2012&quot; acpi=force acpi_enforce_resources=lax
i915.enable_rc6=1 i915.enable_fbc=1 i915.lvds_downclock=1 i915.se
maphores=1 drm.vblankoffdelay=1 acpi_backlight=vendor apparmor=1
security=apparmor quiet
[...]
Jul 20 14:26:01 eyak kernel: VGA switcheroo: detected Optimus DSM method
\_SB_.PCI0.PEGP.DGFX handle
Jul 20 14:26:01 eyak kernel: checking generic (a0000000 7e9000) vs hw (50000000
10000000)
Jul 20 14:26:01 eyak kernel: checking generic (a0000000 7e9000) vs hw (60000000
2000000)
Jul 20 14:26:01 eyak kernel: nouveau 0000:01:00.0: enabling device (0004 -&gt;
0007)
Jul 20 14:26:01 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  :
0x108390a1
Jul 20 14:26:01 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208
(NV108)
Jul 20 14:26:01 eyak kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] using image from
ACPI
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature
found
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] version
80.28.52.00.09
Jul 20 14:26:01 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB version 0x49
unknown
Jul 20 14:26:01 eyak kernel: nouveau W[   VBIOS][0000:01:00.0] DCB version 0x49
unknown
Jul 20 14:26:01 eyak kernel: nouveau  [ DEVINIT][0000:01:00.0] adaptor not
initialised
Jul 20 14:26:01 eyak kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Jul 20 14:26:01 eyak kernel: nouveau E[   VBIOS][0000:01:00.0] 0x3830[0]:
unknown opcode 0x70
Jul 20 14:26:01 eyak kernel: nouveau E[ DEVINIT][0000:01:00.0] init failed, -22
Jul 20 14:26:01 eyak kernel: nouveau E[     DRM] failed to create 0x00000080,
-22
Jul 20 14:26:01 eyak kernel: nouveau: probe of 0000:01:00.0 failed with error
-22


So, it seems a little bit better but not yet working. It means that I must
stick with the intel graphic card that cannot use DVI and HDMI outputs (or use
the NVidia module)

My laptop is an HP ZBook 15 with the latest available BIOS (L70 Ver. 01.32)

Any ideas?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437398288.81611.26838--

--===============0658145968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0658145968==--
