From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71472] [NV108] GT-740M not detected (mmiotrace)
Date: Wed, 13 Nov 2013 07:42:14 +0000
Message-ID: <bug-71472-8800-PUrxfzbf9t@http.bugs.freedesktop.org/>
References: <bug-71472-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1860007095=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71472-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1860007095==
Content-Type: multipart/alternative; boundary="1384328534.1A4ea61.9546"; charset="us-ascii"


--1384328534.1A4ea61.9546
Date: Wed, 13 Nov 2013 07:42:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71472

--- Comment #4 from Andrey Melnikov <temnota.am-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #3)
> You used the nouveau/master kernel, right? What's in dmesg? Does it say that
No, plain 3.12 kernel. Running 3.12 + drm-next correctly find & initalize card:

[    5.446823] [drm] Initialized drm 1.1.0 20060810
[    5.553540] [drm:__gen6_gt_force_wake_mt_get] *ERROR* Timed out waiting for
forcewake old ack to clear.
[    5.553838] [drm] Memory usable by graphics device = 2048M
[    5.597641] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.597642] [drm] Driver supports precise vblank timestamp query.
[    5.643467] fbcon: inteldrmfb (fb0) is primary device
[    6.477539] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    6.479547] ACPI: Video Device [PEGP] (multi-head: yes  rom: yes  post: no)
[    6.498276] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    6.498622] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor
0
[    6.500980] [drm] hdmi device  not found 1 0 1
[    6.501130] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108120a1
[    6.501133] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[    6.501135] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.503834] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.504924] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.504926] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.505011] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.505013] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    6.822958] [drm] Enabling RC6 states: RC6 on, RC6p on, RC6pp off
[    7.923775] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    7.923779] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    7.923878] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    7.923880] nouveau  [   VBIOS][0000:01:00.0] version 80.28.22.00.2d
[    7.924312] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    7.924314] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    7.987014] nouveau 0000:01:00.0: irq 47 for MSI/MSI-X
[    7.987022] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    7.987053] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    7.987055] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    7.987056] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    7.987124] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[    7.991145] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    8.014359] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    8.014365] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    8.014368] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    8.014389] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 405
MHz 
[    8.014447] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1058 MHz memory
810 MHz 
[    8.014522] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1058 MHz memory
900 MHz 
[    8.014605] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 405
MHz 
[    8.014614] vga_switcheroo: enabled
[    8.014742] [TTM] Zone  kernel: Available graphics memory: 2992280 kiB
[    8.014743] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    8.014744] [TTM] Initializing pool allocator
[    8.014747] [TTM] Initializing DMA pool allocator
[    8.014753] nouveau  [     DRM] VRAM: 2048 MiB
[    8.014754] nouveau  [     DRM] GART: 1048576 MiB
[    8.014757] nouveau E[     DRM] Pointer to TMDS table invalid
[    8.014776] nouveau  [     DRM] DCB version 4.0
[    8.014778] nouveau E[     DRM] Pointer to flat panel table invalid
[    8.014805] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[    8.014845] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[  109.660228] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1726.135079] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1734.934377] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1790.774022] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1798.993019] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1936.349824] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[13311.264009] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)

> You'll still need to extract graph firmware from the blob mmiotraces
This is other problem - python script from this page
(http://nouveau.freedesktop.org/wiki/NVC0_Firmware/) produce empty files,
demmio tool crash with messages: 
I don't know which chipset variant to use!
[0] 4073.986684 MMIO32 R 0x000000 0x108120a1 PMC.ID => { REV_MINOR = 0x1 |
REV_MAJOR = 0xa | IMPLEMENTATION = 0 | ALWAYS0_2 = 0x2 | CHIPSET = NV01 |
ALWAYS0_1 = 0 | FOUNDRY = HELIOS | 0x800000 }
Segmentation fault (core dumped)

> I'm not sure what you're trying to achieve by filing this bug. The GK208 is
Try to find any working combination of drivers. nvidia blob on this hardware
periodically stops screen output, notebook not survived suspend-resume. 

If you need other traces, testing patches - let me know.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384328534.1A4ea61.9546
Date: Wed, 13 Nov 2013 07:42:14 +0000
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
   title="REOPENED --- - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV108] GT-740M not detected (mmiotrace)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
              from <span class="vcard"><a class="email" href="mailto:temnota.am&#64;gmail.com" title="Andrey Melnikov &lt;temnota.am&#64;gmail.com&gt;"> <span class="fn">Andrey Melnikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71472#c3">comment #3</a>)
<span class="quote">&gt; You used the nouveau/master kernel, right? What's in dmesg? Does it say that</span >
No, plain 3.12 kernel. Running 3.12 + drm-next correctly find &amp; initalize card:

[    5.446823] [drm] Initialized drm 1.1.0 20060810
[    5.553540] [drm:__gen6_gt_force_wake_mt_get] *ERROR* Timed out waiting for
forcewake old ack to clear.
[    5.553838] [drm] Memory usable by graphics device = 2048M
[    5.597641] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.597642] [drm] Driver supports precise vblank timestamp query.
[    5.643467] fbcon: inteldrmfb (fb0) is primary device
[    6.477539] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    6.479547] ACPI: Video Device [PEGP] (multi-head: yes  rom: yes  post: no)
[    6.498276] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    6.498622] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor
0
[    6.500980] [drm] hdmi device  not found 1 0 1
[    6.501130] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x108120a1
[    6.501133] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
[    6.501135] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.503834] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.504924] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.504926] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.505011] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.505013] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    6.822958] [drm] Enabling RC6 states: RC6 on, RC6p on, RC6pp off
[    7.923775] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    7.923779] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
[    7.923878] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    7.923880] nouveau  [   VBIOS][0000:01:00.0] version 80.28.22.00.2d
[    7.924312] nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
[    7.924314] nouveau  [   VBIOS][0000:01:00.0] running init tables
[    7.987014] nouveau 0000:01:00.0: irq 47 for MSI/MSI-X
[    7.987022] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    7.987053] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    7.987055] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    7.987056] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    7.987124] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[    7.991145] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 600000uv
[    8.014359] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    8.014365] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    8.014368] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    8.014389] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz memory 405
MHz 
[    8.014447] nouveau  [     CLK][0000:01:00.0] 0a: core 405-1058 MHz memory
810 MHz 
[    8.014522] nouveau  [     CLK][0000:01:00.0] 0f: core 405-1058 MHz memory
900 MHz 
[    8.014605] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory 405
MHz 
[    8.014614] vga_switcheroo: enabled
[    8.014742] [TTM] Zone  kernel: Available graphics memory: 2992280 kiB
[    8.014743] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    8.014744] [TTM] Initializing pool allocator
[    8.014747] [TTM] Initializing DMA pool allocator
[    8.014753] nouveau  [     DRM] VRAM: 2048 MiB
[    8.014754] nouveau  [     DRM] GART: 1048576 MiB
[    8.014757] nouveau E[     DRM] Pointer to TMDS table invalid
[    8.014776] nouveau  [     DRM] DCB version 4.0
[    8.014778] nouveau E[     DRM] Pointer to flat panel table invalid
[    8.014805] nouveau  [     DRM] ACPI backlight interface available, not
registering our own
[    8.014845] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[  109.660228] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1726.135079] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1734.934377] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1790.774022] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1798.993019] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[ 1936.349824] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)
[13311.264009] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x4188ac 0x00000001
(0x1e70822e)

<span class="quote">&gt; You'll still need to extract graph firmware from the blob mmiotraces</span >
This is other problem - python script from this page
(<a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a>) produce empty files,
demmio tool crash with messages: 
I don't know which chipset variant to use!
[0] 4073.986684 MMIO32 R 0x000000 0x108120a1 PMC.ID =&gt; { REV_MINOR = 0x1 |
REV_MAJOR = 0xa | IMPLEMENTATION = 0 | ALWAYS0_2 = 0x2 | CHIPSET = NV01 |
ALWAYS0_1 = 0 | FOUNDRY = HELIOS | 0x800000 }
Segmentation fault (core dumped)

<span class="quote">&gt; I'm not sure what you're trying to achieve by filing this bug. The GK208 is</span >
Try to find any working combination of drivers. nvidia blob on this hardware
periodically stops screen output, notebook not survived suspend-resume. 

If you need other traces, testing patches - let me know.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384328534.1A4ea61.9546--

--===============1860007095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1860007095==--
