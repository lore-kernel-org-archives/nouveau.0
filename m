From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: nouveau git + v3.2-rc2 + NV18 Oops
Date: 23 Nov 2011 10:49:27 -0500
Message-ID: <20111123154927.28077.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

My old machine started getting a bit flaky, so I have kicked it off my
desk, but still wanted to get some nouveau bugs fixed on it.  (In fact
it's easier now that I can reboot it more easily.)

So I put a spare old hard drive on it and rebuilt it, but I'm having
a heck of a time getting it working.  Whenever it tries to load the
nouveau module, it blows up.

What's funny is that it *used* to work, but I re-downloaded all
the sources and rebuilt, so something might have changed.

The current kernel is 3.2.0-rc2-00097-g75b64de3, built from commit 
75b64de35b70358b789bb8c8a3ec35b67734b725
"drm/nouveau/hwsq: remove some magic, give proper opcode names"

I finally captured the kernel logs when loading the module, as follows:

[  955.834884] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 10
[  955.834938] nouveau 0000:02:00.0: PCI INT A -> Link[LNK5] -> GSI 10 (level, low) -> IRQ 10
[  955.838263] [drm] nouveau 0000:02:00.0: Detected an NV10 generation card (0x01f000a5)
[  955.838567] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
[  955.883327] [drm] nouveau 0000:02:00.0: ... BIOS checksum invalid
[  955.883368] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PROM
[  955.883421] [drm] nouveau 0000:02:00.0: ... BIOS signature not found
[  955.883461] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PCIROM
[  955.883963] [drm] nouveau 0000:02:00.0: ... appears to be valid
[  955.884466] [drm] nouveau 0000:02:00.0: BMP BIOS found
[  955.884504] [drm] nouveau 0000:02:00.0: BMP version 5.21
[  955.884543] [drm] nouveau 0000:02:00.0: Bios version 04.1f.00.07
[  955.884587] [drm] nouveau 0000:02:00.0: I2C0: type 3 index 0/0 unknown
[  955.884629] [drm] nouveau 0000:02:00.0: I2C1: type 3 index 0/0 unknown
[  955.887577] [drm] nouveau 0000:02:00.0: MXM: no VBIOS data, nothing to do
[  955.887628] [drm] nouveau 0000:02:00.0: DCB version 2.0
[  955.887669] [drm] nouveau 0000:02:00.0: DCB outp 00: 01000100 000088b8
[  955.887711] [drm] nouveau 0000:02:00.0: DCB outp 01: 02010210 000088b8
[  955.887752] [drm] nouveau 0000:02:00.0: DCB outp 02: 01120132 00000000
[  955.887793] [drm] nouveau 0000:02:00.0: DCB outp 03: 01120232 00000000
[  955.887833] [drm] nouveau 0000:02:00.0: DCB outp 04: 02010121 00000003
[  955.887874] [drm] nouveau 0000:02:00.0: DCB outp 05: 02010221 00000003
[  955.887915] [drm] nouveau 0000:02:00.0: Merging DCB entries 2 and 3
[  955.887955] [drm] nouveau 0000:02:00.0: Merging DCB entries 4 and 5
[  955.888452] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset 0xC284
[  955.888531] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset 0xC4E0
[  955.888591] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset 0xC2E7
[  955.903691] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset 0xC632
[  955.903752] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset 0xC47B
[  955.903809] [drm] nouveau 0000:02:00.0: Unknown memclock table version 0.
[  955.943188] [drm] nouveau 0000:02:00.0: 0 available performance level(s)
[  955.943299] [drm] nouveau 0000:02:00.0: c: core 199MHz memory 200454M
[  955.946816] [TTM] Zone  kernel: Available graphics memory: 444156 kiB.
[  955.946865] [TTM] Zone highmem: Available graphics memory: 1005280 kiB.
[  955.946906] [TTM] Initializing pool allocator.
[  955.946962] [drm] nouveau 0000:02:00.0: Detected 64MiB VRAM
[  955.947133] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[  955.947202] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[  955.947305] nouveau 0000:02:00.0: putting AGP V2 device into 4x mode
[  955.947341] [drm] nouveau 0000:02:00.0: 128 MiB GART (aperture)
[  955.947473] [drm] nouveau 0000:02:00.0: Saving VGA fonts
[  955.997830] [drm] nouveau 0000:02:00.0: Detected TMDS transmitter: sil164
[  956.025750] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[  956.025794] [drm] No driver support for vblank timestamp query.
[  956.046127] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder (output 0)
[  956.046181] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga encoder (output 1)
[  956.046226] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[  956.046271] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on TV encoder (output 3)
[  956.066346] BUG: unable to handle kernel NULL pointer dereference at   (null)
[  956.066416] IP: [<c11bafc4>] i2c_transfer+0x17/0xab
[  956.066475] *pde = 00000000 
[  956.066521] Oops: 0000 [#1] 
[  956.066567] Modules linked in: sil164 nouveau(+) ttm button i2c_algo_bit cfbcopyarea mxm_wmi video thermal_sys wmi cfbimgblt cfbfillrect fbcon font bitblit softcursor drm_kms_helper drm [last unloaded: button]
[  956.066579] 
[  956.066579] Pid: 2946, comm: modprobe Tainted: G        W    3.2.0-rc2-00097-g75b64de3 #4    /FN41 
[  956.066579] EIP: 0060:[<c11bafc4>] EFLAGS: 00010292 CPU: 0
[  956.066579] EIP is at i2c_transfer+0x17/0xab
[  956.066579] EAX: 00000000 EBX: ffffffa1 ECX: 00000002 EDX: f5919c54
[  956.066579] ESI: f5511250 EDI: f5511250 EBP: 00000002 ESP: f5919c38
[  956.066579]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
[  956.066579] Process modprobe (pid: 2946, ti=f5918000 task=f59dfb00 task.ti=f5918000)
[  956.066579] Stack:
[  956.066579]  00000001 f5919c54 f5924400 f546000c f5511250 00000000 f88686af 00000050
[  956.066579]  f5920001 f5919c6f 00010050 f5460001 f5919c6f 00000000 f8869e3e 00001000
[  956.066579]  f59244ec c1104a96 f5924800 f5924800 01133348 f5924400 f88b22fc 00001000
[  956.066579] Call Trace:
[  956.066579]  [<f88686af>] ? nouveau_probe_i2c_addr+0x45/0x4f [nouveau]
[  956.066579]  [<f8869e3e>] ? nouveau_connector_detect+0x8c/0x21f [nouveau]
[  956.066579]  [<c1104a96>] ? snprintf+0x19/0x1b
[  956.066579]  [<f81565da>] ? drm_helper_probe_single_connector_modes+0xae/0x2a0 [drm_kms_helper]
[  956.066579]  [<f8154589>] ? drm_fb_helper_probe_connector_modes+0x2f/0x40 [drm_kms_helper]
[  956.066579]  [<f8155a9b>] ? drm_fb_helper_initial_config+0x175/0x1a4 [drm_kms_helper]
[  956.066579]  [<f889fec8>] ? NVWriteVgaCrtc+0x79/0x99 [nouveau]
[  956.066579]  [<f885bd48>] ? NVWriteVgaSeq+0x22/0x38 [nouveau]
[  956.066579]  [<f886af86>] ? nouveau_fbcon_init+0xda/0xe2 [nouveau]
[  956.066579]  [<f88528ee>] ? nouveau_card_init+0x1247/0x1363 [nouveau]
[  956.066579]  [<f8853049>] ? nouveau_load+0x577/0x5af [nouveau]
[  956.066579]  [<f8120ef2>] ? drm_get_pci_dev+0x137/0x22e [drm]
[  956.066579]  [<c1031a6d>] ? __blocking_notifier_call_chain+0x47/0x4f
[  956.066579]  [<f88b158c>] ? nouveau_acpi_edid+0x80/0x80 [nouveau]
[  956.066579]  [<c11105f9>] ? pci_device_probe+0x39/0x60
[  956.066579]  [<c1161d5f>] ? driver_probe_device+0x85/0x108
[  956.066579]  [<c1110549>] ? pci_match_id+0x15/0x34
[  956.066579]  [<c1161e22>] ? __driver_attach+0x40/0x5b
[  956.066579]  [<c11612fc>] ? bus_for_each_dev+0x37/0x60
[  956.066579]  [<c1161b0a>] ? driver_attach+0x17/0x1a
[  956.066579]  [<c1161de2>] ? driver_probe_device+0x108/0x108
[  956.066579]  [<c116183f>] ? bus_add_driver+0x92/0x1d1
[  956.066579]  [<c10fffe1>] ? kset_find_obj_hinted+0x42/0x72
[  956.066579]  [<f88d2000>] ? 0xf88d1fff
[  956.066579]  [<c11621bc>] ? driver_register+0x7d/0xd4
[  956.066579]  [<f812101a>] ? drm_pci_init+0x31/0xd5 [drm]
[  956.066579]  [<f88d2000>] ? 0xf88d1fff
[  956.066579]  [<c1110c7c>] ? __pci_register_driver+0x2c/0x80
[  956.066579]  [<f88d2000>] ? 0xf88d1fff
[  956.066579]  [<c1001164>] ? do_one_initcall+0x7c/0x128
[  956.066579]  [<c1031a6d>] ? __blocking_notifier_call_chain+0x47/0x4f
[  956.066579]  [<c103ee6d>] ? sys_init_module+0x12d9/0x153f
[  956.066579]  [<c1250f50>] ? sysenter_do_call+0x12/0x26
[  956.066579] Code: 40 24 e8 5f ff ff ff 85 c0 75 f2 8d 43 10 5b e9 3d 59 09 00 55 89 cd 57 56 89 c6 53 bb a1 ff ff ff 83 ec 08 8b 40 08 89 54 24 04 
[  956.066579]  38 00 0f 84 81 00 00 00 89 e0 25 00 e0 ff ff f7 40 14 ff ff 
[  956.066579] EIP: [<c11bafc4>] i2c_transfer+0x17/0xab SS:ESP 0068:f5919c38
[  956.066579] CR2: 0000000000000000
[  956.071543] ---[ end trace a71d16ddb4f45436 ]---


The hardware is an Athlon XP + nForce2 chipset.
00:00.0 Host bridge [0600]: nVidia Corporation nForce2 IGP2 [10de:01e0] (rev a2)
00:00.1 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 1 [10de:01eb] (rev a2)
00:00.2 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 4 [10de:01ee] (rev a2)
00:00.3 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 3 [10de:01ed] (rev a2)
00:00.4 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 2 [10de:01ec] (rev a2)
00:00.5 RAM memory [0500]: nVidia Corporation nForce2 Memory Controller 5 [10de:01ef] (rev a2)
00:01.0 ISA bridge [0601]: nVidia Corporation nForce2 ISA Bridge [10de:0060] (rev a3)
00:01.1 SMBus [0c05]: nVidia Corporation nForce2 SMBus (MCP) [10de:0064] (rev a2)
00:02.0 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0067] (rev a3)
00:02.1 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0067] (rev a3)
00:02.2 USB Controller [0c03]: nVidia Corporation nForce2 USB Controller [10de:0068] (rev a3)
00:04.0 Ethernet controller [0200]: nVidia Corporation nForce2 Ethernet Controller [10de:0066] (rev a1)
00:05.0 Multimedia audio controller [0401]: nVidia Corporation nForce Audio Processing Unit [10de:006b] (rev a2)
00:06.0 Multimedia audio controller [0401]: nVidia Corporation nForce2 AC97 Audio Controler (MCP) [10de:006a] (rev a1)
00:08.0 PCI bridge [0604]: nVidia Corporation nForce2 External PCI Bridge [10de:006c] (rev a3)
00:09.0 IDE interface [0101]: nVidia Corporation nForce2 IDE [10de:0065] (rev a2)
00:0d.0 FireWire (IEEE 1394) [0c00]: nVidia Corporation nForce2 FireWire (IEEE 1394) Controller [10de:006e] (rev a3)
00:1e.0 PCI bridge [0604]: nVidia Corporation nForce2 AGP [10de:01e8] (rev a2)
01:06.0 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev 80)
01:06.1 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev 80)
04:00.0 VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX - nForce GPU] [10de:01f0] (rev a3)


I also have nvidiafb turned on; perhaps that conflicts?
