From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56446] New: BUG: unable to handle kernel paging
 request at ffffc90014e00000
Date: Sat, 27 Oct 2012 01:28:21 +0000
Message-ID: <bug-56446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1534132814=="
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
List-Id: nouveau.vger.kernel.org


--===============1534132814==
Content-Type: multipart/alternative; boundary="1351301301.528a71.4827"; charset="us-ascii"


--1351301301.528a71.4827
Date: Sat, 27 Oct 2012 01:28:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56446

          Priority: medium
            Bug ID: 56446
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: BUG: unable to handle kernel paging request at
                    ffffc90014e00000
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: crrodriguez-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

kernel 3.7 rc2
[ 7128.389874] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.389880] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.389884] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.631253] [TTM] Illegal buffer object size
[ 7128.631570] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.631574] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.631578] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.636579] [TTM] Illegal buffer object size
[ 7128.645639] [TTM] Illegal buffer object size
[ 7128.935968] [TTM] Illegal buffer object size
[ 7128.936289] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.936294] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.936298] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.936318] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.936321] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.936324] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.951170] [TTM] Illegal buffer object size
[ 7128.996795] [TTM] Illegal buffer object size
[ 7129.203803] [TTM] Illegal buffer object size
[ 7129.204119] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.204124] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.204129] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.399713] [TTM] Illegal buffer object size
[ 7129.400079] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.400083] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.400086] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.410508] [TTM] Illegal buffer object size
[ 7129.424629] [TTM] Illegal buffer object size
[ 7129.440342] [TTM] Illegal buffer object size
[ 7129.475361] [TTM] Illegal buffer object size
[ 7129.503061] [TTM] Illegal buffer object size
[ 7129.535349] [TTM] Illegal buffer object size
[ 7129.567626] [TTM] Illegal buffer object size
[ 7129.581636] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.581644] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.581650] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.603116] [TTM] Illegal buffer object size
[ 7129.635219] [TTM] Illegal buffer object size
[ 7129.667951] [TTM] Illegal buffer object size
[ 7129.715924] [TTM] Illegal buffer object size
[ 7129.739727] [TTM] Illegal buffer object size
[ 7129.772155] [TTM] Illegal buffer object size
[ 7129.783012] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.783020] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.783027] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.832034] [TTM] Illegal buffer object size
[ 7129.842310] [TTM] Illegal buffer object size
[ 7129.874579] [TTM] Illegal buffer object size
[ 7129.905804] [TTM] Illegal buffer object size
[ 7129.935865] [TTM] Illegal buffer object size
[ 7129.969233] [TTM] Illegal buffer object size
[ 7129.979331] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.979338] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.979345] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.979371] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.979375] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.979379] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.000775] [TTM] Illegal buffer object size
[ 7130.042005] [TTM] Illegal buffer object size
[ 7130.073292] [TTM] Illegal buffer object size
[ 7130.105027] [TTM] Illegal buffer object size
[ 7130.136884] [TTM] Illegal buffer object size
[ 7130.169432] [TTM] Illegal buffer object size
[ 7130.179352] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.179357] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.179362] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.201237] [TTM] Illegal buffer object size
[ 7130.232432] [TTM] Illegal buffer object size
[ 7130.274709] [TTM] Illegal buffer object size
[ 7130.306349] [TTM] Illegal buffer object size
[ 7130.337423] [TTM] Illegal buffer object size
[ 7130.368562] [TTM] Illegal buffer object size
[ 7130.378273] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.378281] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.378286] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.400011] [TTM] Illegal buffer object size
[ 7130.440816] [TTM] Illegal buffer object size
[ 7130.472711] [TTM] Illegal buffer object size
[ 7130.504873] [TTM] Illegal buffer object size
[ 7130.536337] [TTM] Illegal buffer object size
[ 7130.566568] [TTM] Illegal buffer object size
[ 7130.577303] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.577310] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.577316] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.598763] [TTM] Illegal buffer object size
[ 7130.639895] [TTM] Illegal buffer object size
[ 7130.671640] [TTM] Illegal buffer object size
[ 7130.702404] [TTM] Illegal buffer object size
[ 7130.733289] [TTM] Illegal buffer object size
[ 7130.766135] [TTM] Illegal buffer object size
[ 7130.776082] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.776089] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.776095] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.806964] [TTM] Illegal buffer object size
[ 7130.838359] [TTM] Illegal buffer object size
[ 7130.870563] [TTM] Illegal buffer object size
[ 7130.902404] [TTM] Illegal buffer object size
[ 7130.933490] [TTM] Illegal buffer object size
[ 7130.964764] [TTM] Illegal buffer object size
[ 7130.974709] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.974714] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.974717] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.974735] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.974737] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.974740] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.006355] [TTM] Illegal buffer object size
[ 7131.038170] [TTM] Illegal buffer object size
[ 7131.068580] [TTM] Illegal buffer object size
[ 7131.100583] [TTM] Illegal buffer object size
[ 7131.132387] [TTM] Illegal buffer object size
[ 7131.173197] [TTM] Illegal buffer object size
[ 7131.185090] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.185096] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.185102] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.206409] [TTM] Illegal buffer object size
[ 7131.238211] [TTM] Illegal buffer object size
[ 7131.270139] [TTM] Illegal buffer object size
[ 7131.302776] [TTM] Illegal buffer object size
[ 7131.332698] [TTM] Illegal buffer object size
[ 7131.365580] [TTM] Illegal buffer object size
[ 7131.376731] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.376738] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.376742] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.397365] [TTM] Illegal buffer object size
[ 7131.438766] [TTM] Illegal buffer object size
[ 7131.470387] [TTM] Illegal buffer object size
[ 7131.503430] [TTM] Illegal buffer object size
[ 7131.534117] [TTM] Illegal buffer object size
[ 7131.567420] [TTM] Illegal buffer object size
[ 7131.576474] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.576480] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.576485] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.597587] [TTM] Illegal buffer object size
[ 7131.629870] [TTM] Illegal buffer object size
[ 7131.672777] [TTM] Illegal buffer object size
[ 7131.703552] [TTM] Illegal buffer object size
[ 7131.734947] [TTM] Illegal buffer object size
[ 7131.766949] [TTM] Illegal buffer object size
[ 7131.778021] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.778029] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.778035] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.799922] [TTM] Illegal buffer object size
[ 7131.829937] [TTM] Illegal buffer object size
[ 7131.871782] [TTM] Illegal buffer object size
[ 7131.905220] [TTM] Illegal buffer object size
[ 7131.936440] [TTM] Illegal buffer object size
[ 7131.967802] [TTM] Illegal buffer object size
[ 7131.978178] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.978185] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.978191] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.978212] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.978215] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.978220] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.999918] [TTM] Illegal buffer object size
[ 7132.030923] [TTM] Illegal buffer object size
[ 7132.063468] [TTM] Illegal buffer object size
[ 7132.105137] [TTM] Illegal buffer object size
[ 7132.137913] [TTM] Illegal buffer object size
[ 7132.170595] [TTM] Illegal buffer object size
[ 7132.181425] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7132.181432] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7132.181438] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7132.202772] [TTM] Illegal buffer object size
[ 7132.236098] [TTM] Illegal buffer object size
[ 7132.265019] [TTM] Illegal buffer object size
[ 7132.298587] [TTM] Illegal buffer object size
[ 7132.330312] [TTM] Illegal buffer object size
[ 7132.362123] [TTM] Illegal buffer object size
[ 7132.372609] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7132.372615] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7132.372620] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7132.403861] [TTM] Illegal buffer object size
[ 7132.435414] [TTM] Illegal buffer object size

[12394.823963] BUG: unable to handle kernel paging request at ffffc90014e00000
[12394.823982] IP: [<ffffffff812f8dd0>] iowrite32+0x30/0x40
[12394.823992] PGD 23f024067 PUD 23f025067 PMD 22f04d067 PTE 0
[12394.824001] Oops: 0002 [#1] PREEMPT SMP 
[12394.824008] Modules linked in: des_generic ecb md4 sha256_generic md5
nls_utf8 cifs fscache fuse ufs qnx4 hfsplus hfs minix vfat msdos fat jfs xfs
reiserfs dm_mod af_packet arc4 snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_intel snd_hda_codec snd_hwdep snd_pcm snd_seq ath9k mac80211 iTCO_wdt
iTCO_vendor_support gpio_ich ath9k_common ath9k_hw ath cfg80211 lpc_ich sr_mod
ata_generic cdc_acm snd_timer acpi_cpufreq dcdbas mperf coretemp kvm_intel kvm
serio_raw pcspkr i2c_i801 cdrom usb_storage sg joydev snd_seq_device mfd_core
rfkill pata_jmicron snd r8169 soundcore i7core_edac snd_page_alloc edac_core
microcode btrfs zlib_deflate libcrc32c crc32c_intel nouveau ttm drm_kms_helper
drm i2c_algo_bit mxm_wmi video wmi button processor thermal_sys scsi_dh_rdac
scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_dh autofs4
[12394.824150] CPU 7 
[12394.824154] Pid: 22457, comm: chromium Not tainted 3.7.0-rc2-1-desktop #1
DELL Inc. Studio XPS 435T/9000/0X501H
[12394.824162] RIP: 0010:[<ffffffff812f8dd0>]  [<ffffffff812f8dd0>]
iowrite32+0x30/0x40
[12394.824170] RSP: 0018:ffff88012f92da10  EFLAGS: 00010292
[12394.824175] RAX: ffff8801b88cfec0 RBX: 0000000000000000 RCX:
ffffffffa0156cd0
[12394.824182] RDX: ffffc90014e00000 RSI: ffffc90014e00000 RDI:
0000000000000000
[12394.824188] RBP: ffff8801a031ebc0 R08: ffffffffa0220280 R09:
0000000000000000
[12394.824193] R10: 0000000000000000 R11: 000000000000000f R12:
00000000000bb004
[12394.824198] R13: ffff88022fe73500 R14: ffff88012f92da40 R15:
0000000000000000
[12394.824204] FS:  00007ffa6c7a8980(0000) GS:ffff88023fce0000(0000)
knlGS:0000000000000000
[12394.824210] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[12394.824214] CR2: ffffc90014e00000 CR3: 000000012febf000 CR4:
00000000000007e0
[12394.824220] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[12394.824225] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[12394.824231] Process chromium (pid: 22457, threadinfo ffff88012f92c000, task
ffff8801a88dc500)
[12394.824236] Stack:
[12394.824239]  ffffffffa0153db4 ffffff0000000000 ffffffffa0220080
ffff880230fdca80
[12394.824248]  000000001de88000 ffff8801b88cfec0 0000000000000000
0000000000000000
[12394.824257]  ffff88012f92db90 ffff88012da30018 ffffffffa0220080
ffffffffa02200c0
[12394.824267] Call Trace:
[12394.824284]  [<ffffffffa0153db4>] nouveau_gpuobj_create_+0x1d4/0x2e0
[nouveau]
[12394.824300]  [<ffffffffa0153ef5>] _nouveau_gpuobj_ctor+0x35/0x50 [nouveau]
[12394.824314]  [<ffffffffa0155524>] nouveau_object_ctor+0x34/0xc0 [nouveau]
[12394.824328]  [<ffffffffa0153f58>] nouveau_gpuobj_new+0x48/0x50 [nouveau]
[12394.824344]  [<ffffffffa01716d1>] nouveau_vm_get+0x1a1/0x2d0 [nouveau]
[12394.824387]  [<ffffffffa01c1923>] nouveau_bo_vma_add+0x43/0x100 [nouveau]
[12394.824454]  [<ffffffffa01bbd70>] nouveau_channel_prep+0x250/0x320 [nouveau]
[12394.824516]  [<ffffffffa01bbe73>] nouveau_channel_new+0x33/0x6b0 [nouveau]
[12394.824579]  [<ffffffffa01c42d7>]
nouveau_abi16_ioctl_channel_alloc+0x137/0x330 [nouveau]
[12394.824644]  [<ffffffffa005b18c>] drm_ioctl+0x40c/0x4c0 [drm]
[12394.824655]  [<ffffffff811801af>] do_vfs_ioctl+0x8f/0x530
[12394.824662]  [<ffffffff811806f0>] sys_ioctl+0xa0/0xc0
[12394.824670]  [<ffffffff815c786d>] system_call_fastpath+0x1a/0x1f
[12394.824678]  [<00007ffa66a62677>] 0x7ffa66a62676
[12394.824682] Code: 03 00 48 89 f2 77 24 48 81 fe 00 00 01 00 76 0b 81 e2 ff
ff 00 00 89 f8 ef c3 90 48 c7 c6 df 01 80 81 48 89 d7 e9 51 ff ff ff 90 <89> 3e
c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff 
[12394.824760] RIP  [<ffffffff812f8dd0>] iowrite32+0x30/0x40
[12394.824766]  RSP <ffff88012f92da10>
[12394.824769] CR2: ffffc90014e00000
[12394.837843] ---[ end trace 4077777c66f3e8a2 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351301301.528a71.4827
Date: Sat, 27 Oct 2012 01:28:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: unable to handle kernel paging request at ffffc90014e00000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56446">56446</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: unable to handle kernel paging request at ffffc90014e00000
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>crrodriguez&#64;opensuse.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>kernel 3.7 rc2
[ 7128.389874] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.389880] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.389884] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.631253] [TTM] Illegal buffer object size
[ 7128.631570] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.631574] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.631578] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.636579] [TTM] Illegal buffer object size
[ 7128.645639] [TTM] Illegal buffer object size
[ 7128.935968] [TTM] Illegal buffer object size
[ 7128.936289] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.936294] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.936298] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.936318] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7128.936321] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7128.936324] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7128.951170] [TTM] Illegal buffer object size
[ 7128.996795] [TTM] Illegal buffer object size
[ 7129.203803] [TTM] Illegal buffer object size
[ 7129.204119] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.204124] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.204129] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.399713] [TTM] Illegal buffer object size
[ 7129.400079] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.400083] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.400086] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.410508] [TTM] Illegal buffer object size
[ 7129.424629] [TTM] Illegal buffer object size
[ 7129.440342] [TTM] Illegal buffer object size
[ 7129.475361] [TTM] Illegal buffer object size
[ 7129.503061] [TTM] Illegal buffer object size
[ 7129.535349] [TTM] Illegal buffer object size
[ 7129.567626] [TTM] Illegal buffer object size
[ 7129.581636] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.581644] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.581650] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.603116] [TTM] Illegal buffer object size
[ 7129.635219] [TTM] Illegal buffer object size
[ 7129.667951] [TTM] Illegal buffer object size
[ 7129.715924] [TTM] Illegal buffer object size
[ 7129.739727] [TTM] Illegal buffer object size
[ 7129.772155] [TTM] Illegal buffer object size
[ 7129.783012] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.783020] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.783027] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.832034] [TTM] Illegal buffer object size
[ 7129.842310] [TTM] Illegal buffer object size
[ 7129.874579] [TTM] Illegal buffer object size
[ 7129.905804] [TTM] Illegal buffer object size
[ 7129.935865] [TTM] Illegal buffer object size
[ 7129.969233] [TTM] Illegal buffer object size
[ 7129.979331] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.979338] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.979345] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7129.979371] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7129.979375] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7129.979379] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.000775] [TTM] Illegal buffer object size
[ 7130.042005] [TTM] Illegal buffer object size
[ 7130.073292] [TTM] Illegal buffer object size
[ 7130.105027] [TTM] Illegal buffer object size
[ 7130.136884] [TTM] Illegal buffer object size
[ 7130.169432] [TTM] Illegal buffer object size
[ 7130.179352] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.179357] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.179362] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.201237] [TTM] Illegal buffer object size
[ 7130.232432] [TTM] Illegal buffer object size
[ 7130.274709] [TTM] Illegal buffer object size
[ 7130.306349] [TTM] Illegal buffer object size
[ 7130.337423] [TTM] Illegal buffer object size
[ 7130.368562] [TTM] Illegal buffer object size
[ 7130.378273] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.378281] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.378286] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.400011] [TTM] Illegal buffer object size
[ 7130.440816] [TTM] Illegal buffer object size
[ 7130.472711] [TTM] Illegal buffer object size
[ 7130.504873] [TTM] Illegal buffer object size
[ 7130.536337] [TTM] Illegal buffer object size
[ 7130.566568] [TTM] Illegal buffer object size
[ 7130.577303] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.577310] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.577316] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.598763] [TTM] Illegal buffer object size
[ 7130.639895] [TTM] Illegal buffer object size
[ 7130.671640] [TTM] Illegal buffer object size
[ 7130.702404] [TTM] Illegal buffer object size
[ 7130.733289] [TTM] Illegal buffer object size
[ 7130.766135] [TTM] Illegal buffer object size
[ 7130.776082] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.776089] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.776095] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.806964] [TTM] Illegal buffer object size
[ 7130.838359] [TTM] Illegal buffer object size
[ 7130.870563] [TTM] Illegal buffer object size
[ 7130.902404] [TTM] Illegal buffer object size
[ 7130.933490] [TTM] Illegal buffer object size
[ 7130.964764] [TTM] Illegal buffer object size
[ 7130.974709] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.974714] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.974717] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7130.974735] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7130.974737] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7130.974740] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.006355] [TTM] Illegal buffer object size
[ 7131.038170] [TTM] Illegal buffer object size
[ 7131.068580] [TTM] Illegal buffer object size
[ 7131.100583] [TTM] Illegal buffer object size
[ 7131.132387] [TTM] Illegal buffer object size
[ 7131.173197] [TTM] Illegal buffer object size
[ 7131.185090] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.185096] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.185102] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.206409] [TTM] Illegal buffer object size
[ 7131.238211] [TTM] Illegal buffer object size
[ 7131.270139] [TTM] Illegal buffer object size
[ 7131.302776] [TTM] Illegal buffer object size
[ 7131.332698] [TTM] Illegal buffer object size
[ 7131.365580] [TTM] Illegal buffer object size
[ 7131.376731] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.376738] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.376742] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.397365] [TTM] Illegal buffer object size
[ 7131.438766] [TTM] Illegal buffer object size
[ 7131.470387] [TTM] Illegal buffer object size
[ 7131.503430] [TTM] Illegal buffer object size
[ 7131.534117] [TTM] Illegal buffer object size
[ 7131.567420] [TTM] Illegal buffer object size
[ 7131.576474] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.576480] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.576485] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.597587] [TTM] Illegal buffer object size
[ 7131.629870] [TTM] Illegal buffer object size
[ 7131.672777] [TTM] Illegal buffer object size
[ 7131.703552] [TTM] Illegal buffer object size
[ 7131.734947] [TTM] Illegal buffer object size
[ 7131.766949] [TTM] Illegal buffer object size
[ 7131.778021] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.778029] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.778035] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.799922] [TTM] Illegal buffer object size
[ 7131.829937] [TTM] Illegal buffer object size
[ 7131.871782] [TTM] Illegal buffer object size
[ 7131.905220] [TTM] Illegal buffer object size
[ 7131.936440] [TTM] Illegal buffer object size
[ 7131.967802] [TTM] Illegal buffer object size
[ 7131.978178] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.978185] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.978191] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.978212] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7131.978215] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7131.978220] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7131.999918] [TTM] Illegal buffer object size
[ 7132.030923] [TTM] Illegal buffer object size
[ 7132.063468] [TTM] Illegal buffer object size
[ 7132.105137] [TTM] Illegal buffer object size
[ 7132.137913] [TTM] Illegal buffer object size
[ 7132.170595] [TTM] Illegal buffer object size
[ 7132.181425] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7132.181432] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7132.181438] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7132.202772] [TTM] Illegal buffer object size
[ 7132.236098] [TTM] Illegal buffer object size
[ 7132.265019] [TTM] Illegal buffer object size
[ 7132.298587] [TTM] Illegal buffer object size
[ 7132.330312] [TTM] Illegal buffer object size
[ 7132.362123] [TTM] Illegal buffer object size
[ 7132.372609] nouveau E[  PGRAPH][0000:08:00.0] DATA_ERROR XY_OUT_OF_BOUNDS
[ 7132.372615] nouveau  [  PGRAPH][0000:08:00.0]  DATA_ERROR
[ 7132.372620] nouveau E[  PGRAPH][0000:08:00.0] ch 13 [0x001ecb0000] subc 5
class 0x5039 mthd 0x0328 data 0x00000000
[ 7132.403861] [TTM] Illegal buffer object size
[ 7132.435414] [TTM] Illegal buffer object size

[12394.823963] BUG: unable to handle kernel paging request at ffffc90014e00000
[12394.823982] IP: [&lt;ffffffff812f8dd0&gt;] iowrite32+0x30/0x40
[12394.823992] PGD 23f024067 PUD 23f025067 PMD 22f04d067 PTE 0
[12394.824001] Oops: 0002 [#1] PREEMPT SMP 
[12394.824008] Modules linked in: des_generic ecb md4 sha256_generic md5
nls_utf8 cifs fscache fuse ufs qnx4 hfsplus hfs minix vfat msdos fat jfs xfs
reiserfs dm_mod af_packet arc4 snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_intel snd_hda_codec snd_hwdep snd_pcm snd_seq ath9k mac80211 iTCO_wdt
iTCO_vendor_support gpio_ich ath9k_common ath9k_hw ath cfg80211 lpc_ich sr_mod
ata_generic cdc_acm snd_timer acpi_cpufreq dcdbas mperf coretemp kvm_intel kvm
serio_raw pcspkr i2c_i801 cdrom usb_storage sg joydev snd_seq_device mfd_core
rfkill pata_jmicron snd r8169 soundcore i7core_edac snd_page_alloc edac_core
microcode btrfs zlib_deflate libcrc32c crc32c_intel nouveau ttm drm_kms_helper
drm i2c_algo_bit mxm_wmi video wmi button processor thermal_sys scsi_dh_rdac
scsi_dh_hp_sw scsi_dh_emc scsi_dh_alua scsi_dh autofs4
[12394.824150] CPU 7 
[12394.824154] Pid: 22457, comm: chromium Not tainted 3.7.0-rc2-1-desktop #1
DELL Inc. Studio XPS 435T/9000/0X501H
[12394.824162] RIP: 0010:[&lt;ffffffff812f8dd0&gt;]  [&lt;ffffffff812f8dd0&gt;]
iowrite32+0x30/0x40
[12394.824170] RSP: 0018:ffff88012f92da10  EFLAGS: 00010292
[12394.824175] RAX: ffff8801b88cfec0 RBX: 0000000000000000 RCX:
ffffffffa0156cd0
[12394.824182] RDX: ffffc90014e00000 RSI: ffffc90014e00000 RDI:
0000000000000000
[12394.824188] RBP: ffff8801a031ebc0 R08: ffffffffa0220280 R09:
0000000000000000
[12394.824193] R10: 0000000000000000 R11: 000000000000000f R12:
00000000000bb004
[12394.824198] R13: ffff88022fe73500 R14: ffff88012f92da40 R15:
0000000000000000
[12394.824204] FS:  00007ffa6c7a8980(0000) GS:ffff88023fce0000(0000)
knlGS:0000000000000000
[12394.824210] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[12394.824214] CR2: ffffc90014e00000 CR3: 000000012febf000 CR4:
00000000000007e0
[12394.824220] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[12394.824225] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[12394.824231] Process chromium (pid: 22457, threadinfo ffff88012f92c000, task
ffff8801a88dc500)
[12394.824236] Stack:
[12394.824239]  ffffffffa0153db4 ffffff0000000000 ffffffffa0220080
ffff880230fdca80
[12394.824248]  000000001de88000 ffff8801b88cfec0 0000000000000000
0000000000000000
[12394.824257]  ffff88012f92db90 ffff88012da30018 ffffffffa0220080
ffffffffa02200c0
[12394.824267] Call Trace:
[12394.824284]  [&lt;ffffffffa0153db4&gt;] nouveau_gpuobj_create_+0x1d4/0x2e0
[nouveau]
[12394.824300]  [&lt;ffffffffa0153ef5&gt;] _nouveau_gpuobj_ctor+0x35/0x50 [nouveau]
[12394.824314]  [&lt;ffffffffa0155524&gt;] nouveau_object_ctor+0x34/0xc0 [nouveau]
[12394.824328]  [&lt;ffffffffa0153f58&gt;] nouveau_gpuobj_new+0x48/0x50 [nouveau]
[12394.824344]  [&lt;ffffffffa01716d1&gt;] nouveau_vm_get+0x1a1/0x2d0 [nouveau]
[12394.824387]  [&lt;ffffffffa01c1923&gt;] nouveau_bo_vma_add+0x43/0x100 [nouveau]
[12394.824454]  [&lt;ffffffffa01bbd70&gt;] nouveau_channel_prep+0x250/0x320 [nouveau]
[12394.824516]  [&lt;ffffffffa01bbe73&gt;] nouveau_channel_new+0x33/0x6b0 [nouveau]
[12394.824579]  [&lt;ffffffffa01c42d7&gt;]
nouveau_abi16_ioctl_channel_alloc+0x137/0x330 [nouveau]
[12394.824644]  [&lt;ffffffffa005b18c&gt;] drm_ioctl+0x40c/0x4c0 [drm]
[12394.824655]  [&lt;ffffffff811801af&gt;] do_vfs_ioctl+0x8f/0x530
[12394.824662]  [&lt;ffffffff811806f0&gt;] sys_ioctl+0xa0/0xc0
[12394.824670]  [&lt;ffffffff815c786d&gt;] system_call_fastpath+0x1a/0x1f
[12394.824678]  [&lt;00007ffa66a62677&gt;] 0x7ffa66a62676
[12394.824682] Code: 03 00 48 89 f2 77 24 48 81 fe 00 00 01 00 76 0b 81 e2 ff
ff 00 00 89 f8 ef c3 90 48 c7 c6 df 01 80 81 48 89 d7 e9 51 ff ff ff 90 &lt;89&gt; 3e
c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff 
[12394.824760] RIP  [&lt;ffffffff812f8dd0&gt;] iowrite32+0x30/0x40
[12394.824766]  RSP &lt;ffff88012f92da10&gt;
[12394.824769] CR2: ffffc90014e00000
[12394.837843] ---[ end trace 4077777c66f3e8a2 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351301301.528a71.4827--

--===============1534132814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1534132814==--
