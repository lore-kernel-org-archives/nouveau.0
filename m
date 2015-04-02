From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Thu, 02 Apr 2015 15:34:21 +0000
Message-ID: <bug-89558-8800-Y7h6iI3wOE@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0786298914=="
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


--===============0786298914==
Content-Type: multipart/alternative; boundary="1427988861.CBeaF2.694"; charset="UTF-8"


--1427988861.CBeaF2.694
Date: Thu, 2 Apr 2015 15:34:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #27 from SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
I have noticed that if the nouveau module is removed and re-added the second
instance calculated the VRAM size correctly:

modprobe nouveau;rmmod nouveau;modprobe nouveau

Apr  2 16:15:20 Mars kernel: [   95.443268] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443303] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443400] i915 0000:00:02.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:15:20 Mars kernel: [   95.443416] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443438] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443507] pci 0000:03:00.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:15:20 Mars kernel: [   95.443508] VGA switcheroo: detected Optimus
DSM method \_SB_.PCI0.RP05.PEGP handle
Apr  2 16:15:20 Mars kernel: [   95.443532] nouveau 0000:03:00.0: enabling
device (0006 -> 0007)
Apr  2 16:15:20 Mars kernel: [   95.443681] nouveau  [  DEVICE][0000:03:00.0]
BOOT0  : 0x118010a2
Apr  2 16:15:20 Mars kernel: [   95.443683] nouveau  [  DEVICE][0000:03:00.0]
Chipset: GM107 (NV118)
Apr  2 16:15:20 Mars kernel: [   95.443685] nouveau  [  DEVICE][0000:03:00.0]
Family : NV110
Apr  2 16:15:20 Mars kernel: [   95.447783] nouveau  [   VBIOS][0000:03:00.0]
using image from ACPI
Apr  2 16:15:20 Mars kernel: [   95.447821] nouveau  [   VBIOS][0000:03:00.0]
BIT signature found
Apr  2 16:15:20 Mars kernel: [   95.447823] nouveau  [   VBIOS][0000:03:00.0]
version 82.08.13.00.1c
Apr  2 16:15:20 Mars kernel: [   95.448092] nouveau  [     PMC][0000:03:00.0]
MSI interrupts enabled
Apr  2 16:15:20 Mars kernel: [   95.448145] nouveau  [     PFB][0000:03:00.0]
RAM type: DDR3
Apr  2 16:15:20 Mars kernel: [   95.448147] nouveau  [     PFB][0000:03:00.0]
RAM size: -1159778304 MiB
Apr  2 16:15:20 Mars kernel: [   95.448148] nouveau  [     PFB][0000:03:00.0]  
 ZCOMP: 0 tags
Apr  2 16:15:20 Mars kernel: [   95.486566] nouveau  [  PTHERM][0000:03:00.0]
FAN control: none / external
Apr  2 16:15:20 Mars kernel: [   95.486579] nouveau  [  PTHERM][0000:03:00.0]
internal sensor: no
Apr  2 16:15:20 Mars kernel: [   95.486618] nouveau  [     CLK][0000:03:00.0]
07: core 405 MHz memory 810 MHz 
Apr  2 16:15:20 Mars kernel: [   95.486674] nouveau  [     CLK][0000:03:00.0]
0a: core 270-1124 MHz memory 1600 MHz 
Apr  2 16:15:20 Mars kernel: [   95.486746] nouveau  [     CLK][0000:03:00.0]
0f: core 270-1124 MHz memory 2002 MHz 
Apr  2 16:15:20 Mars kernel: [   95.486874] nouveau  [     CLK][0000:03:00.0]
--: core 13 MHz  
Apr  2 16:15:20 Mars kernel: [   95.517016] nouveau  [  PGRAPH][0000:03:00.0]
using external firmware
Apr  2 16:15:20 Mars kernel: [   95.517393] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc409c' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.517467] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc409d' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.517658] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc41ac' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.517727] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc41ad' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.518153] vga_switcheroo: enabled
Apr  2 16:15:20 Mars kernel: [   95.518218] [TTM] Zone  kernel: Available
graphics memory: 414084 kiB
Apr  2 16:15:20 Mars kernel: [   95.518219] [TTM] Zone highmem: Available
graphics memory: 4098824 kiB
Apr  2 16:15:20 Mars kernel: [   95.518220] [TTM] Initializing pool allocator
Apr  2 16:15:20 Mars kernel: [   95.518226] nouveau  [     DRM] VRAM:
-1159778304 MiB
Apr  2 16:15:20 Mars kernel: [   95.518227] nouveau  [     DRM] GART: 1048576
MiB
Apr  2 16:15:20 Mars kernel: [   95.518231] nouveau  [     DRM] DCB version 4.0
Apr  2 16:15:22 Mars kernel: [   97.537378] nouveau  [     DRM] MM: using COPY
for buffer copies
Apr  2 16:15:22 Mars kernel: [   97.537398] [drm] Initialized nouveau 1.2.1
20120801 for 0000:03:00.0 on minor 1
Apr  2 16:15:27 Mars kernel: [  102.539882] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:27 Mars kernel: [  102.540090] ACPI: \_SB_.PCI0.RP05.PEGP: failed
to evaluate _DSM
Apr  2 16:15:27 Mars kernel: [  102.540099] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:41 Mars kernel: [  117.332569] [TTM] Finalizing pool allocator
Apr  2 16:15:41 Mars kernel: [  117.332630] [TTM] Zone  kernel: Used memory at
exit: 0 kiB
Apr  2 16:15:41 Mars kernel: [  117.332638] [TTM] Zone highmem: Used memory at
exit: 0 kiB
Apr  2 16:15:41 Mars kernel: [  117.332644] vga_switcheroo: disabled
Apr  2 16:15:41 Mars kernel: [  117.335194] [drm] Module unloaded
Apr  2 16:17:01 Mars kernel: [  196.668965] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669077] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669380] i915 0000:00:02.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:17:01 Mars kernel: [  196.669441] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669526] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669793] pci 0000:03:00.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:17:01 Mars kernel: [  196.669798] VGA switcheroo: detected Optimus
DSM method \_SB_.PCI0.RP05.PEGP handle
Apr  2 16:17:01 Mars kernel: [  196.670169] nouveau  [  DEVICE][0000:03:00.0]
BOOT0  : 0x118010a2
Apr  2 16:17:01 Mars kernel: [  196.670175] nouveau  [  DEVICE][0000:03:00.0]
Chipset: GM107 (NV118)
Apr  2 16:17:01 Mars kernel: [  196.670181] nouveau  [  DEVICE][0000:03:00.0]
Family : NV110
Apr  2 16:17:01 Mars kernel: [  196.675480] nouveau  [   VBIOS][0000:03:00.0]
using image from ACPI
Apr  2 16:17:01 Mars kernel: [  196.675518] nouveau  [   VBIOS][0000:03:00.0]
BIT signature found
Apr  2 16:17:01 Mars kernel: [  196.675521] nouveau  [   VBIOS][0000:03:00.0]
version 82.08.13.00.1c
Apr  2 16:17:01 Mars kernel: [  196.675704] nouveau  [     PMC][0000:03:00.0]
MSI interrupts enabled
Apr  2 16:17:01 Mars kernel: [  196.675740] nouveau  [     PFB][0000:03:00.0]
RAM type: DDR3
Apr  2 16:17:01 Mars kernel: [  196.675742] nouveau  [     PFB][0000:03:00.0]
RAM size: 4096 MiB
Apr  2 16:17:01 Mars kernel: [  196.675744] nouveau  [     PFB][0000:03:00.0]  
 ZCOMP: 0 tags
Apr  2 16:17:01 Mars kernel: [  196.707235] nouveau  [  PTHERM][0000:03:00.0]
FAN control: none / external
Apr  2 16:17:01 Mars kernel: [  196.707244] nouveau  [  PTHERM][0000:03:00.0]
internal sensor: no
Apr  2 16:17:01 Mars kernel: [  196.707265] nouveau  [     CLK][0000:03:00.0]
07: core 405 MHz memory 810 MHz 
Apr  2 16:17:01 Mars kernel: [  196.707327] nouveau  [     CLK][0000:03:00.0]
0a: core 270-1124 MHz memory 1600 MHz 
Apr  2 16:17:01 Mars kernel: [  196.707406] nouveau  [     CLK][0000:03:00.0]
0f: core 270-1124 MHz memory 2002 MHz 
Apr  2 16:17:01 Mars kernel: [  196.707534] nouveau  [     CLK][0000:03:00.0]
--: core 405 MHz memory 810 MHz 
Apr  2 16:17:01 Mars kernel: [  196.720937] nouveau  [  PGRAPH][0000:03:00.0]
using external firmware
Apr  2 16:17:01 Mars kernel: [  196.720959] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc409c' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.720972] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc409d' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.720980] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc41ac' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.720987] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc41ad' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.721191] vga_switcheroo: enabled
Apr  2 16:17:01 Mars kernel: [  196.721256] [TTM] Zone  kernel: Available
graphics memory: 414084 kiB
Apr  2 16:17:01 Mars kernel: [  196.721257] [TTM] Zone highmem: Available
graphics memory: 4098824 kiB
Apr  2 16:17:01 Mars kernel: [  196.721258] [TTM] Initializing pool allocator
Apr  2 16:17:01 Mars kernel: [  196.721265] nouveau  [     DRM] VRAM: 4096 MiB
Apr  2 16:17:01 Mars kernel: [  196.721266] nouveau  [     DRM] GART: 1048576
MiB
Apr  2 16:17:01 Mars kernel: [  196.721270] nouveau  [     DRM] DCB version 4.0
Apr  2 16:17:01 Mars kernel: [  196.729665] nouveau  [     DRM] MM: using COPY
for buffer copies
Apr  2 16:17:01 Mars kernel: [  196.729670] [drm] Initialized nouveau 1.2.1
20120801 for 0000:03:00.0 on minor 1

Two further points the second instance causes the laptop to lockup
(unsurprisingly) and secondly is the GART value correct ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427988861.CBeaF2.694
Date: Thu, 2 Apr 2015 15:34:21 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span></b>
        <pre>I have noticed that if the nouveau module is removed and re-added the second
instance calculated the VRAM size correctly:

modprobe nouveau;rmmod nouveau;modprobe nouveau

Apr  2 16:15:20 Mars kernel: [   95.443268] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443303] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443400] i915 0000:00:02.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:15:20 Mars kernel: [   95.443416] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443438] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:20 Mars kernel: [   95.443507] pci 0000:03:00.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:15:20 Mars kernel: [   95.443508] VGA switcheroo: detected Optimus
DSM method \_SB_.PCI0.RP05.PEGP handle
Apr  2 16:15:20 Mars kernel: [   95.443532] nouveau 0000:03:00.0: enabling
device (0006 -&gt; 0007)
Apr  2 16:15:20 Mars kernel: [   95.443681] nouveau  [  DEVICE][0000:03:00.0]
BOOT0  : 0x118010a2
Apr  2 16:15:20 Mars kernel: [   95.443683] nouveau  [  DEVICE][0000:03:00.0]
Chipset: GM107 (NV118)
Apr  2 16:15:20 Mars kernel: [   95.443685] nouveau  [  DEVICE][0000:03:00.0]
Family : NV110
Apr  2 16:15:20 Mars kernel: [   95.447783] nouveau  [   VBIOS][0000:03:00.0]
using image from ACPI
Apr  2 16:15:20 Mars kernel: [   95.447821] nouveau  [   VBIOS][0000:03:00.0]
BIT signature found
Apr  2 16:15:20 Mars kernel: [   95.447823] nouveau  [   VBIOS][0000:03:00.0]
version 82.08.13.00.1c
Apr  2 16:15:20 Mars kernel: [   95.448092] nouveau  [     PMC][0000:03:00.0]
MSI interrupts enabled
Apr  2 16:15:20 Mars kernel: [   95.448145] nouveau  [     PFB][0000:03:00.0]
RAM type: DDR3
Apr  2 16:15:20 Mars kernel: [   95.448147] nouveau  [     PFB][0000:03:00.0]
RAM size: -1159778304 MiB
Apr  2 16:15:20 Mars kernel: [   95.448148] nouveau  [     PFB][0000:03:00.0]  
 ZCOMP: 0 tags
Apr  2 16:15:20 Mars kernel: [   95.486566] nouveau  [  PTHERM][0000:03:00.0]
FAN control: none / external
Apr  2 16:15:20 Mars kernel: [   95.486579] nouveau  [  PTHERM][0000:03:00.0]
internal sensor: no
Apr  2 16:15:20 Mars kernel: [   95.486618] nouveau  [     CLK][0000:03:00.0]
07: core 405 MHz memory 810 MHz 
Apr  2 16:15:20 Mars kernel: [   95.486674] nouveau  [     CLK][0000:03:00.0]
0a: core 270-1124 MHz memory 1600 MHz 
Apr  2 16:15:20 Mars kernel: [   95.486746] nouveau  [     CLK][0000:03:00.0]
0f: core 270-1124 MHz memory 2002 MHz 
Apr  2 16:15:20 Mars kernel: [   95.486874] nouveau  [     CLK][0000:03:00.0]
--: core 13 MHz  
Apr  2 16:15:20 Mars kernel: [   95.517016] nouveau  [  PGRAPH][0000:03:00.0]
using external firmware
Apr  2 16:15:20 Mars kernel: [   95.517393] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc409c' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.517467] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc409d' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.517658] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc41ac' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.517727] request_firmware returned 0
(0xf15e5a84 'nouveau/nv118_fuc41ad' 0xf2661864)
Apr  2 16:15:20 Mars kernel: [   95.518153] vga_switcheroo: enabled
Apr  2 16:15:20 Mars kernel: [   95.518218] [TTM] Zone  kernel: Available
graphics memory: 414084 kiB
Apr  2 16:15:20 Mars kernel: [   95.518219] [TTM] Zone highmem: Available
graphics memory: 4098824 kiB
Apr  2 16:15:20 Mars kernel: [   95.518220] [TTM] Initializing pool allocator
Apr  2 16:15:20 Mars kernel: [   95.518226] nouveau  [     DRM] VRAM:
-1159778304 MiB
Apr  2 16:15:20 Mars kernel: [   95.518227] nouveau  [     DRM] GART: 1048576
MiB
Apr  2 16:15:20 Mars kernel: [   95.518231] nouveau  [     DRM] DCB version 4.0
Apr  2 16:15:22 Mars kernel: [   97.537378] nouveau  [     DRM] MM: using COPY
for buffer copies
Apr  2 16:15:22 Mars kernel: [   97.537398] [drm] Initialized nouveau 1.2.1
20120801 for 0000:03:00.0 on minor 1
Apr  2 16:15:27 Mars kernel: [  102.539882] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:27 Mars kernel: [  102.540090] ACPI: \_SB_.PCI0.RP05.PEGP: failed
to evaluate _DSM
Apr  2 16:15:27 Mars kernel: [  102.540099] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:15:41 Mars kernel: [  117.332569] [TTM] Finalizing pool allocator
Apr  2 16:15:41 Mars kernel: [  117.332630] [TTM] Zone  kernel: Used memory at
exit: 0 kiB
Apr  2 16:15:41 Mars kernel: [  117.332638] [TTM] Zone highmem: Used memory at
exit: 0 kiB
Apr  2 16:15:41 Mars kernel: [  117.332644] vga_switcheroo: disabled
Apr  2 16:15:41 Mars kernel: [  117.335194] [drm] Module unloaded
Apr  2 16:17:01 Mars kernel: [  196.668965] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669077] ACPI Warning: \_SB_.PCI0.GFX0._DSM:
Argument #4 type mismatch - Found [Buffer], ACPI requires [Package]
(20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669380] i915 0000:00:02.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:17:01 Mars kernel: [  196.669441] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669526] ACPI Warning:
\_SB_.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20141107/nsarguments-95)
Apr  2 16:17:01 Mars kernel: [  196.669793] pci 0000:03:00.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Apr  2 16:17:01 Mars kernel: [  196.669798] VGA switcheroo: detected Optimus
DSM method \_SB_.PCI0.RP05.PEGP handle
Apr  2 16:17:01 Mars kernel: [  196.670169] nouveau  [  DEVICE][0000:03:00.0]
BOOT0  : 0x118010a2
Apr  2 16:17:01 Mars kernel: [  196.670175] nouveau  [  DEVICE][0000:03:00.0]
Chipset: GM107 (NV118)
Apr  2 16:17:01 Mars kernel: [  196.670181] nouveau  [  DEVICE][0000:03:00.0]
Family : NV110
Apr  2 16:17:01 Mars kernel: [  196.675480] nouveau  [   VBIOS][0000:03:00.0]
using image from ACPI
Apr  2 16:17:01 Mars kernel: [  196.675518] nouveau  [   VBIOS][0000:03:00.0]
BIT signature found
Apr  2 16:17:01 Mars kernel: [  196.675521] nouveau  [   VBIOS][0000:03:00.0]
version 82.08.13.00.1c
Apr  2 16:17:01 Mars kernel: [  196.675704] nouveau  [     PMC][0000:03:00.0]
MSI interrupts enabled
Apr  2 16:17:01 Mars kernel: [  196.675740] nouveau  [     PFB][0000:03:00.0]
RAM type: DDR3
Apr  2 16:17:01 Mars kernel: [  196.675742] nouveau  [     PFB][0000:03:00.0]
RAM size: 4096 MiB
Apr  2 16:17:01 Mars kernel: [  196.675744] nouveau  [     PFB][0000:03:00.0]  
 ZCOMP: 0 tags
Apr  2 16:17:01 Mars kernel: [  196.707235] nouveau  [  PTHERM][0000:03:00.0]
FAN control: none / external
Apr  2 16:17:01 Mars kernel: [  196.707244] nouveau  [  PTHERM][0000:03:00.0]
internal sensor: no
Apr  2 16:17:01 Mars kernel: [  196.707265] nouveau  [     CLK][0000:03:00.0]
07: core 405 MHz memory 810 MHz 
Apr  2 16:17:01 Mars kernel: [  196.707327] nouveau  [     CLK][0000:03:00.0]
0a: core 270-1124 MHz memory 1600 MHz 
Apr  2 16:17:01 Mars kernel: [  196.707406] nouveau  [     CLK][0000:03:00.0]
0f: core 270-1124 MHz memory 2002 MHz 
Apr  2 16:17:01 Mars kernel: [  196.707534] nouveau  [     CLK][0000:03:00.0]
--: core 405 MHz memory 810 MHz 
Apr  2 16:17:01 Mars kernel: [  196.720937] nouveau  [  PGRAPH][0000:03:00.0]
using external firmware
Apr  2 16:17:01 Mars kernel: [  196.720959] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc409c' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.720972] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc409d' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.720980] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc41ac' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.720987] request_firmware returned 0
(0xf1a57a84 'nouveau/nv118_fuc41ad' 0xf2661864)
Apr  2 16:17:01 Mars kernel: [  196.721191] vga_switcheroo: enabled
Apr  2 16:17:01 Mars kernel: [  196.721256] [TTM] Zone  kernel: Available
graphics memory: 414084 kiB
Apr  2 16:17:01 Mars kernel: [  196.721257] [TTM] Zone highmem: Available
graphics memory: 4098824 kiB
Apr  2 16:17:01 Mars kernel: [  196.721258] [TTM] Initializing pool allocator
Apr  2 16:17:01 Mars kernel: [  196.721265] nouveau  [     DRM] VRAM: 4096 MiB
Apr  2 16:17:01 Mars kernel: [  196.721266] nouveau  [     DRM] GART: 1048576
MiB
Apr  2 16:17:01 Mars kernel: [  196.721270] nouveau  [     DRM] DCB version 4.0
Apr  2 16:17:01 Mars kernel: [  196.729665] nouveau  [     DRM] MM: using COPY
for buffer copies
Apr  2 16:17:01 Mars kernel: [  196.729670] [drm] Initialized nouveau 1.2.1
20120801 for 0000:03:00.0 on minor 1

Two further points the second instance causes the laptop to lockup
(unsurprisingly) and secondly is the GART value correct ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427988861.CBeaF2.694--

--===============0786298914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0786298914==--
