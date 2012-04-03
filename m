From: Meelis Roos <mroos-HgUWewaQDNA@public.gmane.org>
Subject: 3.4.1-rc1-104: nouveau divide error in
	nouveau_hwmon_show_temp
Date: Tue, 3 Apr 2012 12:07:33 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1204031203260.23847@math.ut.ee>
References: <alpine.SOC.1.00.1204021640130.14978@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <alpine.SOC.1.00.1204021640130.14978-ptEonEWSGqKptlylMvRsHA@public.gmane.org>
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

While asking for sensors in 3.4.0-rc1-104, I got the divide error below. 
sensors showed card temp in 3.2.9 when monitor was present (currently 
not present).

(please CC, I am not subscribed)

[   10.633191] divide error: 0000 [#1] SMP 
[   10.633935] CPU 0 
[   10.633946] Modules linked in: eeprom loop firewire_sbp2 snd_hda_codec_realtek nv_tco usb_storage uas snd_hda_intel snd_hda_codec snd_hwdep snd_pcm snd_page_alloc nouveau snd_timer video sr_mod mxm_wmi wmi ttm drm_kms_helper i2c_nforce2 psmouse drm firewire_ohci cdrom powernow_k8 fan firewire_core edac_mce_amd snd ohci_hcd soundcore mperf evdev k8temp serio_raw pcspkr forcedeth power_supply crc_itu_t edac_core microcode thermal processor ehci_hcd button usbcore i2c_core thermal_sys pata_amd usb_common
[   10.636024] 
[   10.636024] Pid: 946, comm: sensors Not tainted 3.4.0-rc1-00104-g7d6e1cb #2 System Manufacter System Product Name/KN9(NF-MCP55 series)
[   10.636024] RIP: 0010:[<ffffffffa01c49c4>]  [<ffffffffa01c49c4>] nv40_temp_get+0x25/0x105 [nouveau]
[   10.636024] RSP: 0018:ffff88013508fe68  EFLAGS: 00010282
[   10.636024] RAX: 0000000000000101 RBX: ffff880136b00000 RCX: 0000000000000000
[   10.636024] RDX: 0000000000000000 RSI: ffffffffa021df90 RDI: ffffc90004800000
[   10.636024] RBP: ffff8801369be800 R08: 0000000000000000 R09: 00000000000357ff
[   10.636024] R10: 0000000000000002 R11: 00000000000014b5 R12: 0000000000000101
[   10.636024] R13: ffff880136ae1540 R14: ffff8801369f9d20 R15: ffffffff8142db80
[   10.636024] FS:  00007f2d2670b700(0000) GS:ffff88013fc00000(0000) knlGS:0000000000000000
[   10.636024] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.636024] CR2: 00007f2d2713e000 CR3: 0000000135090000 CR4: 00000000000007f0
[   10.636024] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   10.636024] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[   10.636024] Process sensors (pid: 946, threadinfo ffff88013508e000, task ffff8801383f2c30)
[   10.636024] Stack:
[   10.636024]  ffff88013a746000 ffff88013508ff58 0000000000001000 ffffffffa01c2a62
[   10.636024]  ffffffffa021df90 ffffffff811d2ccc ffffffff8142db80 ffffffff8107883a
[   10.636024]  ffff880136ae1560 ffffffff810f1785 0000000000000000 0000000000000022
[   10.636024] Call Trace:
[   10.636024]  [<ffffffffa01c2a62>] ? nouveau_hwmon_show_temp+0x19/0x39 [nouveau]
[   10.636024]  [<ffffffff811d2ccc>] ? dev_attr_show+0x1e/0x46
[   10.636024]  [<ffffffff8107883a>] ? __get_free_pages+0x25/0x46
[   10.636024]  [<ffffffff810f1785>] ? sysfs_read_file+0xa8/0x12e
[   10.636024]  [<ffffffff810a94d6>] ? vfs_read+0x9f/0xe6
[   10.636024]  [<ffffffff8108e2c3>] ? sys_mmap_pgoff+0xe1/0x105
[   10.636024]  [<ffffffff810a9562>] ? sys_read+0x45/0x6b
[   10.636024]  [<ffffffff812d5522>] ? system_call_fastpath+0x16/0x1b
[   10.636024] Code: 5f 5b 88 d0 5d c3 41 54 55 48 89 fd 53 48 8b 9f 30 03 00 00 44 0f bf a3 be 16 00 00 0f bf 8b c0 16 00 00 48 8b 7b 20 44 89 e0 99 <f7> f9 83 7b 0c 4f 41 89 c4 76 11 48 81 c7 08 00 02 00 e8 f8 a2 
[   10.636024] RIP  [<ffffffffa01c49c4>] nv40_temp_get+0x25/0x105 [nouveau]
[   10.636024]  RSP <ffff88013508fe68>
[   10.664946] ---[ end trace e3d93513d27c6066 ]---

Initial dmesg:

[    4.169797] VGA switcheroo: detected Optimus DSM method \ handle
[    4.170273] ACPI: PCI Interrupt Link [APC6] enabled at IRQ 16
[    4.171160] [drm] nouveau 0000:05:00.0: Detected an NV40 generation card (0x043100a4)
[    4.177934] [drm] nouveau 0000:05:00.0: Checking PRAMIN for VBIOS
[    4.252378] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    4.252424] [drm] nouveau 0000:05:00.0: Checking PROM for VBIOS
[    4.252698] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    4.252742] [drm] nouveau 0000:05:00.0: Checking ACPI for VBIOS
[    4.252982] [drm] nouveau 0000:05:00.0: ... BIOS checksum invalid
[    4.253026] [drm] nouveau 0000:05:00.0: Checking PCIROM for VBIOS
[    4.256860] [drm] nouveau 0000:05:00.0: ... appears to be valid
[    4.256918] [drm] nouveau 0000:05:00.0: Using VBIOS from PCIROM
[    4.256969] [drm] nouveau 0000:05:00.0: BIT BIOS found
[    4.257015] [drm] nouveau 0000:05:00.0: Bios version 05.43.02.87
[    4.257061] [drm] nouveau 0000:05:00.0: TMDS table version 1.1
[    4.257303] [drm] nouveau 0000:05:00.0: MXM: no VBIOS data, nothing to do
[    4.257351] [drm] nouveau 0000:05:00.0: DCB version 3.0
[    4.257398] [drm] nouveau 0000:05:00.0: DCB outp 00: 01000300 00000028
[    4.257448] [drm] nouveau 0000:05:00.0: DCB outp 01: 04011320 00000028
[    4.257494] [drm] nouveau 0000:05:00.0: DCB outp 02: 04011322 00000000
[    4.257539] [drm] nouveau 0000:05:00.0: DCB outp 03: 020223f1 00c0c080
[    4.257584] [drm] nouveau 0000:05:00.0: DCB conn 00: 0000
[    4.257651] [drm] nouveau 0000:05:00.0: DCB conn 01: 1130
[    4.257718] [drm] nouveau 0000:05:00.0: DCB conn 02: 0210
[    4.257784] [drm] nouveau 0000:05:00.0: DCB conn 03: 0211
[    4.257850] [drm] nouveau 0000:05:00.0: DCB conn 04: 0213
[    4.257923] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 0 at offset 0xE1F1
[    4.257982] [drm] nouveau 0000:05:00.0: 0xE1F1: Init table command not found: 0x00
[    4.258038] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 1 at offset 0xE63D
[    4.258094] [drm] nouveau 0000:05:00.0: 0xE63D: Init table command not found: 0x02
[    4.258150] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 2 at offset 0xEBB9
[    4.258206] [drm] nouveau 0000:05:00.0: 0xEBB9: Init table command not found: 0xF8
[    4.258262] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 3 at offset 0xED43
[    4.258318] [drm] nouveau 0000:05:00.0: 0xED43: Init table command not found: 0x00
[    4.258374] [drm] nouveau 0000:05:00.0: Parsing VBIOS init table 4 at offset 0xEEF8
[    4.258658] [TTM] Zone  kernel: Available graphics memory: 2025616 kiB
[    4.258705] [TTM] Initializing pool allocator
[    4.258753] [TTM] Initializing DMA pool allocator
[    4.258816] [drm] nouveau 0000:05:00.0: Detected 256MiB VRAM (DDR2)
[    4.265279] [drm] nouveau 0000:05:00.0: 512 MiB GART (aperture)
[    4.265480] [drm] nouveau 0000:05:00.0: Saving VGA fonts
[    4.315588] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    4.315635] [drm] No driver support for vblank timestamp query.
[    4.315861] [drm] nouveau 0000:05:00.0: voltage table 0x1b unknown
[    4.316950] [drm] nouveau 0000:05:00.0: 0 available performance level(s)
[    4.317012] [drm] nouveau 0000:05:00.0: c: core 351MHz shader 351MHz memory 803MHz fanspeed 100%
[    4.318231] [drm] nouveau 0000:05:00.0: 0xD650: Parsing digital output script table
[    4.368464] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on vga encoder (output 0)
[    4.368532] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on vga encoder (output 1)
[    4.368590] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[    4.368651] [drm] nouveau 0000:05:00.0: Setting dpms mode 3 on TV encoder (output 3)
[    4.500046] No connectors reported connected with modes
[    4.500106] [drm] Cannot find any crtc or sizes - going 1024x768
[    4.501185] [drm] nouveau 0000:05:00.0: allocated 1024x768 fb: 0x49000, bo ffff88013a781000
[    4.501353] fbcon: nouveaufb (fb0) is primary device
[    4.507045] Console: switching to colour frame buffer device 128x48
[    4.508397] fb0: nouveaufb frame buffer device
[    4.508412] drm: registered panic notifier
[    4.508437] [drm] Initialized nouveau 1.0.0 20120316 for 0000:05:00.0 on minor 0


 
-- 
Meelis Roos (mroos-Y27EyoLml9s@public.gmane.org)
