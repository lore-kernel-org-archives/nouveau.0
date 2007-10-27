From: Daniel van Eeden <daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org>
Subject: Oops with Nouveau on amd64 with nv15 card and kernel
	2.6.22	(debian sid)
Date: Sat, 27 Oct 2007 20:38:02 +0200
Message-ID: <1193510282.6740.5.camel@pc1.myname.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

Hello,

I've build drm and nouveau from git and got this error while starting
Xorg.

Another thing is that before the install instructions on the wiki worked
I had to install xorg-dev. This was the error I got before installing
xorg-dev:
./configure: line 20257: syntax error near unexpected token `RANDR,'
./configure: line 20257: `XORG_DRIVER_CHECK_EXT(RANDR, randrproto)'

I'm not on the list so please keep me on CC.

Cheers,

Daniel

The Oops:

[drm] Initialized drm 1.1.0 20060810
[drm] Detected an NV40 generation card (0xa4005101)
[drm] Initialized nouveau 0.0.10 20060213 on minor 0
Unable to handle kernel paging request at 0000000000010000 RIP: 
 [<ffffffff885d3d7c>] :nouveau:nv04_instmem_init+0x67/0x1d3
PGD 5788067 PUD 268ab067 PMD 0 
Oops: 0002 [1] SMP 
CPU 0 
Modules linked in: nouveau drm via_agp udf nls_iso8859_1 nls_cp437 vfat
fat fuse binfmt_misc rfcomm l2cap bluetooth nfsd exportfs ppdev
parport_pc lp parport tun sit tunnel4 battery ipv6 cpufreq_stats
cpufreq_conservative nfs lockd nfs_acl sunrpc dm_snapshot dm_mirror
dm_mod cpufreq_userspace cpufreq_powersave cpufreq_ondemand powernow_k8
freq_table button ac cpuid microcode msr ext3 jbd mbcache w83627hf
hwmon_vid eeprom i2c_isa ide_generic sd_mod bt878 snd_via82xx gameport
snd_ac97_codec ac97_bus snd_pcm_oss snd_mixer_oss snd_pcm snd_page_alloc
snd_mpu401_uart snd_seq_dummy snd_seq_oss tuner snd_seq_midi snd_rawmidi
tvaudio pcspkr tsdev snd_seq_midi_event snd_seq snd_timer snd_seq_device
k8temp i2c_viapro snd soundcore bttv video_buf firmware_class ir_common
compat_ioctl32 i2c_algo_bit btcx_risc tveeprom i2c_core videodev
v4l2_common v4l1_compat shpchp pci_hotplug usb_storage evdev usbhid hid
xfs raid1 md_mod ide_cd cdrom ide_disk ata_generic ehci_hcd uhci_hcd
sata_via libata scsi_mod via82cxxx generic ide_core r8169 thermal
processor fan
Pid: 2896, comm: Xorg Tainted: P       2.6.22-2-amd64 #1
RIP: 0010:[<ffffffff885d3d7c>]
[<ffffffff885d3d7c>] :nouveau:nv04_instmem_init+0x67/0x1d3
RSP: 0018:ffff81001dde7bf8  EFLAGS: 00010202
RAX: 0000000000010000 RBX: 0000000000000000 RCX: ffff810020fe5000
RDX: 0000000000010004 RSI: ffff81000fd1b750 RDI: ffff810021100000
RBP: ffff810020fe5430 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000003246 R12: ffff810020fe5000
R13: ffff810021100000 R14: ffff810021100000 R15: ffff810020fe5000
FS:  00002b6906fdd1e0(0000) GS:ffffffff804e3000(0000)
knlGS:00000000f7d976b0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000010000 CR3: 0000000032c64000 CR4: 00000000000006e0
Process Xorg (pid: 2896, threadinfo ffff81001dde6000, task
ffff81003d9c94f0)
Stack:  ffff810020fe5000 0000000000000000 ffff810020fe5430
0000000000000000
 ffff810020fe5020 ffffffff885ada6b 0000000000200200 ffffffff885ddea0
 ffff810021100000 0000000000006440 ffff81001dde7c88 ffff81002eea5a80
Call Trace:
 [<ffffffff885ada6b>] :nouveau:nouveau_card_init+0x716/0x7f7
 [<ffffffff885adb4c>] :nouveau:nouveau_ioctl_card_init+0x0/0x5
 [<ffffffff88586571>] :drm:drm_unlocked_ioctl+0x19b/0x215
 [<ffffffff88132a44>] :xfs:xfs_iunlock+0x2a/0x79
 [<ffffffff8815968e>] :xfs:xfs_write+0xa32/0xa7c
 [<ffffffff80274325>] __vmalloc_area_node+0x134/0x15c
 [<ffffffff8858cb5e>] :drm:drm_ht_just_insert_please+0x7e/0xb3
 [<ffffffff881556f1>] :xfs:xfs_file_aio_write+0x5a/0x5d
 [<ffffffff80283058>] do_sync_write+0xc9/0x10c
 [<ffffffff8027dc72>] cache_grow+0x1b4/0x207
 [<ffffffff802439c2>] autoremove_wake_function+0x0/0x2e
 [<ffffffff885865eb>] :drm:drm_ioctl+0x0/0x13
 [<ffffffff885865fc>] :drm:drm_ioctl+0x11/0x13
 [<ffffffff8028e599>] do_ioctl+0x9d/0xb6
 [<ffffffff8028e7f5>] vfs_ioctl+0x243/0x25c
 [<ffffffff8028389d>] vfs_write+0x142/0x157
 [<ffffffff8028e867>] sys_ioctl+0x59/0x7a
 [<ffffffff80209d8e>] system_call+0x7e/0x83


Code: c7 00 00 00 00 00 41 39 94 24 48 05 00 00 77 e0 49 8b ad 78 
RIP  [<ffffffff885d3d7c>] :nouveau:nv04_instmem_init+0x67/0x1d3
 RSP <ffff81001dde7bf8>
CR2: 0000000000010000
[drm:drm_release] *ERROR* Device busy: 1 0
