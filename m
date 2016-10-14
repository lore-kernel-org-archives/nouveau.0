From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] Kernel module fails to load on HP Pavilion
 V3A33AV laptop.
Date: Fri, 14 Oct 2016 02:06:27 +0000
Message-ID: <bug-98240-8800-6u6QzrnFmR@http.bugs.freedesktop.org/>
References: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0472075163=="
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


--===============0472075163==
Content-Type: multipart/alternative; boundary="14764107861.7f34DdB5.27164";
 charset="UTF-8"


--14764107861.7f34DdB5.27164
Date: Fri, 14 Oct 2016 02:06:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

--- Comment #4 from Sergey Okhapkin <sos-iE5g+WOE291eeLb3ft/vUmD2FQJk+8+b@public.gmane.org> ---
The patch works:

[ 1175.989212] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 1175.989299] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 1175.989407] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 1175.990458] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[ 1175.990465] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[ 1175.990466] nouveau: detected PR support, will not use DSM
[ 1175.990559] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[ 1176.003295] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[ 1176.004237] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[ 1176.666189] vga_switcheroo: enabled
[ 1176.666415] [TTM] Zone  kernel: Available graphics memory: 4032186 kiB
[ 1176.666435] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[ 1176.666435] [TTM] Initializing pool allocator
[ 1176.666438] [TTM] Initializing DMA pool allocator
[ 1176.666444] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[ 1176.666445] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[ 1176.666447] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[ 1176.666448] nouveau 0000:01:00.0: DRM: DCB version 4.0
[ 1176.666449] nouveau 0000:01:00.0: DRM: DCB outp 00: 08000f82 00020030
[ 1176.666450] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000061
[ 1176.666474] nouveau 0000:01:00.0: DRM: BIOS FP mode: 1024x768 (65000kHz
pixel clock)
[ 1176.683565] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 1176.683566] [drm] Driver supports precise vblank timestamp query.
[ 1176.817465] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[ 1176.817469] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[ 1182.560206] nouveau 0000:01:00.0: DRM: suspending console...
[ 1182.560207] nouveau 0000:01:00.0: DRM: suspending display...
[ 1182.560213] nouveau 0000:01:00.0: DRM: evicting buffers...
[ 1182.560214] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go
idle...
[ 1182.560228] nouveau 0000:01:00.0: DRM: suspending client object trees...
[ 1182.563009] nouveau 0000:01:00.0: DRM: suspending kernel object tree...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14764107861.7f34DdB5.27164
Date: Fri, 14 Oct 2016 02:06:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240#c4">Comment=
 # 4</a>
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
        <pre>The patch works:

[ 1175.989212] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 1175.989299] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 1175.989407] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 1175.990458] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[ 1175.990465] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[ 1175.990466] nouveau: detected PR support, will not use DSM
[ 1175.990559] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[ 1176.003295] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[ 1176.004237] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[ 1176.666189] vga_switcheroo: enabled
[ 1176.666415] [TTM] Zone  kernel: Available graphics memory: 4032186 kiB
[ 1176.666435] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[ 1176.666435] [TTM] Initializing pool allocator
[ 1176.666438] [TTM] Initializing DMA pool allocator
[ 1176.666444] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[ 1176.666445] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[ 1176.666447] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[ 1176.666448] nouveau 0000:01:00.0: DRM: DCB version 4.0
[ 1176.666449] nouveau 0000:01:00.0: DRM: DCB outp 00: 08000f82 00020030
[ 1176.666450] nouveau 0000:01:00.0: DRM: DCB conn 00: 01000061
[ 1176.666474] nouveau 0000:01:00.0: DRM: BIOS FP mode: 1024x768 (65000kHz
pixel clock)
[ 1176.683565] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 1176.683566] [drm] Driver supports precise vblank timestamp query.
[ 1176.817465] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[ 1176.817469] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[ 1182.560206] nouveau 0000:01:00.0: DRM: suspending console...
[ 1182.560207] nouveau 0000:01:00.0: DRM: suspending display...
[ 1182.560213] nouveau 0000:01:00.0: DRM: evicting buffers...
[ 1182.560214] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go
idle...
[ 1182.560228] nouveau 0000:01:00.0: DRM: suspending client object trees...
[ 1182.563009] nouveau 0000:01:00.0: DRM: suspending kernel object tree...<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14764107861.7f34DdB5.27164--

--===============0472075163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0472075163==--
