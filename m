From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 14:00:49 +0000
Message-ID: <bug-98240-8800-sSOI92GW8f@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0902316414=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98240-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0902316414==
Content-Type: multipart/alternative; boundary="14764536490.ADCC49.9946";
 charset="UTF-8"


--14764536490.ADCC49.9946
Date: Fri, 14 Oct 2016 14:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #14 from Sergey Okhapkin <sos-iE5g+WOE291eeLb3ft/vUmD2FQJk+8+b@public.gmane.org> ---
Seems working.

[  637.158783] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  637.158870] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  637.158978] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  637.160088] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[  637.160095] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  637.160096] nouveau: detected PR support, will not use DSM
[  637.160955] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[  637.167300] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
[  637.167614] retrieving _ROM off: 0x1000, len: 0xf000, ret: 0xf000
[  637.167941] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
[  637.168326] retrieving _ROM off: 0x1000, len: 0x1000, ret: 0x1000
[  637.168643] retrieving _ROM off: 0x2000, len: 0x1000, ret: 0x1000
[  637.168948] retrieving _ROM off: 0x3000, len: 0x1000, ret: 0x1000
[  637.169330] retrieving _ROM off: 0x4000, len: 0x1000, ret: 0x1000
[  637.169647] retrieving _ROM off: 0x5000, len: 0x1000, ret: 0x1000
[  637.169949] retrieving _ROM off: 0x6000, len: 0x1000, ret: 0x1000
[  637.170388] retrieving _ROM off: 0x7000, len: 0x1000, ret: 0x1000
[  637.170691] retrieving _ROM off: 0x8000, len: 0x1000, ret: 0x1000
[  637.170993] retrieving _ROM off: 0x9000, len: 0x1000, ret: 0x1000
[  637.171398] retrieving _ROM off: 0xa000, len: 0x1000, ret: 0x1000
[  637.171734] retrieving _ROM off: 0xb000, len: 0x1000, ret: 0x1000
[  637.172065] retrieving _ROM off: 0xc000, len: 0x1000, ret: 0x1000
[  637.172461] retrieving _ROM off: 0xd000, len: 0x1000, ret: 0x1000
[  637.172789] retrieving _ROM off: 0xe000, len: 0x1000, ret: 0x1000
[  637.173106] retrieving _ROM off: 0xf000, len: 0x1000, ret: 0x1000
[  637.173559] retrieving _ROM off: 0x10000, len: 0x1000, ret: 0x1000
[  637.173900] retrieving _ROM off: 0x11000, len: 0x1000, ret: 0x1000
[  637.174403] retrieving _ROM off: 0x12000, len: 0x1000, ret: 0x1000
[  637.174739] retrieving _ROM off: 0x13000, len: 0x1000, ret: 0x1000
[  637.175070] retrieving _ROM off: 0x14000, len: 0x1000, ret: 0x1000
[  637.175514] retrieving _ROM off: 0x15000, len: 0x1000, ret: 0x1000
[  637.175841] retrieving _ROM off: 0x16000, len: 0x1000, ret: 0x1000
[  637.176169] retrieving _ROM off: 0x17000, len: 0x1000, ret: 0x1000
[  637.176580] retrieving _ROM off: 0x18000, len: 0x1000, ret: 0x1000
[  637.176908] retrieving _ROM off: 0x19000, len: 0x1000, ret: 0x1000
[  637.176921] retrieving _ROM off: 0x1a000, len: 0x1000, ret: 0x1000
[  637.177021] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[  637.323115] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[  637.323120] nouveau 0000:01:00.0: priv: HUB0: 614900 00800000 (1c408200)
[  637.987352] vga_switcheroo: enabled
[  637.987641] [TTM] Zone  kernel: Available graphics memory: 4032186 kiB
[  637.987642] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  637.987643] [TTM] Initializing pool allocator
[  637.987647] [TTM] Initializing DMA pool allocator
[  637.987659] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[  637.987661] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[  637.987664] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[  637.987666] nouveau 0000:01:00.0: DRM: DCB version 4.0
[  637.987668] nouveau 0000:01:00.0: DRM: DCB outp 00: 08000f82 00020030
[  637.987669] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000061
[  637.987674] nouveau 0000:01:00.0: DRM: BIOS FP mode: 1024x768 (65000kHz
pixel clock)
[  638.016774] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  638.016775] [drm] Driver supports precise vblank timestamp query.
[  638.196517] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[  638.196525] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764536490.ADCC49.9946
Date: Fri, 14 Oct 2016 14:00:49 +0000
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
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240">bug 98240<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sos&#64;sokhapkin.dyndns.org" title=3D"Sergey Okhapkin &lt;sos&#64;sokhapki=
n.dyndns.org&gt;"> <span class=3D"fn">Sergey Okhapkin</span></a>
</span></b>
        <pre>Seems working.

[  637.158783] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  637.158870] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  637.158978] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[  637.160088] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[  637.160095] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  637.160096] nouveau: detected PR support, will not use DSM
[  637.160955] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[  637.167300] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
[  637.167614] retrieving _ROM off: 0x1000, len: 0xf000, ret: 0xf000
[  637.167941] retrieving _ROM off: 0x0, len: 0x1000, ret: 0x1000
[  637.168326] retrieving _ROM off: 0x1000, len: 0x1000, ret: 0x1000
[  637.168643] retrieving _ROM off: 0x2000, len: 0x1000, ret: 0x1000
[  637.168948] retrieving _ROM off: 0x3000, len: 0x1000, ret: 0x1000
[  637.169330] retrieving _ROM off: 0x4000, len: 0x1000, ret: 0x1000
[  637.169647] retrieving _ROM off: 0x5000, len: 0x1000, ret: 0x1000
[  637.169949] retrieving _ROM off: 0x6000, len: 0x1000, ret: 0x1000
[  637.170388] retrieving _ROM off: 0x7000, len: 0x1000, ret: 0x1000
[  637.170691] retrieving _ROM off: 0x8000, len: 0x1000, ret: 0x1000
[  637.170993] retrieving _ROM off: 0x9000, len: 0x1000, ret: 0x1000
[  637.171398] retrieving _ROM off: 0xa000, len: 0x1000, ret: 0x1000
[  637.171734] retrieving _ROM off: 0xb000, len: 0x1000, ret: 0x1000
[  637.172065] retrieving _ROM off: 0xc000, len: 0x1000, ret: 0x1000
[  637.172461] retrieving _ROM off: 0xd000, len: 0x1000, ret: 0x1000
[  637.172789] retrieving _ROM off: 0xe000, len: 0x1000, ret: 0x1000
[  637.173106] retrieving _ROM off: 0xf000, len: 0x1000, ret: 0x1000
[  637.173559] retrieving _ROM off: 0x10000, len: 0x1000, ret: 0x1000
[  637.173900] retrieving _ROM off: 0x11000, len: 0x1000, ret: 0x1000
[  637.174403] retrieving _ROM off: 0x12000, len: 0x1000, ret: 0x1000
[  637.174739] retrieving _ROM off: 0x13000, len: 0x1000, ret: 0x1000
[  637.175070] retrieving _ROM off: 0x14000, len: 0x1000, ret: 0x1000
[  637.175514] retrieving _ROM off: 0x15000, len: 0x1000, ret: 0x1000
[  637.175841] retrieving _ROM off: 0x16000, len: 0x1000, ret: 0x1000
[  637.176169] retrieving _ROM off: 0x17000, len: 0x1000, ret: 0x1000
[  637.176580] retrieving _ROM off: 0x18000, len: 0x1000, ret: 0x1000
[  637.176908] retrieving _ROM off: 0x19000, len: 0x1000, ret: 0x1000
[  637.176921] retrieving _ROM off: 0x1a000, len: 0x1000, ret: 0x1000
[  637.177021] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[  637.323115] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[  637.323120] nouveau 0000:01:00.0: priv: HUB0: 614900 00800000 (1c408200)
[  637.987352] vga_switcheroo: enabled
[  637.987641] [TTM] Zone  kernel: Available graphics memory: 4032186 kiB
[  637.987642] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  637.987643] [TTM] Initializing pool allocator
[  637.987647] [TTM] Initializing DMA pool allocator
[  637.987659] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[  637.987661] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[  637.987664] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[  637.987666] nouveau 0000:01:00.0: DRM: DCB version 4.0
[  637.987668] nouveau 0000:01:00.0: DRM: DCB outp 00: 08000f82 00020030
[  637.987669] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000061
[  637.987674] nouveau 0000:01:00.0: DRM: BIOS FP mode: 1024x768 (65000kHz
pixel clock)
[  638.016774] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  638.016775] [drm] Driver supports precise vblank timestamp query.
[  638.196517] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[  638.196525] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764536490.ADCC49.9946--

--===============0902316414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0902316414==--
