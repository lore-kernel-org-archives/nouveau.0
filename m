From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90976] GM204 (NV124) black screen on modesetting
Date: Sun, 20 Sep 2015 14:36:25 +0000
Message-ID: <bug-90976-8800-fyU3xOGhxT@http.bugs.freedesktop.org/>
References: <bug-90976-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1718387519=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90976-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1718387519==
Content-Type: multipart/alternative; boundary="1442759784.0A0251.2132"; charset="UTF-8"


--1442759784.0A0251.2132
Date: Sun, 20 Sep 2015 14:36:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90976

--- Comment #6 from roucaries.bastien+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Tested with 4.2 same result
[  104.394703] [drm] Initialized drm 1.1.0 20060810
[  104.400173] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input5
[  104.400181] ACPI: Power Button [PWRB]
[  104.400257] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input6
[  104.400261] ACPI: Sleep Button [SLPB]
[  104.400329] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input7
[  104.400334] ACPI: Power Button [PWRF]
[  104.402274] wmi: Mapper loaded
[  104.412652] MXM: GUID detected in BIOS
[  104.413082] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x124020a1
[  104.413085] nouveau  [  DEVICE][0000:01:00.0] Chipset: GM204 (NV124)
[  104.413088] nouveau  [  DEVICE][0000:01:00.0] Family : NV110
[  104.492557] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[  104.492739] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  104.492741] nouveau  [   VBIOS][0000:01:00.0] version 84.04.2f.00.46
[  104.493047] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  104.493076] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[  104.493077] nouveau  [     PFB][0000:01:00.0] RAM size: 4096 MiB
[  104.493078] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[  104.530936] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[  104.531209] nouveau 0000:01:00.0: firmware: failed to load
nouveau/nv124_fuc409c (-2)
[  104.531284] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nv124_fuc409c failed with error -2
[  104.531289] nouveau 0000:01:00.0: firmware: failed to load nouveau/fuc409c
(-2)
[  104.531362] nouveau 0000:01:00.0: Direct firmware load for nouveau/fuc409c
failed with error -2
[  104.531467] [TTM] Zone  kernel: Available graphics memory: 4062934 kiB
[  104.531468] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  104.531469] [TTM] Initializing pool allocator
[  104.531475] [TTM] Initializing DMA pool allocator
[  104.531483] nouveau  [     DRM] VRAM: 4096 MiB
[  104.531484] nouveau  [     DRM] GART: 1048576 MiB
[  104.531485] nouveau  [     DRM] TMDS table version 2.0
[  104.531486] nouveau  [     DRM] DCB version 4.1
[  104.531488] nouveau  [     DRM] DCB outp 00: 01000f02 00020030
[  104.531489] nouveau  [     DRM] DCB outp 01: 02000f00 00000000
[  104.531490] nouveau  [     DRM] DCB outp 02: 02811f76 04400020
[  104.531491] nouveau  [     DRM] DCB outp 03: 02011f72 00020020
[  104.531491] nouveau  [     DRM] DCB outp 04: 04822f86 04400010
[  104.531492] nouveau  [     DRM] DCB outp 05: 04022f82 00020010
[  104.531493] nouveau  [     DRM] DCB outp 06: 04833f96 04400020
[  104.531494] nouveau  [     DRM] DCB outp 07: 04033f92 00020020
[  104.531495] nouveau  [     DRM] DCB outp 08: 02044f62 00020010
[  104.531496] nouveau  [     DRM] DCB outp 15: 01df5ff8 00000000
[  104.531497] nouveau  [     DRM] DCB conn 00: 00001030
[  104.531498] nouveau  [     DRM] DCB conn 01: 00020146
[  104.531499] nouveau  [     DRM] DCB conn 02: 01000246
[  104.531500] nouveau  [     DRM] DCB conn 03: 02000346
[  104.531501] nouveau  [     DRM] DCB conn 04: 00010461
[  104.531501] nouveau  [     DRM] DCB conn 05: 00000570
[  104.531503] nouveau E[     DRM] Pointer to flat panel table invalid
[  104.532383] nouveau W[     DRM] unknown connector type 70
[  104.532404] nouveau W[     DRM] failed to create encoder 1/8/0: -19
[  104.532405] nouveau W[     DRM] Unknown-1 has no encoders, removing
[  104.532423] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  104.532424] [drm] Driver supports precise vblank timestamp query.
[  104.538612] nouveau E[   PFIFO][0000:01:00.0] unsupported engines 0x00000001
[  104.538760] nouveau E[     DRM] failed to create kernel channel, -22
[  104.829454] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880212d93400
[  104.829549] fbcon: nouveaufb (fb0) is primary device
[  105.471544] Console: switching to colour frame buffer device 240x67
[  105.474365] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[  105.474365] nouveau 0000:01:00.0: registered panic notifier
[  105.482627] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442759784.0A0251.2132
Date: Sun, 20 Sep 2015 14:36:24 +0000
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
   title="NEW - GM204 (NV124) black screen on modesetting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90976#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GM204 (NV124) black screen on modesetting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90976">bug 90976</a>
              from <span class="vcard"><a class="email" href="mailto:roucaries.bastien+bugs&#64;gmail.com" title="roucaries.bastien+bugs&#64;gmail.com">roucaries.bastien+bugs&#64;gmail.com</a>
</span></b>
        <pre>Tested with 4.2 same result
[  104.394703] [drm] Initialized drm 1.1.0 20060810
[  104.400173] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input5
[  104.400181] ACPI: Power Button [PWRB]
[  104.400257] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input6
[  104.400261] ACPI: Sleep Button [SLPB]
[  104.400329] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input7
[  104.400334] ACPI: Power Button [PWRF]
[  104.402274] wmi: Mapper loaded
[  104.412652] MXM: GUID detected in BIOS
[  104.413082] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x124020a1
[  104.413085] nouveau  [  DEVICE][0000:01:00.0] Chipset: GM204 (NV124)
[  104.413088] nouveau  [  DEVICE][0000:01:00.0] Family : NV110
[  104.492557] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[  104.492739] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  104.492741] nouveau  [   VBIOS][0000:01:00.0] version 84.04.2f.00.46
[  104.493047] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  104.493076] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[  104.493077] nouveau  [     PFB][0000:01:00.0] RAM size: 4096 MiB
[  104.493078] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[  104.530936] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[  104.531209] nouveau 0000:01:00.0: firmware: failed to load
nouveau/nv124_fuc409c (-2)
[  104.531284] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nv124_fuc409c failed with error -2
[  104.531289] nouveau 0000:01:00.0: firmware: failed to load nouveau/fuc409c
(-2)
[  104.531362] nouveau 0000:01:00.0: Direct firmware load for nouveau/fuc409c
failed with error -2
[  104.531467] [TTM] Zone  kernel: Available graphics memory: 4062934 kiB
[  104.531468] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  104.531469] [TTM] Initializing pool allocator
[  104.531475] [TTM] Initializing DMA pool allocator
[  104.531483] nouveau  [     DRM] VRAM: 4096 MiB
[  104.531484] nouveau  [     DRM] GART: 1048576 MiB
[  104.531485] nouveau  [     DRM] TMDS table version 2.0
[  104.531486] nouveau  [     DRM] DCB version 4.1
[  104.531488] nouveau  [     DRM] DCB outp 00: 01000f02 00020030
[  104.531489] nouveau  [     DRM] DCB outp 01: 02000f00 00000000
[  104.531490] nouveau  [     DRM] DCB outp 02: 02811f76 04400020
[  104.531491] nouveau  [     DRM] DCB outp 03: 02011f72 00020020
[  104.531491] nouveau  [     DRM] DCB outp 04: 04822f86 04400010
[  104.531492] nouveau  [     DRM] DCB outp 05: 04022f82 00020010
[  104.531493] nouveau  [     DRM] DCB outp 06: 04833f96 04400020
[  104.531494] nouveau  [     DRM] DCB outp 07: 04033f92 00020020
[  104.531495] nouveau  [     DRM] DCB outp 08: 02044f62 00020010
[  104.531496] nouveau  [     DRM] DCB outp 15: 01df5ff8 00000000
[  104.531497] nouveau  [     DRM] DCB conn 00: 00001030
[  104.531498] nouveau  [     DRM] DCB conn 01: 00020146
[  104.531499] nouveau  [     DRM] DCB conn 02: 01000246
[  104.531500] nouveau  [     DRM] DCB conn 03: 02000346
[  104.531501] nouveau  [     DRM] DCB conn 04: 00010461
[  104.531501] nouveau  [     DRM] DCB conn 05: 00000570
[  104.531503] nouveau E[     DRM] Pointer to flat panel table invalid
[  104.532383] nouveau W[     DRM] unknown connector type 70
[  104.532404] nouveau W[     DRM] failed to create encoder 1/8/0: -19
[  104.532405] nouveau W[     DRM] Unknown-1 has no encoders, removing
[  104.532423] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  104.532424] [drm] Driver supports precise vblank timestamp query.
[  104.538612] nouveau E[   PFIFO][0000:01:00.0] unsupported engines 0x00000001
[  104.538760] nouveau E[     DRM] failed to create kernel channel, -22
[  104.829454] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880212d93400
[  104.829549] fbcon: nouveaufb (fb0) is primary device
[  105.471544] Console: switching to colour frame buffer device 240x67
[  105.474365] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[  105.474365] nouveau 0000:01:00.0: registered panic notifier
[  105.482627] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442759784.0A0251.2132--

--===============1718387519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1718387519==--
