From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27064] Nouveau fails to start X. This is a Nvidia
 G210m, the laptop is an asus UL50vt
Date: Thu, 04 Oct 2012 19:48:11 +0000
Message-ID: <bug-27064-8800-l5XbCbdjIl@http.bugs.freedesktop.org/>
References: <bug-27064-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887007905=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27064-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1887007905==
Content-Type: multipart/alternative; boundary="1349380091.0BdB2.586"; charset="us-ascii"


--1349380091.0BdB2.586
Date: Thu, 4 Oct 2012 19:48:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27064

--- Comment #6 from Miles Lane <miles.lane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Are any of you involved in the development of the nouveau kernel driver?  I am
currently attempting to get the nouveau kernel driver to load/setup
successfully.  I also have a UL50VT.  This laptop does not support Optimus, but
rather has a hardware MUX.

I looked at the nouveau and i915 code and see they need to parse DSM
information to determine whether vgaswitcheroo is supported.  In addition to
the nouveau driver not getting set up correctly, I don't see
/sys/kernel/debug/vgaswitcheroo.

nouveau T[  DEVICE][0000:01:00.0] inc() == 2
nouveau T[     DRM] inc() == 3
nouveau T[     DRM] inc() == 4
nouveau T[     DRM] inc() == 5
nouveau T[  DEVICE][0000:01:00.0] inc() == 3
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a8a00a2
nouveau  [  DEVICE][0000:01:00.0] Chipset: GT218 (NVA8)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau D[  DEVICE][0000:01:00.0] crystal freq: 27000KHz
nouveau T[  DEVICE][0000:01:00.0] inc() == 4
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
nouveau 0000:01:00.0: Invalid ROM contents
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001, -22
nouveau T[  DEVICE][0000:01:00.0] dec() == 3
nouveau E[     DRM] failed to create 0x80000080, -22
nouveau T[  DEVICE][0000:01:00.0] dec() == 2
nouveau T[     DRM] dec() == 4
nouveau T[     DRM] dec() == 3
nouveau T[     DRM] dec() == 2
nouveau D[     DRM] fini running
nouveau T[     DRM] 0xffffffff:0xffffffff fini children
nouveau T[     DRM] 0xffffffff:0xffffffff fini running
nouveau T[     DRM] use(-1) == 1
nouveau T[     DRM] 0xffffffff:0xffffffff fini completed
nouveau D[     DRM] fini completed with 0
nouveau T[     DRM] dec() == 0
nouveau D[     DRM] destroying
nouveau T[  DEVICE][0000:01:00.0] dec() == 1
nouveau T[     DRM] 0xffffffff:0xffffffff destroy running
nouveau T[     DRM] 0xffffffff:0xffffffff destroy completed
nouveau T[     DRM] dec() == -1
nouveau T[  DEVICE][0000:01:00.0] dec() == 0
nouveau D[  DEVICE][0000:01:00.0] destroying
nouveau: probe of 0000:01:00.0 failed with error -22

# lspci
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset
Integrated Graphics Controller (rev 07)
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce G210M]
(rev a2)

dmesg:

[    3.517680] vesafb: mode is 1024x768x32, linelength=4096, pages=0
[    3.517691] vesafb: scrolling: redraw
[    3.517700] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    3.518342] vesafb: framebuffer at 0xd0000000, mapped to 0xffffc90011380000,
using 3072k, total 3072k
[    3.555338] Console: switching to colour frame buffer device 128x48
[    3.585908] fb0: VESA VGA frame buffer device
[   21.367309] Linux agpgart interface v0.103
[   21.422456] ACPI: AC Adapter [AC0] (on-line)
[   21.425939] agpgart-intel 0000:00:00.0: Intel GM45 Chipset
[   21.426209] agpgart-intel 0000:00:00.0: detected gtt size: 2097152K total,
262144K mappable
[   21.427707] agpgart-intel 0000:00:00.0: detected 32768K stolen memory
[   21.429098] agpgart-intel 0000:00:00.0: AGP aperture is 256M @ 0xd0000000
[   21.704900] [drm] Initialized drm 1.1.0 20060810
[   23.171595] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013a694000 (20120711/exresop-590)
[   23.171605] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20120711/dswexec-460)
[   23.171899] ACPI Error: Method parse/execution failed [\_SB_.PCI0.VGA_._DSM]
(Node ffff88013ab50000), AE_AML_OPERAND_TYPE (20120711/psparse-536)
[   23.172151] failed to evaluate _DSM: 12291
[   23.193181] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013a695c20 (20120711/exresop-590)
[   23.193192] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20120711/dswexec-460)
[   23.193548] ACPI Error: Method parse/execution failed [\_SB_.PCI0.VGA_._DSM]
(Node ffff88013ab50000), AE_AML_OPERAND_TYPE (20120711/psparse-536)
[   23.193669] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.P0P1.VGA_._DSM] (Node ffff88013ab6a730), AE_AML_OPERAND_TYPE
(20120711/psparse-536)
[   23.193955] failed to evaluate _DSM: 12291
[   23.199675] checking generic (d0000000 300000) vs hw (e0000000 10000000)
[   23.199680] checking generic (d0000000 300000) vs hw (fa000000 2000000)
[   23.199911] nouveau 0000:01:00.0: enabling device (0004 -> 0007)
[   23.215724] asus_laptop: Asus Laptop Support version 0.42
[   23.265572] asus_laptop:   UL50VT model detected
[   23.287663] checking generic (d0000000 300000) vs hw (d0000000 10000000)
[   23.287668] fb: conflicting fb hw usage inteldrmfb vs VESA VGA - removing
generic driver
[   23.482305] i915 0000:00:02.0: setting latency timer to 64
[   23.622888] i915 0000:00:02.0: irq 46 for MSI/MSI-X
[   23.632024] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   23.632029] [drm] Driver supports precise vblank timestamp query.
[   23.811555] vgaarb: device changed decodes:
PCI:0000:00:02.0,olddecodes=io+mem,decodes=none:owns=io+mem
[   23.811560] vgaarb: transferring owner from PCI:0000:00:02.0 to
PCI:0000:01:00.0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349380091.0BdB2.586
Date: Thu, 4 Oct 2012 19:48:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fails to start X. This is a Nvidia G210m, the laptop is an asus UL50vt"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27064#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fails to start X. This is a Nvidia G210m, the laptop is an asus UL50vt"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27064">bug 27064</a>
              from <span class="vcard"><a class="email" href="mailto:miles.lane&#64;gmail.com" title="Miles Lane &lt;miles.lane&#64;gmail.com&gt;"> <span class="fn">Miles Lane</span></a>
</span></b>
        <pre>Are any of you involved in the development of the nouveau kernel driver?  I am
currently attempting to get the nouveau kernel driver to load/setup
successfully.  I also have a UL50VT.  This laptop does not support Optimus, but
rather has a hardware MUX.

I looked at the nouveau and i915 code and see they need to parse DSM
information to determine whether vgaswitcheroo is supported.  In addition to
the nouveau driver not getting set up correctly, I don't see
/sys/kernel/debug/vgaswitcheroo.

nouveau T[  DEVICE][0000:01:00.0] inc() == 2
nouveau T[     DRM] inc() == 3
nouveau T[     DRM] inc() == 4
nouveau T[     DRM] inc() == 5
nouveau T[  DEVICE][0000:01:00.0] inc() == 3
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a8a00a2
nouveau  [  DEVICE][0000:01:00.0] Chipset: GT218 (NVA8)
nouveau  [  DEVICE][0000:01:00.0] Family : NV50
nouveau D[  DEVICE][0000:01:00.0] crystal freq: 27000KHz
nouveau T[  DEVICE][0000:01:00.0] inc() == 4
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
nouveau 0000:01:00.0: Invalid ROM contents
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau E[   VBIOS][0000:01:00.0] unable to locate usable image
nouveau E[  DEVICE][0000:01:00.0] failed to create 0x10000001, -22
nouveau T[  DEVICE][0000:01:00.0] dec() == 3
nouveau E[     DRM] failed to create 0x80000080, -22
nouveau T[  DEVICE][0000:01:00.0] dec() == 2
nouveau T[     DRM] dec() == 4
nouveau T[     DRM] dec() == 3
nouveau T[     DRM] dec() == 2
nouveau D[     DRM] fini running
nouveau T[     DRM] 0xffffffff:0xffffffff fini children
nouveau T[     DRM] 0xffffffff:0xffffffff fini running
nouveau T[     DRM] use(-1) == 1
nouveau T[     DRM] 0xffffffff:0xffffffff fini completed
nouveau D[     DRM] fini completed with 0
nouveau T[     DRM] dec() == 0
nouveau D[     DRM] destroying
nouveau T[  DEVICE][0000:01:00.0] dec() == 1
nouveau T[     DRM] 0xffffffff:0xffffffff destroy running
nouveau T[     DRM] 0xffffffff:0xffffffff destroy completed
nouveau T[     DRM] dec() == -1
nouveau T[  DEVICE][0000:01:00.0] dec() == 0
nouveau D[  DEVICE][0000:01:00.0] destroying
nouveau: probe of 0000:01:00.0 failed with error -22

# lspci
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset
Integrated Graphics Controller (rev 07)
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce G210M]
(rev a2)

dmesg:

[    3.517680] vesafb: mode is 1024x768x32, linelength=4096, pages=0
[    3.517691] vesafb: scrolling: redraw
[    3.517700] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    3.518342] vesafb: framebuffer at 0xd0000000, mapped to 0xffffc90011380000,
using 3072k, total 3072k
[    3.555338] Console: switching to colour frame buffer device 128x48
[    3.585908] fb0: VESA VGA frame buffer device
[   21.367309] Linux agpgart interface v0.103
[   21.422456] ACPI: AC Adapter [AC0] (on-line)
[   21.425939] agpgart-intel 0000:00:00.0: Intel GM45 Chipset
[   21.426209] agpgart-intel 0000:00:00.0: detected gtt size: 2097152K total,
262144K mappable
[   21.427707] agpgart-intel 0000:00:00.0: detected 32768K stolen memory
[   21.429098] agpgart-intel 0000:00:00.0: AGP aperture is 256M &#64; 0xd0000000
[   21.704900] [drm] Initialized drm 1.1.0 20060810
[   23.171595] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013a694000 (20120711/exresop-590)
[   23.171605] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20120711/dswexec-460)
[   23.171899] ACPI Error: Method parse/execution failed [\_SB_.PCI0.VGA_._DSM]
(Node ffff88013ab50000), AE_AML_OPERAND_TYPE (20120711/psparse-536)
[   23.172151] failed to evaluate _DSM: 12291
[   23.193181] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013a695c20 (20120711/exresop-590)
[   23.193192] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20120711/dswexec-460)
[   23.193548] ACPI Error: Method parse/execution failed [\_SB_.PCI0.VGA_._DSM]
(Node ffff88013ab50000), AE_AML_OPERAND_TYPE (20120711/psparse-536)
[   23.193669] ACPI Error: Method parse/execution failed
[\_SB_.PCI0.P0P1.VGA_._DSM] (Node ffff88013ab6a730), AE_AML_OPERAND_TYPE
(20120711/psparse-536)
[   23.193955] failed to evaluate _DSM: 12291
[   23.199675] checking generic (d0000000 300000) vs hw (e0000000 10000000)
[   23.199680] checking generic (d0000000 300000) vs hw (fa000000 2000000)
[   23.199911] nouveau 0000:01:00.0: enabling device (0004 -&gt; 0007)
[   23.215724] asus_laptop: Asus Laptop Support version 0.42
[   23.265572] asus_laptop:   UL50VT model detected
[   23.287663] checking generic (d0000000 300000) vs hw (d0000000 10000000)
[   23.287668] fb: conflicting fb hw usage inteldrmfb vs VESA VGA - removing
generic driver
[   23.482305] i915 0000:00:02.0: setting latency timer to 64
[   23.622888] i915 0000:00:02.0: irq 46 for MSI/MSI-X
[   23.632024] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   23.632029] [drm] Driver supports precise vblank timestamp query.
[   23.811555] vgaarb: device changed decodes:
PCI:0000:00:02.0,olddecodes=io+mem,decodes=none:owns=io+mem
[   23.811560] vgaarb: transferring owner from PCI:0000:00:02.0 to
PCI:0000:01:00.0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349380091.0BdB2.586--

--===============1887007905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1887007905==--
