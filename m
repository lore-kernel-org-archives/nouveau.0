From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101573] New: GP107 crash with no HDMI connected on
	4.12.rc6
Date: Sat, 24 Jun 2017 05:14:08 +0000
Message-ID: <bug-101573-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1450961563=="
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


--===============1450961563==
Content-Type: multipart/alternative; boundary="14982812480.Ec54ED67F.5708";
 charset="UTF-8"


--14982812480.Ec54ED67F.5708
Date: Sat, 24 Jun 2017 05:14:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101573

            Bug ID: 101573
           Summary: GP107 crash with no HDMI connected on 4.12.rc6
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: harry_x-ZOxssm6ufFDtwjQa/ONI9g@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When starting the machine on Dell Inspiron 7000 (Kabylake, GTX 1050 Ti) with
HDMI monitor connected (HDMI output is provided by NVIDIA card, eDP is
connected to internal), everything seems to work (using reverse prime that =
is
automatically setup). There is lot of tearing, but it works.

But when starting the machine without HDMI output connected (so the NVIDIA =
card
has no connected output), it fails with timeouts:

=C4=8Den 23 22:11:03 blackgate kernel: nouveau 0000:01:00.0: DRM: resuming =
object
tree...
=C4=8Den 23 22:11:03 blackgate kernel: nouveau 0000:01:00.0: bus: MMIO read=
 of
00000000 FAULT at 409800 [ TIMEOUT ]
=C4=8Den 23 22:11:05 blackgate kernel: nouveau 0000:01:00.0: timeout
=C4=8Den 23 22:11:05 blackgate kernel: ------------[ cut here ]------------
=C4=8Den 23 22:11:05 blackgate kernel: WARNING: CPU: 6 PID: 138 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1501
gf100_gr_init_ctxctl+0x81f/0x9a0 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel: Modules linked in: xt_nat veth xfs
ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink xfrm_u=
ser
xfrm_algo xt_addrtype br_netfilter bridge stp llc tun dm_thin_pool
dm_persistent_data dm_bi
o_prison dm_bufio loop ecryptfs cbc encrypted_keys trusted ctr ccm cmac rfc=
omm
pci_stub vboxpci(O) xt_tcpudp iptable_filter iptable_nat nf_conntrack_ipv6
nf_conntrack_ipv4 nf_defrag_ipv4 nf_defrag_ipv6 nf_nat_ipv4 xt_conntrack nf=
_nat
nf_co
nntrack ip6table_filter ip6_tables libcrc32c crc32c_generic bnep joydev
mousedev uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
hid_multitouch videobuf2_core videodev btusb btrtl media fuse
snd_hda_codec_realtek snd_hda_codec_g
eneric arc4 iTCO_wdt iTCO_vendor_support nls_iso8859_1 nls_cp437 vfat fat
i2c_designware_platform iwlmvm i2c_designware_core
=C4=8Den 23 22:11:05 blackgate kernel:  dell_wmi mac80211 dell_laptop dell_=
smbios
dcdbas intel_rapl dell_smm_hwmon x86_pkg_temp_thermal intel_powerclamp core=
temp
kvm_intel kvm iwlwifi irqbypass crct10dif_pclmul snd_hda_intel cfg80211
r8168(O) g
hash_clmulni_intel snd_hda_codec intel_cstate intel_rapl_perf snd_hda_core
psmouse snd_hwdep hci_uart input_leds snd_pcm btbcm idma64 btqca mei_me
snd_timer btintel i2c_hid processor_thermal_device snd i2c_i801 mei soundco=
re
intel_lpss_pci
 intel_pch_thermal bluetooth shpchp intel_soc_dts_iosf thermal hid battery
int3403_thermal ecdh_generic tpm_crb rfkill intel_lpss_acpi intel_lpss
int3402_thermal int340x_thermal_zone evdev intel_hid mac_hid int3400_thermal
acpi_als sparse_
keymap tpm_tis acpi_thermal_rel kfifo_buf ac tpm_tis_core industrialio acpi=
_pad
tpm sch_fq_codel msr vboxnetadp(O)
=C4=8Den 23 22:11:05 blackgate kernel:  vboxnetflt(O) vboxdrv(O) i2c_dev sg
ip_tables x_tables sd_mod ext4 crc16 jbd2 fscrypto mbcache dm_mod dax serio=
_raw
atkbd libps2 crc32_pclmul crc32c_intel aesni_intel aes_x86_64 crypto_simd
cryptd glue_he
lper ahci libahci nouveau(-) libata led_class mxm_wmi scsi_mod xhci_pci ttm
i8042 serio wmi i915 video button intel_gtt i2c_algo_bit drm_kms_helper
syscopyarea sysfillrect sysimgblt fb_sys_fops drm xhci_hcd usbcore usb_comm=
on
nvme nvme_cor
e
=C4=8Den 23 22:11:05 blackgate kernel: CPU: 6 PID: 138 Comm: kworker/6:2 Ta=
inted: G=20
         O    4.12.0-rc6-mainline #1
=C4=8Den 23 22:11:05 blackgate kernel: Hardware name: Dell Inc. Inspiron 15=
 7000
Gaming/065C71, BIOS 01.00.05 03/01/2017
=C4=8Den 23 22:11:05 blackgate kernel: Workqueue: pm pm_runtime_work
=C4=8Den 23 22:11:05 blackgate kernel: task: ffff88085a909d80 task.stack:
ffffc90003abc000
=C4=8Den 23 22:11:05 blackgate kernel: RIP: 0010:gf100_gr_init_ctxctl+0x81f=
/0x9a0
[nouveau]
=C4=8Den 23 22:11:05 blackgate kernel: RSP: 0018:ffffc90003abfa08 EFLAGS: 0=
0010286
=C4=8Den 23 22:11:05 blackgate kernel: RAX: 000000000000001d RBX: ffff88085=
aa2f830
RCX: 0000000000000000
=C4=8Den 23 22:11:05 blackgate kernel: RDX: 0000000000000000 RSI: ffff88087=
f58dcc8
RDI: ffff88087f58dcc8
=C4=8Den 23 22:11:05 blackgate kernel: RBP: ffffc90003abfa38 R08: 000000000=
00003e2
R09: 0000000000000004
=C4=8Den 23 22:11:05 blackgate kernel: R10: ffffc90003abf8a8 R11: 000000000=
0000001
R12: ffff880851cd0000
=C4=8Den 23 22:11:05 blackgate kernel: R13: 0000000077363ba0 R14: ffff88085=
26ddba0
R15: 0000001cebd02520
=C4=8Den 23 22:11:05 blackgate kernel: FS:  0000000000000000(0000)
GS:ffff88087f580000(0000) knlGS:0000000000000000
=C4=8Den 23 22:11:05 blackgate kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
=C4=8Den 23 22:11:05 blackgate kernel: CR2: 000000000232146c CR3: 000000000=
1a09000
CR4: 00000000003406e0
=C4=8Den 23 22:11:05 blackgate kernel: Call Trace:
=C4=8Den 23 22:11:05 blackgate kernel:  gp100_gr_init+0x6f0/0x720 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel:  gf100_gr_init_+0x55/0x60 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_gr_init+0x17/0x20 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_engine_init+0x68/0x1f0 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_subdev_init+0xb0/0x200 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_device_init+0x13c/0x270 [nouve=
au]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_udevice_init+0x48/0x60 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_object_init+0x3f/0x190 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_object_init+0xa3/0x190 [nouvea=
u]


The stack trace is different every time, for example:
=C4=8Den 23 22:11:07 blackgate kernel: nouveau 0000:01:00.0: timeout
=C4=8Den 23 22:11:07 blackgate kernel: ------------[ cut here ]------------
=C4=8Den 23 22:11:07 blackgate kernel: WARNING: CPU: 6 PID: 138 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1ab/0x=
1c0
[nouveau]
=C4=8Den 23 22:11:07 blackgate kernel: Modules linked in: xt_nat veth xfs
ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink xfrm_u=
ser
xfrm_algo xt_addrtype br_netfilter bridge stp llc tun dm_thin_pool
dm_persistent_data dm_bio_prison dm_bufio loop ecryptfs cbc encrypted_keys
trusted ctr ccm cmac rfcomm pci_stub vboxpci(O) xt_tcpudp iptable_filter
iptable_nat nf_conntrack_ipv6 nf_conntrack_ipv4 nf_defrag_ipv4 nf_defrag_ip=
v6
nf_nat_ipv4 xt_conntrack nf_nat nf_conntrack ip6table_filter ip6_tables
libcrc32c crc32c_generic bnep joydev mousedev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 hid_multitouch videobuf2_core videodev btusb
btrtl media fuse snd_hda_codec_realtek snd_hda_codec_generic arc4 iTCO_wdt
iTCO_vendor_support nls_iso8859_1 nls_cp437 vfat fat i2c_designware_platform
iwlmvm i2c_designware_core
=C4=8Den 23 22:11:07 blackgate kernel:  dell_wmi mac80211 dell_laptop dell_=
smbios
dcdbas intel_rapl dell_smm_hwmon x86_pkg_temp_thermal intel_powerclamp core=
temp
kvm_intel kvm iwlwifi irqbypass crct10dif_pclmul snd_hda_intel cfg80211
r8168(O) ghash_clmulni_intel snd_hda_codec intel_cstate intel_rapl_perf
snd_hda_core psmouse snd_hwdep hci_uart input_leds snd_pcm btbcm idma64 btq=
ca
mei_me snd_timer btintel i2c_hid processor_thermal_device snd i2c_i801 mei
soundcore intel_lpss_pci intel_pch_thermal bluetooth shpchp intel_soc_dts_i=
osf
thermal hid battery int3403_thermal ecdh_generic tpm_crb rfkill intel_lpss_=
acpi
intel_lpss int3402_thermal int340x_thermal_zone evdev intel_hid mac_hid
int3400_thermal acpi_als sparse_keymap tpm_tis acpi_thermal_rel kfifo_buf ac
tpm_tis_core industrialio acpi_pad tpm sch_fq_codel msr vboxnetadp(O)
=C4=8Den 23 22:11:07 blackgate kernel:  vboxnetflt(O) vboxdrv(O) i2c_dev sg
ip_tables x_tables sd_mod ext4 crc16 jbd2 fscrypto mbcache dm_mod dax serio=
_raw
atkbd libps2 crc32_pclmul crc32c_intel aesni_intel aes_x86_64 crypto_simd
cryptd glue_helper ahci libahci nouveau(-) libata led_class mxm_wmi scsi_mod
xhci_pci ttm i8042 serio wmi i915 video button intel_gtt i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm xhci_hcd
usbcore usb_common nvme nvme_core
=C4=8Den 23 22:11:07 blackgate kernel: CPU: 6 PID: 138 Comm: kworker/6:2 Ta=
inted: G=20
      W  O    4.12.0-rc6-mainline #1
=C4=8Den 23 22:11:07 blackgate kernel: Hardware name: Dell Inc. Inspiron 15=
 7000
Gaming/065C71, BIOS 01.00.05 03/01/2017
=C4=8Den 23 22:11:07 blackgate kernel: Workqueue: pm pm_runtime_work
=C4=8Den 23 22:11:07 blackgate kernel: task: ffff88085a909d80 task.stack:
ffffc90003abc000
=C4=8Den 23 22:11:07 blackgate kernel: RIP: 0010:gf100_vm_flush+0x1ab/0x1c0
[nouveau]
=C4=8Den 23 22:11:07 blackgate kernel: RSP: 0018:ffffc90003abf7e8 EFLAGS: 0=
0010282
=C4=8Den 23 22:11:07 blackgate kernel: RAX: 000000000000001d RBX: ffff88085=
aa2f830
RCX: 0000000000000000
=C4=8Den 23 22:11:07 blackgate kernel: RDX: 0000000000000000 RSI: ffff88087=
f58dcc8
RDI: ffff88087f58dcc8
=C4=8Den 23 22:11:07 blackgate kernel: RBP: ffffc90003abf828 R08: 000000000=
0000415
R09: 0000000000000004
=C4=8Den 23 22:11:07 blackgate kernel: R10: ffffffffa05be080 R11: 000000000=
0000001
R12: ffff880853d72c00
=C4=8Den 23 22:11:07 blackgate kernel: R13: ffff8808526ddba0 R14: ffff88085=
ae2f420
R15: 0000001d6343fb00
=C4=8Den 23 22:11:07 blackgate kernel: FS:  0000000000000000(0000)
GS:ffff88087f580000(0000) knlGS:0000000000000000
=C4=8Den 23 22:11:07 blackgate kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
=C4=8Den 23 22:11:07 blackgate kernel: CR2: 000000000232146c CR3: 000000000=
1a09000
CR4: 00000000003406e0
=C4=8Den 23 22:11:07 blackgate kernel: Call Trace:
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_vm_map_at+0x189/0x1a0 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nv50_instobj_map+0x1b/0x20 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nv50_instobj_boot+0x89/0x100 [nouve=
au]
=C4=8Den 23 22:11:07 blackgate kernel:  nv50_instobj_acquire+0x4b/0x70 [nou=
veau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_instobj_new+0x6e/0x180 [nouvea=
u]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_memory_new+0x44/0x80 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_vm_get+0x14a/0x240 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_gpuobj_map+0x33/0x60 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  gm200_secboot_run_blob+0x8d/0x180 [=
nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  ? flush_work+0x3f/0x1b0
=C4=8Den 23 22:11:07 blackgate kernel:  gp102_secboot_run_blob+0x1d9/0x2e0 =
[nouveau]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14982812480.Ec54ED67F.5708
Date: Sat, 24 Jun 2017 05:14:08 +0000
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
   title=3D"NEW - GP107 crash with no HDMI connected on 4.12.rc6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101573">101573</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GP107 crash with no HDMI connected on 4.12.rc6
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>harry_x&#64;babylon5.cz
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When starting the machine on Dell Inspiron 7000 (Kabylake, GTX=
 1050 Ti) with
HDMI monitor connected (HDMI output is provided by NVIDIA card, eDP is
connected to internal), everything seems to work (using reverse prime that =
is
automatically setup). There is lot of tearing, but it works.

But when starting the machine without HDMI output connected (so the NVIDIA =
card
has no connected output), it fails with timeouts:

=C4=8Den 23 22:11:03 blackgate kernel: nouveau 0000:01:00.0: DRM: resuming =
object
tree...
=C4=8Den 23 22:11:03 blackgate kernel: nouveau 0000:01:00.0: bus: MMIO read=
 of
00000000 FAULT at 409800 [ TIMEOUT ]
=C4=8Den 23 22:11:05 blackgate kernel: nouveau 0000:01:00.0: timeout
=C4=8Den 23 22:11:05 blackgate kernel: ------------[ cut here ]------------
=C4=8Den 23 22:11:05 blackgate kernel: WARNING: CPU: 6 PID: 138 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1501
gf100_gr_init_ctxctl+0x81f/0x9a0 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel: Modules linked in: xt_nat veth xfs
ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink xfrm_u=
ser
xfrm_algo xt_addrtype br_netfilter bridge stp llc tun dm_thin_pool
dm_persistent_data dm_bi
o_prison dm_bufio loop ecryptfs cbc encrypted_keys trusted ctr ccm cmac rfc=
omm
pci_stub vboxpci(O) xt_tcpudp iptable_filter iptable_nat nf_conntrack_ipv6
nf_conntrack_ipv4 nf_defrag_ipv4 nf_defrag_ipv6 nf_nat_ipv4 xt_conntrack nf=
_nat
nf_co
nntrack ip6table_filter ip6_tables libcrc32c crc32c_generic bnep joydev
mousedev uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
hid_multitouch videobuf2_core videodev btusb btrtl media fuse
snd_hda_codec_realtek snd_hda_codec_g
eneric arc4 iTCO_wdt iTCO_vendor_support nls_iso8859_1 nls_cp437 vfat fat
i2c_designware_platform iwlmvm i2c_designware_core
=C4=8Den 23 22:11:05 blackgate kernel:  dell_wmi mac80211 dell_laptop dell_=
smbios
dcdbas intel_rapl dell_smm_hwmon x86_pkg_temp_thermal intel_powerclamp core=
temp
kvm_intel kvm iwlwifi irqbypass crct10dif_pclmul snd_hda_intel cfg80211
r8168(O) g
hash_clmulni_intel snd_hda_codec intel_cstate intel_rapl_perf snd_hda_core
psmouse snd_hwdep hci_uart input_leds snd_pcm btbcm idma64 btqca mei_me
snd_timer btintel i2c_hid processor_thermal_device snd i2c_i801 mei soundco=
re
intel_lpss_pci
 intel_pch_thermal bluetooth shpchp intel_soc_dts_iosf thermal hid battery
int3403_thermal ecdh_generic tpm_crb rfkill intel_lpss_acpi intel_lpss
int3402_thermal int340x_thermal_zone evdev intel_hid mac_hid int3400_thermal
acpi_als sparse_
keymap tpm_tis acpi_thermal_rel kfifo_buf ac tpm_tis_core industrialio acpi=
_pad
tpm sch_fq_codel msr vboxnetadp(O)
=C4=8Den 23 22:11:05 blackgate kernel:  vboxnetflt(O) vboxdrv(O) i2c_dev sg
ip_tables x_tables sd_mod ext4 crc16 jbd2 fscrypto mbcache dm_mod dax serio=
_raw
atkbd libps2 crc32_pclmul crc32c_intel aesni_intel aes_x86_64 crypto_simd
cryptd glue_he
lper ahci libahci nouveau(-) libata led_class mxm_wmi scsi_mod xhci_pci ttm
i8042 serio wmi i915 video button intel_gtt i2c_algo_bit drm_kms_helper
syscopyarea sysfillrect sysimgblt fb_sys_fops drm xhci_hcd usbcore usb_comm=
on
nvme nvme_cor
e
=C4=8Den 23 22:11:05 blackgate kernel: CPU: 6 PID: 138 Comm: kworker/6:2 Ta=
inted: G=20
         O    4.12.0-rc6-mainline #1
=C4=8Den 23 22:11:05 blackgate kernel: Hardware name: Dell Inc. Inspiron 15=
 7000
Gaming/065C71, BIOS 01.00.05 03/01/2017
=C4=8Den 23 22:11:05 blackgate kernel: Workqueue: pm pm_runtime_work
=C4=8Den 23 22:11:05 blackgate kernel: task: ffff88085a909d80 task.stack:
ffffc90003abc000
=C4=8Den 23 22:11:05 blackgate kernel: RIP: 0010:gf100_gr_init_ctxctl+0x81f=
/0x9a0
[nouveau]
=C4=8Den 23 22:11:05 blackgate kernel: RSP: 0018:ffffc90003abfa08 EFLAGS: 0=
0010286
=C4=8Den 23 22:11:05 blackgate kernel: RAX: 000000000000001d RBX: ffff88085=
aa2f830
RCX: 0000000000000000
=C4=8Den 23 22:11:05 blackgate kernel: RDX: 0000000000000000 RSI: ffff88087=
f58dcc8
RDI: ffff88087f58dcc8
=C4=8Den 23 22:11:05 blackgate kernel: RBP: ffffc90003abfa38 R08: 000000000=
00003e2
R09: 0000000000000004
=C4=8Den 23 22:11:05 blackgate kernel: R10: ffffc90003abf8a8 R11: 000000000=
0000001
R12: ffff880851cd0000
=C4=8Den 23 22:11:05 blackgate kernel: R13: 0000000077363ba0 R14: ffff88085=
26ddba0
R15: 0000001cebd02520
=C4=8Den 23 22:11:05 blackgate kernel: FS:  0000000000000000(0000)
GS:ffff88087f580000(0000) knlGS:0000000000000000
=C4=8Den 23 22:11:05 blackgate kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
=C4=8Den 23 22:11:05 blackgate kernel: CR2: 000000000232146c CR3: 000000000=
1a09000
CR4: 00000000003406e0
=C4=8Den 23 22:11:05 blackgate kernel: Call Trace:
=C4=8Den 23 22:11:05 blackgate kernel:  gp100_gr_init+0x6f0/0x720 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel:  gf100_gr_init_+0x55/0x60 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_gr_init+0x17/0x20 [nouveau]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_engine_init+0x68/0x1f0 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_subdev_init+0xb0/0x200 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_device_init+0x13c/0x270 [nouve=
au]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_udevice_init+0x48/0x60 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_object_init+0x3f/0x190 [nouvea=
u]
=C4=8Den 23 22:11:05 blackgate kernel:  nvkm_object_init+0xa3/0x190 [nouvea=
u]


The stack trace is different every time, for example:
=C4=8Den 23 22:11:07 blackgate kernel: nouveau 0000:01:00.0: timeout
=C4=8Den 23 22:11:07 blackgate kernel: ------------[ cut here ]------------
=C4=8Den 23 22:11:07 blackgate kernel: WARNING: CPU: 6 PID: 138 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1ab/0x=
1c0
[nouveau]
=C4=8Den 23 22:11:07 blackgate kernel: Modules linked in: xt_nat veth xfs
ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink xfrm_u=
ser
xfrm_algo xt_addrtype br_netfilter bridge stp llc tun dm_thin_pool
dm_persistent_data dm_bio_prison dm_bufio loop ecryptfs cbc encrypted_keys
trusted ctr ccm cmac rfcomm pci_stub vboxpci(O) xt_tcpudp iptable_filter
iptable_nat nf_conntrack_ipv6 nf_conntrack_ipv4 nf_defrag_ipv4 nf_defrag_ip=
v6
nf_nat_ipv4 xt_conntrack nf_nat nf_conntrack ip6table_filter ip6_tables
libcrc32c crc32c_generic bnep joydev mousedev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 hid_multitouch videobuf2_core videodev btusb
btrtl media fuse snd_hda_codec_realtek snd_hda_codec_generic arc4 iTCO_wdt
iTCO_vendor_support nls_iso8859_1 nls_cp437 vfat fat i2c_designware_platform
iwlmvm i2c_designware_core
=C4=8Den 23 22:11:07 blackgate kernel:  dell_wmi mac80211 dell_laptop dell_=
smbios
dcdbas intel_rapl dell_smm_hwmon x86_pkg_temp_thermal intel_powerclamp core=
temp
kvm_intel kvm iwlwifi irqbypass crct10dif_pclmul snd_hda_intel cfg80211
r8168(O) ghash_clmulni_intel snd_hda_codec intel_cstate intel_rapl_perf
snd_hda_core psmouse snd_hwdep hci_uart input_leds snd_pcm btbcm idma64 btq=
ca
mei_me snd_timer btintel i2c_hid processor_thermal_device snd i2c_i801 mei
soundcore intel_lpss_pci intel_pch_thermal bluetooth shpchp intel_soc_dts_i=
osf
thermal hid battery int3403_thermal ecdh_generic tpm_crb rfkill intel_lpss_=
acpi
intel_lpss int3402_thermal int340x_thermal_zone evdev intel_hid mac_hid
int3400_thermal acpi_als sparse_keymap tpm_tis acpi_thermal_rel kfifo_buf ac
tpm_tis_core industrialio acpi_pad tpm sch_fq_codel msr vboxnetadp(O)
=C4=8Den 23 22:11:07 blackgate kernel:  vboxnetflt(O) vboxdrv(O) i2c_dev sg
ip_tables x_tables sd_mod ext4 crc16 jbd2 fscrypto mbcache dm_mod dax serio=
_raw
atkbd libps2 crc32_pclmul crc32c_intel aesni_intel aes_x86_64 crypto_simd
cryptd glue_helper ahci libahci nouveau(-) libata led_class mxm_wmi scsi_mod
xhci_pci ttm i8042 serio wmi i915 video button intel_gtt i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm xhci_hcd
usbcore usb_common nvme nvme_core
=C4=8Den 23 22:11:07 blackgate kernel: CPU: 6 PID: 138 Comm: kworker/6:2 Ta=
inted: G=20
      W  O    4.12.0-rc6-mainline #1
=C4=8Den 23 22:11:07 blackgate kernel: Hardware name: Dell Inc. Inspiron 15=
 7000
Gaming/065C71, BIOS 01.00.05 03/01/2017
=C4=8Den 23 22:11:07 blackgate kernel: Workqueue: pm pm_runtime_work
=C4=8Den 23 22:11:07 blackgate kernel: task: ffff88085a909d80 task.stack:
ffffc90003abc000
=C4=8Den 23 22:11:07 blackgate kernel: RIP: 0010:gf100_vm_flush+0x1ab/0x1c0
[nouveau]
=C4=8Den 23 22:11:07 blackgate kernel: RSP: 0018:ffffc90003abf7e8 EFLAGS: 0=
0010282
=C4=8Den 23 22:11:07 blackgate kernel: RAX: 000000000000001d RBX: ffff88085=
aa2f830
RCX: 0000000000000000
=C4=8Den 23 22:11:07 blackgate kernel: RDX: 0000000000000000 RSI: ffff88087=
f58dcc8
RDI: ffff88087f58dcc8
=C4=8Den 23 22:11:07 blackgate kernel: RBP: ffffc90003abf828 R08: 000000000=
0000415
R09: 0000000000000004
=C4=8Den 23 22:11:07 blackgate kernel: R10: ffffffffa05be080 R11: 000000000=
0000001
R12: ffff880853d72c00
=C4=8Den 23 22:11:07 blackgate kernel: R13: ffff8808526ddba0 R14: ffff88085=
ae2f420
R15: 0000001d6343fb00
=C4=8Den 23 22:11:07 blackgate kernel: FS:  0000000000000000(0000)
GS:ffff88087f580000(0000) knlGS:0000000000000000
=C4=8Den 23 22:11:07 blackgate kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
=C4=8Den 23 22:11:07 blackgate kernel: CR2: 000000000232146c CR3: 000000000=
1a09000
CR4: 00000000003406e0
=C4=8Den 23 22:11:07 blackgate kernel: Call Trace:
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_vm_map_at+0x189/0x1a0 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nv50_instobj_map+0x1b/0x20 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nv50_instobj_boot+0x89/0x100 [nouve=
au]
=C4=8Den 23 22:11:07 blackgate kernel:  nv50_instobj_acquire+0x4b/0x70 [nou=
veau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_instobj_new+0x6e/0x180 [nouvea=
u]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_memory_new+0x44/0x80 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_vm_get+0x14a/0x240 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  nvkm_gpuobj_map+0x33/0x60 [nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  gm200_secboot_run_blob+0x8d/0x180 [=
nouveau]
=C4=8Den 23 22:11:07 blackgate kernel:  ? flush_work+0x3f/0x1b0
=C4=8Den 23 22:11:07 blackgate kernel:  gp102_secboot_run_blob+0x1d9/0x2e0 =
[nouveau]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14982812480.Ec54ED67F.5708--

--===============1450961563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1450961563==--
