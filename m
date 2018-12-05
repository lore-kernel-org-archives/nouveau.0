From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Wed, 05 Dec 2018 15:21:23 +0000
Message-ID: <bug-98386-8800-1sVl79uLX1@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0061210952=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0061210952==
Content-Type: multipart/alternative; boundary="15440232833.2Adcc10D3.16470"
Content-Transfer-Encoding: 7bit


--15440232833.2Adcc10D3.16470
Date: Wed, 5 Dec 2018 15:21:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #23 from Cameron <cameron-+zXD/wg+ns71P9xLtpHBDw@public.gmane.org> ---
I just started getting these FAULTS
Running openSUSE Tumbelweed
kernel 4.19.5-1-default

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
Dec 05 07:35:28 flisk kernel: usb 2-2: new SuperSpeed Gen 1 USB device numb=
er 2
using xhci_hcd
Dec 05 07:35:28 flisk kernel: usb 4-1: new SuperSpeed Gen 1 USB device numb=
er 2
using xhci_hcd

Should I try passing the nouveau.runpm=3D0 to see if that helps?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15440232833.2Adcc10D3.16470
Date: Wed, 5 Dec 2018 15:21:23 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c23">Commen=
t # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cameron&#64;seader.us" title=3D"Cameron &lt;cameron&#64;seader.us&gt;"> <sp=
an class=3D"fn">Cameron</span></a>
</span></b>
        <pre>I just started getting these FAULTS
Running openSUSE Tumbelweed
kernel 4.19.5-1-default

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
Dec 05 07:35:28 flisk kernel: usb 2-2: new SuperSpeed Gen 1 USB device numb=
er 2
using xhci_hcd
Dec 05 07:35:28 flisk kernel: usb 4-1: new SuperSpeed Gen 1 USB device numb=
er 2
using xhci_hcd

Should I try passing the nouveau.runpm=3D0 to see if that helps?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15440232833.2Adcc10D3.16470--

--===============0061210952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0061210952==--
