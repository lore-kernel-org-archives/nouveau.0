From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Tue, 30 Jun 2015 12:56:53 +0000
Message-ID: <bug-70354-8800-Xk8UybzCjQ@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0773843344=="
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


--===============0773843344==
Content-Type: multipart/alternative; boundary="1435669013.24DAc41F1.2038"; charset="UTF-8"


--1435669013.24DAc41F1.2038
Date: Tue, 30 Jun 2015 12:56:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #57 from Bozhan <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
dmesg with hack-gk106m.


[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.0.0-2-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.0.0-2-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    1.538115] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    1.538283] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[    1.538285] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.538286] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.547704] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    1.547791] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.547793] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.0f
[    1.548230] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    1.548259] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    1.704732] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.704776] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.704777] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.704778] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.704843] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    1.706772] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    1.756182] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.756196] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.756220] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.756286] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[    1.756339] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[    1.756409] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[    1.756546] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[    1.788206] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[    1.788476] nouveau  [     DRM] VRAM: 2048 MiB
[    1.788477] nouveau  [     DRM] GART: 1048576 MiB
[    1.788479] nouveau E[     DRM] Pointer to TMDS table invalid
[    1.788526] nouveau  [     DRM] DCB version 4.0
[    1.788527] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.794450] nouveau  [     DRM] MM: using COPY for buffer copies
[    1.794453] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[   44.819011] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   44.819097] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   44.819132] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[   44.819333] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   46.820946] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[   46.820953] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000204
[   46.820963] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.820972] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   46.820975] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[   46.820980] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.820984] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.820986] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435669013.24DAc41F1.2038
Date: Tue, 30 Jun 2015 12:56:53 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c57">Comment # 57</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan</span></a>
</span></b>
        <pre>dmesg with hack-gk106m.


[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.0.0-2-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.0.0-2-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    1.538115] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    1.538283] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[    1.538285] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.538286] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.547704] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    1.547791] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.547793] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.0f
[    1.548230] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    1.548259] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    1.704732] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.704776] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.704777] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.704778] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.704843] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    1.706772] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    1.756182] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.756196] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.756220] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.756286] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[    1.756339] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[    1.756409] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[    1.756546] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[    1.788206] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[    1.788476] nouveau  [     DRM] VRAM: 2048 MiB
[    1.788477] nouveau  [     DRM] GART: 1048576 MiB
[    1.788479] nouveau E[     DRM] Pointer to TMDS table invalid
[    1.788526] nouveau  [     DRM] DCB version 4.0
[    1.788527] nouveau E[     DRM] Pointer to flat panel table invalid
[    1.794450] nouveau  [     DRM] MM: using COPY for buffer copies
[    1.794453] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[   44.819011] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   44.819097] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   44.819132] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[   44.819333] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   46.820946] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[   46.820953] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000204
[   46.820963] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.820972] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   46.820975] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[   46.820980] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.820984] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.820986] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435669013.24DAc41F1.2038--

--===============0773843344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0773843344==--
