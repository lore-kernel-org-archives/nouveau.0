From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101778] New: Kernel Error on Lenovo P51 when setting
 graphics to hybrid (Nvidia Optimus with intel+nvidia)
Date: Thu, 13 Jul 2017 08:53:18 +0000
Message-ID: <bug-101778-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0846721076=="
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


--===============0846721076==
Content-Type: multipart/alternative; boundary="14999359980.AfEb.4419";
 charset="UTF-8"


--14999359980.AfEb.4419
Date: Thu, 13 Jul 2017 08:53:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101778

            Bug ID: 101778
           Summary: Kernel Error on Lenovo P51 when setting graphics to
                    hybrid (Nvidia Optimus with intel+nvidia)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: Development-gH/kpmAylh3vIoy7gQb1Kw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi,

im using a new Lenovo Thinkpad P51 that uses Nvidia Optimus. It has a
integrated Intel graphic (Intel=C2=AE HD Graphics 630) and a descrete Nvidi=
a graphic
(Nvidia Quadro M1200). The Thinkpad is used in combination with a Lenovo
ThinkPad Workstation Dock (Docking Station).

My OS is Debian Buster (Debian Testing).

When using Nouveau and i915 as drivers while using both graphic cards, a ke=
rnel
error occurs (bios is set to hybrid graphics):

---[ end trace 0f5b1e9bbdb82fb3 ]---
 ? system_call_fast_compare_end+0xc/0x9b
 ? SyS_ioctl+0x74/0x80
 ? do_munmap+0x353/0x430
 ? do_vfs_ioctl+0x9f/0x600
 ? nouveau_drm_ioctl+0x66/0xc0 [nouveau]
 ? signal_setup_done+0x67/0xb0
 ? drm_gem_handle_create+0x40/0x40 [drm]
 ? drm_ioctl+0x1ef/0x440 [drm]
 ? drm_gem_handle_delete+0x57/0x80 [drm]
 ? drm_gem_object_release_handle+0x50/0x90 [drm]
 ? nouveau_gem_object_del+0x8d/0xe0 [nouveau]
 ? ttm_bo_release_list+0xc8/0x1f0 [ttm]
 ? nouveau_bo_del_ttm+0x77/0x80 [nouveau]
 ? __warn+0xbe/0xe0
 ? dump_stack+0x5c/0x78
Call Trace:
Hardware name: LENOVO 20HH0014GE/20HH0014GE, BIOS N1UET31W (1.05 ) 02/13/20=
17
CPU: 7 PID: 3782 Comm: Xorg Tainted: P           O    4.11.0-1-amd64 #1 Deb=
ian
4.11.6-1
 ghash_clmulni_intel pcbc aesni_intel aes_x86_64 crypto_simd glue_helper cr=
yptd
ahci libahci psmouse e1000e libata xhci_pci ptp i2c_i801 pps_core xhci_hcd
rtsx_pci nvme mfd_core nvme_core scsi_mod usbcore usb_common thermal i2c_hid
hid
 mxm_wmi snd_hda_codec_realtek rtsx_pci_ms ttm kvm_intel snd_hda_codec_gene=
ric
drm_kms_helper memstick kvm joydev cfg80211 snd_hda_intel drm snd_hda_codec
irqbypass i2c_algo_bit efi_pstore intel_cstate evdev snd_hda_core snd_hwdep
mei_me idma64 intel_
Modules linked in: ctr ccm acpi_call(O) veth xt_nat ipt_MASQUERADE
nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo
xt_addrtype br_netfilter bridge stp llc overlay ip6t_REJECT nf_reject_ipv6
nf_conntrack_ipv6 nf_defrag_ipv6 ip
WARNING: CPU: 7 PID: 3782 at
/build/linux-C5oXKu/linux-4.11.6/drivers/gpu/drm/nouveau/nouveau_bo.c:137
nouveau_bo_del_ttm+0x77/0x80 [nouveau]
------------[ cut here ]------------

[   28.615917] Oops: 0000 [#1] SMP
[   28.615924] Modules linked in: cmac ip6t_REJECT nf_reject_ipv6
nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_filter ip6_tables ipt_REJECT
nf_reject_ipv4 xt_tcpudp xt_conntrack iptable_filter iptable_nat
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_n$
[   28.616065]  memstick ttm efi_pstore drm_kms_helper snd_hda_codec joydev
evdev snd_hda_core mei_me snd_hwdep drm snd_pcm idma64 iTCO_wdt pcspkr
serio_raw efivars iTCO_vendor_support snd_timer sg i2c_algo_bit mei shpchp
intel_pch_thermal intel_lpss_$
[   28.616210]  nvme rtsx_pci mfd_core nvme_core usbcore scsi_mod usb_common
thermal i2c_hid hid
[   28.616230] CPU: 0 PID: 57 Comm: kworker/0:1 Tainted: P           O=20=
=20=20
4.11.0-1-amd64 #1 Debian 4.11.6-1
[   28.616248] Hardware name: LENOVO 20HH0014GE/20HH0014GE, BIOS N1UET31W (=
1.05
) 02/13/2017
[   28.616266] Workqueue: events_long drm_dp_mst_link_probe_work
[drm_kms_helper]
[   28.616280] task: ffff9e947fd92100 task.stack: ffffb20306494000
[   28.616294] RIP: 0010:drm_fb_helper_add_one_connector+0x17/0xd0
[drm_kms_helper]
[   28.616308] RSP: 0018:ffffb20306497c60 EFLAGS: 00010202
[   28.616319] RAX: 0000000000000000 RBX: ffff9e946c19c010 RCX:
0000000000000000
[   28.616333] RDX: ffff9e947cfe8c58 RSI: ffff9e946c19c010 RDI:
0000000000000000
[   28.616347] RBP: ffff9e946c19c010 R08: ffff9e946c1050e0 R09:
0000000000000000
[   28.616360] R10: ffffb20306497c68 R11: 0000000000000001 R12:
ffff9e947dc7c010
[   28.616374] R13: 0000000000000001 R14: ffff9e947a81a780 R15:
ffff9e947dc7c000
[   28.616390] FS:  0000000000000000(0000) GS:ffff9e94af400000(0000)
knlGS:0000000000000000
[   28.616412] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.616424] CR2: 0000000000000008 CR3: 0000000400209000 CR4:
00000000003406f0
[   28.616438] Call Trace:
[   28.616463]  ? nv50_mstm_register_connector+0x2c/0x50 [nouveau]
[   28.616477]  ? drm_dp_add_port+0x32d/0x460 [drm_kms_helper]
[   28.616501]  ? g94_i2c_aux_fini.isra.0+0x27/0x40 [nouveau]
[   28.616523]  ? g94_i2c_aux_xfer+0x6a2/0x7d0 [nouveau]
[   28.616544]  ? nvkm_i2c_aux_release+0x42/0x50 [nouveau]
[   28.616569]  ? nouveau_connector_aux_xfer+0x7f/0xc0 [nouveau]
[   28.616582]  ? drm_dp_dpcd_access+0xee/0x120 [drm_kms_helper]
[   28.616595]  ? drm_dp_send_link_address+0x16b/0x1f0 [drm_kms_helper]
[   28.616610]  ? drm_dp_check_and_send_link_address+0xab/0xb0 [drm_kms_hel=
per]
[   28.616625]  ? drm_dp_mst_link_probe_work+0x4a/0x80 [drm_kms_helper]
[   28.616638]  ? process_one_work+0x197/0x430
[   28.616647]  ? worker_thread+0x4d/0x490
[   28.616656]  ? kthread+0xfc/0x130
[   28.616664]  ? process_one_work+0x430/0x430
[   28.616673]  ? kthread_create_on_node+0x70/0x70
[   28.616683]  ? ret_from_fork+0x26/0x40
[   28.616691] Code: bf f4 ff ff ff e9 7b ff ff ff 66 2e 0f 1f 84 00 00 00 =
00
00 0f 1f 44 00 00 31 c0 80 3d 72 76 00 00 00 74 6b 41 54 55 48 89 f5 53 <48=
> 8b
47 08 48 89 fb 48 8b 80 08 02 00 00 48 a9 f8 ff ff ff 74
[   28.616741] RIP: drm_fb_helper_add_one_connector+0x17/0xd0 [drm_kms_help=
er]
RSP: ffffb20306497c60
[   28.616757] CR2: 0000000000000008
[   28.621441] ---[ end trace f1588c8aea537ee6 ]---

When setting the graphic card to the disrecete nvidia card everything works
fine.

Also see https://bugzilla.kernel.org/show_bug.cgi?id=3D196341.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14999359980.AfEb.4419
Date: Thu, 13 Jul 2017 08:53:18 +0000
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
   title=3D"NEW - Kernel Error on Lenovo P51 when setting graphics to hybri=
d (Nvidia Optimus with intel+nvidia)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101778">101778</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel Error on Lenovo P51 when setting graphics to hybrid (N=
vidia Optimus with intel+nvidia)
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
          <td>Development&#64;Geekparadise.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

im using a new Lenovo Thinkpad P51 that uses Nvidia Optimus. It has a
integrated Intel graphic (Intel=C2=AE HD Graphics 630) and a descrete Nvidi=
a graphic
(Nvidia Quadro M1200). The Thinkpad is used in combination with a Lenovo
ThinkPad Workstation Dock (Docking Station).

My OS is Debian Buster (Debian Testing).

When using Nouveau and i915 as drivers while using both graphic cards, a ke=
rnel
error occurs (bios is set to hybrid graphics):

---[ end trace 0f5b1e9bbdb82fb3 ]---
 ? system_call_fast_compare_end+0xc/0x9b
 ? SyS_ioctl+0x74/0x80
 ? do_munmap+0x353/0x430
 ? do_vfs_ioctl+0x9f/0x600
 ? nouveau_drm_ioctl+0x66/0xc0 [nouveau]
 ? signal_setup_done+0x67/0xb0
 ? drm_gem_handle_create+0x40/0x40 [drm]
 ? drm_ioctl+0x1ef/0x440 [drm]
 ? drm_gem_handle_delete+0x57/0x80 [drm]
 ? drm_gem_object_release_handle+0x50/0x90 [drm]
 ? nouveau_gem_object_del+0x8d/0xe0 [nouveau]
 ? ttm_bo_release_list+0xc8/0x1f0 [ttm]
 ? nouveau_bo_del_ttm+0x77/0x80 [nouveau]
 ? __warn+0xbe/0xe0
 ? dump_stack+0x5c/0x78
Call Trace:
Hardware name: LENOVO 20HH0014GE/20HH0014GE, BIOS N1UET31W (1.05 ) 02/13/20=
17
CPU: 7 PID: 3782 Comm: Xorg Tainted: P           O    4.11.0-1-amd64 #1 Deb=
ian
4.11.6-1
 ghash_clmulni_intel pcbc aesni_intel aes_x86_64 crypto_simd glue_helper cr=
yptd
ahci libahci psmouse e1000e libata xhci_pci ptp i2c_i801 pps_core xhci_hcd
rtsx_pci nvme mfd_core nvme_core scsi_mod usbcore usb_common thermal i2c_hid
hid
 mxm_wmi snd_hda_codec_realtek rtsx_pci_ms ttm kvm_intel snd_hda_codec_gene=
ric
drm_kms_helper memstick kvm joydev cfg80211 snd_hda_intel drm snd_hda_codec
irqbypass i2c_algo_bit efi_pstore intel_cstate evdev snd_hda_core snd_hwdep
mei_me idma64 intel_
Modules linked in: ctr ccm acpi_call(O) veth xt_nat ipt_MASQUERADE
nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo
xt_addrtype br_netfilter bridge stp llc overlay ip6t_REJECT nf_reject_ipv6
nf_conntrack_ipv6 nf_defrag_ipv6 ip
WARNING: CPU: 7 PID: 3782 at
/build/linux-C5oXKu/linux-4.11.6/drivers/gpu/drm/nouveau/nouveau_bo.c:137
nouveau_bo_del_ttm+0x77/0x80 [nouveau]
------------[ cut here ]------------

[   28.615917] Oops: 0000 [#1] SMP
[   28.615924] Modules linked in: cmac ip6t_REJECT nf_reject_ipv6
nf_conntrack_ipv6 nf_defrag_ipv6 ip6table_filter ip6_tables ipt_REJECT
nf_reject_ipv4 xt_tcpudp xt_conntrack iptable_filter iptable_nat
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_n$
[   28.616065]  memstick ttm efi_pstore drm_kms_helper snd_hda_codec joydev
evdev snd_hda_core mei_me snd_hwdep drm snd_pcm idma64 iTCO_wdt pcspkr
serio_raw efivars iTCO_vendor_support snd_timer sg i2c_algo_bit mei shpchp
intel_pch_thermal intel_lpss_$
[   28.616210]  nvme rtsx_pci mfd_core nvme_core usbcore scsi_mod usb_common
thermal i2c_hid hid
[   28.616230] CPU: 0 PID: 57 Comm: kworker/0:1 Tainted: P           O=20=
=20=20
4.11.0-1-amd64 #1 Debian 4.11.6-1
[   28.616248] Hardware name: LENOVO 20HH0014GE/20HH0014GE, BIOS N1UET31W (=
1.05
) 02/13/2017
[   28.616266] Workqueue: events_long drm_dp_mst_link_probe_work
[drm_kms_helper]
[   28.616280] task: ffff9e947fd92100 task.stack: ffffb20306494000
[   28.616294] RIP: 0010:drm_fb_helper_add_one_connector+0x17/0xd0
[drm_kms_helper]
[   28.616308] RSP: 0018:ffffb20306497c60 EFLAGS: 00010202
[   28.616319] RAX: 0000000000000000 RBX: ffff9e946c19c010 RCX:
0000000000000000
[   28.616333] RDX: ffff9e947cfe8c58 RSI: ffff9e946c19c010 RDI:
0000000000000000
[   28.616347] RBP: ffff9e946c19c010 R08: ffff9e946c1050e0 R09:
0000000000000000
[   28.616360] R10: ffffb20306497c68 R11: 0000000000000001 R12:
ffff9e947dc7c010
[   28.616374] R13: 0000000000000001 R14: ffff9e947a81a780 R15:
ffff9e947dc7c000
[   28.616390] FS:  0000000000000000(0000) GS:ffff9e94af400000(0000)
knlGS:0000000000000000
[   28.616412] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   28.616424] CR2: 0000000000000008 CR3: 0000000400209000 CR4:
00000000003406f0
[   28.616438] Call Trace:
[   28.616463]  ? nv50_mstm_register_connector+0x2c/0x50 [nouveau]
[   28.616477]  ? drm_dp_add_port+0x32d/0x460 [drm_kms_helper]
[   28.616501]  ? g94_i2c_aux_fini.isra.0+0x27/0x40 [nouveau]
[   28.616523]  ? g94_i2c_aux_xfer+0x6a2/0x7d0 [nouveau]
[   28.616544]  ? nvkm_i2c_aux_release+0x42/0x50 [nouveau]
[   28.616569]  ? nouveau_connector_aux_xfer+0x7f/0xc0 [nouveau]
[   28.616582]  ? drm_dp_dpcd_access+0xee/0x120 [drm_kms_helper]
[   28.616595]  ? drm_dp_send_link_address+0x16b/0x1f0 [drm_kms_helper]
[   28.616610]  ? drm_dp_check_and_send_link_address+0xab/0xb0 [drm_kms_hel=
per]
[   28.616625]  ? drm_dp_mst_link_probe_work+0x4a/0x80 [drm_kms_helper]
[   28.616638]  ? process_one_work+0x197/0x430
[   28.616647]  ? worker_thread+0x4d/0x490
[   28.616656]  ? kthread+0xfc/0x130
[   28.616664]  ? process_one_work+0x430/0x430
[   28.616673]  ? kthread_create_on_node+0x70/0x70
[   28.616683]  ? ret_from_fork+0x26/0x40
[   28.616691] Code: bf f4 ff ff ff e9 7b ff ff ff 66 2e 0f 1f 84 00 00 00 =
00
00 0f 1f 44 00 00 31 c0 80 3d 72 76 00 00 00 74 6b 41 54 55 48 89 f5 53 &lt=
;48&gt; 8b
47 08 48 89 fb 48 8b 80 08 02 00 00 48 a9 f8 ff ff ff 74
[   28.616741] RIP: drm_fb_helper_add_one_connector+0x17/0xd0 [drm_kms_help=
er]
RSP: ffffb20306497c60
[   28.616757] CR2: 0000000000000008
[   28.621441] ---[ end trace f1588c8aea537ee6 ]---

When setting the graphic card to the disrecete nvidia card everything works
fine.

Also see <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D196341">h=
ttps://bugzilla.kernel.org/show_bug.cgi?id=3D196341</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14999359980.AfEb.4419--

--===============0846721076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0846721076==--
