From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Sat, 09 May 2015 21:55:44 +0000
Message-ID: <bug-70354-8800-1GbucABtNW@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1296282939=="
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


--===============1296282939==
Content-Type: multipart/alternative; boundary="1431208544.a55CdaBc6.10361"; charset="UTF-8"


--1431208544.a55CdaBc6.10361
Date: Sat, 9 May 2015 21:55:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #54 from Bozhan <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
Linux bo 4.0.0-trunk-amd64 #1 SMP Debian 4.0-1~exp1 (2015-04-21) x86_64
GNU/Linux

bo@bo:~$ dmesg | grep nouve
[   12.510157] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[   12.510320] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[   12.510321] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[   12.510322] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[   12.519025] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[   12.519108] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   12.519110] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.0f
[   12.519398] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[   12.519425] nouveau  [   VBIOS][0000:01:00.0] running init tables
[   12.675786] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   12.675835] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[   12.675836] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[   12.675837] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[   12.675898] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[   12.677860] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[   12.727255] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   12.727270] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   12.727295] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   12.727363] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[   12.727421] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[   12.727496] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[   12.727633] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[   12.760239] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[   12.760408] nouveau  [     DRM] VRAM: 2048 MiB
[   12.760409] nouveau  [     DRM] GART: 1048576 MiB
[   12.760421] nouveau E[     DRM] Pointer to TMDS table invalid
[   12.760470] nouveau  [     DRM] DCB version 4.0
[   12.760471] nouveau E[     DRM] Pointer to flat panel table invalid
[   12.766380] nouveau  [     DRM] MM: using COPY for buffer copies
[   12.766385] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 0
[   31.531758] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[   32.184387] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   32.184479] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   32.184553] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[   32.184968] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   34.186577] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   34.186588] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   34.186600] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   34.186611] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   34.186617] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   34.186624] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   34.186631] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   34.186634] nouveau E[     PGR][0000:01:00.0] init failed, -16
[16430.044081] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]

Is there something that users can do to help with fixing this ? :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431208544.a55CdaBc6.10361
Date: Sat, 9 May 2015 21:55:44 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c54">Comment # 54</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan</span></a>
</span></b>
        <pre>Linux bo 4.0.0-trunk-amd64 #1 SMP Debian 4.0-1~exp1 (2015-04-21) x86_64
GNU/Linux

bo&#64;bo:~$ dmesg | grep nouve
[   12.510157] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[   12.510320] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[   12.510321] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[   12.510322] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[   12.519025] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[   12.519108] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   12.519110] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.0f
[   12.519398] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[   12.519425] nouveau  [   VBIOS][0000:01:00.0] running init tables
[   12.675786] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   12.675835] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[   12.675836] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[   12.675837] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[   12.675898] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[   12.677860] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[   12.727255] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   12.727270] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   12.727295] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   12.727363] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[   12.727421] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[   12.727496] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[   12.727633] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[   12.760239] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x500c30 [ IBUS ]
[   12.760408] nouveau  [     DRM] VRAM: 2048 MiB
[   12.760409] nouveau  [     DRM] GART: 1048576 MiB
[   12.760421] nouveau E[     DRM] Pointer to TMDS table invalid
[   12.760470] nouveau  [     DRM] DCB version 4.0
[   12.760471] nouveau E[     DRM] Pointer to flat panel table invalid
[   12.766380] nouveau  [     DRM] MM: using COPY for buffer copies
[   12.766385] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 0
[   31.531758] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[   32.184387] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   32.184479] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   32.184553] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x405804 [ IBUS ]
[   32.184968] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   34.186577] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   34.186588] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   34.186600] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   34.186611] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   34.186617] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   34.186624] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   34.186631] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   34.186634] nouveau E[     PGR][0000:01:00.0] init failed, -16
[16430.044081] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]

Is there something that users can do to help with fixing this ? :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431208544.a55CdaBc6.10361--

--===============1296282939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1296282939==--
