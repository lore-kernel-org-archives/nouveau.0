From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: 2.6.39-rc7 nouveau vs KDE 4.6.2
Date: Sun, 15 May 2011 02:12:08 +0300
Message-ID: <20110514231208.GA2947@p183>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

After logging into KDE, I get garbage areas when say mouse moves over
icon in tray, or when window is opened fullscreen to the point it's
unusable.

Previous version of KDE (4.4.5?) was OK.


Linux version 2.6.39-rc7 (ad@p183) (gcc version 4.4.5 (Gentoo 4.4.5 p1.2, pie-0.4.5) ) #4 SMP PREEMPT Tue May 10 22:07:32 EEST 2011

[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x450100a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 60.80.13.00
[drm] nouveau 0000:01:00.0: TMDS table version 2.0
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 04000320 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01000322 00000030
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02011312 00000030
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 010223f1 00c1c020
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 6 2
[drm] nouveau 0000:01:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
[drm] nouveau 0000:01:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xBC7E
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xBE86
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xD041
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xD130
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xD2E7
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xD34C
[drm] nouveau 0000:01:00.0: 0xD34C: Condition still not met after 20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: 1 available performance level(s)
[drm] nouveau 0000:01:00.0: 0: memory 900MHz core 576MHz shader 1350MHz voltage 1300mV fanspeed 100%
[drm] nouveau 0000:01:00.0: c: memory 396MHz core 198MHz shader 1188MHz
[TTM] Zone  kernel: Available graphics memory: 4074404 kiB.
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB.
[TTM] Initializing pool allocator.
[drm] nouveau 0000:01:00.0: Detected 768MiB VRAM
mtrr: type mismatch for d0000000,10000000 old: write-back new: write-combining
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[drm] nouveau 0000:01:00.0: TV-1 has no encoders, removing
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
[drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x40000000, bo ffff88023d708cd8
fbcon: nouveaufb (fb0) is primary device
Console: switching to colour frame buffer device 160x64
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
i2c-core: driver [ch7006] using legacy suspend method
i2c-core: driver [ch7006] using legacy resume method

	...

[drm] nouveau 0000:01:00.0: multiple instances of buffer 256 on validation list
[drm] nouveau 0000:01:00.0: validate_init
[drm] nouveau 0000:01:00.0: validate: -22
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP5: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP0: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP5: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP0: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP3: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP5: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP0: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP3: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP5: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP6: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP0: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP1: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP3: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP5: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP6: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP0: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP1: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP2: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP3: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP4: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP5: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP6: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP7: Unhandled ustatus 0x00020000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 3 (0x0000de0000) subc 7 class 0x5097 mthd 0x15e0 data 0x00000000
[drm] nouveau 0000:01:00.0: multiple instances of buffer 264 on validation list
[drm] nouveau 0000:01:00.0: validate_init
[drm] nouveau 0000:01:00.0: validate: -22
[drm] nouveau 0000:01:00.0: multiple instances of buffer 263 on validation list
[drm] nouveau 0000:01:00.0: validate_init
[drm] nouveau 0000:01:00.0: validate: -22
