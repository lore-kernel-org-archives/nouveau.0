From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Sat, 21 Mar 2015 22:02:47 +0000
Message-ID: <bug-70354-8800-Q4gNxHXWcl@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1681850991=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1681850991==
Content-Type: multipart/alternative; boundary="1426975367.c7805.23496"; charset="UTF-8"


--1426975367.c7805.23496
Date: Sat, 21 Mar 2015 22:02:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #53 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
Using 3.19, little changes from RCU patches, but still no luck.

[  173.852656] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0e7240a2
[  173.852658] nouveau  [  DEVICE][0000:02:00.0] Chipset: GK107 (NVE7)
[  173.852659] nouveau  [  DEVICE][0000:02:00.0] Family : NVE0
[  173.867029] nouveau  [   VBIOS][0000:02:00.0] using image from ACPI
[  173.867119] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[  173.867121] nouveau  [   VBIOS][0000:02:00.0] version 80.07.b3.00.21
[  173.867339] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[  173.867370] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  174.004784] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[  174.004849] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[  174.004850] nouveau  [     PFB][0000:02:00.0] RAM size: 2048 MiB
[  174.004851] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  174.004927] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[  174.006964] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 600000uv
[  174.056647] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[  174.056662] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[  174.056687] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[  174.056753] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 810
MHz 
[  174.056811] nouveau  [     CLK][0000:02:00.0] 0a: core 405-1058 MHz memory
1600 MHz 
[  174.056887] nouveau  [     CLK][0000:02:00.0] 0f: core 405-1058 MHz memory
5000 MHz 
[  174.057024] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz memory 810
MHz 
[  174.091539] nouveau E[    PBUS][0000:02:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[  174.091572] vga_switcheroo: enabled
[  174.091701] [TTM] Zone  kernel: Available graphics memory: 8169492 kiB
[  174.091702] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  174.091703] [TTM] Initializing pool allocator
[  174.091706] [TTM] Initializing DMA pool allocator
[  174.091713] nouveau  [     DRM] VRAM: 2048 MiB
[  174.091714] nouveau  [     DRM] GART: 1048576 MiB
[  174.091716] nouveau E[     DRM] Pointer to TMDS table invalid
[  174.091717] nouveau  [     DRM] DCB version 4.0
[  174.091718] nouveau E[     DRM] Pointer to flat panel table invalid
[  174.098167] nouveau  [     DRM] MM: using COPY for buffer copies
[  174.098177] [drm] Initialized nouveau 1.2.1 20120801 for 0000:02:00.0 on
minor 1
[  174.116049] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[  174.116122] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x418e08 [ IBUS ]
[  174.116138] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419f74 0x00000555
(0x3800820c)
[  174.116157] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000010 FAULT
at 0x418980 [ IBUS ]
[  174.116175] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[  174.116186] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1008 FAULT
at 0x419cc0 [ IBUS ]
[  174.116202] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419cc0 0xbadf1008
(0x3800820c)
[  174.116235] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1000 FAULT
at 0x419eb4 [ IBUS ]
[  174.116250] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[  174.116267] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[  174.116284] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[  174.116319] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[  174.116345] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[  174.116359] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x405818 [ IBUS ]
[  174.116405] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT
at 0x405818 [ IBUS ]
[  174.116422] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000009 FAULT
at 0x405820 [ IBUS ]
[  174.116606] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[  176.118600] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
[  176.118607] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
[  176.118616] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  176.118626] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[  176.118629] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
[  176.118634] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  176.118638] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  176.118640] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426975367.c7805.23496
Date: Sat, 21 Mar 2015 22:02:47 +0000
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
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c53">Comment # 53</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bruno.pagani&#64;ens-lyon.org" title="bruno.pagani&#64;ens-lyon.org">bruno.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>Using 3.19, little changes from RCU patches, but still no luck.

[  173.852656] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0e7240a2
[  173.852658] nouveau  [  DEVICE][0000:02:00.0] Chipset: GK107 (NVE7)
[  173.852659] nouveau  [  DEVICE][0000:02:00.0] Family : NVE0
[  173.867029] nouveau  [   VBIOS][0000:02:00.0] using image from ACPI
[  173.867119] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[  173.867121] nouveau  [   VBIOS][0000:02:00.0] version 80.07.b3.00.21
[  173.867339] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[  173.867370] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  174.004784] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[  174.004849] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[  174.004850] nouveau  [     PFB][0000:02:00.0] RAM size: 2048 MiB
[  174.004851] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  174.004927] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[  174.006964] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 600000uv
[  174.056647] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[  174.056662] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[  174.056687] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[  174.056753] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 810
MHz 
[  174.056811] nouveau  [     CLK][0000:02:00.0] 0a: core 405-1058 MHz memory
1600 MHz 
[  174.056887] nouveau  [     CLK][0000:02:00.0] 0f: core 405-1058 MHz memory
5000 MHz 
[  174.057024] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz memory 810
MHz 
[  174.091539] nouveau E[    PBUS][0000:02:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[  174.091572] vga_switcheroo: enabled
[  174.091701] [TTM] Zone  kernel: Available graphics memory: 8169492 kiB
[  174.091702] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  174.091703] [TTM] Initializing pool allocator
[  174.091706] [TTM] Initializing DMA pool allocator
[  174.091713] nouveau  [     DRM] VRAM: 2048 MiB
[  174.091714] nouveau  [     DRM] GART: 1048576 MiB
[  174.091716] nouveau E[     DRM] Pointer to TMDS table invalid
[  174.091717] nouveau  [     DRM] DCB version 4.0
[  174.091718] nouveau E[     DRM] Pointer to flat panel table invalid
[  174.098167] nouveau  [     DRM] MM: using COPY for buffer copies
[  174.098177] [drm] Initialized nouveau 1.2.1 20120801 for 0000:02:00.0 on
minor 1
[  174.116049] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[  174.116122] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x418e08 [ IBUS ]
[  174.116138] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419f74 0x00000555
(0x3800820c)
[  174.116157] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000010 FAULT
at 0x418980 [ IBUS ]
[  174.116175] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[  174.116186] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1008 FAULT
at 0x419cc0 [ IBUS ]
[  174.116202] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419cc0 0xbadf1008
(0x3800820c)
[  174.116235] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0xbadf1000 FAULT
at 0x419eb4 [ IBUS ]
[  174.116250] nouveau E[   PIBUS][0000:02:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[  174.116267] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[  174.116284] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[  174.116319] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[  174.116345] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[  174.116359] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000000 FAULT
at 0x405818 [ IBUS ]
[  174.116405] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x3f800000 FAULT
at 0x405818 [ IBUS ]
[  174.116422] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000009 FAULT
at 0x405820 [ IBUS ]
[  174.116606] nouveau E[   PIBUS][0000:02:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[  176.118600] nouveau E[  PGRAPH][0000:02:00.0] HUB_INIT timed out
[  176.118607] nouveau E[  PGRAPH][0000:02:00.0] 409000 - done 0x00000204
[  176.118616] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  176.118626] nouveau E[  PGRAPH][0000:02:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[  176.118629] nouveau E[  PGRAPH][0000:02:00.0] 502000 - done 0x00000300
[  176.118634] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  176.118638] nouveau E[  PGRAPH][0000:02:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  176.118640] nouveau E[  PGRAPH][0000:02:00.0] init failed, -16</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426975367.c7805.23496--

--===============1681850991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1681850991==--
