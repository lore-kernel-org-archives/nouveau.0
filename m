From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105687] New: BUG: unable to handle kernel NULL
 pointer dereference at 0000000000000ca0
Date: Thu, 22 Mar 2018 09:18:32 +0000
Message-ID: <bug-105687-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0936432305=="
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


--===============0936432305==
Content-Type: multipart/alternative; boundary="15217103120.eAE0FC40.25898"
Content-Transfer-Encoding: 7bit


--15217103120.eAE0FC40.25898
Date: Thu, 22 Mar 2018 09:18:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105687

            Bug ID: 105687
           Summary: BUG: unable to handle kernel NULL pointer dereference
                    at 0000000000000ca0
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: philip.raets-CNXmb7IdZIWZIoH1IeqzKA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 138274
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138274&action=3Dedit
dmesg

With testing of kernel 4.16 rc6 (from openSUSE Kernel Head) I now get the
following error (and gui freeze):

[  132.906691] BUG: unable to handle kernel NULL pointer dereference at
0000000000000ca0
[  132.906737] IP: nouveau_mem_host+0x4b/0x180 [nouveau]
[  132.906741] PGD 0 P4D 0=20
[  132.906746] Oops: 0000 [#1] PREEMPT SMP PTI
[  132.906750] Modules linked in: fuse arc4 md4 nls_utf8 cifs ccm dns_resol=
ver
fscache af_packet veeamsnap(O) vhost_net vhost tap tun nf_conntrack_netbios=
_ns
nf_conntrack_broadcast xt_CT xt_tcpudp ip6t_rpfilter ip6t_REJECT nf_reject_=
ipv6
ipt_REJECT nf_reject_ipv4 xt_conntrack devlink ip_set nfnetlink ebtable_nat
ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security iptable_nat
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack libcrc32c
iptable_mangle iptable_raw iptable_security ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables x_tables snd_hda_codec_=
hdmi
msr snd_hda_codec_realtek snd_hda_codec_generic mei_wdt snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl
[  132.906806]  x86_pkg_temp_thermal intel_powerclamp coretemp snd_timer
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel pcbc snd hid_generic iTCO_wdt iTCO_vendor_support uas
dcdbas aesni_intel mei_me e1000e aes_x86_64 crypto_simd glue_helper cryptd
usbhid usb_storage pcspkr i2c_i801 soundcore mei ptp shpchp lpc_ich pps_core
serio_raw sr_mod cdrom nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper
syscopyarea ehci_pci sysfillrect sysimgblt fb_sys_fops ehci_hcd ttm usbcore=
 drm
video button sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[  132.906853] CPU: 0 PID: 5076 Comm: X Tainted: G           O=20=20=20=20
4.16.0-rc6-2.gf39c456-default #1 openSUSE Tumbleweed (unreleased)
[  132.906859] Hardware name: Dell Inc. OptiPlex 790/0HY9JP, BIOS A19
05/07/2017
[  132.906886] RIP: 0010:nouveau_mem_host+0x4b/0x180 [nouveau]
[  132.906890] RSP: 0018:ffffac7808307838 EFLAGS: 00010282
[  132.906894] RAX: ffff95c0faa30938 RBX: ffff95c0faa30840 RCX:
0000000003fdd2c0
[  132.906898] RDX: ffff95c0faa56480 RSI: ffff95c050c03f80 RDI:
0000000000000000
[  132.906905] RBP: ffff95c056f8da00 R08: ffff95bd40000328 R09:
0000000000000001
[  132.906909] R10: 0000000000000000 R11: 0000000000000008 R12:
ffffac7808307988
[  132.906914] R13: 0000000000000000 R14: ffff95c056f8da00 R15:
ffffac7808307988
[  132.906918] FS:  00007fc21078d940(0000) GS:ffff95c15d200000(0000)
knlGS:0000000000000000
[  132.906923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  132.906927] CR2: 0000000000000ca0 CR3: 000000041c62a001 CR4:
00000000000626f0
[  132.906931] Call Trace:
[  132.906958]  nv50_sgdma_bind+0x18/0x30 [nouveau]
[  132.906966]  ttm_tt_bind+0x42/0x60 [ttm]
[  132.906972]  ttm_bo_handle_move_mem+0x577/0x5b0 [ttm]
[  132.906979]  ttm_bo_evict+0x115/0x2f0 [ttm]
[  132.907002]  ? nv44_mmu_new+0x60/0x60 [nouveau]
[  132.907017]  ? drm_add_edid_modes.part.29+0x1911/0x19b0 [drm]
[  132.907024]  ttm_mem_evict_first+0x190/0x200 [ttm]
[  132.907030]  ttm_bo_mem_space+0x328/0x4a0 [ttm]
[  132.907036]  ttm_bo_validate+0x98/0x110 [ttm]
[  132.907047]  ? drm_vma_offset_add+0x41/0x60 [drm]
[  132.907057]  ? drm_add_edid_modes.part.29+0x193e/0x19b0 [drm]
[  132.907064]  ttm_bo_init_reserved+0x382/0x430 [ttm]
[  132.907069]  ttm_bo_init+0x52/0xc0 [ttm]
[  132.907093]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
[  132.907117]  ? nouveau_gem_ioctl_pushbuf+0x9bf/0x1600 [nouveau]
[  132.907141]  nouveau_bo_new+0x416/0x590 [nouveau]
[  132.907164]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
[  132.907188]  ? nouveau_gem_new+0x100/0x100 [nouveau]
[  132.907210]  nouveau_gem_new+0x49/0x100 [nouveau]
[  132.907233]  nouveau_gem_ioctl_new+0x41/0xc0 [nouveau]
[  132.907243]  drm_ioctl_kernel+0x5b/0xb0 [drm]
[  132.907253]  drm_ioctl+0x2ad/0x350 [drm]
[  132.907276]  ? nouveau_gem_new+0x100/0x100 [nouveau]
[  132.907282]  ? current_time+0x18/0x70
[  132.907306]  nouveau_drm_ioctl+0x64/0xc0 [nouveau]
[  132.907312]  do_vfs_ioctl+0x90/0x5f0
[  132.907317]  ? __fput+0x174/0x210
[  132.907321]  ? __fget+0x6e/0xb0
[  132.907325]  SyS_ioctl+0x74/0x80
[  132.907330]  do_syscall_64+0x76/0x140
[  132.907336]  entry_SYSCALL_64_after_hwframe+0x42/0xb7
[  132.907340] RIP: 0033:0x7fc20e07a967
[  132.907343] RSP: 002b:00007ffd8654b8f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  132.907349] RAX: ffffffffffffffda RBX: 000055e8b70add90 RCX:
00007fc20e07a967
[  132.907353] RDX: 00007ffd8654b950 RSI: 00000000c0306480 RDI:
000000000000000d
[  132.907357] RBP: 00007ffd8654b950 R08: 0000000000000000 R09:
000055e8b70d3d60
[  132.907361] R10: 0000000000000008 R11: 0000000000000246 R12:
00000000c0306480
[  132.907366] R13: 000000000000000d R14: 000055e8b70d3df0 R15:
000055e8b671f8c0
[  132.907371] Code: 08 00 00 00 00 48 c7 44 24 10 00 00 00 00 48 c7 44 24 =
18
00 00 00 00 48 8b 7b 40 48 8d 83 f8 00 00 00 44 0f b6 6b 39 48 89 04 24 <48=
> 63
8f a0 0c 00 00 48 8b 97 78 03 00 00 80 3c 4a 00 0f 88 fc=20
[  132.907419] RIP: nouveau_mem_host+0x4b/0x180 [nouveau] RSP: ffffac780830=
7838
[  132.907423] CR2: 0000000000000ca0
[  132.913485] ---[ end trace c985cc3c9d3ceb61 ]---

It already happened twice today while browsing some pictures

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15217103120.eAE0FC40.25898
Date: Thu, 22 Mar 2018 09:18:32 +0000
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
   title=3D"NEW - BUG: unable to handle kernel NULL pointer dereference at =
0000000000000ca0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105687">105687</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: unable to handle kernel NULL pointer dereference at 0000=
000000000ca0
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
          <td>philip.raets&#64;telenet.be
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138274=
" name=3D"attach_138274" title=3D"dmesg">attachment 138274</a> <a href=3D"a=
ttachment.cgi?id=3D138274&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

With testing of kernel 4.16 rc6 (from openSUSE Kernel Head) I now get the
following error (and gui freeze):

[  132.906691] BUG: unable to handle kernel NULL pointer dereference at
0000000000000ca0
[  132.906737] IP: nouveau_mem_host+0x4b/0x180 [nouveau]
[  132.906741] PGD 0 P4D 0=20
[  132.906746] Oops: 0000 [#1] PREEMPT SMP PTI
[  132.906750] Modules linked in: fuse arc4 md4 nls_utf8 cifs ccm dns_resol=
ver
fscache af_packet veeamsnap(O) vhost_net vhost tap tun nf_conntrack_netbios=
_ns
nf_conntrack_broadcast xt_CT xt_tcpudp ip6t_rpfilter ip6t_REJECT nf_reject_=
ipv6
ipt_REJECT nf_reject_ipv4 xt_conntrack devlink ip_set nfnetlink ebtable_nat
ebtable_broute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security iptable_nat
nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack libcrc32c
iptable_mangle iptable_raw iptable_security ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables x_tables snd_hda_codec_=
hdmi
msr snd_hda_codec_realtek snd_hda_codec_generic mei_wdt snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl
[  132.906806]  x86_pkg_temp_thermal intel_powerclamp coretemp snd_timer
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel pcbc snd hid_generic iTCO_wdt iTCO_vendor_support uas
dcdbas aesni_intel mei_me e1000e aes_x86_64 crypto_simd glue_helper cryptd
usbhid usb_storage pcspkr i2c_i801 soundcore mei ptp shpchp lpc_ich pps_core
serio_raw sr_mod cdrom nouveau mxm_wmi wmi i2c_algo_bit drm_kms_helper
syscopyarea ehci_pci sysfillrect sysimgblt fb_sys_fops ehci_hcd ttm usbcore=
 drm
video button sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[  132.906853] CPU: 0 PID: 5076 Comm: X Tainted: G           O=20=20=20=20
4.16.0-rc6-2.gf39c456-default #1 openSUSE Tumbleweed (unreleased)
[  132.906859] Hardware name: Dell Inc. OptiPlex 790/0HY9JP, BIOS A19
05/07/2017
[  132.906886] RIP: 0010:nouveau_mem_host+0x4b/0x180 [nouveau]
[  132.906890] RSP: 0018:ffffac7808307838 EFLAGS: 00010282
[  132.906894] RAX: ffff95c0faa30938 RBX: ffff95c0faa30840 RCX:
0000000003fdd2c0
[  132.906898] RDX: ffff95c0faa56480 RSI: ffff95c050c03f80 RDI:
0000000000000000
[  132.906905] RBP: ffff95c056f8da00 R08: ffff95bd40000328 R09:
0000000000000001
[  132.906909] R10: 0000000000000000 R11: 0000000000000008 R12:
ffffac7808307988
[  132.906914] R13: 0000000000000000 R14: ffff95c056f8da00 R15:
ffffac7808307988
[  132.906918] FS:  00007fc21078d940(0000) GS:ffff95c15d200000(0000)
knlGS:0000000000000000
[  132.906923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  132.906927] CR2: 0000000000000ca0 CR3: 000000041c62a001 CR4:
00000000000626f0
[  132.906931] Call Trace:
[  132.906958]  nv50_sgdma_bind+0x18/0x30 [nouveau]
[  132.906966]  ttm_tt_bind+0x42/0x60 [ttm]
[  132.906972]  ttm_bo_handle_move_mem+0x577/0x5b0 [ttm]
[  132.906979]  ttm_bo_evict+0x115/0x2f0 [ttm]
[  132.907002]  ? nv44_mmu_new+0x60/0x60 [nouveau]
[  132.907017]  ? drm_add_edid_modes.part.29+0x1911/0x19b0 [drm]
[  132.907024]  ttm_mem_evict_first+0x190/0x200 [ttm]
[  132.907030]  ttm_bo_mem_space+0x328/0x4a0 [ttm]
[  132.907036]  ttm_bo_validate+0x98/0x110 [ttm]
[  132.907047]  ? drm_vma_offset_add+0x41/0x60 [drm]
[  132.907057]  ? drm_add_edid_modes.part.29+0x193e/0x19b0 [drm]
[  132.907064]  ttm_bo_init_reserved+0x382/0x430 [ttm]
[  132.907069]  ttm_bo_init+0x52/0xc0 [ttm]
[  132.907093]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
[  132.907117]  ? nouveau_gem_ioctl_pushbuf+0x9bf/0x1600 [nouveau]
[  132.907141]  nouveau_bo_new+0x416/0x590 [nouveau]
[  132.907164]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
[  132.907188]  ? nouveau_gem_new+0x100/0x100 [nouveau]
[  132.907210]  nouveau_gem_new+0x49/0x100 [nouveau]
[  132.907233]  nouveau_gem_ioctl_new+0x41/0xc0 [nouveau]
[  132.907243]  drm_ioctl_kernel+0x5b/0xb0 [drm]
[  132.907253]  drm_ioctl+0x2ad/0x350 [drm]
[  132.907276]  ? nouveau_gem_new+0x100/0x100 [nouveau]
[  132.907282]  ? current_time+0x18/0x70
[  132.907306]  nouveau_drm_ioctl+0x64/0xc0 [nouveau]
[  132.907312]  do_vfs_ioctl+0x90/0x5f0
[  132.907317]  ? __fput+0x174/0x210
[  132.907321]  ? __fget+0x6e/0xb0
[  132.907325]  SyS_ioctl+0x74/0x80
[  132.907330]  do_syscall_64+0x76/0x140
[  132.907336]  entry_SYSCALL_64_after_hwframe+0x42/0xb7
[  132.907340] RIP: 0033:0x7fc20e07a967
[  132.907343] RSP: 002b:00007ffd8654b8f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  132.907349] RAX: ffffffffffffffda RBX: 000055e8b70add90 RCX:
00007fc20e07a967
[  132.907353] RDX: 00007ffd8654b950 RSI: 00000000c0306480 RDI:
000000000000000d
[  132.907357] RBP: 00007ffd8654b950 R08: 0000000000000000 R09:
000055e8b70d3d60
[  132.907361] R10: 0000000000000008 R11: 0000000000000246 R12:
00000000c0306480
[  132.907366] R13: 000000000000000d R14: 000055e8b70d3df0 R15:
000055e8b671f8c0
[  132.907371] Code: 08 00 00 00 00 48 c7 44 24 10 00 00 00 00 48 c7 44 24 =
18
00 00 00 00 48 8b 7b 40 48 8d 83 f8 00 00 00 44 0f b6 6b 39 48 89 04 24 &lt=
;48&gt; 63
8f a0 0c 00 00 48 8b 97 78 03 00 00 80 3c 4a 00 0f 88 fc=20
[  132.907419] RIP: nouveau_mem_host+0x4b/0x180 [nouveau] RSP: ffffac780830=
7838
[  132.907423] CR2: 0000000000000ca0
[  132.913485] ---[ end trace c985cc3c9d3ceb61 ]---

It already happened twice today while browsing some pictures</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15217103120.eAE0FC40.25898--

--===============0936432305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0936432305==--
