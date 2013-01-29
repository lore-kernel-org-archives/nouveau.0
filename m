From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60007] BUG: nouveau crashes in various ways in
 32-bits Fedora 18
Date: Tue, 29 Jan 2013 10:27:47 +0000
Message-ID: <bug-60007-8800-L8aCptRwh2@http.bugs.freedesktop.org/>
References: <bug-60007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1584410228=="
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


--===============1584410228==
Content-Type: multipart/alternative; boundary="1359455267.af3E31.21159"; charset="us-ascii"


--1359455267.af3E31.21159
Date: Tue, 29 Jan 2013 10:27:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60007

--- Comment #2 from Cornel Panceac <cpanceac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
full traces:

Jan 28 14:47:32 localhost kernel: [357498.739893] BUG: unable to handle kernel
paging request at fb880000
Jan 28 14:47:32 localhost kernel: [357498.739913] IP: [<c06957c8>]
iowrite32+0x38/0x40
Jan 28 14:47:32 localhost kernel: [357498.739924] *pdpt = 0000000000cec001 *pde
= 0000000036947067 *pte = 0000000000000000
Jan 28 14:47:32 localhost kernel: [357498.739936] Oops: 0002 [#1] SMP
Jan 28 14:47:32 localhost kernel: [357498.739943] Modules linked in: lp
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
Jan 28 14:47:32 localhost kernel: [357498.740004] Pid: 11705, comm: firefox Not
tainted 3.7.2-204.fc18.i686.PAE #1 Dell Inc. Latitude E6400 /0U695R
Jan 28 14:47:32 localhost kernel: [357498.740004] EIP: 0060:[<c06957c8>]
EFLAGS: 00010292 CPU: 0
Jan 28 14:47:32 localhost kernel: [357498.740004] EIP is at iowrite32+0x38/0x40
Jan 28 14:47:32 localhost kernel: [357498.740004] EAX: 00000000 EBX: f6acc280
ECX: fb880000 EDX: fb880000
Jan 28 14:47:32 localhost kernel: [357498.740004] ESI: f85d81c0 EDI: f85d8080
EBP: ed939bc0 ESP: ed939bb8
Jan 28 14:47:32 localhost kernel: [357498.740004] DS: 007b ES: 007b FS: 00d8
GS: 00e0 SS: 0068
Jan 28 14:47:32 localhost kernel: [357498.740004] CR0: 80050033 CR2: fb880000
CR3: 2d20d000 CR4: 000407f0
Jan 28 14:47:32 localhost kernel: [357498.740004] DR0: 00000000 DR1: 00000000
DR2: 00000000 DR3: 00000000
Jan 28 14:47:32 localhost kernel: [357498.740004] DR6: ffff0ff0 DR7: 00000400
Jan 28 14:47:32 localhost kernel: [357498.740004] Process firefox (pid: 11705,
ti=ed938000 task=e8f33ed0 task.ti=ed938000)
Jan 28 14:47:32 localhost kernel: [357498.740004] Stack:
Jan 28 14:47:32 localhost kernel: [357498.740004] f852fb05 f6acc280 ed939bd0
f852ca68 cc228900 00070004 ed939c14 f852ccef
Jan 28 14:47:32 localhost kernel: [357498.740004] 02000000 00000058 ed939c38
f8590261 0bab0000 00000000 ed939c04 f85d8060
Jan 28 14:47:32 localhost kernel: [357498.740004] f68cf180 00000000 f68cf480
00000000 00000000 00100000 f85d8080 ed939c44
Jan 28 14:47:32 localhost kernel: [357498.740004] Call Trace:
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f852fb05>] ?
nouveau_barobj_wr32+0x15/0x20 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f852ca68>]
_nouveau_gpuobj_wr32+0x28/0x40 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f852ccef>]
nouveau_gpuobj_create_+0x19f/0x270 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8590261>] ?
nouveau_gart_manager_new+0x31/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f852ce06>]
_nouveau_gpuobj_ctor+0x46/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f852e3cb>]
nouveau_object_ctor+0x3b/0xe0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f852ce78>]
nouveau_gpuobj_new+0x58/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8548c0a>]
nouveau_vm_get+0x18a/0x250 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c05372fa>] ?
map_vm_area+0x3a/0x60
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8593784>]
nouveau_bo_vma_add+0x44/0xf0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f858e436>]
nouveau_channel_prep+0x1f6/0x310 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f858e583>]
nouveau_channel_new+0x33/0x620 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8595c0d>] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8595c0d>] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8595c86>]
nouveau_abi16_ioctl_channel_alloc+0x156/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8595b30>] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f83c5d62>]
drm_ioctl+0x422/0x480 [drm]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f8595b30>] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c052d8fd>] ?
handle_mm_fault+0x1ed/0x290
Jan 28 14:47:32 localhost kernel: [357498.740004] [<f83c5940>] ?
drm_copy_field+0x80/0x80 [drm]
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0568cfa>]
do_vfs_ioctl+0x7a/0x590
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0631f2a>] ?
inode_has_perm.isra.31.constprop.62+0x3a/0x50
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0633570>] ?
file_has_perm+0xa0/0xb0
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0633988>] ?
selinux_file_ioctl+0x48/0xe0
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c056927b>]
sys_ioctl+0x6b/0x80
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c098f94d>]
sysenter_do_call+0x12/0x28
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [<c0586442>] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] Code: 00 01 00 76 0e 81 e2 ff
ff 00 00 ef c3 8d b6 00 00 00 00 55 ba 91 d4 b2 c0 89 e5 89 c8 e8 41 ff ff ff
5d c3 8d b4 26 00 00 00 00 <89> 02 c3 90 8d 74 26 00 81 fa ff ff 03 00 89 d1 77
2e 81 fa 00
Jan 28 14:47:32 localhost kernel: [357498.740004] EIP: [<c06957c8>]
iowrite32+0x38/0x40 SS:ESP 0068:ed939bb8
Jan 28 14:47:32 localhost kernel: [357498.740004] CR2: 00000000fb880000
Jan 28 14:47:32 localhost kernel: [357498.740004] ---[ end trace
5ab85add3f2620f6 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359455267.af3E31.21159
Date: Tue, 29 Jan 2013 10:27:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">bug 60007</a>
              from <span class="vcard"><a class="email" href="mailto:cpanceac&#64;gmail.com" title="Cornel Panceac &lt;cpanceac&#64;gmail.com&gt;"> <span class="fn">Cornel Panceac</span></a>
</span></b>
        <pre>full traces:

Jan 28 14:47:32 localhost kernel: [357498.739893] BUG: unable to handle kernel
paging request at fb880000
Jan 28 14:47:32 localhost kernel: [357498.739913] IP: [&lt;c06957c8&gt;]
iowrite32+0x38/0x40
Jan 28 14:47:32 localhost kernel: [357498.739924] *pdpt = 0000000000cec001 *pde
= 0000000036947067 *pte = 0000000000000000
Jan 28 14:47:32 localhost kernel: [357498.739936] Oops: 0002 [#1] SMP
Jan 28 14:47:32 localhost kernel: [357498.739943] Modules linked in: lp
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
Jan 28 14:47:32 localhost kernel: [357498.740004] Pid: 11705, comm: firefox Not
tainted 3.7.2-204.fc18.i686.PAE #1 Dell Inc. Latitude E6400 /0U695R
Jan 28 14:47:32 localhost kernel: [357498.740004] EIP: 0060:[&lt;c06957c8&gt;]
EFLAGS: 00010292 CPU: 0
Jan 28 14:47:32 localhost kernel: [357498.740004] EIP is at iowrite32+0x38/0x40
Jan 28 14:47:32 localhost kernel: [357498.740004] EAX: 00000000 EBX: f6acc280
ECX: fb880000 EDX: fb880000
Jan 28 14:47:32 localhost kernel: [357498.740004] ESI: f85d81c0 EDI: f85d8080
EBP: ed939bc0 ESP: ed939bb8
Jan 28 14:47:32 localhost kernel: [357498.740004] DS: 007b ES: 007b FS: 00d8
GS: 00e0 SS: 0068
Jan 28 14:47:32 localhost kernel: [357498.740004] CR0: 80050033 CR2: fb880000
CR3: 2d20d000 CR4: 000407f0
Jan 28 14:47:32 localhost kernel: [357498.740004] DR0: 00000000 DR1: 00000000
DR2: 00000000 DR3: 00000000
Jan 28 14:47:32 localhost kernel: [357498.740004] DR6: ffff0ff0 DR7: 00000400
Jan 28 14:47:32 localhost kernel: [357498.740004] Process firefox (pid: 11705,
ti=ed938000 task=e8f33ed0 task.ti=ed938000)
Jan 28 14:47:32 localhost kernel: [357498.740004] Stack:
Jan 28 14:47:32 localhost kernel: [357498.740004] f852fb05 f6acc280 ed939bd0
f852ca68 cc228900 00070004 ed939c14 f852ccef
Jan 28 14:47:32 localhost kernel: [357498.740004] 02000000 00000058 ed939c38
f8590261 0bab0000 00000000 ed939c04 f85d8060
Jan 28 14:47:32 localhost kernel: [357498.740004] f68cf180 00000000 f68cf480
00000000 00000000 00100000 f85d8080 ed939c44
Jan 28 14:47:32 localhost kernel: [357498.740004] Call Trace:
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f852fb05&gt;] ?
nouveau_barobj_wr32+0x15/0x20 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f852ca68&gt;]
_nouveau_gpuobj_wr32+0x28/0x40 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f852ccef&gt;]
nouveau_gpuobj_create_+0x19f/0x270 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8590261&gt;] ?
nouveau_gart_manager_new+0x31/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f852ce06&gt;]
_nouveau_gpuobj_ctor+0x46/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f852e3cb&gt;]
nouveau_object_ctor+0x3b/0xe0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f852ce78&gt;]
nouveau_gpuobj_new+0x58/0x60 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8548c0a&gt;]
nouveau_vm_get+0x18a/0x250 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c05372fa&gt;] ?
map_vm_area+0x3a/0x60
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8593784&gt;]
nouveau_bo_vma_add+0x44/0xf0 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f858e436&gt;]
nouveau_channel_prep+0x1f6/0x310 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f858e583&gt;]
nouveau_channel_new+0x33/0x620 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8595c0d&gt;] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8595c0d&gt;] ?
nouveau_abi16_ioctl_channel_alloc+0xdd/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8595c86&gt;]
nouveau_abi16_ioctl_channel_alloc+0x156/0x350 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8595b30&gt;] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f83c5d62&gt;]
drm_ioctl+0x422/0x480 [drm]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f8595b30&gt;] ?
nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c052d8fd&gt;] ?
handle_mm_fault+0x1ed/0x290
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;f83c5940&gt;] ?
drm_copy_field+0x80/0x80 [drm]
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0568cfa&gt;]
do_vfs_ioctl+0x7a/0x590
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0631f2a&gt;] ?
inode_has_perm.isra.31.constprop.62+0x3a/0x50
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0633570&gt;] ?
file_has_perm+0xa0/0xb0
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0633988&gt;] ?
selinux_file_ioctl+0x48/0xe0
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c056927b&gt;]
sys_ioctl+0x6b/0x80
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c098f94d&gt;]
sysenter_do_call+0x12/0x28
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] [&lt;c0586442&gt;] ?
__block_write_full_page+0x152/0x370
Jan 28 14:47:32 localhost kernel: [357498.740004] Code: 00 01 00 76 0e 81 e2 ff
ff 00 00 ef c3 8d b6 00 00 00 00 55 ba 91 d4 b2 c0 89 e5 89 c8 e8 41 ff ff ff
5d c3 8d b4 26 00 00 00 00 &lt;89&gt; 02 c3 90 8d 74 26 00 81 fa ff ff 03 00 89 d1 77
2e 81 fa 00
Jan 28 14:47:32 localhost kernel: [357498.740004] EIP: [&lt;c06957c8&gt;]
iowrite32+0x38/0x40 SS:ESP 0068:ed939bb8
Jan 28 14:47:32 localhost kernel: [357498.740004] CR2: 00000000fb880000
Jan 28 14:47:32 localhost kernel: [357498.740004] ---[ end trace
5ab85add3f2620f6 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359455267.af3E31.21159--

--===============1584410228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1584410228==--
