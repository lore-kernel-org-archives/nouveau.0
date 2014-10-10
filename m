From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84880] New: [NV94] X freeze on nouveau list_del
 corruption / unable to handle kernel paging request
Date: Fri, 10 Oct 2014 18:14:05 +0000
Message-ID: <bug-84880-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0669159869=="
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


--===============0669159869==
Content-Type: multipart/alternative; boundary="1412964845.E7CBBe11.19726"; charset="UTF-8"


--1412964845.E7CBBe11.19726
Date: Fri, 10 Oct 2014 18:14:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84880

            Bug ID: 84880
           Summary: [NV94] X freeze on nouveau list_del corruption /
                    unable to handle kernel paging request
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Running kernel-3.17.0-301.fc21 on Fedora 21 (more or less 3.17.0 upstream I
believe), my desktop (GNOME 3.14) froze while I was zooming in Google Maps in
Firefox. I could ssh in and interact with the system normally and trigger a
reboot, but X was stuck. Logs show a kernel WARNING: __list_del corruption ,
followed by a BUG: unable to handle kernel paging request. Pasting both traces
in-line. The traces are separated from any other log messages by 3 minutes, so
I don't think anything else is relevant.

Oct 10 10:36:18 adam.happyassassin.net kernel: ------------[ cut here
]------------
Oct 10 10:36:18 adam.happyassassin.net kernel: WARNING: CPU: 0 PID: 1516 at
lib/list_debug.c:62 __list_del_entry+0xdd/0xe0()
Oct 10 10:36:18 adam.happyassassin.net kernel: list_del corruption. next->prev
should be ffff8801b5727240, but was ffff8001b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel: Modules linked in:
rpcsec_gss_krb5 auth_rpcgss nfsv4 nfs lockd rfcomm arc4 md4 nls_utf8 cifs
dns_resolver fscache fuse xt_CHECKSUM ipt_MASQUERADE vhost_net tun vhost
macvtap macvlan nf_conntrack_netbios_ns nf_conntrack_broadcast ip6t_rpfilter
ip6t_REJECT xt_conntrack cfg80211 ebtable_nat ebtable_broute bridge stp llc
ebtable_filter ebtables ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_raw ip6table_filter
ip6_tables iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat
nf_conntrack iptable_mangle iptable_security iptable_raw bnep uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common videodev
snd_usb_audio uas snd_usbmidi_lib joydev btusb usb_storage media snd_rawmidi
bluetooth x86_pkg_temp_thermal coretemp
Oct 10 10:36:18 adam.happyassassin.net kernel:  kvm_intel kvm eeepc_wmi
asus_wmi iTCO_wdt sparse_keymap rfkill iTCO_vendor_support crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel snd_hda_codec_realtek
snd_hda_codec_generic serio_raw i2c_i801 snd_hda_intel snd_hda_controller
lpc_ich snd_hda_codec mfd_core snd_hwdep snd_seq snd_seq_device snd_pcm
snd_timer snd mei_me mei soundcore shpchp sunrpc binfmt_misc nouveau video
i2c_algo_bit drm_kms_helper e1000e ttm firewire_ohci mxm_wmi drm firewire_core
ptp crc_itu_t pps_core wmi
Oct 10 10:36:18 adam.happyassassin.net kernel: CPU: 0 PID: 1516 Comm: Xorg.bin
Not tainted 3.17.0-301.fc21.x86_64 #1
Oct 10 10:36:18 adam.happyassassin.net kernel: Hardware name: System
manufacturer System Product Name/P8P67 DELUXE, BIOS 1703 05/27/2011
Oct 10 10:36:18 adam.happyassassin.net kernel:  0000000000000000
00000000905d5f2b ffff88042608fca0 ffffffff8173c311
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff88042608fce8
ffff88042608fcd8 ffffffff81096e8d ffff8801b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff8804085c9560
ffff8801b5727240 ffff8801b5727240 ffff8804085c9500
Oct 10 10:36:18 adam.happyassassin.net kernel: Call Trace:
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff8173c311>]
dump_stack+0x45/0x56
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff81096e8d>]
warn_slowpath_common+0x7d/0xa0
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff81096f0c>]
warn_slowpath_fmt+0x5c/0x80
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff8139abed>]
__list_del_entry+0xdd/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff8139abfd>]
list_del+0xd/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00902e8>]
ttm_dma_unpopulate+0x2c8/0x360 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa01a8bbd>]
nouveau_ttm_tt_unpopulate+0x11d/0x130 [nouveau]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00871e4>]
ttm_tt_unpopulate+0x54/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa0087255>]
ttm_tt_destroy+0x65/0x70 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa008787f>]
ttm_bo_cleanup_memtype_use+0x3f/0x90 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00886a3>]
ttm_bo_release+0x273/0x2a0 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00886f9>]
ttm_bo_unref+0x29/0x30 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa008bd14>]
ttm_bo_vm_close+0x34/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811c6a72>]
remove_vma+0x32/0x70
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811c9047>]
do_munmap+0x247/0x440
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811c9281>]
vm_munmap+0x41/0x60
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811ca2b2>]
SyS_munmap+0x22/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff81743469>]
system_call_fastpath+0x16/0x1b
Oct 10 10:36:18 adam.happyassassin.net kernel: ---[ end trace 7114183afcc2fd6d
]---
Oct 10 10:36:18 adam.happyassassin.net kernel: BUG: unable to handle kernel
paging request at ffff8001b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel: IP: [<ffffffff8139ab39>]
__list_del_entry+0x29/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel: PGD 0 
Oct 10 10:36:18 adam.happyassassin.net kernel: Oops: 0000 [#1] SMP 
Oct 10 10:36:18 adam.happyassassin.net kernel: Modules linked in:
rpcsec_gss_krb5 auth_rpcgss nfsv4 nfs lockd rfcomm arc4 md4 nls_utf8 cifs
dns_resolver fscache fuse xt_CHECKSUM ipt_MASQUERADE vhost_net tun vhost
macvtap macvlan nf_conntrack_netbios_ns nf_conntrack_broadcast ip6t_rpfilter
ip6t_REJECT xt_conntrack cfg80211 ebtable_nat ebtable_broute bridge stp llc
ebtable_filter ebtables ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_raw ip6table_filter
ip6_tables iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat
nf_conntrack iptable_mangle iptable_security iptable_raw bnep uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common videodev
snd_usb_audio uas snd_usbmidi_lib joydev btusb usb_storage media snd_rawmidi
bluetooth x86_pkg_temp_thermal coretemp
Oct 10 10:36:18 adam.happyassassin.net kernel:  kvm_intel kvm eeepc_wmi
asus_wmi iTCO_wdt sparse_keymap rfkill iTCO_vendor_support crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel snd_hda_codec_realtek
snd_hda_codec_generic serio_raw i2c_i801 snd_hda_intel snd_hda_controller
lpc_ich snd_hda_codec mfd_core snd_hwdep snd_seq snd_seq_device snd_pcm
snd_timer snd mei_me mei soundcore shpchp sunrpc binfmt_misc nouveau video
i2c_algo_bit drm_kms_helper e1000e ttm firewire_ohci mxm_wmi drm firewire_core
ptp crc_itu_t pps_core wmi
Oct 10 10:36:18 adam.happyassassin.net kernel: CPU: 0 PID: 1516 Comm: Xorg.bin
Tainted: G        W      3.17.0-301.fc21.x86_64 #1
Oct 10 10:36:18 adam.happyassassin.net kernel: Hardware name: System
manufacturer System Product Name/P8P67 DELUXE, BIOS 1703 05/27/2011
Oct 10 10:36:18 adam.happyassassin.net kernel: task: ffff880418cbebf0 ti:
ffff88042608c000 task.ti: ffff88042608c000
Oct 10 10:36:18 adam.happyassassin.net kernel: RIP: 0010:[<ffffffff8139ab39>] 
[<ffffffff8139ab39>] __list_del_entry+0x29/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel: RSP: 0018:ffff88042608fd50 
EFLAGS: 00010202
Oct 10 10:36:18 adam.happyassassin.net kernel: RAX: ffff8801b57277c0 RBX:
ffff8801b5727440 RCX: dead000000200200
Oct 10 10:36:18 adam.happyassassin.net kernel: RDX: ffff8001b5727240 RSI:
ffff8800b9f48301 RDI: ffff8801b5727440
Oct 10 10:36:18 adam.happyassassin.net kernel: RBP: ffff88042608fd50 R08:
00000000b5727501 R09: 000000018040001e
Oct 10 10:36:18 adam.happyassassin.net kernel: R10: ffffffffa008fb2e R11:
ffff8801b57275c0 R12: ffff8804085c9560
Oct 10 10:36:18 adam.happyassassin.net kernel: R13: ffff8801b5727440 R14:
ffff8801b5727440 R15: ffff8804085c9500
Oct 10 10:36:18 adam.happyassassin.net kernel: FS:  00007f742949c9c0(0000)
GS:ffff88043f400000(0000) knlGS:0000000000000000
Oct 10 10:36:18 adam.happyassassin.net kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Oct 10 10:36:18 adam.happyassassin.net kernel: CR2: ffff8001b5727240 CR3:
00000000ba905000 CR4: 00000000000427e0
Oct 10 10:36:18 adam.happyassassin.net kernel: Stack:
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff88042608fd68
ffffffff8139abfd ffff880425e6b9c0 ffff88042608fdb8
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffffffffa00902e8
ffff880425e6ba31 ffff880425e6b9c0 ffff8801b57277c0
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff8804085c9500
ffff8804249c0000 ffff880428458098 ffff8802e1006030
Oct 10 10:36:18 adam.happyassassin.net kernel: Call Trace:
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff8139abfd>]
list_del+0xd/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00902e8>]
ttm_dma_unpopulate+0x2c8/0x360 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa01a8bbd>]
nouveau_ttm_tt_unpopulate+0x11d/0x130 [nouveau]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00871e4>]
ttm_tt_unpopulate+0x54/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa0087255>]
ttm_tt_destroy+0x65/0x70 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa008787f>]
ttm_bo_cleanup_memtype_use+0x3f/0x90 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00886a3>]
ttm_bo_release+0x273/0x2a0 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa00886f9>]
ttm_bo_unref+0x29/0x30 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffffa008bd14>]
ttm_bo_vm_close+0x34/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811c6a72>]
remove_vma+0x32/0x70
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811c9047>]
do_munmap+0x247/0x440
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811c9281>]
vm_munmap+0x41/0x60
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff811ca2b2>]
SyS_munmap+0x22/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [<ffffffff81743469>]
system_call_fastpath+0x16/0x1b
Oct 10 10:36:18 adam.happyassassin.net kernel: Code: 00 00 55 48 8b 07 48 b9 00
01 10 00 00 00 ad de 48 8b 57 08 48 89 e5 48 39 c8 74 36 48 b9 00 02 20 00 00
00 ad de 48 39 ca 74 4f <4c> 8b 02 4c 39 c7 75 6f 4c 8b 40 08 4c 39 c7 0f 85 82
00 00 00 
Oct 10 10:36:18 adam.happyassassin.net kernel: RIP  [<ffffffff8139ab39>]
__list_del_entry+0x29/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel:  RSP <ffff88042608fd50>
Oct 10 10:36:18 adam.happyassassin.net kernel: CR2: ffff8001b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel: ---[ end trace 7114183afcc2fd6e
]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412964845.E7CBBe11.19726
Date: Fri, 10 Oct 2014 18:14:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X freeze on nouveau list_del corruption / unable to handle kernel paging request"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84880">84880</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV94] X freeze on nouveau list_del corruption / unable to handle kernel paging request
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
          <td>critical
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
          <td>adamw&#64;happyassassin.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Running kernel-3.17.0-301.fc21 on Fedora 21 (more or less 3.17.0 upstream I
believe), my desktop (GNOME 3.14) froze while I was zooming in Google Maps in
Firefox. I could ssh in and interact with the system normally and trigger a
reboot, but X was stuck. Logs show a kernel WARNING: __list_del corruption ,
followed by a BUG: unable to handle kernel paging request. Pasting both traces
in-line. The traces are separated from any other log messages by 3 minutes, so
I don't think anything else is relevant.

Oct 10 10:36:18 adam.happyassassin.net kernel: ------------[ cut here
]------------
Oct 10 10:36:18 adam.happyassassin.net kernel: WARNING: CPU: 0 PID: 1516 at
lib/list_debug.c:62 __list_del_entry+0xdd/0xe0()
Oct 10 10:36:18 adam.happyassassin.net kernel: list_del corruption. next-&gt;prev
should be ffff8801b5727240, but was ffff8001b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel: Modules linked in:
rpcsec_gss_krb5 auth_rpcgss nfsv4 nfs lockd rfcomm arc4 md4 nls_utf8 cifs
dns_resolver fscache fuse xt_CHECKSUM ipt_MASQUERADE vhost_net tun vhost
macvtap macvlan nf_conntrack_netbios_ns nf_conntrack_broadcast ip6t_rpfilter
ip6t_REJECT xt_conntrack cfg80211 ebtable_nat ebtable_broute bridge stp llc
ebtable_filter ebtables ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_raw ip6table_filter
ip6_tables iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat
nf_conntrack iptable_mangle iptable_security iptable_raw bnep uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common videodev
snd_usb_audio uas snd_usbmidi_lib joydev btusb usb_storage media snd_rawmidi
bluetooth x86_pkg_temp_thermal coretemp
Oct 10 10:36:18 adam.happyassassin.net kernel:  kvm_intel kvm eeepc_wmi
asus_wmi iTCO_wdt sparse_keymap rfkill iTCO_vendor_support crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel snd_hda_codec_realtek
snd_hda_codec_generic serio_raw i2c_i801 snd_hda_intel snd_hda_controller
lpc_ich snd_hda_codec mfd_core snd_hwdep snd_seq snd_seq_device snd_pcm
snd_timer snd mei_me mei soundcore shpchp sunrpc binfmt_misc nouveau video
i2c_algo_bit drm_kms_helper e1000e ttm firewire_ohci mxm_wmi drm firewire_core
ptp crc_itu_t pps_core wmi
Oct 10 10:36:18 adam.happyassassin.net kernel: CPU: 0 PID: 1516 Comm: Xorg.bin
Not tainted 3.17.0-301.fc21.x86_64 #1
Oct 10 10:36:18 adam.happyassassin.net kernel: Hardware name: System
manufacturer System Product Name/P8P67 DELUXE, BIOS 1703 05/27/2011
Oct 10 10:36:18 adam.happyassassin.net kernel:  0000000000000000
00000000905d5f2b ffff88042608fca0 ffffffff8173c311
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff88042608fce8
ffff88042608fcd8 ffffffff81096e8d ffff8801b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff8804085c9560
ffff8801b5727240 ffff8801b5727240 ffff8804085c9500
Oct 10 10:36:18 adam.happyassassin.net kernel: Call Trace:
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff8173c311&gt;]
dump_stack+0x45/0x56
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff81096e8d&gt;]
warn_slowpath_common+0x7d/0xa0
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff81096f0c&gt;]
warn_slowpath_fmt+0x5c/0x80
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff8139abed&gt;]
__list_del_entry+0xdd/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff8139abfd&gt;]
list_del+0xd/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00902e8&gt;]
ttm_dma_unpopulate+0x2c8/0x360 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa01a8bbd&gt;]
nouveau_ttm_tt_unpopulate+0x11d/0x130 [nouveau]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00871e4&gt;]
ttm_tt_unpopulate+0x54/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa0087255&gt;]
ttm_tt_destroy+0x65/0x70 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa008787f&gt;]
ttm_bo_cleanup_memtype_use+0x3f/0x90 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00886a3&gt;]
ttm_bo_release+0x273/0x2a0 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00886f9&gt;]
ttm_bo_unref+0x29/0x30 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa008bd14&gt;]
ttm_bo_vm_close+0x34/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811c6a72&gt;]
remove_vma+0x32/0x70
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811c9047&gt;]
do_munmap+0x247/0x440
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811c9281&gt;]
vm_munmap+0x41/0x60
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811ca2b2&gt;]
SyS_munmap+0x22/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff81743469&gt;]
system_call_fastpath+0x16/0x1b
Oct 10 10:36:18 adam.happyassassin.net kernel: ---[ end trace 7114183afcc2fd6d
]---
Oct 10 10:36:18 adam.happyassassin.net kernel: BUG: unable to handle kernel
paging request at ffff8001b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel: IP: [&lt;ffffffff8139ab39&gt;]
__list_del_entry+0x29/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel: PGD 0 
Oct 10 10:36:18 adam.happyassassin.net kernel: Oops: 0000 [#1] SMP 
Oct 10 10:36:18 adam.happyassassin.net kernel: Modules linked in:
rpcsec_gss_krb5 auth_rpcgss nfsv4 nfs lockd rfcomm arc4 md4 nls_utf8 cifs
dns_resolver fscache fuse xt_CHECKSUM ipt_MASQUERADE vhost_net tun vhost
macvtap macvlan nf_conntrack_netbios_ns nf_conntrack_broadcast ip6t_rpfilter
ip6t_REJECT xt_conntrack cfg80211 ebtable_nat ebtable_broute bridge stp llc
ebtable_filter ebtables ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_raw ip6table_filter
ip6_tables iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat
nf_conntrack iptable_mangle iptable_security iptable_raw bnep uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common videodev
snd_usb_audio uas snd_usbmidi_lib joydev btusb usb_storage media snd_rawmidi
bluetooth x86_pkg_temp_thermal coretemp
Oct 10 10:36:18 adam.happyassassin.net kernel:  kvm_intel kvm eeepc_wmi
asus_wmi iTCO_wdt sparse_keymap rfkill iTCO_vendor_support crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel snd_hda_codec_realtek
snd_hda_codec_generic serio_raw i2c_i801 snd_hda_intel snd_hda_controller
lpc_ich snd_hda_codec mfd_core snd_hwdep snd_seq snd_seq_device snd_pcm
snd_timer snd mei_me mei soundcore shpchp sunrpc binfmt_misc nouveau video
i2c_algo_bit drm_kms_helper e1000e ttm firewire_ohci mxm_wmi drm firewire_core
ptp crc_itu_t pps_core wmi
Oct 10 10:36:18 adam.happyassassin.net kernel: CPU: 0 PID: 1516 Comm: Xorg.bin
Tainted: G        W      3.17.0-301.fc21.x86_64 #1
Oct 10 10:36:18 adam.happyassassin.net kernel: Hardware name: System
manufacturer System Product Name/P8P67 DELUXE, BIOS 1703 05/27/2011
Oct 10 10:36:18 adam.happyassassin.net kernel: task: ffff880418cbebf0 ti:
ffff88042608c000 task.ti: ffff88042608c000
Oct 10 10:36:18 adam.happyassassin.net kernel: RIP: 0010:[&lt;ffffffff8139ab39&gt;] 
[&lt;ffffffff8139ab39&gt;] __list_del_entry+0x29/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel: RSP: 0018:ffff88042608fd50 
EFLAGS: 00010202
Oct 10 10:36:18 adam.happyassassin.net kernel: RAX: ffff8801b57277c0 RBX:
ffff8801b5727440 RCX: dead000000200200
Oct 10 10:36:18 adam.happyassassin.net kernel: RDX: ffff8001b5727240 RSI:
ffff8800b9f48301 RDI: ffff8801b5727440
Oct 10 10:36:18 adam.happyassassin.net kernel: RBP: ffff88042608fd50 R08:
00000000b5727501 R09: 000000018040001e
Oct 10 10:36:18 adam.happyassassin.net kernel: R10: ffffffffa008fb2e R11:
ffff8801b57275c0 R12: ffff8804085c9560
Oct 10 10:36:18 adam.happyassassin.net kernel: R13: ffff8801b5727440 R14:
ffff8801b5727440 R15: ffff8804085c9500
Oct 10 10:36:18 adam.happyassassin.net kernel: FS:  00007f742949c9c0(0000)
GS:ffff88043f400000(0000) knlGS:0000000000000000
Oct 10 10:36:18 adam.happyassassin.net kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Oct 10 10:36:18 adam.happyassassin.net kernel: CR2: ffff8001b5727240 CR3:
00000000ba905000 CR4: 00000000000427e0
Oct 10 10:36:18 adam.happyassassin.net kernel: Stack:
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff88042608fd68
ffffffff8139abfd ffff880425e6b9c0 ffff88042608fdb8
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffffffffa00902e8
ffff880425e6ba31 ffff880425e6b9c0 ffff8801b57277c0
Oct 10 10:36:18 adam.happyassassin.net kernel:  ffff8804085c9500
ffff8804249c0000 ffff880428458098 ffff8802e1006030
Oct 10 10:36:18 adam.happyassassin.net kernel: Call Trace:
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff8139abfd&gt;]
list_del+0xd/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00902e8&gt;]
ttm_dma_unpopulate+0x2c8/0x360 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa01a8bbd&gt;]
nouveau_ttm_tt_unpopulate+0x11d/0x130 [nouveau]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00871e4&gt;]
ttm_tt_unpopulate+0x54/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa0087255&gt;]
ttm_tt_destroy+0x65/0x70 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa008787f&gt;]
ttm_bo_cleanup_memtype_use+0x3f/0x90 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00886a3&gt;]
ttm_bo_release+0x273/0x2a0 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa00886f9&gt;]
ttm_bo_unref+0x29/0x30 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffffa008bd14&gt;]
ttm_bo_vm_close+0x34/0x60 [ttm]
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811c6a72&gt;]
remove_vma+0x32/0x70
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811c9047&gt;]
do_munmap+0x247/0x440
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811c9281&gt;]
vm_munmap+0x41/0x60
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff811ca2b2&gt;]
SyS_munmap+0x22/0x30
Oct 10 10:36:18 adam.happyassassin.net kernel:  [&lt;ffffffff81743469&gt;]
system_call_fastpath+0x16/0x1b
Oct 10 10:36:18 adam.happyassassin.net kernel: Code: 00 00 55 48 8b 07 48 b9 00
01 10 00 00 00 ad de 48 8b 57 08 48 89 e5 48 39 c8 74 36 48 b9 00 02 20 00 00
00 ad de 48 39 ca 74 4f &lt;4c&gt; 8b 02 4c 39 c7 75 6f 4c 8b 40 08 4c 39 c7 0f 85 82
00 00 00 
Oct 10 10:36:18 adam.happyassassin.net kernel: RIP  [&lt;ffffffff8139ab39&gt;]
__list_del_entry+0x29/0xe0
Oct 10 10:36:18 adam.happyassassin.net kernel:  RSP &lt;ffff88042608fd50&gt;
Oct 10 10:36:18 adam.happyassassin.net kernel: CR2: ffff8001b5727240
Oct 10 10:36:18 adam.happyassassin.net kernel: ---[ end trace 7114183afcc2fd6e
]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412964845.E7CBBe11.19726--

--===============0669159869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0669159869==--
