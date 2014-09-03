From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83443] New: Nouveau cras
Date: Wed, 03 Sep 2014 15:15:00 +0000
Message-ID: <bug-83443-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1463118173=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1463118173==
Content-Type: multipart/alternative; boundary="1409757300.Ce55aF1.13819"; charset="us-ascii"


--1409757300.Ce55aF1.13819
Date: Wed, 3 Sep 2014 15:15:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83443

          Priority: medium
            Bug ID: 83443
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau cras
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: openoliv-rN3gS7ZnVUsdnm+yROfE0A@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105694
  --> https://bugs.freedesktop.org/attachment.cgi?id=105694&action=edit
nouveau crash

Hi, 

sometimes at boot time I've got a crash (let's say one crash every ten
boots...) :

Sep 03 16:35:34 azerty kernel: divide error: 0000 [#1] PREEMPT SMP 
Sep 03 16:35:34 azerty kernel: Modules linked in: ctr ccm xt_tcpudp
ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_conntrack ebtable_broute bridge stp llc
ebtable_nat ebtable_filter ebtables ip6table_raw ip6table_nat nf_conntrack_ipv6
nf_defrag_ipv6 nf_nat_ipv6 ip6table_filter joydev ip6table_security mousedev
ip6table_mangle ip6_tables iptable_raw iptable_nat nf_conntrack_ipv4
nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack iptable_filter iptable_security
iptable_mangle ip_tables x_tables rtsx_usb_sdmmc mmc_core rtsx_usb_ms memstick
rtsx_usb ecb nls_iso8859_1 asus_nb_wmi nls_cp437 asus_wmi sparse_keymap arc4
vfat fat iwldvm led_class mac80211 coretemp intel_rapl x86_pkg_temp_thermal
uvcvideo intel_powerclamp videobuf2_vmalloc btusb videobuf2_memops iTCO_wdt
iTCO_vendor_support kvm_intel iwlwifi kvm videobuf2_core v4l2_common
Sep 03 16:35:34 azerty kernel:  i915(+) videodev media bluetooth evdev
microcode pcspkr nouveau(+) mac_hid psmouse snd_hda_codec_hdmi serio_raw
mxm_wmi cfg80211 6lowpan_iphc snd_hda_codec_realtek snd_hda_codec_generic
rfkill i2c_i801 snd_hda_intel ttm snd_hda_controller int3403_thermal
drm_kms_helper snd_hda_codec drm snd_hwdep snd_pcm battery snd_timer intel_gtt
hwmon ac wmi tpm_tis i2c_algo_bit video snd tpm i2c_core button mei_me thermal
soundcore mei shpchp lpc_ich processor bbswitch(O) ext4 crc16 mbcache jbd2
algif_skcipher af_alg dm_crypt dm_mod sd_mod crc_t10dif atkbd libps2
crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel ghash_clmulni_intel
aesni_intel aes_x86_64 lrw gf128mul glue_helper ablk_helper cryptd xhci_hcd
ahci libahci libata ehci_pci scsi_mod ehci_hcd usbcore usb_common i8042 serio
Sep 03 16:35:34 azerty kernel: CPU: 0 PID: 229 Comm: systemd-udevd Tainted: G  
        O  3.16.1-1-ARCH #1
Sep 03 16:35:34 azerty kernel: Hardware name: ASUSTeK COMPUTER INC.
UX32VD/UX32VD, BIOS UX32VD.214 01/29/2013
Sep 03 16:35:34 azerty kernel: task: ffff88029fea28c0 ti: ffff88029f384000
task.ti: ffff88029f384000
Sep 03 16:35:34 azerty kernel: RIP: 0010:[<ffffffffa055f9a3>] 
[<ffffffffa055f9a3>] gf100_ltcg_init_tag_ram+0xa3/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel: RSP: 0018:ffff88029f3877e8  EFLAGS: 00010206
Sep 03 16:35:34 azerty kernel: RAX: 00000001ffefffff RBX: ffff88029ebfc300 RCX:
ffff88029ebfc3b8
Sep 03 16:35:34 azerty kernel: RDX: 0000000000000000 RSI: 00000000000000d0 RDI:
ffffffffa0525228
Sep 03 16:35:34 azerty kernel: RBP: ffff88029f387800 R08: 00000000000173a0 R09:
0000000000000040
Sep 03 16:35:34 azerty kernel: R10: 00000000fffffefa R11: ffff88029bcd7878 R12:
0000000000000000
Sep 03 16:35:34 azerty kernel: R13: 00000000fff00000 R14: ffffffffa0610ec0 R15:
ffff88029e5cb400
Sep 03 16:35:34 azerty kernel: FS:  00007fbddaca37c0(0000)
GS:ffff8802aee00000(0000) knlGS:0000000000000000
Sep 03 16:35:34 azerty kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 03 16:35:34 azerty kernel: CR2: 00007f813c8fa000 CR3: 000000029e53c000 CR4:
00000000001407f0
Sep 03 16:35:34 azerty kernel: Stack:
Sep 03 16:35:34 azerty kernel:  ffff88029bcd7800 ffff88029ebfc300
00000000ffffffff ffff88029f387848
Sep 03 16:35:34 azerty kernel:  ffffffffa055fb11 ffff8802000000c0
ffff88029f387820 ffff88029ebfc300
Sep 03 16:35:34 azerty kernel:  000000007450b321 0000000000000000
ffffffffa0610e90 ffff88029ee18ca0
Sep 03 16:35:34 azerty kernel: Call Trace:
Sep 03 16:35:34 azerty kernel:  [<ffffffffa055fb11>]
gf100_ltcg_ctor+0x121/0x160 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa0525d91>]
nouveau_object_ctor+0x41/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa056d326>]
nouveau_devobj_ctor+0x1a6/0x7b0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa0525d91>]
nouveau_object_ctor+0x41/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa052669b>]
nouveau_object_new+0x18b/0x240 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa05aaee8>]
nouveau_drm_load+0x248/0x930 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa033a836>] ?
drm_sysfs_device_add+0xd6/0x120 [drm]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa0336d6d>]
drm_dev_register+0xad/0x100 [drm]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa03398f8>] drm_get_pci_dev+0xd8/0x200
[drm]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa05aac5a>]
nouveau_drm_probe+0x26a/0x2b0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffff812df6e5>] local_pci_probe+0x45/0xa0
Sep 03 16:35:34 azerty kernel:  [<ffffffff812df635>] ?
pci_match_device+0xe5/0x110
Sep 03 16:35:34 azerty kernel:  [<ffffffff812df841>]
pci_device_probe+0x101/0x150
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a4f93>]
driver_probe_device+0xa3/0x410
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a53cb>] __driver_attach+0x8b/0x90
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a5340>] ?
__device_attach+0x40/0x40
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a2db3>] bus_for_each_dev+0x73/0xc0
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a4a1e>] driver_attach+0x1e/0x20
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a4600>] bus_add_driver+0x180/0x250
Sep 03 16:35:34 azerty kernel:  [<ffffffff813a5c64>] driver_register+0x64/0xf0
Sep 03 16:35:34 azerty kernel:  [<ffffffff812dee3b>]
__pci_register_driver+0x4b/0x50
Sep 03 16:35:34 azerty kernel:  [<ffffffffa0339b2a>] drm_pci_init+0x10a/0x140
[drm]
Sep 03 16:35:34 azerty kernel:  [<ffffffffa06a9000>] ? 0xffffffffa06a8fff
Sep 03 16:35:34 azerty kernel:  [<ffffffffa06a9042>]
nouveau_drm_init+0x42/0x1000 [nouveau]
Sep 03 16:35:34 azerty kernel:  [<ffffffff81002148>] do_one_initcall+0xd8/0x210
Sep 03 16:35:34 azerty kernel:  [<ffffffff8118af82>] ? __vunmap+0xa2/0x100
Sep 03 16:35:34 azerty kernel:  [<ffffffff810efcb1>] load_module+0x1dd1/0x2680
Sep 03 16:35:34 azerty kernel:  [<ffffffff810ec1c0>] ? store_uevent+0x70/0x70
Sep 03 16:35:34 azerty kernel:  [<ffffffff810f062d>] SyS_init_module+0xcd/0x120
Sep 03 16:35:34 azerty kernel:  [<ffffffff81530be9>]
system_call_fastpath+0x16/0x1b
Sep 03 16:35:34 azerty kernel: Code: 00 01 c2 c1 ea 0c 89 d1 e8 6b 5c fc ff 85
c0 75 57 48 8b 83 b8 00 00 00 31 d2 8b 40 34 c1 e0 0c 41 01 c5 41 8d 44 24 ff
4c 01 e8 <49> f7 f4 8b 93 88 00 00 00 89 83 8c 00 00 00 48 8d bb 90 00 00 
Sep 03 16:35:34 azerty kernel: RIP  [<ffffffffa055f9a3>]
gf100_ltcg_init_tag_ram+0xa3/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel:  RSP <ffff88029f3877e8>
Sep 03 16:35:34 azerty kernel: ---[ end trace 694c769667de463a ]---
Sep 03 16:35:34 azerty systemd-udevd[224]: worker [229] terminated by signal 11
(Segmentation fault)
Sep 03 16:35:34 azerty systemd-udevd[224]: worker [229] failed while handling
'/devices/pci0000:00/0000:00:01.0/0000:01:00.0'

# lscpci -v 
01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/820M / GT
620M/625M/630M/720M] (rev a1)
    Subsystem: ASUSTeK Computer Inc. GeForce GT 620M
    Flags: bus master, fast devsel, latency 0, IRQ 49
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau
    Kernel modules: nouveau

#uname -a 
Linux azerty 3.16.1-1-ARCH #1 SMP PREEMPT Thu Aug 14 07:40:19 CEST 2014 x86_64
GNU/Linux


Journalctl attached.

On a side note and FYI, it's a recent bug, until at least Linux 3.15.2-2  (and
since 2 years of use of this laptop) I had this kind of message:
Aug 15 10:49:52 azerty kernel: nouveau E[  DEVICE][0000:01:00.0] unknown
chipset, 0xffffffff
Aug 15 10:49:52 azerty kernel: nouveau E[     DRM] failed to create 0x80000080,
-22
Aug 15 10:49:52 azerty kernel: nouveau: probe of 0000:01:00.0 failed with error
-22

Regards

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409757300.Ce55aF1.13819
Date: Wed, 3 Sep 2014 15:15:00 +0000
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
   title="NEW --- - Nouveau cras"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83443">83443</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau cras
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>openoliv&#64;mailoo.org
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
          <td>unspecified
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
        <pre>Created <span class=""><a href="attachment.cgi?id=105694" name="attach_105694" title="nouveau crash">attachment 105694</a> <a href="attachment.cgi?id=105694&amp;action=edit" title="nouveau crash">[details]</a></span>
nouveau crash

Hi, 

sometimes at boot time I've got a crash (let's say one crash every ten
boots...) :

Sep 03 16:35:34 azerty kernel: divide error: 0000 [#1] PREEMPT SMP 
Sep 03 16:35:34 azerty kernel: Modules linked in: ctr ccm xt_tcpudp
ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_conntrack ebtable_broute bridge stp llc
ebtable_nat ebtable_filter ebtables ip6table_raw ip6table_nat nf_conntrack_ipv6
nf_defrag_ipv6 nf_nat_ipv6 ip6table_filter joydev ip6table_security mousedev
ip6table_mangle ip6_tables iptable_raw iptable_nat nf_conntrack_ipv4
nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack iptable_filter iptable_security
iptable_mangle ip_tables x_tables rtsx_usb_sdmmc mmc_core rtsx_usb_ms memstick
rtsx_usb ecb nls_iso8859_1 asus_nb_wmi nls_cp437 asus_wmi sparse_keymap arc4
vfat fat iwldvm led_class mac80211 coretemp intel_rapl x86_pkg_temp_thermal
uvcvideo intel_powerclamp videobuf2_vmalloc btusb videobuf2_memops iTCO_wdt
iTCO_vendor_support kvm_intel iwlwifi kvm videobuf2_core v4l2_common
Sep 03 16:35:34 azerty kernel:  i915(+) videodev media bluetooth evdev
microcode pcspkr nouveau(+) mac_hid psmouse snd_hda_codec_hdmi serio_raw
mxm_wmi cfg80211 6lowpan_iphc snd_hda_codec_realtek snd_hda_codec_generic
rfkill i2c_i801 snd_hda_intel ttm snd_hda_controller int3403_thermal
drm_kms_helper snd_hda_codec drm snd_hwdep snd_pcm battery snd_timer intel_gtt
hwmon ac wmi tpm_tis i2c_algo_bit video snd tpm i2c_core button mei_me thermal
soundcore mei shpchp lpc_ich processor bbswitch(O) ext4 crc16 mbcache jbd2
algif_skcipher af_alg dm_crypt dm_mod sd_mod crc_t10dif atkbd libps2
crct10dif_pclmul crct10dif_common crc32_pclmul crc32c_intel ghash_clmulni_intel
aesni_intel aes_x86_64 lrw gf128mul glue_helper ablk_helper cryptd xhci_hcd
ahci libahci libata ehci_pci scsi_mod ehci_hcd usbcore usb_common i8042 serio
Sep 03 16:35:34 azerty kernel: CPU: 0 PID: 229 Comm: systemd-udevd Tainted: G  
        O  3.16.1-1-ARCH #1
Sep 03 16:35:34 azerty kernel: Hardware name: ASUSTeK COMPUTER INC.
UX32VD/UX32VD, BIOS UX32VD.214 01/29/2013
Sep 03 16:35:34 azerty kernel: task: ffff88029fea28c0 ti: ffff88029f384000
task.ti: ffff88029f384000
Sep 03 16:35:34 azerty kernel: RIP: 0010:[&lt;ffffffffa055f9a3&gt;] 
[&lt;ffffffffa055f9a3&gt;] gf100_ltcg_init_tag_ram+0xa3/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel: RSP: 0018:ffff88029f3877e8  EFLAGS: 00010206
Sep 03 16:35:34 azerty kernel: RAX: 00000001ffefffff RBX: ffff88029ebfc300 RCX:
ffff88029ebfc3b8
Sep 03 16:35:34 azerty kernel: RDX: 0000000000000000 RSI: 00000000000000d0 RDI:
ffffffffa0525228
Sep 03 16:35:34 azerty kernel: RBP: ffff88029f387800 R08: 00000000000173a0 R09:
0000000000000040
Sep 03 16:35:34 azerty kernel: R10: 00000000fffffefa R11: ffff88029bcd7878 R12:
0000000000000000
Sep 03 16:35:34 azerty kernel: R13: 00000000fff00000 R14: ffffffffa0610ec0 R15:
ffff88029e5cb400
Sep 03 16:35:34 azerty kernel: FS:  00007fbddaca37c0(0000)
GS:ffff8802aee00000(0000) knlGS:0000000000000000
Sep 03 16:35:34 azerty kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 03 16:35:34 azerty kernel: CR2: 00007f813c8fa000 CR3: 000000029e53c000 CR4:
00000000001407f0
Sep 03 16:35:34 azerty kernel: Stack:
Sep 03 16:35:34 azerty kernel:  ffff88029bcd7800 ffff88029ebfc300
00000000ffffffff ffff88029f387848
Sep 03 16:35:34 azerty kernel:  ffffffffa055fb11 ffff8802000000c0
ffff88029f387820 ffff88029ebfc300
Sep 03 16:35:34 azerty kernel:  000000007450b321 0000000000000000
ffffffffa0610e90 ffff88029ee18ca0
Sep 03 16:35:34 azerty kernel: Call Trace:
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa055fb11&gt;]
gf100_ltcg_ctor+0x121/0x160 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa0525d91&gt;]
nouveau_object_ctor+0x41/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa056d326&gt;]
nouveau_devobj_ctor+0x1a6/0x7b0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa0525d91&gt;]
nouveau_object_ctor+0x41/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa052669b&gt;]
nouveau_object_new+0x18b/0x240 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa05aaee8&gt;]
nouveau_drm_load+0x248/0x930 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa033a836&gt;] ?
drm_sysfs_device_add+0xd6/0x120 [drm]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa0336d6d&gt;]
drm_dev_register+0xad/0x100 [drm]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa03398f8&gt;] drm_get_pci_dev+0xd8/0x200
[drm]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa05aac5a&gt;]
nouveau_drm_probe+0x26a/0x2b0 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff812df6e5&gt;] local_pci_probe+0x45/0xa0
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff812df635&gt;] ?
pci_match_device+0xe5/0x110
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff812df841&gt;]
pci_device_probe+0x101/0x150
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a4f93&gt;]
driver_probe_device+0xa3/0x410
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a53cb&gt;] __driver_attach+0x8b/0x90
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a5340&gt;] ?
__device_attach+0x40/0x40
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a2db3&gt;] bus_for_each_dev+0x73/0xc0
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a4a1e&gt;] driver_attach+0x1e/0x20
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a4600&gt;] bus_add_driver+0x180/0x250
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff813a5c64&gt;] driver_register+0x64/0xf0
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff812dee3b&gt;]
__pci_register_driver+0x4b/0x50
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa0339b2a&gt;] drm_pci_init+0x10a/0x140
[drm]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa06a9000&gt;] ? 0xffffffffa06a8fff
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffffa06a9042&gt;]
nouveau_drm_init+0x42/0x1000 [nouveau]
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff81002148&gt;] do_one_initcall+0xd8/0x210
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff8118af82&gt;] ? __vunmap+0xa2/0x100
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff810efcb1&gt;] load_module+0x1dd1/0x2680
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff810ec1c0&gt;] ? store_uevent+0x70/0x70
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff810f062d&gt;] SyS_init_module+0xcd/0x120
Sep 03 16:35:34 azerty kernel:  [&lt;ffffffff81530be9&gt;]
system_call_fastpath+0x16/0x1b
Sep 03 16:35:34 azerty kernel: Code: 00 01 c2 c1 ea 0c 89 d1 e8 6b 5c fc ff 85
c0 75 57 48 8b 83 b8 00 00 00 31 d2 8b 40 34 c1 e0 0c 41 01 c5 41 8d 44 24 ff
4c 01 e8 &lt;49&gt; f7 f4 8b 93 88 00 00 00 89 83 8c 00 00 00 48 8d bb 90 00 00 
Sep 03 16:35:34 azerty kernel: RIP  [&lt;ffffffffa055f9a3&gt;]
gf100_ltcg_init_tag_ram+0xa3/0xf0 [nouveau]
Sep 03 16:35:34 azerty kernel:  RSP &lt;ffff88029f3877e8&gt;
Sep 03 16:35:34 azerty kernel: ---[ end trace 694c769667de463a ]---
Sep 03 16:35:34 azerty systemd-udevd[224]: worker [229] terminated by signal 11
(Segmentation fault)
Sep 03 16:35:34 azerty systemd-udevd[224]: worker [229] failed while handling
'/devices/pci0000:00/0000:00:01.0/0000:01:00.0'

# lscpci -v 
01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M/820M / GT
620M/625M/630M/720M] (rev a1)
    Subsystem: ASUSTeK Computer Inc. GeForce GT 620M
    Flags: bus master, fast devsel, latency 0, IRQ 49
    Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau
    Kernel modules: nouveau

#uname -a 
Linux azerty 3.16.1-1-ARCH #1 SMP PREEMPT Thu Aug 14 07:40:19 CEST 2014 x86_64
GNU/Linux


Journalctl attached.

On a side note and FYI, it's a recent bug, until at least Linux 3.15.2-2  (and
since 2 years of use of this laptop) I had this kind of message:
Aug 15 10:49:52 azerty kernel: nouveau E[  DEVICE][0000:01:00.0] unknown
chipset, 0xffffffff
Aug 15 10:49:52 azerty kernel: nouveau E[     DRM] failed to create 0x80000080,
-22
Aug 15 10:49:52 azerty kernel: nouveau: probe of 0000:01:00.0 failed with error
-22

Regards</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409757300.Ce55aF1.13819--

--===============1463118173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1463118173==--
