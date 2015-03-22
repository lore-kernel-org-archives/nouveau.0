From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Sun, 22 Mar 2015 23:08:48 +0000
Message-ID: <bug-89558-8800-qzQGNtZ6eq@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1780795575=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1780795575==
Content-Type: multipart/alternative; boundary="1427065728.F5A38a3.8995"; charset="UTF-8"


--1427065728.F5A38a3.8995
Date: Sun, 22 Mar 2015 23:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
heh, yeah, you're gonna have a bad time with this:

[    1.834852] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x118010a2
[    1.834885] nouveau  [  DEVICE][0000:03:00.0] Chipset: GM108 (NV118)

How did you get that? I guess you copied the entire 0x117 section instead of
just adding the "case 0x118" next to case 0x117? [not that there's anything
wrong with that]

[    1.834915] nouveau  [  DEVICE][0000:03:00.0] Family : NV110
[    1.841397] nouveau  [   VBIOS][0000:03:00.0] using image from ACPI
[    1.841487] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    1.841518] nouveau  [   VBIOS][0000:03:00.0] version 82.08.13.00.1c
[    1.841817] nouveau  [     PMC][0000:03:00.0] MSI interrupts enabled
[    1.841890] nouveau  [     PFB][0000:03:00.0] RAM type: DDR3
[    1.841898] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x6013d4 [ IBUS ]

That's the vga 0x3d4 port afaik... no display controller? no outputs in the
dcb, so I guess that makes sense. Does it come up as a 3D Accelerator, or VGA
compatible controller?

[    1.841966] nouveau  [     PFB][0000:03:00.0] RAM size: -1159778304 MiB

Seems like an awfully low amount of vram :) Can you boot with
nouveau.debug=debug? That should provide some additional prints to work out how
it gets to such a fun quantity.

[    1.841997] nouveau  [     PFB][0000:03:00.0]    ZCOMP: 0 tags
[    1.842052] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x10f65c [ IBUS ]
[    1.842169] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x17e280 [ IBUS ]
[    1.880555] nouveau  [  PTHERM][0000:03:00.0] FAN control: none / external
[    1.880602] nouveau  [  PTHERM][0000:03:00.0] internal sensor: no
[    1.880672] nouveau  [     CLK][0000:03:00.0] 07: core 405 MHz memory 810
MHz 
[    1.880798] nouveau  [     CLK][0000:03:00.0] 0a: core 270-1124 MHz memory
1600 MHz 
[    1.880951] nouveau  [     CLK][0000:03:00.0] 0f: core 270-1124 MHz memory
2002 MHz 
[    1.881116] nouveau  [     CLK][0000:03:00.0] --: core 13 MHz  
[    1.911386] nouveau  [  PGRAPH][0000:03:00.0] using external firmware
[    1.911429] nouveau 0000:03:00.0: Direct firmware load for
nouveau/nv118_fuc409c failed with error -2
[    1.911472] request_firmware returned -2 (0xf2cb3b64 'nouveau/nv118_fuc409c'
0xf2687864)
[    1.912817] nouveau 0000:03:00.0: Direct firmware load for nouveau/fuc409c
failed with error -2
[    1.914179] request_firmware returned -2 (0xf2cb3b64 'nouveau/fuc409c'
0xf2687864)
[    1.915536] nouveau E[  PGRAPH][0000:03:00.0] failed to load fuc409c
[    1.916912] vga_switcheroo: enabled
[    1.918346] [TTM] Zone  kernel: Available graphics memory: 413022 kiB
[    1.919713] [TTM] Zone highmem: Available graphics memory: 4097762 kiB
[    1.921085] [TTM] Initializing pool allocator
[    1.922452] nouveau  [     DRM] VRAM: -1159778304 MiB
[    1.923815] nouveau  [     DRM] GART: 1048576 MiB
[    1.925179] nouveau E[     DRM] Pointer to TMDS table invalid
[    1.926537] nouveau  [     DRM] DCB version 4.0
[    1.927891] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.939229] nouveau E[   PFIFO][0000:03:00.0] write fault at 0x0000070000
[UNBOUND_INST_BLOCK] from BAR3/HOST_CPU_NB on channel 0x0000000000 [unknown]
[    1.941398] nouveau E[   PFIFO][0000:03:00.0] DROPPED_MMU_FAULT 0x00000000
[    1.942989] nouveau E[   PFIFO][0000:03:00.0] BIND_ERROR [ INVALID_CTX_TGT ]
[    1.944398] nouveau E[   PFIFO][0000:03:00.0] read fault at 0x0000000000
[UNBOUND_INST_BLOCK] from GR/VIP on channel 0x0000000000 [unknown]
[    1.945821] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK08 ]
[    1.948423] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    1.951026] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]

I'm very willing to believe that these issues are all caused by the negative
vram size.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427065728.F5A38a3.8995
Date: Sun, 22 Mar 2015 23:08:48 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>heh, yeah, you're gonna have a bad time with this:

[    1.834852] nouveau  [  DEVICE][0000:03:00.0] BOOT0  : 0x118010a2
[    1.834885] nouveau  [  DEVICE][0000:03:00.0] Chipset: GM108 (NV118)

How did you get that? I guess you copied the entire 0x117 section instead of
just adding the &quot;case 0x118&quot; next to case 0x117? [not that there's anything
wrong with that]

[    1.834915] nouveau  [  DEVICE][0000:03:00.0] Family : NV110
[    1.841397] nouveau  [   VBIOS][0000:03:00.0] using image from ACPI
[    1.841487] nouveau  [   VBIOS][0000:03:00.0] BIT signature found
[    1.841518] nouveau  [   VBIOS][0000:03:00.0] version 82.08.13.00.1c
[    1.841817] nouveau  [     PMC][0000:03:00.0] MSI interrupts enabled
[    1.841890] nouveau  [     PFB][0000:03:00.0] RAM type: DDR3
[    1.841898] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x6013d4 [ IBUS ]

That's the vga 0x3d4 port afaik... no display controller? no outputs in the
dcb, so I guess that makes sense. Does it come up as a 3D Accelerator, or VGA
compatible controller?

[    1.841966] nouveau  [     PFB][0000:03:00.0] RAM size: -1159778304 MiB

Seems like an awfully low amount of vram :) Can you boot with
nouveau.debug=debug? That should provide some additional prints to work out how
it gets to such a fun quantity.

[    1.841997] nouveau  [     PFB][0000:03:00.0]    ZCOMP: 0 tags
[    1.842052] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x10f65c [ IBUS ]
[    1.842169] nouveau E[    PBUS][0000:03:00.0] MMIO read of 0x00000000 FAULT
at 0x17e280 [ IBUS ]
[    1.880555] nouveau  [  PTHERM][0000:03:00.0] FAN control: none / external
[    1.880602] nouveau  [  PTHERM][0000:03:00.0] internal sensor: no
[    1.880672] nouveau  [     CLK][0000:03:00.0] 07: core 405 MHz memory 810
MHz 
[    1.880798] nouveau  [     CLK][0000:03:00.0] 0a: core 270-1124 MHz memory
1600 MHz 
[    1.880951] nouveau  [     CLK][0000:03:00.0] 0f: core 270-1124 MHz memory
2002 MHz 
[    1.881116] nouveau  [     CLK][0000:03:00.0] --: core 13 MHz  
[    1.911386] nouveau  [  PGRAPH][0000:03:00.0] using external firmware
[    1.911429] nouveau 0000:03:00.0: Direct firmware load for
nouveau/nv118_fuc409c failed with error -2
[    1.911472] request_firmware returned -2 (0xf2cb3b64 'nouveau/nv118_fuc409c'
0xf2687864)
[    1.912817] nouveau 0000:03:00.0: Direct firmware load for nouveau/fuc409c
failed with error -2
[    1.914179] request_firmware returned -2 (0xf2cb3b64 'nouveau/fuc409c'
0xf2687864)
[    1.915536] nouveau E[  PGRAPH][0000:03:00.0] failed to load fuc409c
[    1.916912] vga_switcheroo: enabled
[    1.918346] [TTM] Zone  kernel: Available graphics memory: 413022 kiB
[    1.919713] [TTM] Zone highmem: Available graphics memory: 4097762 kiB
[    1.921085] [TTM] Initializing pool allocator
[    1.922452] nouveau  [     DRM] VRAM: -1159778304 MiB
[    1.923815] nouveau  [     DRM] GART: 1048576 MiB
[    1.925179] nouveau E[     DRM] Pointer to TMDS table invalid
[    1.926537] nouveau  [     DRM] DCB version 4.0
[    1.927891] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.939229] nouveau E[   PFIFO][0000:03:00.0] write fault at 0x0000070000
[UNBOUND_INST_BLOCK] from BAR3/HOST_CPU_NB on channel 0x0000000000 [unknown]
[    1.941398] nouveau E[   PFIFO][0000:03:00.0] DROPPED_MMU_FAULT 0x00000000
[    1.942989] nouveau E[   PFIFO][0000:03:00.0] BIND_ERROR [ INVALID_CTX_TGT ]
[    1.944398] nouveau E[   PFIFO][0000:03:00.0] read fault at 0x0000000000
[UNBOUND_INST_BLOCK] from GR/VIP on channel 0x0000000000 [unknown]
[    1.945821] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK08 ]
[    1.948423] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    1.951026] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]

I'm very willing to believe that these issues are all caused by the negative
vram size.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427065728.F5A38a3.8995--

--===============1780795575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1780795575==--
