From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99966] New: Crash of nouveau - cache related?
Date: Sat, 25 Feb 2017 22:09:44 +0000
Message-ID: <bug-99966-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0239947295=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0239947295==
Content-Type: multipart/alternative; boundary="14880605841.f83Cf2CA.3879";
 charset="UTF-8"


--14880605841.f83Cf2CA.3879
Date: Sat, 25 Feb 2017 22:09:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99966

            Bug ID: 99966
           Summary: Crash of nouveau - cache related?
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: quelque_ri1-Qt13gs6zZMY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Allo,

I am not sure how to look for this bug in the list. Still, I will provide a=
ll
the information I can and let some wiser guys determine if there is a
duplicate. And maybe it would not even apply to nouveau.

I have a crash, happening after a few days of use, that I reproduce all the
time after few days. I have not able to determine what could be the cause, =
but
it may be because of the cache that ends up unfreed and lacking of space. T=
he
symptoms vary, but it doesn't necessarily make my xorg crash. I am commiting
now, with the nouveau "crash", with firefox. So that means it is not a comp=
lete
crash. But I can't launch vlc nor a Konsole.

There is my setup:
lspci -vvv gives this graphic card:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 32=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Acer Incorporated [ALI] Device 036d
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 3000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau

uname : Linux mooooo.com 4.9.8-1-ARCH #1 SMP PREEMPT Mon Feb 6 12:59:40 CET
2017 x86_64 GNU/Linux
(I am running archlinux with a KDE interface)

xf86-video-nouveau : 1.0.13-2
xorg-server : 1.19.1-5


There is the dmesg I get (that's the tail):
[252778.055465] resource sanity check: requesting [mem 0xb1f9c000-0xb209bff=
f],
which spans more than PCI Bus 0000:01 [mem 0xa0000000-0xb1ffffff 64bit pref]
[252778.055507] caller nv50_instobj_boot+0xac/0x120 [nouveau] mapping multi=
ple
BARs
[252778.055567] BUG: unable to handle kernel paging request at ffffc90000cb=
0000
[252778.055591] IP: [<ffffffff8132026e>] iowrite32+0x2e/0x40
[252778.055605] PGD 153498067=20
[252778.055609] PUD 153499067=20
[252778.055615] PMD 1517b5067=20
[252778.055617] PTE 0

[252778.055626] Oops: 0002 [#1] PREEMPT SMP
[252778.055636] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[252778.055804]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[252778.055881] CPU: 0 PID: 14905 Comm: exe Tainted: G           O=20=20=20
4.9.8-1-ARCH #1
[252778.055889] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[252778.055897] task: ffff88007ae55b00 task.stack: ffffc900072d8000
[252778.055903] RIP: 0010:[<ffffffff8132026e>]  [<ffffffff8132026e>]
iowrite32+0x2e/0x40
[252778.055914] RSP: 0018:ffffc900072db930  EFLAGS: 00010292
[252778.055920] RAX: ffffffffa0926880 RBX: 0000000000010000 RCX:
0000000000000009
[252778.055927] RDX: 000000003dec7381 RSI: ffffc90000cb0000 RDI:
000000003dec7381
[252778.055934] RBP: ffffc900072db938 R08: 0000000000000100 R09:
000000003de63000
[252778.055941] R10: ffff88007ca5d200 R11: 000000003de63000 R12:
0000000000000000
[252778.055948] R13: 000000003dec7381 R14: 0000000000000400 R15:
ffff880148cfc280
[252778.055956] FS:  00007f01bff34a00(0000) GS:ffff880157c00000(0000)
knlGS:0000000000000000
[252778.056208] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[252778.056503] CR2: ffffc90000cb0000 CR3: 0000000027a20000 CR4:
00000000000006f0
[252778.056991] Stack:
[252778.057471]  ffffffffa0890954 ffffc900072db990 ffffffffa0896f27
ffff88007ca5d200
[252778.057965]  ffff88007a35d0d8 000000003df47001 000000e000000000
0000000000000100
[252778.058461]  0000000000000000 000000000000209c ffff880151d11600
ffff88007a35d0d8
[252778.058963] Call Trace:
[252778.059494]  [<ffffffffa0890954>] ? nvkm_instobj_wr32+0x14/0x20 [nouvea=
u]
[252778.059992]  [<ffffffffa0896f27>] nv50_vm_map+0x157/0x1a0 [nouveau]
[252778.060500]  [<ffffffffa089503d>] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
[252778.061015]  [<ffffffffa089171b>] nv50_instobj_map+0x1b/0x20 [nouveau]
[252778.061534]  [<ffffffffa0891982>] nv50_instobj_boot+0xc2/0x120 [nouveau]
[252778.062050]  [<ffffffffa089189b>] nv50_instobj_acquire+0x4b/0x70 [nouve=
au]
[252778.062564]  [<ffffffffa0890887>] nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
[252778.063080]  [<ffffffffa0890c2f>] nvkm_instobj_new+0x6f/0x180 [nouveau]
[252778.063587]  [<ffffffffa08475c4>] nvkm_memory_new+0x44/0x80 [nouveau]
[252778.064108]  [<ffffffffa0895b3f>] nvkm_vm_get+0x15f/0x250 [nouveau]
[252778.064611]  [<ffffffffa08f5a52>] nouveau_bo_vma_add+0x32/0xa0 [nouveau]
[252778.065124]  [<ffffffffa08f3c2a>] ? nouveau_bo_map+0x7a/0xa0 [nouveau]
[252778.065627]  [<ffffffffa0906f52>] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[252778.066136]  [<ffffffffa0907067>] nouveau_channel_new+0x57/0x6d0 [nouve=
au]
[252778.066642]  [<ffffffffa0844a2d>] ? nvif_device_init+0x2d/0x30 [nouveau]
[252778.067144]  [<ffffffff811eb0cc>] ? kmem_cache_alloc_trace+0x19c/0x1b0
[252778.067672]  [<ffffffffa0906174>]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[252778.068185]  [<ffffffffa044cb6b>] drm_ioctl+0x21b/0x4c0 [drm]
[252778.068710]  [<ffffffffa0906090>] ? nouveau_abi16_ioctl_setparam+0x10/0=
x10
[nouveau]
[252778.069220]  [<ffffffffa08eee14>] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[252778.069723]  [<ffffffff81225053>] do_vfs_ioctl+0xa3/0x5f0
[252778.070239]  [<ffffffff81230497>] ? __fget+0x77/0xb0
[252778.070757]  [<ffffffff81225619>] SyS_ioctl+0x79/0x90
[252778.071260]  [<ffffffff8160a8b7>] entry_SYSCALL_64_fastpath+0x1a/0xa9
[252778.071744] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 <89=
> 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[252778.072757] RIP  [<ffffffff8132026e>] iowrite32+0x2e/0x40
[252778.073213]  RSP <ffffc900072db930>
[252778.073651] CR2: ffffc90000cb0000
[252778.076467] ---[ end trace 9acfa30a808e2e75 ]---
[253230.177767] BUG: unable to handle kernel paging request at ffffc90000cb=
04e0
[253230.178099] IP: [<ffffffff8132026e>] iowrite32+0x2e/0x40
[253230.178472] PGD 153498067=20
[253230.178479] PUD 153499067=20
[253230.178814] PMD 1517b5067=20
[253230.178818] PTE 0

[253230.179495] Oops: 0002 [#2] PREEMPT SMP
[253230.179858] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[253230.181575]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[253230.182913] CPU: 1 PID: 15998 Comm: exe Tainted: G      D    O=20=20=20
4.9.8-1-ARCH #1
[253230.183417] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[253230.183942] task: ffff880152f6a700 task.stack: ffffc90007f00000
[253230.184466] RIP: 0010:[<ffffffff8132026e>]  [<ffffffff8132026e>]
iowrite32+0x2e/0x40
[253230.184993] RSP: 0018:ffffc90007f03930  EFLAGS: 00010296
[253230.185517] RAX: ffffffffa0926880 RBX: 00000000000104e0 RCX:
0000000000000009
[253230.186045] RDX: 000000003dd63101 RSI: ffffc90000cb04e0 RDI:
000000003dd63101
[253230.186574] RBP: ffffc90007f03938 R08: 0000000000000100 R09:
000000003dd63000
[253230.187111] R10: ffff88010dd38500 R11: 000000003dd63000 R12:
0000000000000000
[253230.187635] R13: 000000003dd63101 R14: 0000000000000020 R15:
ffff880148cfc280
[253230.188170] FS:  00007f1bcd1eda00(0000) GS:ffff880157c40000(0000)
knlGS:0000000000000000
[253230.188698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[253230.189227] CR2: ffffc90000cb04e0 CR3: 000000005dfae000 CR4:
00000000000006e0
[253230.189807] Stack:
[253230.190345]  ffffffffa0890954 ffffc90007f03990 ffffffffa0896f27
ffff88010dd38500
[253230.190972]  ffff8800375c96d8 000000003dd67001 000007e000000000
0000000000000100
[253230.192427]  0000000000000000 000000000000219c ffff880151d11600
ffff8800375c96d8
[253230.192917] Call Trace:
[253230.193501]  [<ffffffffa0890954>] ? nvkm_instobj_wr32+0x14/0x20 [nouvea=
u]
[253230.194037]  [<ffffffffa0896f27>] nv50_vm_map+0x157/0x1a0 [nouveau]
[253230.194591]  [<ffffffffa089503d>] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
[253230.195145]  [<ffffffffa089171b>] nv50_instobj_map+0x1b/0x20 [nouveau]
[253230.195695]  [<ffffffffa0891982>] nv50_instobj_boot+0xc2/0x120 [nouveau]
[253230.196246]  [<ffffffffa089189b>] nv50_instobj_acquire+0x4b/0x70 [nouve=
au]
[253230.196785]  [<ffffffffa0890887>] nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
[253230.197326]  [<ffffffffa0890c2f>] nvkm_instobj_new+0x6f/0x180 [nouveau]
[253230.197865]  [<ffffffffa08475c4>] nvkm_memory_new+0x44/0x80 [nouveau]
[253230.198423]  [<ffffffffa0895b3f>] nvkm_vm_get+0x15f/0x250 [nouveau]
[253230.200581]  [<ffffffffa08f5a52>] nouveau_bo_vma_add+0x32/0xa0 [nouveau]
[253230.201767]  [<ffffffffa08f3c2a>] ? nouveau_bo_map+0x7a/0xa0 [nouveau]
[253230.202293]  [<ffffffffa0906f52>] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[253230.202796]  [<ffffffffa0907067>] nouveau_channel_new+0x57/0x6d0 [nouve=
au]
[253230.203305]  [<ffffffffa0844a2d>] ? nvif_device_init+0x2d/0x30 [nouveau]
[253230.203809]  [<ffffffff811eb0cc>] ? kmem_cache_alloc_trace+0x19c/0x1b0
[253230.204337]  [<ffffffffa0906174>]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[253230.204853]  [<ffffffffa044cb6b>] drm_ioctl+0x21b/0x4c0 [drm]
[253230.205379]  [<ffffffffa0906090>] ? nouveau_abi16_ioctl_setparam+0x10/0=
x10
[nouveau]
[253230.205903]  [<ffffffffa08eee14>] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[253230.206410]  [<ffffffff81225053>] do_vfs_ioctl+0xa3/0x5f0
[253230.206929]  [<ffffffff81230497>] ? __fget+0x77/0xb0
[253230.207451]  [<ffffffff81225619>] SyS_ioctl+0x79/0x90
[253230.207957]  [<ffffffff8160a8b7>] entry_SYSCALL_64_fastpath+0x1a/0xa9
[253230.208446] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 <89=
> 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[253230.209467] RIP  [<ffffffff8132026e>] iowrite32+0x2e/0x40
[253230.209930]  RSP <ffffc90007f03930>
[253230.210367] CR2: ffffc90000cb04e0
[253230.210786] ---[ end trace 9acfa30a808e2e76 ]---
[260088.008087] tg3 0000:02:00.0 enp2s0: Link is down
[310151.341262] tg3 0000:02:00.0 enp2s0: Link is up at 100 Mbps, full duplex
[310151.341269] tg3 0000:02:00.0 enp2s0: Flow control is off for TX and off=
 for
RX
[329571.013839] BUG: unable to handle kernel paging request at ffffc90000cb=
0ce0
[329571.014121] IP: [<ffffffff8132026e>] iowrite32+0x2e/0x40
[329571.014389] PGD 153498067=20
[329571.014393] PUD 153499067=20
[329571.014730] PMD 1517b5067=20
[329571.014734] PTE 0

[329571.015517] Oops: 0002 [#3] PREEMPT SMP
[329571.015907] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[329571.017732]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[329571.019216] CPU: 1 PID: 2256 Comm: vlc Tainted: G      D    O=20=20=20
4.9.8-1-ARCH #1
[329571.019724] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[329571.020247] task: ffff880104006800 task.stack: ffffc900070f0000
[329571.020770] RIP: 0010:[<ffffffff8132026e>]  [<ffffffff8132026e>]
iowrite32+0x2e/0x40
[329571.021303] RSP: 0018:ffffc900070f3930  EFLAGS: 00010296
[329571.021828] RAX: ffffffffa0926880 RBX: 0000000000010ce0 RCX:
0000000000000009
[329571.022354] RDX: 000000003dc63101 RSI: ffffc90000cb0ce0 RDI:
000000003dc63101
[329571.022883] RBP: ffffc900070f3938 R08: 0000000000000100 R09:
000000003dc63000
[329571.023414] R10: ffff88002d3d2a00 R11: 000000003dc63000 R12:
0000000000000000
[329571.023951] R13: 000000003dc63101 R14: 0000000000000020 R15:
ffff880148cfc280
[329571.024473] FS:  00007f0a841f6700(0000) GS:ffff880157c40000(0000)
knlGS:0000000000000000
[329571.025005] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[329571.025539] CR2: ffffc90000cb0ce0 CR3: 000000000c22b000 CR4:
00000000000006e0
[329571.026079] Stack:
[329571.026616]  ffffffffa0890954 ffffc900070f3990 ffffffffa0896f27
ffff88002d3d2a00
[329571.027158]  ffff88001760d5b8 000000003dc67001 000007e000000000
0000000000000100
[329571.027708]  0000000000000000 000000000000229c ffff880151d11600
ffff88001760d5b8
[329571.028263] Call Trace:
[329571.028847]  [<ffffffffa0890954>] ? nvkm_instobj_wr32+0x14/0x20 [nouvea=
u]
[329571.029386]  [<ffffffffa0896f27>] nv50_vm_map+0x157/0x1a0 [nouveau]
[329571.029937]  [<ffffffffa089503d>] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
[329571.030494]  [<ffffffffa089171b>] nv50_instobj_map+0x1b/0x20 [nouveau]
[329571.031047]  [<ffffffffa0891982>] nv50_instobj_boot+0xc2/0x120 [nouveau]
[329571.031590]  [<ffffffffa089189b>] nv50_instobj_acquire+0x4b/0x70 [nouve=
au]
[329571.032129]  [<ffffffffa0890887>] nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
[329571.032670]  [<ffffffffa0890c2f>] nvkm_instobj_new+0x6f/0x180 [nouveau]
[329571.033201]  [<ffffffffa08475c4>] nvkm_memory_new+0x44/0x80 [nouveau]
[329571.033750]  [<ffffffffa0895b3f>] nvkm_vm_get+0x15f/0x250 [nouveau]
[329571.034280]  [<ffffffffa08f5a52>] nouveau_bo_vma_add+0x32/0xa0 [nouveau]
[329571.034822]  [<ffffffffa08f3c2a>] ? nouveau_bo_map+0x7a/0xa0 [nouveau]
[329571.035344]  [<ffffffffa0906f52>] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[329571.035848]  [<ffffffffa0907067>] nouveau_channel_new+0x57/0x6d0 [nouve=
au]
[329571.036360]  [<ffffffffa0844a2d>] ? nvif_device_init+0x2d/0x30 [nouveau]
[329571.036864]  [<ffffffff811eb0cc>] ? kmem_cache_alloc_trace+0x19c/0x1b0
[329571.037403]  [<ffffffffa0906174>]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[329571.037911]  [<ffffffffa044cb6b>] drm_ioctl+0x21b/0x4c0 [drm]
[329571.038436]  [<ffffffffa0906090>] ? nouveau_abi16_ioctl_setparam+0x10/0=
x10
[nouveau]
[329571.038956]  [<ffffffffa08eee14>] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[329571.039464]  [<ffffffff81225053>] do_vfs_ioctl+0xa3/0x5f0
[329571.039980]  [<ffffffff81230497>] ? __fget+0x77/0xb0
[329571.040502]  [<ffffffff81225619>] SyS_ioctl+0x79/0x90
[329571.041006]  [<ffffffff8160a8b7>] entry_SYSCALL_64_fastpath+0x1a/0xa9
[329571.041498] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 <89=
> 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[329571.042512] RIP  [<ffffffff8132026e>] iowrite32+0x2e/0x40
[329571.042970]  RSP <ffffc900070f3930>
[329571.043405] CR2: ffffc90000cb0ce0
[329571.043824] ---[ end trace 9acfa30a808e2e77 ]---
[329650.498000] BUG: unable to handle kernel paging request at ffffc90000cb=
14e0
[329650.498281] IP: [<ffffffff8132026e>] iowrite32+0x2e/0x40
[329650.498567] PGD 153498067=20
[329650.498572] PUD 153499067=20
[329650.498883] PMD 1517b5067=20
[329650.498888] PTE 0

[329650.499665] Oops: 0002 [#4] PREEMPT SMP
[329650.500052] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[329650.502794]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[329650.505172] CPU: 2 PID: 2318 Comm: konsole Tainted: G      D    O=20=20=
=20
4.9.8-1-ARCH #1
[329650.505679] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[329650.506205] task: ffff88007a105b00 task.stack: ffffc90007424000
[329650.506728] RIP: 0010:[<ffffffff8132026e>]  [<ffffffff8132026e>]
iowrite32+0x2e/0x40
[329650.507259] RSP: 0018:ffffc90007427930  EFLAGS: 00010296
[329650.507781] RAX: ffffffffa0926880 RBX: 00000000000114e0 RCX:
0000000000000009
[329650.508316] RDX: 000000003db63101 RSI: ffffc90000cb14e0 RDI:
000000003db63101
[329650.508843] RBP: ffffc90007427938 R08: 0000000000000100 R09:
000000003db63000
[329650.509371] R10: ffff880004ec3c00 R11: 000000003db63000 R12:
0000000000000000
[329650.509907] R13: 000000003db63101 R14: 0000000000000020 R15:
ffff880148cfc280
[329650.510438] FS:  00007facf503ec80(0000) GS:ffff880157c80000(0000)
knlGS:0000000000000000
[329650.510965] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[329650.511501] CR2: ffffc90000cb14e0 CR3: 000000007ab98000 CR4:
00000000000006e0
[329650.512040] Stack:
[329650.512577]  ffffffffa0890954 ffffc90007427990 ffffffffa0896f27
ffff880004ec3c00
[329650.513119]  ffff8801260a55b8 000000003db67001 000007e000000000
0000000000000100
[329650.513671]  0000000000000000 000000000000239c ffff880151d11600
ffff8801260a55b8
[329650.514228] Call Trace:
[329650.514808]  [<ffffffffa0890954>] ? nvkm_instobj_wr32+0x14/0x20 [nouvea=
u]
[329650.515350]  [<ffffffffa0896f27>] nv50_vm_map+0x157/0x1a0 [nouveau]
[329650.515903]  [<ffffffffa089503d>] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
[329650.516457]  [<ffffffffa089171b>] nv50_instobj_map+0x1b/0x20 [nouveau]
[329650.517006]  [<ffffffffa0891982>] nv50_instobj_boot+0xc2/0x120 [nouveau]
[329650.517558]  [<ffffffffa089189b>] nv50_instobj_acquire+0x4b/0x70 [nouve=
au]
[329650.518919]  [<ffffffffa0890887>] nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
[329650.519458]  [<ffffffffa0890c2f>] nvkm_instobj_new+0x6f/0x180 [nouveau]
[329650.519990]  [<ffffffffa08475c4>] nvkm_memory_new+0x44/0x80 [nouveau]
[329650.520536]  [<ffffffffa0895b3f>] nvkm_vm_get+0x15f/0x250 [nouveau]
[329650.521071]  [<ffffffffa08f5a52>] nouveau_bo_vma_add+0x32/0xa0 [nouveau]
[329650.521614]  [<ffffffffa08f3c2a>] ? nouveau_bo_map+0x7a/0xa0 [nouveau]
[329650.522134]  [<ffffffffa0906f52>] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[329650.522641]  [<ffffffffa0907067>] nouveau_channel_new+0x57/0x6d0 [nouve=
au]
[329650.523157]  [<ffffffffa0844a2d>] ? nvif_device_init+0x2d/0x30 [nouveau]
[329650.523661]  [<ffffffff811eb0cc>] ? kmem_cache_alloc_trace+0x19c/0x1b0
[329650.524193]  [<ffffffffa0906174>]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[329650.524708]  [<ffffffffa044cb6b>] drm_ioctl+0x21b/0x4c0 [drm]
[329650.525236]  [<ffffffffa0906090>] ? nouveau_abi16_ioctl_setparam+0x10/0=
x10
[nouveau]
[329650.525762]  [<ffffffffa08eee14>] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[329650.526269]  [<ffffffff81225053>] do_vfs_ioctl+0xa3/0x5f0
[329650.526801]  [<ffffffff81230497>] ? __fget+0x77/0xb0
[329650.527324]  [<ffffffff81225619>] SyS_ioctl+0x79/0x90
[329650.527830]  [<ffffffff8160a8b7>] entry_SYSCALL_64_fastpath+0x1a/0xa9
[329650.528319] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 <89=
> 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[329650.529342] RIP  [<ffffffff8132026e>] iowrite32+0x2e/0x40
[329650.529802]  RSP <ffffc90007427930>
[329650.530242] CR2: ffffc90000cb14e0
[329650.530659] ---[ end trace 9acfa30a808e2e78 ]---



I think that's all the information you want. Please tell me to clarify if y=
ou
need to. And you can for sure ask me to provide more information.

Cheers.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14880605841.f83Cf2CA.3879
Date: Sat, 25 Feb 2017 22:09:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash of nouveau - cache related?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99966">99966</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash of nouveau - cache related?
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>quelque_ri1&#64;yahoo.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Allo,

I am not sure how to look for this bug in the list. Still, I will provide a=
ll
the information I can and let some wiser guys determine if there is a
duplicate. And maybe it would not even apply to nouveau.

I have a crash, happening after a few days of use, that I reproduce all the
time after few days. I have not able to determine what could be the cause, =
but
it may be because of the cache that ends up unfreed and lacking of space. T=
he
symptoms vary, but it doesn't necessarily make my xorg crash. I am commiting
now, with the nouveau &quot;crash&quot;, with firefox. So that means it is =
not a complete
crash. But I can't launch vlc nor a Konsole.

There is my setup:
lspci -vvv gives this graphic card:
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 32=
0M]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: Acer Incorporated [ALI] Device 036d
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Region 3: Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 3000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau

uname : Linux mooooo.com 4.9.8-1-ARCH #1 SMP PREEMPT Mon Feb 6 12:59:40 CET
2017 x86_64 GNU/Linux
(I am running archlinux with a KDE interface)

xf86-video-nouveau : 1.0.13-2
xorg-server : 1.19.1-5


There is the dmesg I get (that's the tail):
[252778.055465] resource sanity check: requesting [mem 0xb1f9c000-0xb209bff=
f],
which spans more than PCI Bus 0000:01 [mem 0xa0000000-0xb1ffffff 64bit pref]
[252778.055507] caller nv50_instobj_boot+0xac/0x120 [nouveau] mapping multi=
ple
BARs
[252778.055567] BUG: unable to handle kernel paging request at ffffc90000cb=
0000
[252778.055591] IP: [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[252778.055605] PGD 153498067=20
[252778.055609] PUD 153499067=20
[252778.055615] PMD 1517b5067=20
[252778.055617] PTE 0

[252778.055626] Oops: 0002 [#1] PREEMPT SMP
[252778.055636] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[252778.055804]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[252778.055881] CPU: 0 PID: 14905 Comm: exe Tainted: G           O=20=20=20
4.9.8-1-ARCH #1
[252778.055889] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[252778.055897] task: ffff88007ae55b00 task.stack: ffffc900072d8000
[252778.055903] RIP: 0010:[&lt;ffffffff8132026e&gt;]  [&lt;ffffffff8132026e=
&gt;]
iowrite32+0x2e/0x40
[252778.055914] RSP: 0018:ffffc900072db930  EFLAGS: 00010292
[252778.055920] RAX: ffffffffa0926880 RBX: 0000000000010000 RCX:
0000000000000009
[252778.055927] RDX: 000000003dec7381 RSI: ffffc90000cb0000 RDI:
000000003dec7381
[252778.055934] RBP: ffffc900072db938 R08: 0000000000000100 R09:
000000003de63000
[252778.055941] R10: ffff88007ca5d200 R11: 000000003de63000 R12:
0000000000000000
[252778.055948] R13: 000000003dec7381 R14: 0000000000000400 R15:
ffff880148cfc280
[252778.055956] FS:  00007f01bff34a00(0000) GS:ffff880157c00000(0000)
knlGS:0000000000000000
[252778.056208] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[252778.056503] CR2: ffffc90000cb0000 CR3: 0000000027a20000 CR4:
00000000000006f0
[252778.056991] Stack:
[252778.057471]  ffffffffa0890954 ffffc900072db990 ffffffffa0896f27
ffff88007ca5d200
[252778.057965]  ffff88007a35d0d8 000000003df47001 000000e000000000
0000000000000100
[252778.058461]  0000000000000000 000000000000209c ffff880151d11600
ffff88007a35d0d8
[252778.058963] Call Trace:
[252778.059494]  [&lt;ffffffffa0890954&gt;] ? nvkm_instobj_wr32+0x14/0x20 [=
nouveau]
[252778.059992]  [&lt;ffffffffa0896f27&gt;] nv50_vm_map+0x157/0x1a0 [nouvea=
u]
[252778.060500]  [&lt;ffffffffa089503d&gt;] nvkm_vm_map_at+0xdd/0x1d0 [nouv=
eau]
[252778.061015]  [&lt;ffffffffa089171b&gt;] nv50_instobj_map+0x1b/0x20 [nou=
veau]
[252778.061534]  [&lt;ffffffffa0891982&gt;] nv50_instobj_boot+0xc2/0x120 [n=
ouveau]
[252778.062050]  [&lt;ffffffffa089189b&gt;] nv50_instobj_acquire+0x4b/0x70 =
[nouveau]
[252778.062564]  [&lt;ffffffffa0890887&gt;] nvkm_instobj_acquire_slow+0x17/=
0x30
[nouveau]
[252778.063080]  [&lt;ffffffffa0890c2f&gt;] nvkm_instobj_new+0x6f/0x180 [no=
uveau]
[252778.063587]  [&lt;ffffffffa08475c4&gt;] nvkm_memory_new+0x44/0x80 [nouv=
eau]
[252778.064108]  [&lt;ffffffffa0895b3f&gt;] nvkm_vm_get+0x15f/0x250 [nouvea=
u]
[252778.064611]  [&lt;ffffffffa08f5a52&gt;] nouveau_bo_vma_add+0x32/0xa0 [n=
ouveau]
[252778.065124]  [&lt;ffffffffa08f3c2a&gt;] ? nouveau_bo_map+0x7a/0xa0 [nou=
veau]
[252778.065627]  [&lt;ffffffffa0906f52&gt;] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[252778.066136]  [&lt;ffffffffa0907067&gt;] nouveau_channel_new+0x57/0x6d0 =
[nouveau]
[252778.066642]  [&lt;ffffffffa0844a2d&gt;] ? nvif_device_init+0x2d/0x30 [n=
ouveau]
[252778.067144]  [&lt;ffffffff811eb0cc&gt;] ? kmem_cache_alloc_trace+0x19c/=
0x1b0
[252778.067672]  [&lt;ffffffffa0906174&gt;]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[252778.068185]  [&lt;ffffffffa044cb6b&gt;] drm_ioctl+0x21b/0x4c0 [drm]
[252778.068710]  [&lt;ffffffffa0906090&gt;] ? nouveau_abi16_ioctl_setparam+=
0x10/0x10
[nouveau]
[252778.069220]  [&lt;ffffffffa08eee14&gt;] nouveau_drm_ioctl+0x74/0xc0 [no=
uveau]
[252778.069723]  [&lt;ffffffff81225053&gt;] do_vfs_ioctl+0xa3/0x5f0
[252778.070239]  [&lt;ffffffff81230497&gt;] ? __fget+0x77/0xb0
[252778.070757]  [&lt;ffffffff81225619&gt;] SyS_ioctl+0x79/0x90
[252778.071260]  [&lt;ffffffff8160a8b7&gt;] entry_SYSCALL_64_fastpath+0x1a/=
0xa9
[252778.071744] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 &lt=
;89&gt; 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[252778.072757] RIP  [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[252778.073213]  RSP &lt;ffffc900072db930&gt;
[252778.073651] CR2: ffffc90000cb0000
[252778.076467] ---[ end trace 9acfa30a808e2e75 ]---
[253230.177767] BUG: unable to handle kernel paging request at ffffc90000cb=
04e0
[253230.178099] IP: [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[253230.178472] PGD 153498067=20
[253230.178479] PUD 153499067=20
[253230.178814] PMD 1517b5067=20
[253230.178818] PTE 0

[253230.179495] Oops: 0002 [#2] PREEMPT SMP
[253230.179858] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[253230.181575]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[253230.182913] CPU: 1 PID: 15998 Comm: exe Tainted: G      D    O=20=20=20
4.9.8-1-ARCH #1
[253230.183417] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[253230.183942] task: ffff880152f6a700 task.stack: ffffc90007f00000
[253230.184466] RIP: 0010:[&lt;ffffffff8132026e&gt;]  [&lt;ffffffff8132026e=
&gt;]
iowrite32+0x2e/0x40
[253230.184993] RSP: 0018:ffffc90007f03930  EFLAGS: 00010296
[253230.185517] RAX: ffffffffa0926880 RBX: 00000000000104e0 RCX:
0000000000000009
[253230.186045] RDX: 000000003dd63101 RSI: ffffc90000cb04e0 RDI:
000000003dd63101
[253230.186574] RBP: ffffc90007f03938 R08: 0000000000000100 R09:
000000003dd63000
[253230.187111] R10: ffff88010dd38500 R11: 000000003dd63000 R12:
0000000000000000
[253230.187635] R13: 000000003dd63101 R14: 0000000000000020 R15:
ffff880148cfc280
[253230.188170] FS:  00007f1bcd1eda00(0000) GS:ffff880157c40000(0000)
knlGS:0000000000000000
[253230.188698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[253230.189227] CR2: ffffc90000cb04e0 CR3: 000000005dfae000 CR4:
00000000000006e0
[253230.189807] Stack:
[253230.190345]  ffffffffa0890954 ffffc90007f03990 ffffffffa0896f27
ffff88010dd38500
[253230.190972]  ffff8800375c96d8 000000003dd67001 000007e000000000
0000000000000100
[253230.192427]  0000000000000000 000000000000219c ffff880151d11600
ffff8800375c96d8
[253230.192917] Call Trace:
[253230.193501]  [&lt;ffffffffa0890954&gt;] ? nvkm_instobj_wr32+0x14/0x20 [=
nouveau]
[253230.194037]  [&lt;ffffffffa0896f27&gt;] nv50_vm_map+0x157/0x1a0 [nouvea=
u]
[253230.194591]  [&lt;ffffffffa089503d&gt;] nvkm_vm_map_at+0xdd/0x1d0 [nouv=
eau]
[253230.195145]  [&lt;ffffffffa089171b&gt;] nv50_instobj_map+0x1b/0x20 [nou=
veau]
[253230.195695]  [&lt;ffffffffa0891982&gt;] nv50_instobj_boot+0xc2/0x120 [n=
ouveau]
[253230.196246]  [&lt;ffffffffa089189b&gt;] nv50_instobj_acquire+0x4b/0x70 =
[nouveau]
[253230.196785]  [&lt;ffffffffa0890887&gt;] nvkm_instobj_acquire_slow+0x17/=
0x30
[nouveau]
[253230.197326]  [&lt;ffffffffa0890c2f&gt;] nvkm_instobj_new+0x6f/0x180 [no=
uveau]
[253230.197865]  [&lt;ffffffffa08475c4&gt;] nvkm_memory_new+0x44/0x80 [nouv=
eau]
[253230.198423]  [&lt;ffffffffa0895b3f&gt;] nvkm_vm_get+0x15f/0x250 [nouvea=
u]
[253230.200581]  [&lt;ffffffffa08f5a52&gt;] nouveau_bo_vma_add+0x32/0xa0 [n=
ouveau]
[253230.201767]  [&lt;ffffffffa08f3c2a&gt;] ? nouveau_bo_map+0x7a/0xa0 [nou=
veau]
[253230.202293]  [&lt;ffffffffa0906f52&gt;] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[253230.202796]  [&lt;ffffffffa0907067&gt;] nouveau_channel_new+0x57/0x6d0 =
[nouveau]
[253230.203305]  [&lt;ffffffffa0844a2d&gt;] ? nvif_device_init+0x2d/0x30 [n=
ouveau]
[253230.203809]  [&lt;ffffffff811eb0cc&gt;] ? kmem_cache_alloc_trace+0x19c/=
0x1b0
[253230.204337]  [&lt;ffffffffa0906174&gt;]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[253230.204853]  [&lt;ffffffffa044cb6b&gt;] drm_ioctl+0x21b/0x4c0 [drm]
[253230.205379]  [&lt;ffffffffa0906090&gt;] ? nouveau_abi16_ioctl_setparam+=
0x10/0x10
[nouveau]
[253230.205903]  [&lt;ffffffffa08eee14&gt;] nouveau_drm_ioctl+0x74/0xc0 [no=
uveau]
[253230.206410]  [&lt;ffffffff81225053&gt;] do_vfs_ioctl+0xa3/0x5f0
[253230.206929]  [&lt;ffffffff81230497&gt;] ? __fget+0x77/0xb0
[253230.207451]  [&lt;ffffffff81225619&gt;] SyS_ioctl+0x79/0x90
[253230.207957]  [&lt;ffffffff8160a8b7&gt;] entry_SYSCALL_64_fastpath+0x1a/=
0xa9
[253230.208446] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 &lt=
;89&gt; 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[253230.209467] RIP  [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[253230.209930]  RSP &lt;ffffc90007f03930&gt;
[253230.210367] CR2: ffffc90000cb04e0
[253230.210786] ---[ end trace 9acfa30a808e2e76 ]---
[260088.008087] tg3 0000:02:00.0 enp2s0: Link is down
[310151.341262] tg3 0000:02:00.0 enp2s0: Link is up at 100 Mbps, full duplex
[310151.341269] tg3 0000:02:00.0 enp2s0: Flow control is off for TX and off=
 for
RX
[329571.013839] BUG: unable to handle kernel paging request at ffffc90000cb=
0ce0
[329571.014121] IP: [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[329571.014389] PGD 153498067=20
[329571.014393] PUD 153499067=20
[329571.014730] PMD 1517b5067=20
[329571.014734] PTE 0

[329571.015517] Oops: 0002 [#3] PREEMPT SMP
[329571.015907] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[329571.017732]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[329571.019216] CPU: 1 PID: 2256 Comm: vlc Tainted: G      D    O=20=20=20
4.9.8-1-ARCH #1
[329571.019724] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[329571.020247] task: ffff880104006800 task.stack: ffffc900070f0000
[329571.020770] RIP: 0010:[&lt;ffffffff8132026e&gt;]  [&lt;ffffffff8132026e=
&gt;]
iowrite32+0x2e/0x40
[329571.021303] RSP: 0018:ffffc900070f3930  EFLAGS: 00010296
[329571.021828] RAX: ffffffffa0926880 RBX: 0000000000010ce0 RCX:
0000000000000009
[329571.022354] RDX: 000000003dc63101 RSI: ffffc90000cb0ce0 RDI:
000000003dc63101
[329571.022883] RBP: ffffc900070f3938 R08: 0000000000000100 R09:
000000003dc63000
[329571.023414] R10: ffff88002d3d2a00 R11: 000000003dc63000 R12:
0000000000000000
[329571.023951] R13: 000000003dc63101 R14: 0000000000000020 R15:
ffff880148cfc280
[329571.024473] FS:  00007f0a841f6700(0000) GS:ffff880157c40000(0000)
knlGS:0000000000000000
[329571.025005] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[329571.025539] CR2: ffffc90000cb0ce0 CR3: 000000000c22b000 CR4:
00000000000006e0
[329571.026079] Stack:
[329571.026616]  ffffffffa0890954 ffffc900070f3990 ffffffffa0896f27
ffff88002d3d2a00
[329571.027158]  ffff88001760d5b8 000000003dc67001 000007e000000000
0000000000000100
[329571.027708]  0000000000000000 000000000000229c ffff880151d11600
ffff88001760d5b8
[329571.028263] Call Trace:
[329571.028847]  [&lt;ffffffffa0890954&gt;] ? nvkm_instobj_wr32+0x14/0x20 [=
nouveau]
[329571.029386]  [&lt;ffffffffa0896f27&gt;] nv50_vm_map+0x157/0x1a0 [nouvea=
u]
[329571.029937]  [&lt;ffffffffa089503d&gt;] nvkm_vm_map_at+0xdd/0x1d0 [nouv=
eau]
[329571.030494]  [&lt;ffffffffa089171b&gt;] nv50_instobj_map+0x1b/0x20 [nou=
veau]
[329571.031047]  [&lt;ffffffffa0891982&gt;] nv50_instobj_boot+0xc2/0x120 [n=
ouveau]
[329571.031590]  [&lt;ffffffffa089189b&gt;] nv50_instobj_acquire+0x4b/0x70 =
[nouveau]
[329571.032129]  [&lt;ffffffffa0890887&gt;] nvkm_instobj_acquire_slow+0x17/=
0x30
[nouveau]
[329571.032670]  [&lt;ffffffffa0890c2f&gt;] nvkm_instobj_new+0x6f/0x180 [no=
uveau]
[329571.033201]  [&lt;ffffffffa08475c4&gt;] nvkm_memory_new+0x44/0x80 [nouv=
eau]
[329571.033750]  [&lt;ffffffffa0895b3f&gt;] nvkm_vm_get+0x15f/0x250 [nouvea=
u]
[329571.034280]  [&lt;ffffffffa08f5a52&gt;] nouveau_bo_vma_add+0x32/0xa0 [n=
ouveau]
[329571.034822]  [&lt;ffffffffa08f3c2a&gt;] ? nouveau_bo_map+0x7a/0xa0 [nou=
veau]
[329571.035344]  [&lt;ffffffffa0906f52&gt;] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[329571.035848]  [&lt;ffffffffa0907067&gt;] nouveau_channel_new+0x57/0x6d0 =
[nouveau]
[329571.036360]  [&lt;ffffffffa0844a2d&gt;] ? nvif_device_init+0x2d/0x30 [n=
ouveau]
[329571.036864]  [&lt;ffffffff811eb0cc&gt;] ? kmem_cache_alloc_trace+0x19c/=
0x1b0
[329571.037403]  [&lt;ffffffffa0906174&gt;]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[329571.037911]  [&lt;ffffffffa044cb6b&gt;] drm_ioctl+0x21b/0x4c0 [drm]
[329571.038436]  [&lt;ffffffffa0906090&gt;] ? nouveau_abi16_ioctl_setparam+=
0x10/0x10
[nouveau]
[329571.038956]  [&lt;ffffffffa08eee14&gt;] nouveau_drm_ioctl+0x74/0xc0 [no=
uveau]
[329571.039464]  [&lt;ffffffff81225053&gt;] do_vfs_ioctl+0xa3/0x5f0
[329571.039980]  [&lt;ffffffff81230497&gt;] ? __fget+0x77/0xb0
[329571.040502]  [&lt;ffffffff81225619&gt;] SyS_ioctl+0x79/0x90
[329571.041006]  [&lt;ffffffff8160a8b7&gt;] entry_SYSCALL_64_fastpath+0x1a/=
0xa9
[329571.041498] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 &lt=
;89&gt; 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[329571.042512] RIP  [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[329571.042970]  RSP &lt;ffffc900070f3930&gt;
[329571.043405] CR2: ffffc90000cb0ce0
[329571.043824] ---[ end trace 9acfa30a808e2e77 ]---
[329650.498000] BUG: unable to handle kernel paging request at ffffc90000cb=
14e0
[329650.498281] IP: [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[329650.498567] PGD 153498067=20
[329650.498572] PUD 153499067=20
[329650.498883] PMD 1517b5067=20
[329650.498888] PTE 0

[329650.499665] Oops: 0002 [#4] PREEMPT SMP
[329650.500052] Modules linked in: fuse ctr ccm snd_hda_codec_hdmi arc4
mousedev joydev nouveau iTCO_wdt iTCO_vendor_support snd_hda_codec_realtek
snd_hda_codec_generic acer_wmi sparse_keymap mxm_wmi hid_logitech_hidpp
uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_core
videodev media intel_powerclamp coretemp kvm_intel kvm ath9k ath9k_common
irqbypass ath9k_hw crc32c_intel ath intel_cstate mac80211 ttm evdev input_l=
eds
led_class mac_hid psmouse pcspkr drm_kms_helper broadcom bcm_phy_lib
snd_hda_intel i2c_i801 cfg80211 i2c_smbus snd_hda_codec drm tg3 snd_hda_core
snd_hwdep rfkill snd_pcm syscopyarea snd_timer ptp sysfillrect snd sysimgblt
pps_core fb_sys_fops i2c_algo_bit libphy soundcore lpc_ich mei_me battery m=
ei
ac intel_agp shpchp fjes intel_gtt wmi video button acpi_cpufreq
[329650.502794]  tpm_tis tpm_tis_core tpm sch_fq_codel vboxnetflt(O)
vboxnetadp(O) pci_stub vboxpci(O) vboxdrv(O) sg vhba(O) ip_tables x_tables
hid_logitech_dj ext4 crc16 jbd2 fscrypto usbhid mbcache hid sr_mod cdrom sd=
_mod
serio_raw atkbd libps2 ahci libahci libata scsi_mod ehci_pci ehci_hcd usbco=
re
usb_common i8042 serio
[329650.505172] CPU: 2 PID: 2318 Comm: konsole Tainted: G      D    O=20=20=
=20
4.9.8-1-ARCH #1
[329650.505679] Hardware name: Acer             Aspire 5741G    /Aspire 574=
1G=20=20
 , BIOS V1.08 05/19/2010
[329650.506205] task: ffff88007a105b00 task.stack: ffffc90007424000
[329650.506728] RIP: 0010:[&lt;ffffffff8132026e&gt;]  [&lt;ffffffff8132026e=
&gt;]
iowrite32+0x2e/0x40
[329650.507259] RSP: 0018:ffffc90007427930  EFLAGS: 00010296
[329650.507781] RAX: ffffffffa0926880 RBX: 00000000000114e0 RCX:
0000000000000009
[329650.508316] RDX: 000000003db63101 RSI: ffffc90000cb14e0 RDI:
000000003db63101
[329650.508843] RBP: ffffc90007427938 R08: 0000000000000100 R09:
000000003db63000
[329650.509371] R10: ffff880004ec3c00 R11: 000000003db63000 R12:
0000000000000000
[329650.509907] R13: 000000003db63101 R14: 0000000000000020 R15:
ffff880148cfc280
[329650.510438] FS:  00007facf503ec80(0000) GS:ffff880157c80000(0000)
knlGS:0000000000000000
[329650.510965] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[329650.511501] CR2: ffffc90000cb14e0 CR3: 000000007ab98000 CR4:
00000000000006e0
[329650.512040] Stack:
[329650.512577]  ffffffffa0890954 ffffc90007427990 ffffffffa0896f27
ffff880004ec3c00
[329650.513119]  ffff8801260a55b8 000000003db67001 000007e000000000
0000000000000100
[329650.513671]  0000000000000000 000000000000239c ffff880151d11600
ffff8801260a55b8
[329650.514228] Call Trace:
[329650.514808]  [&lt;ffffffffa0890954&gt;] ? nvkm_instobj_wr32+0x14/0x20 [=
nouveau]
[329650.515350]  [&lt;ffffffffa0896f27&gt;] nv50_vm_map+0x157/0x1a0 [nouvea=
u]
[329650.515903]  [&lt;ffffffffa089503d&gt;] nvkm_vm_map_at+0xdd/0x1d0 [nouv=
eau]
[329650.516457]  [&lt;ffffffffa089171b&gt;] nv50_instobj_map+0x1b/0x20 [nou=
veau]
[329650.517006]  [&lt;ffffffffa0891982&gt;] nv50_instobj_boot+0xc2/0x120 [n=
ouveau]
[329650.517558]  [&lt;ffffffffa089189b&gt;] nv50_instobj_acquire+0x4b/0x70 =
[nouveau]
[329650.518919]  [&lt;ffffffffa0890887&gt;] nvkm_instobj_acquire_slow+0x17/=
0x30
[nouveau]
[329650.519458]  [&lt;ffffffffa0890c2f&gt;] nvkm_instobj_new+0x6f/0x180 [no=
uveau]
[329650.519990]  [&lt;ffffffffa08475c4&gt;] nvkm_memory_new+0x44/0x80 [nouv=
eau]
[329650.520536]  [&lt;ffffffffa0895b3f&gt;] nvkm_vm_get+0x15f/0x250 [nouvea=
u]
[329650.521071]  [&lt;ffffffffa08f5a52&gt;] nouveau_bo_vma_add+0x32/0xa0 [n=
ouveau]
[329650.521614]  [&lt;ffffffffa08f3c2a&gt;] ? nouveau_bo_map+0x7a/0xa0 [nou=
veau]
[329650.522134]  [&lt;ffffffffa0906f52&gt;] nouveau_channel_prep+0x1d2/0x290
[nouveau]
[329650.522641]  [&lt;ffffffffa0907067&gt;] nouveau_channel_new+0x57/0x6d0 =
[nouveau]
[329650.523157]  [&lt;ffffffffa0844a2d&gt;] ? nvif_device_init+0x2d/0x30 [n=
ouveau]
[329650.523661]  [&lt;ffffffff811eb0cc&gt;] ? kmem_cache_alloc_trace+0x19c/=
0x1b0
[329650.524193]  [&lt;ffffffffa0906174&gt;]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x330 [nouveau]
[329650.524708]  [&lt;ffffffffa044cb6b&gt;] drm_ioctl+0x21b/0x4c0 [drm]
[329650.525236]  [&lt;ffffffffa0906090&gt;] ? nouveau_abi16_ioctl_setparam+=
0x10/0x10
[nouveau]
[329650.525762]  [&lt;ffffffffa08eee14&gt;] nouveau_drm_ioctl+0x74/0xc0 [no=
uveau]
[329650.526269]  [&lt;ffffffff81225053&gt;] do_vfs_ioctl+0xa3/0x5f0
[329650.526801]  [&lt;ffffffff81230497&gt;] ? __fget+0x77/0xb0
[329650.527324]  [&lt;ffffffff81225619&gt;] SyS_ioctl+0x79/0x90
[329650.527830]  [&lt;ffffffff8160a8b7&gt;] entry_SYSCALL_64_fastpath+0x1a/=
0xa9
[329650.528319] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6=
 89
f8 ef c3 55 48 89 f7 48 c7 c6 91 60 94 81 48 89 e5 e8 54 fe ff ff 5d c3 &lt=
;89&gt; 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[329650.529342] RIP  [&lt;ffffffff8132026e&gt;] iowrite32+0x2e/0x40
[329650.529802]  RSP &lt;ffffc90007427930&gt;
[329650.530242] CR2: ffffc90000cb14e0
[329650.530659] ---[ end trace 9acfa30a808e2e78 ]---



I think that's all the information you want. Please tell me to clarify if y=
ou
need to. And you can for sure ask me to provide more information.

Cheers.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14880605841.f83Cf2CA.3879--

--===============0239947295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0239947295==--
