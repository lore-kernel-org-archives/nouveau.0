From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 29 Jun 2015 22:28:46 +0000
Message-ID: <bug-70354-8800-Wzi2oFZlkR@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971024961=="
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


--===============0971024961==
Content-Type: multipart/alternative; boundary="1435616926.B6aeED3E1.6385"; charset="UTF-8"


--1435616926.B6aeED3E1.6385
Date: Mon, 29 Jun 2015 22:28:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #56 from Bozhan <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
with latest- kernel panic!
dmesg:
[    1.587345] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    1.587568] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[    1.587634] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.587696] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.597449] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    1.597662] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.597723] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.0f
[    1.598055] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    1.598151] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    1.754599] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.754728] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.754788] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.754857] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.754981] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    1.757143] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    1.806650] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.806727] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.806812] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.806938] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz
[    1.807064] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz
[    1.807207] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz
[    1.807418] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz
[    1.839496] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[    1.839937] nouveau  [     DRM] VRAM: 2048 MiB
[    1.839994] nouveau  [     DRM] GART: 1048576 MiB
[    1.840053] nouveau E[     DRM] Pointer to TMDS table invalid
[    1.840122] nouveau  [     DRM] DCB version 4.0
[    1.840180] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.846106] nouveau  [     DRM] MM: using COPY for buffer copies
[    1.846169] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[    6.854456] nouveau E[   PFIFO][0000:01:00.0] BIND_ERROR [ UNK00 ]
[    6.855050] nouveau E[   PFIFO][0000:01:00.0] PIO_ERROR
[    6.855635] nouveau E[   PFIFO][0000:01:00.0] FB_FLUSH_TIMEOUT
[    6.856223] nouveau E[   PFIFO][0000:01:00.0] DROPPED_MMU_FAULT 0x00000000
[    6.856819] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x002100 [ !ENGINE ]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435616926.B6aeED3E1.6385
Date: Mon, 29 Jun 2015 22:28:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c56">Comment # 56</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan</span></a>
</span></b>
        <pre>with latest- kernel panic!
dmesg:
[    1.587345] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    1.587568] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[    1.587634] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.587696] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.597449] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    1.597662] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.597723] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.0f
[    1.598055] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    1.598151] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    1.754599] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.754728] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.754788] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.754857] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.754981] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    1.757143] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    1.806650] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.806727] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.806812] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.806938] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz
[    1.807064] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz
[    1.807207] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz
[    1.807418] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz
[    1.839496] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[    1.839937] nouveau  [     DRM] VRAM: 2048 MiB
[    1.839994] nouveau  [     DRM] GART: 1048576 MiB
[    1.840053] nouveau E[     DRM] Pointer to TMDS table invalid
[    1.840122] nouveau  [     DRM] DCB version 4.0
[    1.840180] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.846106] nouveau  [     DRM] MM: using COPY for buffer copies
[    1.846169] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[    6.854456] nouveau E[   PFIFO][0000:01:00.0] BIND_ERROR [ UNK00 ]
[    6.855050] nouveau E[   PFIFO][0000:01:00.0] PIO_ERROR
[    6.855635] nouveau E[   PFIFO][0000:01:00.0] FB_FLUSH_TIMEOUT
[    6.856223] nouveau E[   PFIFO][0000:01:00.0] DROPPED_MMU_FAULT 0x00000000
[    6.856819] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x002100 [ !ENGINE ]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435616926.B6aeED3E1.6385--

--===============0971024961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0971024961==--
