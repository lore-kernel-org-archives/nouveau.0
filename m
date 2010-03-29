From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] Full-screen XV causes graphics lockup
Date: Mon, 29 Mar 2010 06:51:20 -0700 (PDT)
Message-ID: <20100329135120.57F2D130060@annarchy.freedesktop.org>
References: <bug-26733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26733-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26733





--- Comment #5 from okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-03-29 06:51:18 PST ---
Lastest git (nouveau tree). Picture freeze on screen and computer is possible
control over ssh. 

[    0.240291] Switching to clocksource hpet
[    0.282671] Non-volatile memory driver v1.3
[    0.282787] [drm] Initialized drm 1.1.0 20060810
[    0.282852] nouveau 0000:08:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.282856] nouveau 0000:08:00.0: setting latency timer to 64
[    0.294237] [drm] nouveau 0000:08:00.0: Detected an NV50 generation card
(0x096480a1)
[    0.299970] [drm] nouveau 0000:08:00.0: Attempting to load BIOS image from
PRAMIN
[    0.385642] [drm] nouveau 0000:08:00.0: ... appears to be valid
[    0.385645] [drm] nouveau 0000:08:00.0: BIT BIOS found
[    0.385647] [drm] nouveau 0000:08:00.0: Bios version 62.94.3c.00
[    0.385650] [drm] nouveau 0000:08:00.0: TMDS table revision 2.0 not
currently supported
[    0.385653] [drm] nouveau 0000:08:00.0: Found Display Configuration Block
version 4.0
[    0.385656] [drm] nouveau 0000:08:00.0: Raw DCB entry 0: 01000323 00010034
[    0.385659] [drm] nouveau 0000:08:00.0: Raw DCB entry 1: 04011312 00020010
[    0.385661] [drm] nouveau 0000:08:00.0: Raw DCB entry 2: 02044300 00000028
[    0.385663] [drm] nouveau 0000:08:00.0: DCB connector table: VHER 0x40 5 16
4
[    0.385666] [drm] nouveau 0000:08:00.0:   0: 0x00000040: type 0x40 idx 0 tag
0xff
[    0.385668] [drm] nouveau 0000:08:00.0:   1: 0x00001131: type 0x31 idx 1 tag
0x07
[    0.385670] [drm] nouveau 0000:08:00.0:   2: 0x00002231: type 0x31 idx 2 tag
0x08
[    0.385673] [drm] nouveau 0000:08:00.0:   3: 0x00110346: type 0x46 idx 3 tag
0x51
[    0.385675] [drm] nouveau 0000:08:00.0:   4: 0x00000400: type 0x00 idx 4 tag
0xff
[    0.385677] [drm] nouveau 0000:08:00.0:   5: 0x00000510: type 0x10 idx 5 tag
0xff
[    0.385679] [drm] nouveau 0000:08:00.0:   6: 0x00000511: type 0x11 idx 6 tag
0xff
[    0.385682] [drm] nouveau 0000:08:00.0:   7: 0x00000513: type 0x13 idx 7 tag
0xff
[    0.385684] [drm] nouveau 0000:08:00.0:   8: 0x00002631: type 0x31 idx 8 tag
0x08
[    0.385686] [drm] nouveau 0000:08:00.0:   9: 0x00001731: type 0x31 idx 9 tag
0x07
[    0.385688] [drm] nouveau 0000:08:00.0:   10: 0x00002831: type 0x31 idx 10
tag 0x08
[    0.385691] [drm] nouveau 0000:08:00.0:   11: 0x00110946: type 0x46 idx 11
tag 0x51
[    0.385693] [drm] nouveau 0000:08:00.0:   12: 0x00000a00: type 0x00 idx 12
tag 0xff
[    0.385695] [drm] nouveau 0000:08:00.0:   13: 0x00000b10: type 0x10 idx 13
tag 0xff
[    0.385698] [drm] nouveau 0000:08:00.0:   14: 0x00000b11: type 0x11 idx 14
tag 0xff
[    0.385700] [drm] nouveau 0000:08:00.0:   15: 0x00000b13: type 0x13 idx 15
tag 0xff
[    0.385709] [drm] nouveau 0000:08:00.0: Parsing VBIOS init table 0 at offset
0xD51F
[    0.410088] ACPI: Battery Slot [BAT1] (battery present)
[    0.414368] [drm] nouveau 0000:08:00.0: Parsing VBIOS init table 1 at offset
0xD910
[    0.420256] [drm] nouveau 0000:08:00.0: Parsing VBIOS init table 2 at offset
0xE8D9
[    0.420265] [drm] nouveau 0000:08:00.0: Parsing VBIOS init table 3 at offset
0xEA22
[    0.422338] [drm] nouveau 0000:08:00.0: Parsing VBIOS init table 4 at offset
0xEC8A
[    0.422340] [drm] nouveau 0000:08:00.0: Parsing VBIOS init table at offset
0xECEF
[    0.443258] [drm] nouveau 0000:08:00.0: 0xECEF: Condition still not met
after 20ms, skipping following opcodes
[    0.443266] [drm] nouveau 0000:08:00.0: 0xB9B8: parsing output script 0
[    0.443268] [drm] nouveau 0000:08:00.0: 0xBD90: parsing output script 0
[    0.443282] [drm] nouveau 0000:08:00.0: Detected 512MiB VRAM
[    0.572490] [TTM] Zone  kernel: Available graphics memory: 2026308 kiB.
[    0.597719] [drm] nouveau 0000:08:00.0: 512 MiB GART (aperture)
[    0.597726] mtrr: type mismatch for d0000000,10000000 old: write-back new:
write-combining
[    0.597978] [drm] nouveau 0000:08:00.0: Allocating FIFO number 1
[    0.603718] [drm] nouveau 0000:08:00.0: nouveau_channel_alloc: initialised
FIFO 1
[    1.662164] [drm] nouveau 0000:08:00.0: Detected a LVDS output
[    1.662168] [drm] nouveau 0000:08:00.0: Detected a TMDS output
[    1.662170] [drm] nouveau 0000:08:00.0: Detected a DAC output
[    1.662173] [drm] nouveau 0000:08:00.0: Detected a LVDS connector
[    1.759634] [drm] nouveau 0000:08:00.0: Detected a DVI-D connector
[    1.759698] [drm] nouveau 0000:08:00.0: Detected a DVI-D connector
[    1.759701] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759703] [drm] nouveau 0000:08:00.0: Detected a DisplayPort connector
[    1.759706] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759708] [drm] nouveau 0000:08:00.0: Detected a VGA connector
[    1.759773] [drm] nouveau 0000:08:00.0: Detected a TV connector
[    1.759776] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759778] [drm] nouveau 0000:08:00.0: Detected a DVI-D connector
[    1.759780] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759781] [drm] nouveau 0000:08:00.0: Detected a DVI-D connector
[    1.759783] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759785] [drm] nouveau 0000:08:00.0: Detected a DVI-D connector
[    1.759787] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759788] [drm] nouveau 0000:08:00.0: Detected a DisplayPort connector
[    1.759790] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759792] [drm] nouveau 0000:08:00.0: Detected a VGA connector
[    1.759793] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.759795] [drm] nouveau 0000:08:00.0: Detected a TV connector
[    1.759797] [drm] nouveau 0000:08:00.0:   no encoders, ignoring
[    1.817734] [drm] nouveau 0000:08:00.0: allocated 1680x1050 fb: 0x40250000,
bo ffff88013f606c00
[    1.819686] [drm] nouveau 0000:08:00.0: 0xB9BC: parsing output script 1
[    1.819715] [drm] nouveau 0000:08:00.0: 0xB873: parsing clock script 0
[    1.824950] Console: switching to colour frame buffer device 210x65
[    1.828155] fb0: nouveaufb frame buffer device
[    1.828156] registered panic notifier
[    1.828161] [drm] Initialized nouveau 0.0.16 20090420 for 0000:08:00.0 on
minor 0
[    1.828202] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.830256] brd: module loaded
--
[    1.987356] hub 7-0:1.0: state 7 ports 2 chg 0000 evt 0000
[    1.988314] hub 8-0:1.0: state 7 ports 2 chg 0000 evt 0000
[    2.074549] [drm] nouveau 0000:08:00.0: 0xB9B3: parsing clock script 1
[    2.087080] hub 2-0:1.0: state 7 ports 6 chg 0004 evt 0000
[    2.087085] hub 2-0:1.0: port 2, status 0501, change 0000, 480 Mb/s
--
[   59.790567] r8169 0000:02:00.0: eth0: link up
[   59.790584] r8169 0000:02:00.0: eth0: link up
[   66.898497] [drm] nouveau 0000:08:00.0: Allocating FIFO number 2
[   66.904189] [drm] nouveau 0000:08:00.0: nouveau_channel_alloc: initialised
FIFO 2
[   67.045985] [drm] nouveau 0000:08:00.0: Allocating FIFO number 3
[   67.051649] [drm] nouveau 0000:08:00.0: nouveau_channel_alloc: initialised
FIFO 3
[   67.661346] uhci_hcd 0000:00:1d.0: reserve dev 2 ep81-INT, period 1, phase
0, 17 us
[   67.664401] uhci_hcd 0000:00:1d.0: release dev 2 ep81-INT, period 1, phase
0, 17 us
--
[11984.701301] usb usb2: bus auto-suspend
[11984.701304] ehci_hcd 0000:00:1d.7: suspend root hub
[12133.043367] [drm] nouveau 0000:08:00.0: PFIFO_DMA_PUSHER - Ch 2
[12133.063975] [drm] nouveau 0000:08:00.0: PFIFO_DMA_PUSHER - Ch 2
[12133.064015] [drm] nouveau 0000:08:00.0: PFIFO_DMA_PUSHER - Ch 2
[12150.336491] SysRq : Keyboard mode set to system default
[12151.075338] SysRq : SAK
[12151.075348] SAK: killed process 2325 (X): task_session(p)==tty->session
[12151.075409] SAK: killed process 2325 (X): task_session(p)==tty->session
[12151.077869] [drm] nouveau 0000:08:00.0: nouveau_channel_free: freeing fifo 2
[12154.077013] [drm] nouveau 0000:08:00.0: Failed to idle channel 2.
[12154.082032] [drm] nouveau 0000:08:00.0: PFIFO_DMA_PUSHER - Ch 127
[12154.082425] [drm] nouveau 0000:08:00.0: nouveau_channel_free: freeing fifo 3
[12154.383550] SysRq : Keyboard mode set to system default
[12154.735041] SysRq : SAK


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
