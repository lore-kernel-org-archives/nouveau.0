From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE7] Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Wed, 06 Nov 2013 00:55:26 +0000
Message-ID: <bug-70354-8800-VPJkfgbYXg@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0769163607=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0769163607==
Content-Type: multipart/alternative; boundary="1383699326.2A24bc52.22545"; charset="us-ascii"


--1383699326.2A24bc52.22545
Date: Wed, 6 Nov 2013 00:55:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #13 from Ivan Havlicek <ivan-1fyyxHVKN6tAfugRpC6u6w@public.gmane.org> ---
Hi,

I have same issue (kernel-3.11.6), my card is a GeForce GTX 765M (10de:11e2).
I'm also ready to help if needed, my log :

$ dmesg | grep -i -e nouveau -e drm
[    4.607166] [drm] Initialized drm 1.1.0 20060810
[    4.656791] [drm] Memory usable by graphics device = 2048M
[    4.656796] fb: conflicting fb hw usage inteldrmfb vs VESA VGA - removing
generic driver
[    5.235194] fb: conflicting fb hw usage inteldrmfb vs VGA16 VGA - removing
generic driver
[    5.249530] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    5.249533] [drm] Driver supports precise vblank timestamp query.
[    5.300252] fbcon: inteldrmfb (fb0) is primary device
[    6.727359] [drm] Enabling RC6 states: RC6 on, RC6p off, RC6pp off
[    8.082531] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    8.084219] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor
0
[    8.085730] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6220a1
[    8.085770] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    8.085771] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    8.086406] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    8.134605] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    8.134696] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    8.309024] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    8.310003] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    8.311106] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    8.312066] nouveau  [   VBIOS][0000:01:00.0] version 80.06.5b.00.05
[    8.313602] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    8.314594] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    8.419401] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    8.420382] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    8.421371] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    8.445223] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    8.446209] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    8.447206] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    8.487489] nouveau  [     DRM] VRAM: 2048 MiB
[    8.488465] nouveau  [     DRM] GART: 1048576 MiB
[    8.489437] nouveau E[     DRM] Pointer to TMDS table invalid
[    8.490396] nouveau  [     DRM] DCB version 4.0
[    8.491369] nouveau E[     DRM] Pointer to flat panel table invalid
[    8.492335] nouveau W[     DRM] voltage table 0x50 unknown
[    8.493301] nouveau  [     DRM] 3 available performance level(s)
[    8.494246] nouveau  [     DRM] 0: core 202MHz shader 405MHz memory 405MHz
voltage 100mV
[    8.495207] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz
voltage 80mV
[    8.496147] nouveau  [     DRM] 3: core 1002MHz shader 2004MHz memory
1080MHz voltage 40mV
[    8.497098] nouveau  [     DRM] c:
[    8.509834] nouveau  [     DRM] MM: using COPY for buffer copies
[    8.510744] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[    8.645176] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[    8.645188] nouveau E[   PIBUS][0000:01:00.0] GPC2: 0x419f74 0x00000555
(0x3800820c)
[    8.645321] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000001 FAULT
at 0x503018 [ IBUS ]
[    8.645360] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    8.645389] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1008 FAULT
at 0x419cc0 [ IBUS ]
[    8.645399] nouveau E[   PIBUS][0000:01:00.0] GPC2: 0x419cc0 0xbadf1008
(0x3800820c)
[    8.645547] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1000 FAULT
at 0x419eb4 [ IBUS ]
[    8.645564] nouveau E[   PIBUS][0000:01:00.0] GPC2: 0x419eb4 0xbadf1000
(0x3800820c)
[   10.648199] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[   10.648204] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000244
[   10.648208] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648212] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   10.648214] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[   10.648220] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648226] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648228] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
[   10.648234] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648239] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648242] nouveau E[  PGRAPH][0000:01:00.0] 512000 - done 0x00000300
[   10.648247] nouveau E[  PGRAPH][0000:01:00.0] 512000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648253] nouveau E[  PGRAPH][0000:01:00.0] 512000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648255] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

which results in this error while runing Xorg :

[     8.621] (II) NOUVEAU(G0): Opened GPU channel 0
[    10.622] (EE) NOUVEAU(G0): Failed to initialise context object: 2D_NVC0 (0)
[    10.622] (EE) NOUVEAU(G0): Error initialising acceleration.  Falling back
to NoAccel

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383699326.2A24bc52.22545
Date: Wed, 6 Nov 2013 00:55:26 +0000
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
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:ivan&#64;modulix.org" title="Ivan Havlicek &lt;ivan&#64;modulix.org&gt;"> <span class="fn">Ivan Havlicek</span></a>
</span></b>
        <pre>Hi,

I have same issue (kernel-3.11.6), my card is a GeForce GTX 765M (10de:11e2).
I'm also ready to help if needed, my log :

$ dmesg | grep -i -e nouveau -e drm
[    4.607166] [drm] Initialized drm 1.1.0 20060810
[    4.656791] [drm] Memory usable by graphics device = 2048M
[    4.656796] fb: conflicting fb hw usage inteldrmfb vs VESA VGA - removing
generic driver
[    5.235194] fb: conflicting fb hw usage inteldrmfb vs VGA16 VGA - removing
generic driver
[    5.249530] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    5.249533] [drm] Driver supports precise vblank timestamp query.
[    5.300252] fbcon: inteldrmfb (fb0) is primary device
[    6.727359] [drm] Enabling RC6 states: RC6 on, RC6p off, RC6pp off
[    8.082531] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    8.084219] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor
0
[    8.085730] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6220a1
[    8.085770] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    8.085771] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    8.086406] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    8.134605] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    8.134696] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    8.309024] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    8.310003] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    8.311106] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    8.312066] nouveau  [   VBIOS][0000:01:00.0] version 80.06.5b.00.05
[    8.313602] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    8.314594] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    8.419401] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    8.420382] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    8.421371] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    8.445223] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    8.446209] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
[    8.447206] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    8.487489] nouveau  [     DRM] VRAM: 2048 MiB
[    8.488465] nouveau  [     DRM] GART: 1048576 MiB
[    8.489437] nouveau E[     DRM] Pointer to TMDS table invalid
[    8.490396] nouveau  [     DRM] DCB version 4.0
[    8.491369] nouveau E[     DRM] Pointer to flat panel table invalid
[    8.492335] nouveau W[     DRM] voltage table 0x50 unknown
[    8.493301] nouveau  [     DRM] 3 available performance level(s)
[    8.494246] nouveau  [     DRM] 0: core 202MHz shader 405MHz memory 405MHz
voltage 100mV
[    8.495207] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz
voltage 80mV
[    8.496147] nouveau  [     DRM] 3: core 1002MHz shader 2004MHz memory
1080MHz voltage 40mV
[    8.497098] nouveau  [     DRM] c:
[    8.509834] nouveau  [     DRM] MM: using COPY for buffer copies
[    8.510744] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[    8.645176] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x418880 [ IBUS ]
[    8.645188] nouveau E[   PIBUS][0000:01:00.0] GPC2: 0x419f74 0x00000555
(0x3800820c)
[    8.645321] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000001 FAULT
at 0x503018 [ IBUS ]
[    8.645360] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000002 FAULT
at 0x4188ac [ IBUS ]
[    8.645389] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1008 FAULT
at 0x419cc0 [ IBUS ]
[    8.645399] nouveau E[   PIBUS][0000:01:00.0] GPC2: 0x419cc0 0xbadf1008
(0x3800820c)
[    8.645547] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1000 FAULT
at 0x419eb4 [ IBUS ]
[    8.645564] nouveau E[   PIBUS][0000:01:00.0] GPC2: 0x419eb4 0xbadf1000
(0x3800820c)
[   10.648199] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[   10.648204] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000244
[   10.648208] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648212] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000002 0x00000009
[   10.648214] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[   10.648220] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648226] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648228] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
[   10.648234] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648239] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648242] nouveau E[  PGRAPH][0000:01:00.0] 512000 - done 0x00000300
[   10.648247] nouveau E[  PGRAPH][0000:01:00.0] 512000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648253] nouveau E[  PGRAPH][0000:01:00.0] 512000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[   10.648255] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

which results in this error while runing Xorg :

[     8.621] (II) NOUVEAU(G0): Opened GPU channel 0
[    10.622] (EE) NOUVEAU(G0): Failed to initialise context object: 2D_NVC0 (0)
[    10.622] (EE) NOUVEAU(G0): Error initialising acceleration.  Falling back
to NoAccel</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383699326.2A24bc52.22545--

--===============0769163607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0769163607==--
