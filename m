From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26534] nouveau does not fetch edid from connected
 monitor on nforce1 (nv1a)
Date: Sat, 17 Jan 2015 19:31:54 +0000
Message-ID: <bug-26534-8800-HJ9aKSEnkY@http.bugs.freedesktop.org/>
References: <bug-26534-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1266185374=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26534-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1266185374==
Content-Type: multipart/alternative; boundary="1421523114.5f0371.27331"; charset="UTF-8"


--1421523114.5f0371.27331
Date: Sat, 17 Jan 2015 19:31:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=26534

--- Comment #23 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
(In reply to Tobias Klausmann from comment #22)
> Can you still reproduce this with recent kernels (3.17, 3.18)?

Still no EDID with 3.19-rc4. Display is 1280x1024.

[  167.174936] wmi: Mapper loaded
[  167.741143] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 12
[  167.746985] PCI: setting IRQ 12 as level-triggered
[  167.752469] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  167.758658] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  167.765100] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  167.771697] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[  167.778201] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  167.784381] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  167.791273] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.799240] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.807600] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.814512] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.821518] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  167.828120] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  167.835234] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  167.841139] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  167.852591] nouveau  [     CLK][0000:02:00.0] --:   
[  167.857683] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.864850] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  167.870179] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  167.877243] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  167.883932] [TTM] Zone  kernel: Available graphics memory: 239288 kiB
[  167.890440] [TTM] Initializing pool allocator
[  167.894958] nouveau  [     DRM] VRAM: 31 MiB
[  167.899288] nouveau  [     DRM] GART: 64 MiB
[  167.903630] nouveau  [     DRM] BMP version 5.20
[  167.908309] nouveau W[     DRM] No useful DCB data in VBIOS
[  167.916315] nouveau  [     DRM] Saving VGA fonts
[  167.966599] nouveau W[     DRM] No useful DCB data in VBIOS
[  167.976050] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  167.982817] [drm] Driver supports precise vblank timestamp query.
[  167.988978] nouveau  [     DRM] 0xAFD8: Parsing digital output script table
[  167.998183] nouveau  [     DRM] MM: using M2MF for buffer copies
[  168.187976] nouveau  [     DRM] allocated 1024x768 fb: 0x4000, bo dce79860
[  168.196704] fbcon: nouveaufb (fb0) is primary device
[  168.291627] Console: switching to colour frame buffer device 128x48
[  168.303855] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[  168.310249] nouveau 0000:02:00.0: registered panic notifier
[  168.316347] [drm] Initialized nouveau 1.2.1 20120801 for 0000:02:00.0 on
minor 0
[  168.325385] modprobe (1568) used greatest stack depth: 5160 bytes left

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421523114.5f0371.27331
Date: Sat, 17 Jan 2015 19:31:54 +0000
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
          bz_status_REOPENED "
   title="REOPENED - nouveau does not fetch edid from connected monitor on nforce1 (nv1a)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26534#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau does not fetch edid from connected monitor on nforce1 (nv1a)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26534">bug 26534</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href="show_bug.cgi?id=26534#c22">comment #22</a>)
<span class="quote">&gt; Can you still reproduce this with recent kernels (3.17, 3.18)?</span >

Still no EDID with 3.19-rc4. Display is 1280x1024.

[  167.174936] wmi: Mapper loaded
[  167.741143] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 12
[  167.746985] PCI: setting IRQ 12 as level-triggered
[  167.752469] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  167.758658] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  167.765100] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  167.771697] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[  167.778201] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  167.784381] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  167.791273] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.799240] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.807600] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.814512] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.821518] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  167.828120] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  167.835234] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  167.841139] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  167.852591] nouveau  [     CLK][0000:02:00.0] --:   
[  167.857683] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  167.864850] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  167.870179] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  167.877243] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  167.883932] [TTM] Zone  kernel: Available graphics memory: 239288 kiB
[  167.890440] [TTM] Initializing pool allocator
[  167.894958] nouveau  [     DRM] VRAM: 31 MiB
[  167.899288] nouveau  [     DRM] GART: 64 MiB
[  167.903630] nouveau  [     DRM] BMP version 5.20
[  167.908309] nouveau W[     DRM] No useful DCB data in VBIOS
[  167.916315] nouveau  [     DRM] Saving VGA fonts
[  167.966599] nouveau W[     DRM] No useful DCB data in VBIOS
[  167.976050] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  167.982817] [drm] Driver supports precise vblank timestamp query.
[  167.988978] nouveau  [     DRM] 0xAFD8: Parsing digital output script table
[  167.998183] nouveau  [     DRM] MM: using M2MF for buffer copies
[  168.187976] nouveau  [     DRM] allocated 1024x768 fb: 0x4000, bo dce79860
[  168.196704] fbcon: nouveaufb (fb0) is primary device
[  168.291627] Console: switching to colour frame buffer device 128x48
[  168.303855] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[  168.310249] nouveau 0000:02:00.0: registered panic notifier
[  168.316347] [drm] Initialized nouveau 1.2.1 20120801 for 0000:02:00.0 on
minor 0
[  168.325385] modprobe (1568) used greatest stack depth: 5160 bytes left</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421523114.5f0371.27331--

--===============1266185374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1266185374==--
