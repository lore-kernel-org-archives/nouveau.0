From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60007] BUG: nouveau crashes in various ways in
 32-bits Fedora 18
Date: Tue, 29 Jan 2013 10:28:16 +0000
Message-ID: <bug-60007-8800-NQQc7QssJd@http.bugs.freedesktop.org/>
References: <bug-60007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051718371=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60007-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1051718371==
Content-Type: multipart/alternative; boundary="1359455296.d8CF01.21214"; charset="us-ascii"


--1359455296.d8CF01.21214
Date: Tue, 29 Jan 2013 10:28:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60007

--- Comment #3 from Cornel Panceac <cpanceac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
and

Jan 28 14:47:32 localhost kernel: [357498.792281] ------------[ cut here
]------------
Jan 28 14:47:32 localhost kernel: [357498.792343] WARNING: at
drivers/gpu/drm/nouveau/core/core/mm.c:242 nouveau_mm_fini+0x47/0x50
[nouveau]()
Jan 28 14:47:32 localhost kernel: [357498.792346] Hardware name: Latitude E6400
Jan 28 14:47:32 localhost kernel: [357498.792347] Modules linked in: lp
binfmt_misc nls_utf8 hfsplus hfs vfat fat xfs fuse ebtable_nat ipt_MASQUERADE
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6table_mangle ip6t_REJECT
be2iscsi nf_conntrack_ipv6 iscsi_boot_sysfs nf_defrag_ipv6 bnx2i iptable_nat
nf_nat_ipv4 nf_nat cnic uio bnep cxgb4i cxgb4 iptable_mangle cxgb3i bluetooth
cxgb3 mdio libcxgbi ib_iser rdma_cm ib_addr nf_conntrack_ipv4 iw_cm
nf_defrag_ipv4 ib_cm xt_conntrack ib_sa nf_conntrack ib_mad ib_core iscsi_tcp
libiscsi_tcp libiscsi scsi_transport_iscsi ebtable_filter ebtables
ip6table_filter ip6_tables dm_crypt snd_hda_codec_idt snd_hda_intel
snd_hda_codec snd_hwdep snd_seq uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_core videodev media arc4 snd_seq_device iwldvm ppdev mac80211 snd_pcm
coretemp iTCO_wdt iwlwifi snd_page_alloc iTCO_vendor_support parport_pc
cfg80211 snd_timer snd rfkill parport microcode i2c_i801 lpc_ich mfd_core
soundcore e1000e dell_laptop dell_wmi sparse_keymap dcdbas vhost_net tun
macvtap macvlan kvm_intel kvm uinput btrfs libcrc32c zlib_deflate firewire_ohci
nouveau sdhci_pci sdhci mxm_wmi mmc_core i2c_algo_bit firewire_core
drm_kms_helper crc_itu_t ttm usb_storage drm i2c_core wmi video
Jan 28 14:47:32 localhost kernel: [357498.792417] Pid: 11705, comm: firefox
Tainted: G D 3.7.2-204.fc18.i686.PAE #1
Jan 28 14:47:32 localhost kernel: [357498.792420] Call Trace:
Jan 28 14:47:32 localhost kernel: [357498.792430] [<c044d6a2>]
warn_slowpath_common+0x72/0xa0
Jan 28 14:47:32 localhost kernel: [357498.792443] [<f852dfb7>] ?
nouveau_mm_fini+0x47/0x50 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792456] [<f852dfb7>] ?
nouveau_mm_fini+0x47/0x50 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792459] [<c044d6f2>]
warn_slowpath_null+0x22/0x30
Jan 28 14:47:32 localhost kernel: [357498.792472] [<f852dfb7>]
nouveau_mm_fini+0x47/0x50 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792491] [<f854903c>]
nouveau_vm_ref+0x11c/0x150 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792508] [<f83c2107>] ?
drm_remove_magic+0xa7/0xb0 [drm]
Jan 28 14:47:32 localhost kernel: [357498.792529] [<f858d47d>]
nouveau_cli_destroy+0x1d/0x40 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792548] [<f858d4b4>]
nouveau_drm_postclose+0x14/0x30 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792560] [<f83c6444>]
drm_release+0x354/0x510 [drm]
Jan 28 14:47:32 localhost kernel: [357498.792570] [<c055ad56>]
__fput+0xc6/0x1f0
Jan 28 14:47:32 localhost kernel: [357498.792573] [<c055ae8d>]
____fput+0xd/0x10
Jan 28 14:47:32 localhost kernel: [357498.792578] [<c046a801>]
task_work_run+0x81/0xa0
Jan 28 14:47:32 localhost kernel: [357498.792581] [<c0452f44>]
do_exit+0x174/0x7f0
Jan 28 14:47:32 localhost kernel: [357498.792584] [<c044d61f>] ?
print_oops_end_marker+0x2f/0x40
Jan 28 14:47:32 localhost kernel: [357498.792590] [<c098978a>]
oops_end+0x8a/0xd0
Jan 28 14:47:32 localhost kernel: [357498.792594] [<c097f8e2>]
no_context+0x1af/0x1b7
Jan 28 14:47:32 localhost kernel: [357498.792599] [<c097fa14>]
__bad_area_nosemaphore+0x12a/0x132
Jan 28 14:47:32 localhost kernel: [357498.792603] [<c049913e>] ?
ktime_get+0x5e/0x100
Jan 28 14:47:32 localhost kernel: [357498.792606] [<c098b91d>] ?
spurious_fault+0x7d/0xda
Jan 28 14:47:32 localhost kernel: [357498.792609] [<c098bad9>] ?
vmalloc_fault+0x15f/0x176
Jan 28 14:47:32 localhost kernel: [357498.792613] [<c098bf80>] ?
__do_page_fault+0x490/0x490
Jan 28 14:47:32 localhost kernel: [357498.792616] [<c097fa33>]
bad_area_nosemaphore+0x17/0x19
Jan 28 14:47:32 localhost kernel: [357498.792618] [<c098be15>]
__do_page_fault+0x325/0x490
Jan 28 14:47:32 localhost kernel: [357498.792621] [<c04a0e49>] ?
tick_program_event+0x29/0x30
Jan 28 14:47:32 localhost kernel: [357498.792628] [<c0455bb7>] ?
irq_exit+0x67/0xb0
Jan 28 14:47:32 localhost kernel: [357498.792632] [<c098bf80>] ?
__do_page_fault+0x490/0x490
Jan 28 14:47:32 localhost kernel: [357498.792635] [<c098bf8d>]
do_page_fault+0xd/0x10
Jan 28 14:47:32 localhost kernel: [357498.792637] [<c0988fa7>]
error_code+0x67/0x6c
Jan 28 14:47:32 localhost kernel: [357498.792645] [<c098007b>] ?
printk_sched+0x4b/0x4f
Jan 28 14:47:32 localhost kernel: [357498.792650] [<c06957c8>] ?
iowrite32+0x38/0x40
Jan 28 14:47:32 localhost kernel: [357498.792664] [<f852fb05>] ?
nouveau_barobj_wr32+0x15/0x20 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792677] [<f852ca68>]
_nouveau_gpuobj_wr32+0x28/0x40 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792691] [<f852ccef>]
nouveau_gpuobj_create_+0x19f/0x270 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792711] [<f8590261>] ?
nouveau_gart_manager_new+0x31/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792727] [<f852ce06>]
_nouveau_gpuobj_ctor+0x46/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792742] [<f852e3cb>]
nouveau_object_ctor+0x3b/0xe0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792756] [<f852ce78>]
nouveau_gpuobj_new+0x58/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792772] [<f8548c0a>]
nouveau_vm_get+0x18a/0x250 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792776] [<c05372fa>] ?
map_vm_area+0x3a/0x60
Jan 28 14:47:32 localhost kernel: [357498.792796] [<f8593784>]
nouveau_bo_vma_add+0x44/0xf0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792815] [<f858e436>]
nouveau_channel_prep+0x1f6/0x310 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792835] [<f858e583>]
nouveau_channel_new+0x33/0x620 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792856] [<f8595c0d>] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792910] [<f8595c0d>] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792929] [<f8595c86>]
nouveau_abi16_ioctl_channel_alloc+0x156/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792949] [<f8595b30>] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792960] [<f83c5d62>]
drm_ioctl+0x422/0x480 [drm]
Jan 28 14:47:32 localhost kernel: [357498.792969] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.792988] [<f8595b30>] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792993] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.792998] [<c052d8fd>] ?
handle_mm_fault+0x1ed/0x290
Jan 28 14:47:32 localhost kernel: [357498.793026] [<f83c5940>] ?
drm_copy_field+0x80/0x80 [drm]
Jan 28 14:47:32 localhost kernel: [357498.793030] [<c0568cfa>]
do_vfs_ioctl+0x7a/0x590
Jan 28 14:47:32 localhost kernel: [357498.793035] [<c0631f2a>] ?
inode_has_perm.isra.31.constprop.62+0x3a/0x50
Jan 28 14:47:32 localhost kernel: [357498.793037] [<c0633570>] ?
file_has_perm+0xa0/0xb0
Jan 28 14:47:32 localhost kernel: [357498.793040] [<c0633988>] ?
selinux_file_ioctl+0x48/0xe0
Jan 28 14:47:32 localhost kernel: [357498.793043] [<c056927b>]
sys_ioctl+0x6b/0x80
Jan 28 14:47:32 localhost kernel: [357498.793046] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.793049] [<c098f94d>]
sysenter_do_call+0x12/0x28
Jan 28 14:47:32 localhost kernel: [357498.793052] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.793054] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.793056] ---[ end trace
5ab85add3f2620f7 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359455296.d8CF01.21214
Date: Tue, 29 Jan 2013 10:28:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">bug 60007</a>
              from <span class="vcard"><a class="email" href="mailto:cpanceac&#64;gmail.com" title="Cornel Panceac &lt;cpanceac&#64;gmail.com&gt;"> <span class="fn">Cornel Panceac</span></a>
</span></b>
        <pre>and

Jan 28 14:47:32 localhost kernel: [357498.792281] ------------[ cut here
]------------
Jan 28 14:47:32 localhost kernel: [357498.792343] WARNING: at
drivers/gpu/drm/nouveau/core/core/mm.c:242 nouveau_mm_fini+0x47/0x50
[nouveau]()
Jan 28 14:47:32 localhost kernel: [357498.792346] Hardware name: Latitude E6400
Jan 28 14:47:32 localhost kernel: [357498.792347] Modules linked in: lp
binfmt_misc nls_utf8 hfsplus hfs vfat fat xfs fuse ebtable_nat ipt_MASQUERADE
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6table_mangle ip6t_REJECT
be2iscsi nf_conntrack_ipv6 iscsi_boot_sysfs nf_defrag_ipv6 bnx2i iptable_nat
nf_nat_ipv4 nf_nat cnic uio bnep cxgb4i cxgb4 iptable_mangle cxgb3i bluetooth
cxgb3 mdio libcxgbi ib_iser rdma_cm ib_addr nf_conntrack_ipv4 iw_cm
nf_defrag_ipv4 ib_cm xt_conntrack ib_sa nf_conntrack ib_mad ib_core iscsi_tcp
libiscsi_tcp libiscsi scsi_transport_iscsi ebtable_filter ebtables
ip6table_filter ip6_tables dm_crypt snd_hda_codec_idt snd_hda_intel
snd_hda_codec snd_hwdep snd_seq uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_core videodev media arc4 snd_seq_device iwldvm ppdev mac80211 snd_pcm
coretemp iTCO_wdt iwlwifi snd_page_alloc iTCO_vendor_support parport_pc
cfg80211 snd_timer snd rfkill parport microcode i2c_i801 lpc_ich mfd_core
soundcore e1000e dell_laptop dell_wmi sparse_keymap dcdbas vhost_net tun
macvtap macvlan kvm_intel kvm uinput btrfs libcrc32c zlib_deflate firewire_ohci
nouveau sdhci_pci sdhci mxm_wmi mmc_core i2c_algo_bit firewire_core
drm_kms_helper crc_itu_t ttm usb_storage drm i2c_core wmi video
Jan 28 14:47:32 localhost kernel: [357498.792417] Pid: 11705, comm: firefox
Tainted: G D 3.7.2-204.fc18.i686.PAE #1
Jan 28 14:47:32 localhost kernel: [357498.792420] Call Trace:
Jan 28 14:47:32 localhost kernel: [357498.792430] [&lt;c044d6a2&gt;]
warn_slowpath_common+0x72/0xa0
Jan 28 14:47:32 localhost kernel: [357498.792443] [&lt;f852dfb7&gt;] ?
nouveau_mm_fini+0x47/0x50 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792456] [&lt;f852dfb7&gt;] ?
nouveau_mm_fini+0x47/0x50 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792459] [&lt;c044d6f2&gt;]
warn_slowpath_null+0x22/0x30
Jan 28 14:47:32 localhost kernel: [357498.792472] [&lt;f852dfb7&gt;]
nouveau_mm_fini+0x47/0x50 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792491] [&lt;f854903c&gt;]
nouveau_vm_ref+0x11c/0x150 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792508] [&lt;f83c2107&gt;] ?
drm_remove_magic+0xa7/0xb0 [drm]
Jan 28 14:47:32 localhost kernel: [357498.792529] [&lt;f858d47d&gt;]
nouveau_cli_destroy+0x1d/0x40 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792548] [&lt;f858d4b4&gt;]
nouveau_drm_postclose+0x14/0x30 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792560] [&lt;f83c6444&gt;]
drm_release+0x354/0x510 [drm]
Jan 28 14:47:32 localhost kernel: [357498.792570] [&lt;c055ad56&gt;]
__fput+0xc6/0x1f0
Jan 28 14:47:32 localhost kernel: [357498.792573] [&lt;c055ae8d&gt;]
____fput+0xd/0x10
Jan 28 14:47:32 localhost kernel: [357498.792578] [&lt;c046a801&gt;]
task_work_run+0x81/0xa0
Jan 28 14:47:32 localhost kernel: [357498.792581] [&lt;c0452f44&gt;]
do_exit+0x174/0x7f0
Jan 28 14:47:32 localhost kernel: [357498.792584] [&lt;c044d61f&gt;] ?
print_oops_end_marker+0x2f/0x40
Jan 28 14:47:32 localhost kernel: [357498.792590] [&lt;c098978a&gt;]
oops_end+0x8a/0xd0
Jan 28 14:47:32 localhost kernel: [357498.792594] [&lt;c097f8e2&gt;]
no_context+0x1af/0x1b7
Jan 28 14:47:32 localhost kernel: [357498.792599] [&lt;c097fa14&gt;]
__bad_area_nosemaphore+0x12a/0x132
Jan 28 14:47:32 localhost kernel: [357498.792603] [&lt;c049913e&gt;] ?
ktime_get+0x5e/0x100
Jan 28 14:47:32 localhost kernel: [357498.792606] [&lt;c098b91d&gt;] ?
spurious_fault+0x7d/0xda
Jan 28 14:47:32 localhost kernel: [357498.792609] [&lt;c098bad9&gt;] ?
vmalloc_fault+0x15f/0x176
Jan 28 14:47:32 localhost kernel: [357498.792613] [&lt;c098bf80&gt;] ?
__do_page_fault+0x490/0x490
Jan 28 14:47:32 localhost kernel: [357498.792616] [&lt;c097fa33&gt;]
bad_area_nosemaphore+0x17/0x19
Jan 28 14:47:32 localhost kernel: [357498.792618] [&lt;c098be15&gt;]
__do_page_fault+0x325/0x490
Jan 28 14:47:32 localhost kernel: [357498.792621] [&lt;c04a0e49&gt;] ?
tick_program_event+0x29/0x30
Jan 28 14:47:32 localhost kernel: [357498.792628] [&lt;c0455bb7&gt;] ?
irq_exit+0x67/0xb0
Jan 28 14:47:32 localhost kernel: [357498.792632] [&lt;c098bf80&gt;] ?
__do_page_fault+0x490/0x490
Jan 28 14:47:32 localhost kernel: [357498.792635] [&lt;c098bf8d&gt;]
do_page_fault+0xd/0x10
Jan 28 14:47:32 localhost kernel: [357498.792637] [&lt;c0988fa7&gt;]
error_code+0x67/0x6c
Jan 28 14:47:32 localhost kernel: [357498.792645] [&lt;c098007b&gt;] ?
printk_sched+0x4b/0x4f
Jan 28 14:47:32 localhost kernel: [357498.792650] [&lt;c06957c8&gt;] ?
iowrite32+0x38/0x40
Jan 28 14:47:32 localhost kernel: [357498.792664] [&lt;f852fb05&gt;] ?
nouveau_barobj_wr32+0x15/0x20 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792677] [&lt;f852ca68&gt;]
_nouveau_gpuobj_wr32+0x28/0x40 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792691] [&lt;f852ccef&gt;]
nouveau_gpuobj_create_+0x19f/0x270 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792711] [&lt;f8590261&gt;] ?
nouveau_gart_manager_new+0x31/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792727] [&lt;f852ce06&gt;]
_nouveau_gpuobj_ctor+0x46/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792742] [&lt;f852e3cb&gt;]
nouveau_object_ctor+0x3b/0xe0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792756] [&lt;f852ce78&gt;]
nouveau_gpuobj_new+0x58/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792772] [&lt;f8548c0a&gt;]
nouveau_vm_get+0x18a/0x250 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792776] [&lt;c05372fa&gt;] ?
map_vm_area+0x3a/0x60
Jan 28 14:47:32 localhost kernel: [357498.792796] [&lt;f8593784&gt;]
nouveau_bo_vma_add+0x44/0xf0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792815] [&lt;f858e436&gt;]
nouveau_channel_prep+0x1f6/0x310 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792835] [&lt;f858e583&gt;]
nouveau_channel_new+0x33/0x620 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792856] [&lt;f8595c0d&gt;] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792910] [&lt;f8595c0d&gt;] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792929] [&lt;f8595c86&gt;]
nouveau_abi16_ioctl_channel_alloc+0x156/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792949] [&lt;f8595b30&gt;] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792960] [&lt;f83c5d62&gt;]
drm_ioctl+0x422/0x480 [drm]
Jan 28 14:47:32 localhost kernel: [357498.792969] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.792988] [&lt;f8595b30&gt;] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.792993] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.792998] [&lt;c052d8fd&gt;] ?
handle_mm_fault+0x1ed/0x290
Jan 28 14:47:32 localhost kernel: [357498.793026] [&lt;f83c5940&gt;] ?
drm_copy_field+0x80/0x80 [drm]
Jan 28 14:47:32 localhost kernel: [357498.793030] [&lt;c0568cfa&gt;]
do_vfs_ioctl+0x7a/0x590
Jan 28 14:47:32 localhost kernel: [357498.793035] [&lt;c0631f2a&gt;] ?
inode_has_perm.isra.31.constprop.62+0x3a/0x50
Jan 28 14:47:32 localhost kernel: [357498.793037] [&lt;c0633570&gt;] ?
file_has_perm+0xa0/0xb0
Jan 28 14:47:32 localhost kernel: [357498.793040] [&lt;c0633988&gt;] ?
selinux_file_ioctl+0x48/0xe0
Jan 28 14:47:32 localhost kernel: [357498.793043] [&lt;c056927b&gt;]
sys_ioctl+0x6b/0x80
Jan 28 14:47:32 localhost kernel: [357498.793046] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.793049] [&lt;c098f94d&gt;]
sysenter_do_call+0x12/0x28
Jan 28 14:47:32 localhost kernel: [357498.793052] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.793054] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.793056] ---[ end trace
5ab85add3f2620f7 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359455296.d8CF01.21214--

--===============1051718371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1051718371==--
