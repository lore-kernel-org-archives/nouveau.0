From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Tue, 08 Dec 2015 18:22:08 +0000
Message-ID: <bug-56615-8800-HRX84xGH4L@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1115780146=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1115780146==
Content-Type: multipart/alternative; boundary="1449598928.486e51A2.24397"; charset="UTF-8"


--1449598928.486e51A2.24397
Date: Tue, 8 Dec 2015 18:22:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #32 from Stefan <ste.lendl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same Problem on an T410 - NVS 3100M

When I boot the gdm wants to start, a mouse cursor appears but the display
stays black.
login in through tty and startx works fine!

I have a display connected via Display Port...

dmesg | ag "(drm|nouveau)"
[    1.326854] ata1.00: supports DRM functions and may not be fully accessible
[    1.328990] ata1.00: supports DRM functions and may not be fully accessible
[    2.707846] [drm] Initialized drm 1.1.0 20060810
[    4.153679] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a8600a2
[    4.153684] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT218 (NVA8)
[    4.153686] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    4.193558] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    4.193704] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    4.193708] nouveau  [   VBIOS][0000:01:00.0] version 70.18.4e.00.00
[    4.194400] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    4.194453] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    4.194455] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    4.194457] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 960 tags
[    4.197564] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1000000uv
[    4.238954] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    4.238974] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    4.238980] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    4.258996] nouveau  [     CLK][0000:01:00.0] 03: core 135 MHz shader 270
MHz memory 135 MHz
[    4.259001] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz shader 810
MHz memory 405 MHz
[    4.259006] nouveau  [     CLK][0000:01:00.0] 0f: core 606 MHz shader 1468
MHz memory 790 MHz
[    4.259081] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810
MHz memory 405 MHz
[    4.259516] nouveau  [     DRM] VRAM: 512 MiB
[    4.259518] nouveau  [     DRM] GART: 1048576 MiB
[    4.259524] nouveau  [     DRM] TMDS table version 2.0
[    4.259526] nouveau  [     DRM] DCB version 4.0
[    4.259529] nouveau  [     DRM] DCB outp 00: 01800323 00010034
[    4.259534] nouveau  [     DRM] DCB outp 01: 02811300 00000000
[    4.259536] nouveau  [     DRM] DCB outp 02: 028223a6 0f220010
[    4.259538] nouveau  [     DRM] DCB outp 03: 02822362 00020010
[    4.259540] nouveau  [     DRM] DCB outp 04: 048333b6 0f220010
[    4.259542] nouveau  [     DRM] DCB outp 05: 04833372 00020010
[    4.259543] nouveau  [     DRM] DCB outp 06: 088443c6 0f220010
[    4.259545] nouveau  [     DRM] DCB outp 07: 08844382 00020010
[    4.259547] nouveau  [     DRM] DCB conn 00: 00000040
[    4.259549] nouveau  [     DRM] DCB conn 01: 00000100
[    4.259551] nouveau  [     DRM] DCB conn 02: 00101246
[    4.259553] nouveau  [     DRM] DCB conn 03: 00202346
[    4.259555] nouveau  [     DRM] DCB conn 04: 00410446
[    4.290527] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.290531] [drm] Driver supports precise vblank timestamp query.
[    4.324628] nouveau  [     DRM] MM: using COPY for buffer copies
[    5.617924] nouveau  [     DRM] allocated 1920x1200 fb: 0x70000, bo
ffff88022edbe400
[    5.618256] fbcon: nouveaufb (fb0) is primary device
[    5.622086] nouveau E[   PDISP][0000:01:00.0] INVALID_VALUE [UNK84] chid 0
mthd 0x0828 data 0x0000a5c5
[    5.729431] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    5.729434] nouveau 0000:01:00.0: registered panic notifier
[    5.743721] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0


lspci -k | grep -A 2 -E "(VGA|3D)"                                              
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M] (rev
a2)
    Subsystem: Lenovo ThinkPad T410
    Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449598928.486e51A2.24397
Date: Tue, 8 Dec 2015 18:22:08 +0000
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
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:ste.lendl&#64;gmail.com" title="Stefan &lt;ste.lendl&#64;gmail.com&gt;"> <span class="fn">Stefan</span></a>
</span></b>
        <pre>I have the same Problem on an T410 - NVS 3100M

When I boot the gdm wants to start, a mouse cursor appears but the display
stays black.
login in through tty and startx works fine!

I have a display connected via Display Port...

dmesg | ag &quot;(drm|nouveau)&quot;
[    1.326854] ata1.00: supports DRM functions and may not be fully accessible
[    1.328990] ata1.00: supports DRM functions and may not be fully accessible
[    2.707846] [drm] Initialized drm 1.1.0 20060810
[    4.153679] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a8600a2
[    4.153684] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT218 (NVA8)
[    4.153686] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[    4.193558] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    4.193704] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    4.193708] nouveau  [   VBIOS][0000:01:00.0] version 70.18.4e.00.00
[    4.194400] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    4.194453] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    4.194455] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    4.194457] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 960 tags
[    4.197564] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 1000000uv
[    4.238954] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    4.238974] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    4.238980] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    4.258996] nouveau  [     CLK][0000:01:00.0] 03: core 135 MHz shader 270
MHz memory 135 MHz
[    4.259001] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz shader 810
MHz memory 405 MHz
[    4.259006] nouveau  [     CLK][0000:01:00.0] 0f: core 606 MHz shader 1468
MHz memory 790 MHz
[    4.259081] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810
MHz memory 405 MHz
[    4.259516] nouveau  [     DRM] VRAM: 512 MiB
[    4.259518] nouveau  [     DRM] GART: 1048576 MiB
[    4.259524] nouveau  [     DRM] TMDS table version 2.0
[    4.259526] nouveau  [     DRM] DCB version 4.0
[    4.259529] nouveau  [     DRM] DCB outp 00: 01800323 00010034
[    4.259534] nouveau  [     DRM] DCB outp 01: 02811300 00000000
[    4.259536] nouveau  [     DRM] DCB outp 02: 028223a6 0f220010
[    4.259538] nouveau  [     DRM] DCB outp 03: 02822362 00020010
[    4.259540] nouveau  [     DRM] DCB outp 04: 048333b6 0f220010
[    4.259542] nouveau  [     DRM] DCB outp 05: 04833372 00020010
[    4.259543] nouveau  [     DRM] DCB outp 06: 088443c6 0f220010
[    4.259545] nouveau  [     DRM] DCB outp 07: 08844382 00020010
[    4.259547] nouveau  [     DRM] DCB conn 00: 00000040
[    4.259549] nouveau  [     DRM] DCB conn 01: 00000100
[    4.259551] nouveau  [     DRM] DCB conn 02: 00101246
[    4.259553] nouveau  [     DRM] DCB conn 03: 00202346
[    4.259555] nouveau  [     DRM] DCB conn 04: 00410446
[    4.290527] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.290531] [drm] Driver supports precise vblank timestamp query.
[    4.324628] nouveau  [     DRM] MM: using COPY for buffer copies
[    5.617924] nouveau  [     DRM] allocated 1920x1200 fb: 0x70000, bo
ffff88022edbe400
[    5.618256] fbcon: nouveaufb (fb0) is primary device
[    5.622086] nouveau E[   PDISP][0000:01:00.0] INVALID_VALUE [UNK84] chid 0
mthd 0x0828 data 0x0000a5c5
[    5.729431] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    5.729434] nouveau 0000:01:00.0: registered panic notifier
[    5.743721] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0


lspci -k | grep -A 2 -E &quot;(VGA|3D)&quot;                                              
01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M] (rev
a2)
    Subsystem: Lenovo ThinkPad T410
    Kernel driver in use: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449598928.486e51A2.24397--

--===============1115780146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1115780146==--
