From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26499] nouveau driver fails to load
Date: Thu,  1 Jul 2010 20:38:20 -0700 (PDT)
Message-ID: <20100702033820.A519D1300B9@annarchy.freedesktop.org>
References: <bug-26499-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26499-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=26499

Miles Lane <miles.lane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Platform|Other                       |x86-64 (AMD64)
         OS/Version|All                         |Linux (All)
                 CC|                            |miles.lane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #2 from Miles Lane <miles.lane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-07-01 20:38:20 PDT ---
I have a dual-gpu machine:  ASUS UL50VT

[   15.132164] [drm] Initialized drm 1.1.0 20060810
[   15.437706] agpgart-intel 0000:00:00.0: Intel GM45 Chipset
[   15.440663] agpgart-intel 0000:00:00.0: detected 32764K stolen memory
[   15.477828] agpgart-intel 0000:00:00.0: AGP aperture is 256M @ 0xd0000000
[   15.868123] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013dddc828 (20100428/exresop-590)
[   15.868137] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20100428/dswexec-445)
[   15.868167] ACPI Error (psparse-0537): Method parse/execution failed
[\_SB_.PCI0.VGA_._DSM] (Node ffff88013fc5df20), AE_AML_OPERAND_TYPE
[   15.868315] failed to evaluate _DSM: 12291
[   15.868444] ACPI Error: Needed [Buffer/String/Package], found [Integer]
ffff88013dddc510 (20100428/exresop-590)
[   15.868455] ACPI Exception: AE_AML_OPERAND_TYPE, While resolving operands
for [OpcodeName unavailable] (20100428/dswexec-445)
[   15.868484] ACPI Error (psparse-0537): Method parse/execution failed
[\_SB_.PCI0.VGA_._DSM] (Node ffff88013fc5df20), AE_AML_OPERAND_TYPE
[   15.868566] ACPI Error (psparse-0537): Method parse/execution failed
[\_SB_.PCI0.P0P1.VGA_._DSM] (Node ffff88013fc60920), AE_AML_OPERAND_TYPE
[   15.868668] failed to evaluate _DSM: 12291
[   15.868683] VGA switcheroo: detected DSM switching method
\_SB_.PCI0.P0P1.VGA_ handle
[   15.868878] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[   15.868898] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[   15.868930] nouveau 0000:01:00.0: setting latency timer to 64
[   15.893213] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x0a8a00a2)
[   15.908245] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
ACPI
[   15.941358] [drm] nouveau 0000:01:00.0: ... appears to be valid
[   15.941366] [drm] nouveau 0000:01:00.0: BIT BIOS found
[   15.941372] [drm] nouveau 0000:01:00.0: Bios version 70.18.1f.00
[   15.941377] [drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid
[   15.941445] [drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not
currently supported
[   15.941451] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[   15.941456] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
[   15.941462] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02014300 00000000
[   15.941466] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02032312 00020010
[   15.941471] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 0000000e 00000000
[   15.941477] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16
4
[   15.941483] [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag
0xff
[   15.941489] [drm] nouveau 0000:01:00.0:   1: 0x00410146: type 0x46 idx 1 tag
0x51
[   15.941495] [drm] nouveau 0000:01:00.0:   2: 0x00001261: type 0x61 idx 2 tag
0x07
[   15.941500] [drm] nouveau 0000:01:00.0:   3: 0x00002330: type 0x30 idx 3 tag
0x08
[   15.941506] [drm] nouveau 0000:01:00.0:   4: 0x00000400: type 0x00 idx 4 tag
0xff
[   15.941511] [drm] nouveau 0000:01:00.0:   5: 0x00000660: type 0x60 idx 5 tag
0xff
[   15.941517] [drm] nouveau 0000:01:00.0:   6: 0x00000500: type 0x00 idx 6 tag
0xff
[   15.941547] [drm] nouveau 0000:01:00.0: Adaptor not initialised
[   15.941551] [drm] nouveau 0000:01:00.0: Running VBIOS init tables
[   15.941571] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xD359
[   16.011074] [drm] nouveau 0000:01:00.0: 0xD62F: Failed parsing init table
opcode: INIT_ZM_I2C_BYTE -6
[   16.011147] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xD8A4
[   16.022066] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xE3D3
[   16.022154] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xE408
[   16.647535] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xE59C
[   16.647541] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xE601
[   16.663644] i915 0000:00:02.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[   16.663656] i915 0000:00:02.0: setting latency timer to 64
[   16.669237] [drm] nouveau 0000:01:00.0: Couldn't find matching output script
table
[   16.669312] [drm] nouveau 0000:01:00.0: 0xC078: parsing output script 0
[   16.669480] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[   16.685960] [drm] nouveau 0000:01:00.0: Error reading back PRAMIN at
0x00000000
[   16.686083] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c51e0 still exists
at takedown, refs=1
[   16.686155] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c5540 still exists
at takedown, refs=1
[   16.686225] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c5f60 still exists
at takedown, refs=0
[   16.686300] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c57e0 still exists
at takedown, refs=1
[   16.686370] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c5c60 still exists
at takedown, refs=1
[   16.686442] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c53c0 still exists
at takedown, refs=1
[   16.686512] [drm] nouveau 0000:01:00.0: gpuobj ffff88013d3c5960 still exists
at takedown, refs=1
[   16.688759] nouveau 0000:01:00.0: PCI INT A disabled
[   16.688784] nouveau: probe of 0000:01:00.0 failed with error -22
[   16.821912] i915 0000:00:02.0: irq 47 for MSI/MSI-X
[   16.821963] [drm] set up 31M of stolen space
[   16.825047] vga_switcheroo: enabled
[   17.400862] fb0: inteldrmfb frame buffer device
[   17.400867] drm: registered panic notifier
[   17.404416] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
[   17.404813] ACPI: Video Device [VGA] (multi-head: yes  rom: no  post: no)
[   17.407517] input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:37/LNXVIDEO:01/input/input8
[   17.408063] ACPI: Video Device [VGA1] (multi-head: yes  rom: yes  post: no)
[   17.408873] [drm] Initialized i915 1.6.0 20080730 for 0000:00:02.0 on minor
1
[   17.779249] Console: switching to colour frame buffer device 170x48
[   26.044055] vgaarb: device changed decodes:
PCI:0000:00:02.0,olddecodes=io+mem,decodes=none:owns=io+mem
[   26.044062] vgaarb: transferring owner from PCI:0000:00:02.0 to
PCI:0000:01:00.0

modinfo nouveau
filename:      
/lib/modules/2.6.35-rc3-git4/kernel/drivers/gpu/drm/nouveau/nouveau.ko
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce
author:         Stephane Marchesin
alias:          pci:v000012D2d*sv*sd*bc03sc*i*
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:       
drm,drm_kms_helper,ttm,fb,backlight,cfbfillrect,cfbimgblt,cfbcopyarea,i2c-algo-bit
vermagic:       2.6.35-rc3-git4 SMP preempt mod_unload 
parm:           ctxfw:Use external firmware blob for grctx init (NV40) (int)
parm:           noagp:Disable AGP (int)
parm:           modeset:Enable kernel modesetting (int)
parm:           vbios:Override default VBIOS location (charp)
parm:           vram_pushbuf:Force DMA push buffers to be in VRAM (int)
parm:           vram_notify:Force DMA notifiers to be in VRAM (int)
parm:           duallink:Allow dual-link TMDS (>=GeForce 8) (int)
parm:           uscript_lvds:LVDS output script table ID (>=GeForce 8) (int)
parm:           uscript_tmds:TMDS output script table ID (>=GeForce 8) (int)
parm:           ignorelid:Ignore ACPI lid status (int)
parm:           noaccel:Disable all acceleration (int)
parm:           nofbaccel:Disable fbcon acceleration (int)
parm:           override_conntype:Ignore DCB connector type (int)
parm:           tv_disable:Disable TV-out detection
 (int)
parm:           tv_norm:Default TV norm.
        Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
            hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
        Default: PAL
        *NOTE* Ignored for cards with external TV encoders. (charp)
parm:           reg_debug:Register access debug bitmask:
        0x1 mc, 0x2 video, 0x4 fb, 0x8 extdev,
        0x10 crtc, 0x20 ramdac, 0x40 vgacrtc, 0x80 rmvio,
        0x100 vgaattr, 0x200 EVO (G80+).  (int)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
