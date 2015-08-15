From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90976] GM204 (NV124) black screen on modesetting
Date: Sat, 15 Aug 2015 20:09:49 +0000
Message-ID: <bug-90976-8800-E3LZMpqHy4@http.bugs.freedesktop.org/>
References: <bug-90976-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0946799668=="
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


--===============0946799668==
Content-Type: multipart/alternative; boundary="1439669388.AD367fFd1.10664"; charset="UTF-8"


--1439669388.AD367fFd1.10664
Date: Sat, 15 Aug 2015 20:09:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90976

--- Comment #4 from roucaries.bastien+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Still blank screen. Now they are some new message:
[  112.778407] [drm] Initialized drm 1.1.0 20060810
[  112.785163] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input5
[  112.785171] ACPI: Power Button [PWRB]
[  112.785244] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input6
[  112.785249] ACPI: Sleep Button [SLPB]
[  112.785318] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input7
[  112.785322] ACPI: Power Button [PWRF]
[  112.786371] wmi: Mapper loaded
[  112.796450] MXM: GUID detected in BIOS
[  112.797022] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x124020a1
[  112.797026] nouveau  [  DEVICE][0000:01:00.0] Chipset: GM204 (NV124)
[  112.797029] nouveau  [  DEVICE][0000:01:00.0] Family : NV110
[  112.876358] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[  112.876486] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  112.876487] nouveau  [   VBIOS][0000:01:00.0] version 84.04.2f.00.46
[  112.876742] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  112.876763] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[  112.876764] nouveau  [     PFB][0000:01:00.0] RAM size: 4096 MiB
[  112.876765] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[  112.907746] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[  112.908015] nouveau 0000:01:00.0: firmware: failed to load
nouveau/nv124_fuc409c (-2)
[  112.908095] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nv124_fuc409c failed with error -2
[  112.908107] nouveau 0000:01:00.0: firmware: failed to load nouveau/fuc409c
(-2)
[  112.908179] nouveau 0000:01:00.0: Direct firmware load for nouveau/fuc409c
failed with error -2
[  112.908367] [TTM] Zone  kernel: Available graphics memory: 4063262 kiB
[  112.908368] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  112.908369] [TTM] Initializing pool allocator
[  112.908371] [TTM] Initializing DMA pool allocator
[  112.908377] nouveau  [     DRM] VRAM: 4096 MiB
[  112.908378] nouveau  [     DRM] GART: 1048576 MiB
[  112.908379] nouveau  [     DRM] TMDS table version 2.0
[  112.908380] nouveau  [     DRM] DCB version 4.1
[  112.908381] nouveau  [     DRM] DCB outp 00: 01000f02 00020030
[  112.908382] nouveau  [     DRM] DCB outp 01: 02000f00 00000000
[  112.908383] nouveau  [     DRM] DCB outp 02: 02811f76 04400020
[  112.908384] nouveau  [     DRM] DCB outp 03: 02011f72 00020020
[  112.908384] nouveau  [     DRM] DCB outp 04: 04822f86 04400010
[  112.908385] nouveau  [     DRM] DCB outp 05: 04022f82 00020010
[  112.908386] nouveau  [     DRM] DCB outp 06: 04833f96 04400020
[  112.908387] nouveau  [     DRM] DCB outp 07: 04033f92 00020020
[  112.908387] nouveau  [     DRM] DCB outp 08: 02044f62 00020010
[  112.908388] nouveau  [     DRM] DCB outp 15: 01df5ff8 00000000
[  112.908389] nouveau  [     DRM] DCB conn 00: 00001030
[  112.908390] nouveau  [     DRM] DCB conn 01: 00020146
[  112.908390] nouveau  [     DRM] DCB conn 02: 01000246
[  112.908391] nouveau  [     DRM] DCB conn 03: 02000346
[  112.908392] nouveau  [     DRM] DCB conn 04: 00010461
[  112.908392] nouveau  [     DRM] DCB conn 05: 00000570
[  112.908393] nouveau E[     DRM] Pointer to flat panel table invalid
[  112.909177] nouveau W[     DRM] unknown connector type 70
[  112.909192] nouveau W[     DRM] failed to create encoder 1/8/0: -19
[  112.909193] nouveau W[     DRM] Unknown-1 has no encoders, removing
[  112.909208] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  112.909209] [drm] Driver supports precise vblank timestamp query.
[  112.914252] nouveau E[   PFIFO][0000:01:00.0] unsupported engines 0x00000001
[  112.914390] nouveau E[     DRM] failed to create kernel channel, -22
[  113.232364] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880214d60800
[  113.232392] fbcon: nouveaufb (fb0) is primary device
[  113.874295] Console: switching to colour frame buffer device 240x67
[  113.877120] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[  113.877121] nouveau 0000:01:00.0: registered panic notifier
[  113.897540] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439669388.AD367fFd1.10664
Date: Sat, 15 Aug 2015 20:09:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90976#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GM204 (NV124) black screen on modesetting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90976">bug 90976</a>
              from <span class="vcard"><a class="email" href="mailto:roucaries.bastien+bugs&#64;gmail.com" title="roucaries.bastien+bugs&#64;gmail.com">roucaries.bastien+bugs&#64;gmail.com</a>
</span></b>
        <pre>Still blank screen. Now they are some new message:
[  112.778407] [drm] Initialized drm 1.1.0 20060810
[  112.785163] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input5
[  112.785171] ACPI: Power Button [PWRB]
[  112.785244] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input6
[  112.785249] ACPI: Sleep Button [SLPB]
[  112.785318] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input7
[  112.785322] ACPI: Power Button [PWRF]
[  112.786371] wmi: Mapper loaded
[  112.796450] MXM: GUID detected in BIOS
[  112.797022] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x124020a1
[  112.797026] nouveau  [  DEVICE][0000:01:00.0] Chipset: GM204 (NV124)
[  112.797029] nouveau  [  DEVICE][0000:01:00.0] Family : NV110
[  112.876358] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[  112.876486] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[  112.876487] nouveau  [   VBIOS][0000:01:00.0] version 84.04.2f.00.46
[  112.876742] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[  112.876763] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[  112.876764] nouveau  [     PFB][0000:01:00.0] RAM size: 4096 MiB
[  112.876765] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[  112.907746] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[  112.908015] nouveau 0000:01:00.0: firmware: failed to load
nouveau/nv124_fuc409c (-2)
[  112.908095] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nv124_fuc409c failed with error -2
[  112.908107] nouveau 0000:01:00.0: firmware: failed to load nouveau/fuc409c
(-2)
[  112.908179] nouveau 0000:01:00.0: Direct firmware load for nouveau/fuc409c
failed with error -2
[  112.908367] [TTM] Zone  kernel: Available graphics memory: 4063262 kiB
[  112.908368] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  112.908369] [TTM] Initializing pool allocator
[  112.908371] [TTM] Initializing DMA pool allocator
[  112.908377] nouveau  [     DRM] VRAM: 4096 MiB
[  112.908378] nouveau  [     DRM] GART: 1048576 MiB
[  112.908379] nouveau  [     DRM] TMDS table version 2.0
[  112.908380] nouveau  [     DRM] DCB version 4.1
[  112.908381] nouveau  [     DRM] DCB outp 00: 01000f02 00020030
[  112.908382] nouveau  [     DRM] DCB outp 01: 02000f00 00000000
[  112.908383] nouveau  [     DRM] DCB outp 02: 02811f76 04400020
[  112.908384] nouveau  [     DRM] DCB outp 03: 02011f72 00020020
[  112.908384] nouveau  [     DRM] DCB outp 04: 04822f86 04400010
[  112.908385] nouveau  [     DRM] DCB outp 05: 04022f82 00020010
[  112.908386] nouveau  [     DRM] DCB outp 06: 04833f96 04400020
[  112.908387] nouveau  [     DRM] DCB outp 07: 04033f92 00020020
[  112.908387] nouveau  [     DRM] DCB outp 08: 02044f62 00020010
[  112.908388] nouveau  [     DRM] DCB outp 15: 01df5ff8 00000000
[  112.908389] nouveau  [     DRM] DCB conn 00: 00001030
[  112.908390] nouveau  [     DRM] DCB conn 01: 00020146
[  112.908390] nouveau  [     DRM] DCB conn 02: 01000246
[  112.908391] nouveau  [     DRM] DCB conn 03: 02000346
[  112.908392] nouveau  [     DRM] DCB conn 04: 00010461
[  112.908392] nouveau  [     DRM] DCB conn 05: 00000570
[  112.908393] nouveau E[     DRM] Pointer to flat panel table invalid
[  112.909177] nouveau W[     DRM] unknown connector type 70
[  112.909192] nouveau W[     DRM] failed to create encoder 1/8/0: -19
[  112.909193] nouveau W[     DRM] Unknown-1 has no encoders, removing
[  112.909208] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  112.909209] [drm] Driver supports precise vblank timestamp query.
[  112.914252] nouveau E[   PFIFO][0000:01:00.0] unsupported engines 0x00000001
[  112.914390] nouveau E[     DRM] failed to create kernel channel, -22
[  113.232364] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880214d60800
[  113.232392] fbcon: nouveaufb (fb0) is primary device
[  113.874295] Console: switching to colour frame buffer device 240x67
[  113.877120] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[  113.877121] nouveau 0000:01:00.0: registered panic notifier
[  113.897540] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
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

--1439669388.AD367fFd1.10664--

--===============0946799668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0946799668==--
