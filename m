From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104835] MMIO read of 00000000 FAULT at 10ac08 [ IBUS
 ]
Date: Wed, 05 Dec 2018 15:47:11 +0000
Message-ID: <bug-104835-8800-6jogMkglBf@http.bugs.freedesktop.org/>
References: <bug-104835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0623255206=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0623255206==
Content-Type: multipart/alternative; boundary="15440248312.FAd7.20466"
Content-Transfer-Encoding: 7bit


--15440248312.FAd7.20466
Date: Wed, 5 Dec 2018 15:47:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

--- Comment #5 from Cameron <cameron-+zXD/wg+ns71P9xLtpHBDw@public.gmane.org> ---
openSUSE Tumbleweed
Kernel 4.19.5-1-default

Getting the same errors

Dell precision 5520

Model: "nVidia GM107GLM [Quadro M1200 Mobile]"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x13b6 "GM107GLM [Quadro M1200 Mobile]"

Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000=
000
FAULT at 022554 [ IBUS ]
Dec 05 07:35:28 flisk kernel: fbcon: Taking over console
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000=
000
FAULT at 10ac08 [ IBUS ]
Dec 05 07:35:28 flisk kernel: usb 1-4: New USB device found, idVendor=3D808=
7,
idProduct=3D0a2b, bcdDevice=3D 0.10
Dec 05 07:35:28 flisk kernel: usb 1-4: New USB device strings: Mfr=3D0,
Product=3D0, SerialNumber=3D0
Dec 05 07:35:28 flisk kernel: usb 3-1: New USB device found, idVendor=3D042=
4,
idProduct=3D2137, bcdDevice=3D60.80
Dec 05 07:35:28 flisk kernel: usb 3-1: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
Dec 05 07:35:28 flisk kernel: usb 3-1: Product: USB2137B
Dec 05 07:35:28 flisk kernel: usb 3-1: Manufacturer: SMSC
Dec 05 07:35:28 flisk kernel: hub 3-1:1.0: USB hub found
Dec 05 07:35:28 flisk kernel: hub 3-1:1.0: 7 ports detected
Dec 05 07:35:28 flisk kernel: vga_switcheroo: enabled
Dec 05 07:35:28 flisk kernel: [TTM] Zone  kernel: Available graphics memory:
16391158 kiB
Dec 05 07:35:28 flisk kernel: [TTM] Zone   dma32: Available graphics memory:
2097152 kiB
Dec 05 07:35:28 flisk kernel: [TTM] Initializing pool allocator
Dec 05 07:35:28 flisk kernel: [TTM] Initializing DMA pool allocator
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: Pointer to TMDS ta=
ble
invalid
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for
buffer copies
Dec 05 07:35:28 flisk kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15440248312.FAd7.20466
Date: Wed, 5 Dec 2018 15:47:11 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835">bug 10483=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cameron&#64;seader.us" title=3D"Cameron &lt;cameron&#64;seader.us&gt;"> <sp=
an class=3D"fn">Cameron</span></a>
</span></b>
        <pre>openSUSE Tumbleweed
Kernel 4.19.5-1-default

Getting the same errors

Dell precision 5520

Model: &quot;nVidia GM107GLM [Quadro M1200 Mobile]&quot;
  Vendor: pci 0x10de &quot;nVidia Corporation&quot;
  Device: pci 0x13b6 &quot;GM107GLM [Quadro M1200 Mobile]&quot;

Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000=
000
FAULT at 022554 [ IBUS ]
Dec 05 07:35:28 flisk kernel: fbcon: Taking over console
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000=
000
FAULT at 10ac08 [ IBUS ]
Dec 05 07:35:28 flisk kernel: usb 1-4: New USB device found, idVendor=3D808=
7,
idProduct=3D0a2b, bcdDevice=3D 0.10
Dec 05 07:35:28 flisk kernel: usb 1-4: New USB device strings: Mfr=3D0,
Product=3D0, SerialNumber=3D0
Dec 05 07:35:28 flisk kernel: usb 3-1: New USB device found, idVendor=3D042=
4,
idProduct=3D2137, bcdDevice=3D60.80
Dec 05 07:35:28 flisk kernel: usb 3-1: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
Dec 05 07:35:28 flisk kernel: usb 3-1: Product: USB2137B
Dec 05 07:35:28 flisk kernel: usb 3-1: Manufacturer: SMSC
Dec 05 07:35:28 flisk kernel: hub 3-1:1.0: USB hub found
Dec 05 07:35:28 flisk kernel: hub 3-1:1.0: 7 ports detected
Dec 05 07:35:28 flisk kernel: vga_switcheroo: enabled
Dec 05 07:35:28 flisk kernel: [TTM] Zone  kernel: Available graphics memory:
16391158 kiB
Dec 05 07:35:28 flisk kernel: [TTM] Zone   dma32: Available graphics memory:
2097152 kiB
Dec 05 07:35:28 flisk kernel: [TTM] Initializing pool allocator
Dec 05 07:35:28 flisk kernel: [TTM] Initializing DMA pool allocator
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: Pointer to TMDS ta=
ble
invalid
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for
buffer copies
Dec 05 07:35:28 flisk kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15440248312.FAd7.20466--

--===============0623255206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0623255206==--
