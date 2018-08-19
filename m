From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Sun, 19 Aug 2018 22:56:20 +0000
Message-ID: <bug-105319-8800-nxjZsAAh6l@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2126335875=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2126335875==
Content-Type: multipart/alternative; boundary="15347193802.bc8D68c.6947"
Content-Transfer-Encoding: 7bit


--15347193802.bc8D68c.6947
Date: Sun, 19 Aug 2018 22:56:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #23 from Dominik 'Rathann' Mierzejewski <dominik-IZ6Av6enwRKJQ7yn63+t2w@public.gmane.org=
> ---
Ok, now I got something more interesting. I booted Fedora kernel
4.19.0-0.rc0.git5.1.fc30.x86_64 (commit
1f7a4c73a739a63b3f108d8eda6f947fdc70dd65). I still got a frozen console, but
when Xorg started, the following WARNING appeared in kernel log. Does this =
give
any clues?

[    7.193842] nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
[    7.253541] nouveau 0000:01:00.0: bios: version 62.98.3c.00.44
[    7.301129] nouveau 0000:01:00.0: bios: M0203T not found
[    7.301492] nouveau 0000:01:00.0: bios: M0203E not matched!
[    7.301669] nouveau 0000:01:00.0: fb: 512 MiB DDR2
[    7.719129] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[    7.719498] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    7.719681] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    7.719851] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    7.720014] nouveau 0000:01:00.0: DRM: DCB outp 00: 01011323 00010034
[    7.720182] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000300 00000028
[    7.720387] nouveau 0000:01:00.0: DRM: DCB outp 02: 02022312 00020030
[    7.720567] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000000
[    7.720736] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000140
[    7.720903] nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261
[    7.721066] nouveau 0000:01:00.0: DRM: DCB conn 07: 00000513
[    7.738669] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    7.784149] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[    7.813006] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[    7.828162] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo
(____ptrval____)
[    7.870502] fbcon: nouveaufb (fb0) is primary device
[    7.885068] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[    7.898694] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[    9.902963] nouveau 0000:01:00.0: DRM: core notifier timeout
[   11.903058] nouveau 0000:01:00.0: DRM: base-0: timeout
[   11.908408] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   11.947124] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   11.958855] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[   11.961609] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   11.972641] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   11.978613]  #0: (____ptrval____) (drm_connector_list_iter){.+.+}, at:
nouveau_backlight_init+0x63/0x450 [nouveau]
[   22.205362] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   32.445359] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   42.685355] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   52.925595] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   63.165373] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   73.405363] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   83.645378] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   93.890397] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  104.125363] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  107.020185] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  107.032965] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[  107.074838] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  107.086752] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[  110.113354] nouveau 0000:01:00.0: DRM: core notifier timeout
[  110.634595] ------------[ cut here ]------------
[  110.634608] nouveau 0000:01:00.0: DMA-API: device driver tries to sync D=
MA
memory it has not allocated [device address=3D0x000000010c412000] [size=3D4=
096
bytes]
[  110.634630] WARNING: CPU: 1 PID: 1163 at kernel/dma/debug.c:1230
check_sync+0x136/0x670
[  110.634634] Modules linked in: ip_set nfnetlink ebtable_nat ebtable_brou=
te
ccm bridge stp llc ip6table_nat nf_nat_ipv6 ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c iptable_mangle iptable_raw iptable_security
ebtable_filter ebtables ip6table_filter ip6_tables bnep sunrpc arc4
snd_hda_codec_realtek snd_hda_codec_generic ath9k snd_hda_intel ath9k_common
snd_hda_codec ath9k_hw snd_hda_core uvcvideo btusb snd_hwdep btrtl snd_seq
snd_seq_device btbcm btintel snd_pcm mac80211 videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 ath videobuf2_common cfg80211 videodev media
bluetooth snd_timer snd coretemp ecdh_generic joydev r592 soundcore asus_la=
ptop
memstick sparse_keymap rfkill input_polldev pcc_cpufreq acpi_cpufreq dm_cry=
pt
[  110.634775]  nouveau ata_generic pata_acpi firewire_ohci firewire_core
mxm_wmi wmi i2c_algo_bit drm_kms_helper sdhci_pci cqhci sdhci ttm sis190
serio_raw mmc_core mii crc_itu_t drm sata_sis pata_sis video
[  110.634823] CPU: 1 PID: 1163 Comm: Xorg Not tainted
4.19.0-0.rc0.git5.1.fc30.x86_64 #1
[  110.634827] Hardware name: ASUSTeK Computer Inc.  X71SL               /X=
71SL
    , BIOS 206     11/05/2008
[  110.634832] RIP: 0010:check_sync+0x136/0x670
[  110.634837] Code: 48 85 ed 75 04 48 8b 68 10 48 8b 3c 24 e8 e2 38 56 00 =
48
89 c6 4d 89 e8 4c 89 f9 48 89 ea 48 c7 c7 a8 18 30 b1 e8 ee 77 f6 ff <0f> 0=
b 8b
05 9a 75 85 01 85 c0 0f 84 81 04 00 00 48 83 c4 28 4c 89
[  110.634841] RSP: 0018:ffffb980412c7a10 EFLAGS: 00010082
[  110.634847] RAX: 0000000000000000 RBX: ffffffffb2f33410 RCX:
0000000000000006
[  110.634851] RDX: 0000000000000007 RSI: 0000000000000001 RDI:
ffff9e12fbbd6ba0
[  110.634855] RBP: ffff9e12f9f82ed0 R08: 0000000000000000 R09:
0000000000000001
[  110.634859] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000286
[  110.634863] R13: 0000000000001000 R14: 0000000000010000 R15:
000000010c412000
[  110.634868] FS:  00007fe0441aeac0(0000) GS:ffff9e12fba00000(0000)
knlGS:0000000000000000
[  110.634873] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  110.634877] CR2: 00007fe03c0c8d90 CR3: 0000000114a6e000 CR4:
00000000000006e0
[  110.634881] Call Trace:
[  110.634897]  debug_dma_sync_single_for_device+0x7b/0x90
[  110.634915]  ? ttm_bo_mem_compat+0x23/0x60 [ttm]
[  110.634925]  ? kfree+0x188/0x320
[  110.634932]  ? krealloc+0x25/0xa0
[  110.635040]  nouveau_bo_sync_for_device+0x6a/0xb0 [nouveau]
[  110.635098]  nouveau_bo_validate+0x71/0x90 [nouveau]
[  110.635154]  nouveau_gem_ioctl_pushbuf+0x8a5/0x1ad0 [nouveau]
[  110.635222]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  110.635240]  ? drm_ioctl_kernel+0xa5/0xf0 [drm]
[  110.635240]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  110.635240]  drm_ioctl_kernel+0xa5/0xf0 [drm]
[  110.635240]  drm_ioctl+0x1fc/0x390 [drm]
[  110.635240]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  110.635240]  nouveau_drm_ioctl+0x65/0xc0 [nouveau]
[  110.635240]  do_vfs_ioctl+0xa5/0x6e0
[  110.635240]  ksys_ioctl+0x60/0x90
[  110.635240]  __x64_sys_ioctl+0x16/0x20
[  110.635240]  do_syscall_64+0x60/0x1f0
[  110.635240]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  110.635240] RIP: 0033:0x7fe041422ec7
[  110.635240] Code: 00 00 90 48 8b 05 d9 7f 2c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a9 7f 2c 00 f7 d8 64 89 01 48
[  110.635240] RSP: 002b:00007ffcd424fc68 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  110.635240] RAX: ffffffffffffffda RBX: 0000000000d5ae98 RCX:
00007fe041422ec7
[  110.635240] RDX: 00007ffcd424fcd0 RSI: 00000000c0406481 RDI:
000000000000000e
[  110.635240] RBP: 00007ffcd424fcd0 R08: 0000000000000000 R09:
0000000000d59f20
[  110.635240] R10: 0000000000d6be98 R11: 0000000000000246 R12:
00000000c0406481
[  110.635240] R13: 000000000000000e R14: 0000000000d5a070 R15:
0000000000d59f20
[  110.635240] irq event stamp: 0
[  110.635240] hardirqs last  enabled at (0): [<0000000000000000>]=20=20=20=
=20=20=20=20=20=20=20
(null)
[  110.635240] hardirqs last disabled at (0): [<ffffffffb00bb817>]
copy_process.part.28+0x747/0x1e70
[  110.635240] softirqs last  enabled at (0): [<ffffffffb00bb817>]
copy_process.part.28+0x747/0x1e70
[  110.635240] softirqs last disabled at (0): [<0000000000000000>]=20=20=20=
=20=20=20=20=20=20=20
(null)
[  110.635240] ---[ end trace a1450e59d31d3810 ]---
[  114.365372] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  117.080247] nouveau 0000:01:00.0: DRM: core notifier timeout
[  119.080664] nouveau 0000:01:00.0: DRM: base-0: timeout
[  122.562843] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  122.574617] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[  124.605473] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  134.845626] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  145.085449] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  155.325447] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  165.565443] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  175.805469] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  186.045466] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15347193802.bc8D68c.6947
Date: Sun, 19 Aug 2018 22:56:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dominik&#64;greysector.net" title=3D"Dominik 'Rathann' Mierzejewski &lt;dom=
inik&#64;greysector.net&gt;"> <span class=3D"fn">Dominik 'Rathann' Mierzeje=
wski</span></a>
</span></b>
        <pre>Ok, now I got something more interesting. I booted Fedora kern=
el
4.19.0-0.rc0.git5.1.fc30.x86_64 (commit
1f7a4c73a739a63b3f108d8eda6f947fdc70dd65). I still got a frozen console, but
when Xorg started, the following WARNING appeared in kernel log. Does this =
give
any clues?

[    7.193842] nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
[    7.253541] nouveau 0000:01:00.0: bios: version 62.98.3c.00.44
[    7.301129] nouveau 0000:01:00.0: bios: M0203T not found
[    7.301492] nouveau 0000:01:00.0: bios: M0203E not matched!
[    7.301669] nouveau 0000:01:00.0: fb: 512 MiB DDR2
[    7.719129] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[    7.719498] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    7.719681] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    7.719851] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    7.720014] nouveau 0000:01:00.0: DRM: DCB outp 00: 01011323 00010034
[    7.720182] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000300 00000028
[    7.720387] nouveau 0000:01:00.0: DRM: DCB outp 02: 02022312 00020030
[    7.720567] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000000
[    7.720736] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000140
[    7.720903] nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261
[    7.721066] nouveau 0000:01:00.0: DRM: DCB conn 07: 00000513
[    7.738669] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    7.784149] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[    7.813006] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[    7.828162] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo
(____ptrval____)
[    7.870502] fbcon: nouveaufb (fb0) is primary device
[    7.885068] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[    7.898694] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[    9.902963] nouveau 0000:01:00.0: DRM: core notifier timeout
[   11.903058] nouveau 0000:01:00.0: DRM: base-0: timeout
[   11.908408] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   11.947124] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   11.958855] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[   11.961609] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   11.972641] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   11.978613]  #0: (____ptrval____) (drm_connector_list_iter){.+.+}, at:
nouveau_backlight_init+0x63/0x450 [nouveau]
[   22.205362] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   32.445359] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   42.685355] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   52.925595] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   63.165373] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   73.405363] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   83.645378] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[   93.890397] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  104.125363] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  107.020185] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  107.032965] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[  107.074838] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  107.086752] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[  110.113354] nouveau 0000:01:00.0: DRM: core notifier timeout
[  110.634595] ------------[ cut here ]------------
[  110.634608] nouveau 0000:01:00.0: DMA-API: device driver tries to sync D=
MA
memory it has not allocated [device address=3D0x000000010c412000] [size=3D4=
096
bytes]
[  110.634630] WARNING: CPU: 1 PID: 1163 at kernel/dma/debug.c:1230
check_sync+0x136/0x670
[  110.634634] Modules linked in: ip_set nfnetlink ebtable_nat ebtable_brou=
te
ccm bridge stp llc ip6table_nat nf_nat_ipv6 ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c iptable_mangle iptable_raw iptable_security
ebtable_filter ebtables ip6table_filter ip6_tables bnep sunrpc arc4
snd_hda_codec_realtek snd_hda_codec_generic ath9k snd_hda_intel ath9k_common
snd_hda_codec ath9k_hw snd_hda_core uvcvideo btusb snd_hwdep btrtl snd_seq
snd_seq_device btbcm btintel snd_pcm mac80211 videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 ath videobuf2_common cfg80211 videodev media
bluetooth snd_timer snd coretemp ecdh_generic joydev r592 soundcore asus_la=
ptop
memstick sparse_keymap rfkill input_polldev pcc_cpufreq acpi_cpufreq dm_cry=
pt
[  110.634775]  nouveau ata_generic pata_acpi firewire_ohci firewire_core
mxm_wmi wmi i2c_algo_bit drm_kms_helper sdhci_pci cqhci sdhci ttm sis190
serio_raw mmc_core mii crc_itu_t drm sata_sis pata_sis video
[  110.634823] CPU: 1 PID: 1163 Comm: Xorg Not tainted
4.19.0-0.rc0.git5.1.fc30.x86_64 #1
[  110.634827] Hardware name: ASUSTeK Computer Inc.  X71SL               /X=
71SL
    , BIOS 206     11/05/2008
[  110.634832] RIP: 0010:check_sync+0x136/0x670
[  110.634837] Code: 48 85 ed 75 04 48 8b 68 10 48 8b 3c 24 e8 e2 38 56 00 =
48
89 c6 4d 89 e8 4c 89 f9 48 89 ea 48 c7 c7 a8 18 30 b1 e8 ee 77 f6 ff &lt;0f=
&gt; 0b 8b
05 9a 75 85 01 85 c0 0f 84 81 04 00 00 48 83 c4 28 4c 89
[  110.634841] RSP: 0018:ffffb980412c7a10 EFLAGS: 00010082
[  110.634847] RAX: 0000000000000000 RBX: ffffffffb2f33410 RCX:
0000000000000006
[  110.634851] RDX: 0000000000000007 RSI: 0000000000000001 RDI:
ffff9e12fbbd6ba0
[  110.634855] RBP: ffff9e12f9f82ed0 R08: 0000000000000000 R09:
0000000000000001
[  110.634859] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000286
[  110.634863] R13: 0000000000001000 R14: 0000000000010000 R15:
000000010c412000
[  110.634868] FS:  00007fe0441aeac0(0000) GS:ffff9e12fba00000(0000)
knlGS:0000000000000000
[  110.634873] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  110.634877] CR2: 00007fe03c0c8d90 CR3: 0000000114a6e000 CR4:
00000000000006e0
[  110.634881] Call Trace:
[  110.634897]  debug_dma_sync_single_for_device+0x7b/0x90
[  110.634915]  ? ttm_bo_mem_compat+0x23/0x60 [ttm]
[  110.634925]  ? kfree+0x188/0x320
[  110.634932]  ? krealloc+0x25/0xa0
[  110.635040]  nouveau_bo_sync_for_device+0x6a/0xb0 [nouveau]
[  110.635098]  nouveau_bo_validate+0x71/0x90 [nouveau]
[  110.635154]  nouveau_gem_ioctl_pushbuf+0x8a5/0x1ad0 [nouveau]
[  110.635222]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  110.635240]  ? drm_ioctl_kernel+0xa5/0xf0 [drm]
[  110.635240]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  110.635240]  drm_ioctl_kernel+0xa5/0xf0 [drm]
[  110.635240]  drm_ioctl+0x1fc/0x390 [drm]
[  110.635240]  ? nouveau_gem_ioctl_new+0xe0/0xe0 [nouveau]
[  110.635240]  nouveau_drm_ioctl+0x65/0xc0 [nouveau]
[  110.635240]  do_vfs_ioctl+0xa5/0x6e0
[  110.635240]  ksys_ioctl+0x60/0x90
[  110.635240]  __x64_sys_ioctl+0x16/0x20
[  110.635240]  do_syscall_64+0x60/0x1f0
[  110.635240]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  110.635240] RIP: 0033:0x7fe041422ec7
[  110.635240] Code: 00 00 90 48 8b 05 d9 7f 2c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d a9 7f 2c 00 f7 d8 64 89 01 48
[  110.635240] RSP: 002b:00007ffcd424fc68 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  110.635240] RAX: ffffffffffffffda RBX: 0000000000d5ae98 RCX:
00007fe041422ec7
[  110.635240] RDX: 00007ffcd424fcd0 RSI: 00000000c0406481 RDI:
000000000000000e
[  110.635240] RBP: 00007ffcd424fcd0 R08: 0000000000000000 R09:
0000000000d59f20
[  110.635240] R10: 0000000000d6be98 R11: 0000000000000246 R12:
00000000c0406481
[  110.635240] R13: 000000000000000e R14: 0000000000d5a070 R15:
0000000000d59f20
[  110.635240] irq event stamp: 0
[  110.635240] hardirqs last  enabled at (0): [&lt;0000000000000000&gt;]=20=
=20=20=20=20=20=20=20=20=20
(null)
[  110.635240] hardirqs last disabled at (0): [&lt;ffffffffb00bb817&gt;]
copy_process.part.28+0x747/0x1e70
[  110.635240] softirqs last  enabled at (0): [&lt;ffffffffb00bb817&gt;]
copy_process.part.28+0x747/0x1e70
[  110.635240] softirqs last disabled at (0): [&lt;0000000000000000&gt;]=20=
=20=20=20=20=20=20=20=20=20
(null)
[  110.635240] ---[ end trace a1450e59d31d3810 ]---
[  114.365372] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  117.080247] nouveau 0000:01:00.0: DRM: core notifier timeout
[  119.080664] nouveau 0000:01:00.0: DRM: base-0: timeout
[  122.562843] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  122.574617] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for
HDMI-A-1
[  124.605473] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  134.845626] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  145.085449] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  155.325447] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  165.565443] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  175.805469] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1
[  186.045466] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for VG=
A-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15347193802.bc8D68c.6947--

--===============2126335875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2126335875==--
