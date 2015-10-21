From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Wed, 21 Oct 2015 19:52:44 +0000
Message-ID: <bug-70354-8800-7lA4HmDyDU@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1108435357=="
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


--===============1108435357==
Content-Type: multipart/alternative; boundary="1445457164.Eed81.10364"; charset="UTF-8"


--1445457164.Eed81.10364
Date: Wed, 21 Oct 2015 19:52:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #71 from Richard <rich-2ZpFXoJyzMtkMtayTlHv3w@public.gmane.org> ---
Aww... got my hopes up :( No dice with 'nouveau.config=War00C800_0=1' on this
setup:

[    1.865840] fb: switching to nouveaufb from simple
[    1.866421] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[    1.866423] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.866425] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.884543] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    1.884658] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.884660] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.2e
[    1.885073] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.885074] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.885075] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.887346] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    1.940034] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.940058] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.940083] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.940152] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[    1.940201] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[    1.940285] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[    1.940486] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[    1.974897] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x10a028 [ IBUS ]
[    1.975102] nouveau  [     DRM] VRAM: 2048 MiB
[    1.975103] nouveau  [     DRM] GART: 1048576 MiB
[    1.975106] nouveau  [     DRM] TMDS table version 2.0
[    1.975107] nouveau  [     DRM] DCB version 4.0
[    1.975109] nouveau  [     DRM] DCB outp 00: 04000fb6 0f420010
[    1.975110] nouveau  [     DRM] DCB outp 01: 08011f82 00020010
[    1.975111] nouveau  [     DRM] DCB outp 02: 02044f00 00000000
[    1.975113] nouveau  [     DRM] DCB conn 00: 00020047
[    1.975114] nouveau  [     DRM] DCB conn 01: 01000161
[    1.975115] nouveau  [     DRM] DCB conn 04: 00000400
[    1.989343] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.085542] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[    2.085640] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[    2.085702] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[    2.085850] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[    4.087453] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[    4.087481] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[    4.087507] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[    4.087534] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[    4.087555] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[    4.087569] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[    4.087596] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[    4.087614] nouveau E[     PGR][0000:01:00.0] init failed, -16
[    4.093274] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880262102400
[    4.093465] fbcon: nouveaufb (fb0) is primary device
[    4.607106] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    4.607108] nouveau 0000:01:00.0: registered panic notifier
[    4.613443] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 0
[    4.613483] nouveau 0000:07:00.0: enabling device (0006 -> 0007)
[    4.613656] nouveau  [  DEVICE][0000:07:00.0] BOOT0  : 0x0e70d0a2
[    4.613658] nouveau  [  DEVICE][0000:07:00.0] Chipset: GK107 (NVE7)
[    4.613659] nouveau  [  DEVICE][0000:07:00.0] Family : NVE0
[    4.682395] nouveau  [   VBIOS][0000:07:00.0] using image from PROM
[    4.683132] nouveau  [   VBIOS][0000:07:00.0] BIT signature found
[    4.683134] nouveau  [   VBIOS][0000:07:00.0] version 80.07.a8.00.32
[    4.683281] nouveau  [ DEVINIT][0000:07:00.0] adaptor not initialised
[    4.683309] nouveau  [   VBIOS][0000:07:00.0] running init tables
[    5.001537] nouveau  [     PFB][0000:07:00.0] RAM type: GDDR5
[    5.001538] nouveau  [     PFB][0000:07:00.0] RAM size: 2048 MiB
[    5.001539] nouveau  [     PFB][0000:07:00.0]    ZCOMP: 0 tags
[    5.003594] nouveau  [    VOLT][0000:07:00.0] GPU voltage: 600000uv
[    5.055514] nouveau  [  PTHERM][0000:07:00.0] FAN control: none / external
[    5.055528] nouveau  [  PTHERM][0000:07:00.0] fan management: automatic
[    5.055553] nouveau  [  PTHERM][0000:07:00.0] internal sensor: yes
[    5.055620] nouveau  [     CLK][0000:07:00.0] 07: core 405 MHz memory 810
MHz 
[    5.055669] nouveau  [     CLK][0000:07:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[    5.055734] nouveau  [     CLK][0000:07:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[    5.055909] nouveau  [     CLK][0000:07:00.0] --: core 405 MHz memory 810
MHz 
[    5.097252] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    5.097361] nouveau  [     DRM] VRAM: 2048 MiB
[    5.097363] nouveau  [     DRM] GART: 1048576 MiB
[    5.097365] nouveau  [     DRM] TMDS table version 2.0
[    5.097367] nouveau  [     DRM] DCB version 4.0
[    5.097368] nouveau  [     DRM] DCB outp 01: 08011f82 00020010
[    5.097369] nouveau  [     DRM] DCB outp 02: 02044f00 00000000
[    5.097371] nouveau  [     DRM] DCB conn 01: 01000161
[    5.097372] nouveau  [     DRM] DCB conn 04: 00000400
[    5.105736] nouveau  [     DRM] MM: using COPY for buffer copies
[    5.105741] [drm] Initialized nouveau 1.2.1 20120801 for 0000:07:00.0 on
minor 1
[   42.778669] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   42.778766] nouveau E[   PIBUS][0000:07:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   42.778844] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[   42.778964] nouveau E[   PIBUS][0000:07:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   44.780562] nouveau E[     PGR][0000:07:00.0] HUB_INIT timed out
[   44.780569] nouveau E[     PGR][0000:07:00.0] 409000 - done 0x00000204
[   44.780579] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   44.780588] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   44.780591] nouveau E[     PGR][0000:07:00.0] 502000 - done 0x00000300
[   44.780596] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   44.780600] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   44.780602] nouveau E[     PGR][0000:07:00.0] init failed, -16
[   44.782794] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   44.782852] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   44.783022] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   46.784624] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   46.784647] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   46.784662] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.784676] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   46.784682] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   46.784691] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.784700] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.784704] nouveau E[     PGR][0000:01:00.0] init failed, -16
[   56.833919] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   56.833963] nouveau E[   PIBUS][0000:07:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   56.834146] nouveau E[   PIBUS][0000:07:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   58.835745] nouveau E[     PGR][0000:07:00.0] HUB_INIT timed out
[   58.835752] nouveau E[     PGR][0000:07:00.0] 409000 - done 0x00000204
[   58.835761] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   58.835770] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   58.835774] nouveau E[     PGR][0000:07:00.0] 502000 - done 0x00000300
[   58.835778] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   58.835783] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   58.835784] nouveau E[     PGR][0000:07:00.0] init failed, -16
[   58.837853] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   58.837908] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   58.838074] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   60.839673] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   60.839693] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   60.839708] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   60.839721] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   60.839728] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   60.839737] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   60.839746] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   60.839750] nouveau E[     PGR][0000:01:00.0] init failed, -16
[   68.053027] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   68.053069] nouveau E[   PIBUS][0000:07:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   68.053237] nouveau E[   PIBUS][0000:07:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   70.054844] nouveau E[     PGR][0000:07:00.0] HUB_INIT timed out
[   70.054850] nouveau E[     PGR][0000:07:00.0] 409000 - done 0x00000204
[   70.054860] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   70.054869] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   70.054872] nouveau E[     PGR][0000:07:00.0] 502000 - done 0x00000300
[   70.054876] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   70.054881] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   70.054882] nouveau E[     PGR][0000:07:00.0] init failed, -16
[   70.056973] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   70.057022] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   70.057186] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   72.058785] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   72.058806] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   72.058821] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   72.058834] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   72.058841] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   72.058850] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   72.058858] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   72.058863] nouveau E[     PGR][0000:01:00.0] init failed, -16

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445457164.Eed81.10364
Date: Wed, 21 Oct 2015 19:52:44 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c71">Comment # 71</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:rich&#64;warfaresdl.com" title="Richard &lt;rich&#64;warfaresdl.com&gt;"> <span class="fn">Richard</span></a>
</span></b>
        <pre>Aww... got my hopes up :( No dice with 'nouveau.config=War00C800_0=1' on this
setup:

[    1.865840] fb: switching to nouveaufb from simple
[    1.866421] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e70d0a2
[    1.866423] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    1.866425] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    1.884543] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    1.884658] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.884660] nouveau  [   VBIOS][0000:01:00.0] version 80.07.a8.00.2e
[    1.885073] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.885074] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    1.885075] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    1.887346] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    1.940034] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.940058] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.940083] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.940152] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 810
MHz 
[    1.940201] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[    1.940285] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[    1.940486] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 810
MHz 
[    1.974897] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x10a028 [ IBUS ]
[    1.975102] nouveau  [     DRM] VRAM: 2048 MiB
[    1.975103] nouveau  [     DRM] GART: 1048576 MiB
[    1.975106] nouveau  [     DRM] TMDS table version 2.0
[    1.975107] nouveau  [     DRM] DCB version 4.0
[    1.975109] nouveau  [     DRM] DCB outp 00: 04000fb6 0f420010
[    1.975110] nouveau  [     DRM] DCB outp 01: 08011f82 00020010
[    1.975111] nouveau  [     DRM] DCB outp 02: 02044f00 00000000
[    1.975113] nouveau  [     DRM] DCB conn 00: 00020047
[    1.975114] nouveau  [     DRM] DCB conn 01: 01000161
[    1.975115] nouveau  [     DRM] DCB conn 04: 00000400
[    1.989343] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.085542] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[    2.085640] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[    2.085702] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[    2.085850] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[    4.087453] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[    4.087481] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[    4.087507] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[    4.087534] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[    4.087555] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[    4.087569] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[    4.087596] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[    4.087614] nouveau E[     PGR][0000:01:00.0] init failed, -16
[    4.093274] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff880262102400
[    4.093465] fbcon: nouveaufb (fb0) is primary device
[    4.607106] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    4.607108] nouveau 0000:01:00.0: registered panic notifier
[    4.613443] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 0
[    4.613483] nouveau 0000:07:00.0: enabling device (0006 -&gt; 0007)
[    4.613656] nouveau  [  DEVICE][0000:07:00.0] BOOT0  : 0x0e70d0a2
[    4.613658] nouveau  [  DEVICE][0000:07:00.0] Chipset: GK107 (NVE7)
[    4.613659] nouveau  [  DEVICE][0000:07:00.0] Family : NVE0
[    4.682395] nouveau  [   VBIOS][0000:07:00.0] using image from PROM
[    4.683132] nouveau  [   VBIOS][0000:07:00.0] BIT signature found
[    4.683134] nouveau  [   VBIOS][0000:07:00.0] version 80.07.a8.00.32
[    4.683281] nouveau  [ DEVINIT][0000:07:00.0] adaptor not initialised
[    4.683309] nouveau  [   VBIOS][0000:07:00.0] running init tables
[    5.001537] nouveau  [     PFB][0000:07:00.0] RAM type: GDDR5
[    5.001538] nouveau  [     PFB][0000:07:00.0] RAM size: 2048 MiB
[    5.001539] nouveau  [     PFB][0000:07:00.0]    ZCOMP: 0 tags
[    5.003594] nouveau  [    VOLT][0000:07:00.0] GPU voltage: 600000uv
[    5.055514] nouveau  [  PTHERM][0000:07:00.0] FAN control: none / external
[    5.055528] nouveau  [  PTHERM][0000:07:00.0] fan management: automatic
[    5.055553] nouveau  [  PTHERM][0000:07:00.0] internal sensor: yes
[    5.055620] nouveau  [     CLK][0000:07:00.0] 07: core 405 MHz memory 810
MHz 
[    5.055669] nouveau  [     CLK][0000:07:00.0] 0a: core 405-1097 MHz memory
1600 MHz 
[    5.055734] nouveau  [     CLK][0000:07:00.0] 0f: core 405-1097 MHz memory
5400 MHz 
[    5.055909] nouveau  [     CLK][0000:07:00.0] --: core 405 MHz memory 810
MHz 
[    5.097252] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    5.097361] nouveau  [     DRM] VRAM: 2048 MiB
[    5.097363] nouveau  [     DRM] GART: 1048576 MiB
[    5.097365] nouveau  [     DRM] TMDS table version 2.0
[    5.097367] nouveau  [     DRM] DCB version 4.0
[    5.097368] nouveau  [     DRM] DCB outp 01: 08011f82 00020010
[    5.097369] nouveau  [     DRM] DCB outp 02: 02044f00 00000000
[    5.097371] nouveau  [     DRM] DCB conn 01: 01000161
[    5.097372] nouveau  [     DRM] DCB conn 04: 00000400
[    5.105736] nouveau  [     DRM] MM: using COPY for buffer copies
[    5.105741] [drm] Initialized nouveau 1.2.1 20120801 for 0000:07:00.0 on
minor 1
[   42.778669] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   42.778766] nouveau E[   PIBUS][0000:07:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   42.778844] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x3f800000 FAULT
at 0x405804 [ IBUS ]
[   42.778964] nouveau E[   PIBUS][0000:07:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   44.780562] nouveau E[     PGR][0000:07:00.0] HUB_INIT timed out
[   44.780569] nouveau E[     PGR][0000:07:00.0] 409000 - done 0x00000204
[   44.780579] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   44.780588] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   44.780591] nouveau E[     PGR][0000:07:00.0] 502000 - done 0x00000300
[   44.780596] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   44.780600] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   44.780602] nouveau E[     PGR][0000:07:00.0] init failed, -16
[   44.782794] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   44.782852] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   44.783022] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   46.784624] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   46.784647] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   46.784662] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.784676] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   46.784682] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   46.784691] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.784700] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   46.784704] nouveau E[     PGR][0000:01:00.0] init failed, -16
[   56.833919] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   56.833963] nouveau E[   PIBUS][0000:07:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   56.834146] nouveau E[   PIBUS][0000:07:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   58.835745] nouveau E[     PGR][0000:07:00.0] HUB_INIT timed out
[   58.835752] nouveau E[     PGR][0000:07:00.0] 409000 - done 0x00000204
[   58.835761] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   58.835770] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   58.835774] nouveau E[     PGR][0000:07:00.0] 502000 - done 0x00000300
[   58.835778] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   58.835783] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   58.835784] nouveau E[     PGR][0000:07:00.0] init failed, -16
[   58.837853] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   58.837908] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   58.838074] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   60.839673] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   60.839693] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   60.839708] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   60.839721] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   60.839728] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   60.839737] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   60.839746] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   60.839750] nouveau E[     PGR][0000:01:00.0] init failed, -16
[   68.053027] nouveau E[    PBUS][0000:07:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   68.053069] nouveau E[   PIBUS][0000:07:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   68.053237] nouveau E[   PIBUS][0000:07:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   70.054844] nouveau E[     PGR][0000:07:00.0] HUB_INIT timed out
[   70.054850] nouveau E[     PGR][0000:07:00.0] 409000 - done 0x00000204
[   70.054860] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   70.054869] nouveau E[     PGR][0000:07:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   70.054872] nouveau E[     PGR][0000:07:00.0] 502000 - done 0x00000300
[   70.054876] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   70.054881] nouveau E[     PGR][0000:07:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   70.054882] nouveau E[     PGR][0000:07:00.0] init failed, -16
[   70.056973] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[   70.057022] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   70.057186] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[   72.058785] nouveau E[     PGR][0000:01:00.0] HUB_INIT timed out
[   72.058806] nouveau E[     PGR][0000:01:00.0] 409000 - done 0x00000204
[   72.058821] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   72.058834] nouveau E[     PGR][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   72.058841] nouveau E[     PGR][0000:01:00.0] 502000 - done 0x00000300
[   72.058850] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   72.058858] nouveau E[     PGR][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   72.058863] nouveau E[     PGR][0000:01:00.0] init failed, -16</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445457164.Eed81.10364--

--===============1108435357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1108435357==--
