From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Fri, 19 Jul 2013 14:23:31 +0000
Message-ID: <bug-64774-8800-RHhjPXWR4w@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0020319766=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0020319766==
Content-Type: multipart/alternative; boundary="1374243811.e7FCBAfd2.25019"; charset="us-ascii"


--1374243811.e7FCBAfd2.25019
Date: Fri, 19 Jul 2013 14:23:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #15 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

xrandr not working if booted with DVI cable connected doesn't seem to be the
case *always*.. it's seems to be a bit random. one boot out of 10, or so, I=
'm
able to see the nouveau connectors on xrandr, so I'm able to try to enable
them, and thus hit the warn_on in the patch I added to the kernel. So here
goes:

[  168.514913] ------------[ cut here ]------------
[  168.514954] WARNING: at drivers/gpu/drm/nouveau/nouveau_bo.c:952
nouveau_vma_getmap.isra.11+0xc1/0xe0 [nouveau]()
[  168.514956] Hardware name: 2349H2G
[  168.514957] Modules linked in: fuse ebtable_nat ipt_MASQUERADE
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6
table_mangle ip6t_REJECT nf_conntrack_ipv6 nf_defrag_ipv6 iptable_nat
nf_nat_ipv4 nf_nat iptable_mangle nf_conntrack
_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack be2iscsi iscsi_boot_sysfs bn=
x2i
ebtable_filter cnic ebtables uio ip6t
able_filter cxgb4i cxgb4 ip6_tables cxgb3i cxgb3 mdio libcxgbi ib_iser rdma=
_cm
ib_addr iw_cm ib_cm ib_sa ib_mad ib_c
ore iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi rfcomm bnep
snd_hda_codec_realtek iTCO_wdt iTCO_vendor_support arc4 iwldvm acpi_cpufreq
mac80211 mperf coretemp uvcvideo microcode snd_hda_intel videobuf2_vmalloc
snd_hda_codec i2c_i801 videobuf2_memops snd_hwdep videobuf2_core snd_seq
iwlwifi snd_seq_device videodev cdc_mbim btusb snd_pcm
[  168.514987]  media bluetooth cfg80211 cdc_ncm usbnet cdc_wdm cdc_acm mii
lpc_ich e1000e mfd_core snd_page_alloc snd_timer mei ptp thinkpad_acpi pps_=
core
snd soundcore rfkill vhost_net tun macvtap macvlan kvm_intel kvm uinput
dm_crypt crc32_pclmul crc32c_intel nouveau i915 ghash_clmulni_intel mxm_wmi
sdhci_pci i2c_algo_bit sdhci ttm drm_kms_helper mmc_core drm i2c_core wmi v=
ideo
[  168.515008] Pid: 914, comm: Xorg Not tainted 3.9.9-201.dbg01.fc18.x86_64=
 #1
[  168.515009] Call Trace:
[  168.515017]  [<ffffffff8105efc5>] warn_slowpath_common+0x75/0xa0
[  168.515019]  [<ffffffff8105f00a>] warn_slowpath_null+0x1a/0x20
[  168.515036]  [<ffffffffa020d801>] nouveau_vma_getmap.isra.11+0xc1/0xe0
[nouveau]
[  168.515046]  [<ffffffffa019292a>] ? _nouveau_gpuobj_wr32+0x2a/0x30 [nouv=
eau]
[  168.515062]  [<ffffffffa020d8a6>] nouveau_bo_move_m2mf.isra.12+0x86/0x140
[nouveau]
[  168.515077]  [<ffffffffa01b6b23>] ? nouveau_vm_map_at+0x153/0x1c0 [nouve=
au]
[  168.515092]  [<ffffffffa020e2aa>] nouveau_bo_move+0x9a/0x400 [nouveau]
[  168.515100]  [<ffffffffa007ee15>] ttm_bo_handle_move_mem+0x245/0x610 [tt=
m]
[  168.515106]  [<ffffffffa007fd00>] ? ttm_bo_mem_space+0x180/0x360 [ttm]
[  168.515112]  [<ffffffffa007fff7>] ttm_bo_move_buffer+0x117/0x130 [ttm]
[  168.515116]  [<ffffffff8122b1fa>] ? ext4_dirty_inode+0x5a/0x70
[  168.515125]  [<ffffffffa00800aa>] ttm_bo_validate+0x9a/0x110 [ttm]
[  168.515140]  [<ffffffffa020eb1c>] nouveau_bo_validate+0x1c/0x20 [nouveau]
[  168.515155]  [<ffffffffa020ed4b>] nouveau_bo_pin+0x9b/0x100 [nouveau]
[  168.515158]  [<ffffffff8130c6b4>] ? snprintf+0x34/0x40
[  168.515173]  [<ffffffffa0231b25>] nv50_crtc_mode_set_base+0x55/0xf0
[nouveau]
[  168.515180]  [<ffffffffa007320b>] drm_crtc_helper_set_config+0x77b/0xb30
[drm_kms_helper]
[  168.515194]  [<ffffffffa003c76e>] drm_mode_set_config_internal+0x2e/0x60
[drm]
[  168.515204]  [<ffffffffa003eecc>] drm_mode_setcrtc+0x10c/0x570 [drm]
[  168.515208]  [<ffffffff8165f88d>] ? mutex_lock+0x1d/0x50
[  168.515217]  [<ffffffffa002f483>] drm_ioctl+0x4d3/0x580 [drm]
[  168.515220]  [<ffffffff81166dc5>] ? mmap_region+0x1c5/0x590
[  168.515230]  [<ffffffffa003edc0>] ? drm_mode_setplane+0x3b0/0x3b0 [drm]
[  168.515234]  [<ffffffff811b1a97>] do_vfs_ioctl+0x97/0x580
[  168.515238]  [<ffffffff812a185a>] ?
inode_has_perm.isra.32.constprop.62+0x2a/0x30
[  168.515240]  [<ffffffff812a2ee7>] ? file_has_perm+0x97/0xb0
[  168.515243]  [<ffffffff811b2011>] sys_ioctl+0x91/0xb0
[  168.515247]  [<ffffffff8166afd9>] system_call_fastpath+0x16/0x1b
[  168.515249] ---[ end trace 951f146548a30c98 ]---

I'll also attach the whole dmesg.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1374243811.e7FCBAfd2.25019
Date: Fri, 19 Jul 2013 14:23:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774">bug 64774<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
xrandr not working if booted with DVI cable connected doesn't seem to be the
case *always*.. it's seems to be a bit random. one boot out of 10, or so, I=
'm
able to see the nouveau connectors on xrandr, so I'm able to try to enable
them, and thus hit the warn_on in the patch I added to the kernel. So here
goes:

[  168.514913] ------------[ cut here ]------------
[  168.514954] WARNING: at drivers/gpu/drm/nouveau/nouveau_bo.c:952
nouveau_vma_getmap.isra.11+0xc1/0xe0 [nouveau]()
[  168.514956] Hardware name: 2349H2G
[  168.514957] Modules linked in: fuse ebtable_nat ipt_MASQUERADE
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6
table_mangle ip6t_REJECT nf_conntrack_ipv6 nf_defrag_ipv6 iptable_nat
nf_nat_ipv4 nf_nat iptable_mangle nf_conntrack
_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack be2iscsi iscsi_boot_sysfs bn=
x2i
ebtable_filter cnic ebtables uio ip6t
able_filter cxgb4i cxgb4 ip6_tables cxgb3i cxgb3 mdio libcxgbi ib_iser rdma=
_cm
ib_addr iw_cm ib_cm ib_sa ib_mad ib_c
ore iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi rfcomm bnep
snd_hda_codec_realtek iTCO_wdt iTCO_vendor_support arc4 iwldvm acpi_cpufreq
mac80211 mperf coretemp uvcvideo microcode snd_hda_intel videobuf2_vmalloc
snd_hda_codec i2c_i801 videobuf2_memops snd_hwdep videobuf2_core snd_seq
iwlwifi snd_seq_device videodev cdc_mbim btusb snd_pcm
[  168.514987]  media bluetooth cfg80211 cdc_ncm usbnet cdc_wdm cdc_acm mii
lpc_ich e1000e mfd_core snd_page_alloc snd_timer mei ptp thinkpad_acpi pps_=
core
snd soundcore rfkill vhost_net tun macvtap macvlan kvm_intel kvm uinput
dm_crypt crc32_pclmul crc32c_intel nouveau i915 ghash_clmulni_intel mxm_wmi
sdhci_pci i2c_algo_bit sdhci ttm drm_kms_helper mmc_core drm i2c_core wmi v=
ideo
[  168.515008] Pid: 914, comm: Xorg Not tainted 3.9.9-201.dbg01.fc18.x86_64=
 #1
[  168.515009] Call Trace:
[  168.515017]  [&lt;ffffffff8105efc5&gt;] warn_slowpath_common+0x75/0xa0
[  168.515019]  [&lt;ffffffff8105f00a&gt;] warn_slowpath_null+0x1a/0x20
[  168.515036]  [&lt;ffffffffa020d801&gt;] nouveau_vma_getmap.isra.11+0xc1/=
0xe0
[nouveau]
[  168.515046]  [&lt;ffffffffa019292a&gt;] ? _nouveau_gpuobj_wr32+0x2a/0x30=
 [nouveau]
[  168.515062]  [&lt;ffffffffa020d8a6&gt;] nouveau_bo_move_m2mf.isra.12+0x8=
6/0x140
[nouveau]
[  168.515077]  [&lt;ffffffffa01b6b23&gt;] ? nouveau_vm_map_at+0x153/0x1c0 =
[nouveau]
[  168.515092]  [&lt;ffffffffa020e2aa&gt;] nouveau_bo_move+0x9a/0x400 [nouv=
eau]
[  168.515100]  [&lt;ffffffffa007ee15&gt;] ttm_bo_handle_move_mem+0x245/0x6=
10 [ttm]
[  168.515106]  [&lt;ffffffffa007fd00&gt;] ? ttm_bo_mem_space+0x180/0x360 [=
ttm]
[  168.515112]  [&lt;ffffffffa007fff7&gt;] ttm_bo_move_buffer+0x117/0x130 [=
ttm]
[  168.515116]  [&lt;ffffffff8122b1fa&gt;] ? ext4_dirty_inode+0x5a/0x70
[  168.515125]  [&lt;ffffffffa00800aa&gt;] ttm_bo_validate+0x9a/0x110 [ttm]
[  168.515140]  [&lt;ffffffffa020eb1c&gt;] nouveau_bo_validate+0x1c/0x20 [n=
ouveau]
[  168.515155]  [&lt;ffffffffa020ed4b&gt;] nouveau_bo_pin+0x9b/0x100 [nouve=
au]
[  168.515158]  [&lt;ffffffff8130c6b4&gt;] ? snprintf+0x34/0x40
[  168.515173]  [&lt;ffffffffa0231b25&gt;] nv50_crtc_mode_set_base+0x55/0xf0
[nouveau]
[  168.515180]  [&lt;ffffffffa007320b&gt;] drm_crtc_helper_set_config+0x77b=
/0xb30
[drm_kms_helper]
[  168.515194]  [&lt;ffffffffa003c76e&gt;] drm_mode_set_config_internal+0x2=
e/0x60
[drm]
[  168.515204]  [&lt;ffffffffa003eecc&gt;] drm_mode_setcrtc+0x10c/0x570 [dr=
m]
[  168.515208]  [&lt;ffffffff8165f88d&gt;] ? mutex_lock+0x1d/0x50
[  168.515217]  [&lt;ffffffffa002f483&gt;] drm_ioctl+0x4d3/0x580 [drm]
[  168.515220]  [&lt;ffffffff81166dc5&gt;] ? mmap_region+0x1c5/0x590
[  168.515230]  [&lt;ffffffffa003edc0&gt;] ? drm_mode_setplane+0x3b0/0x3b0 =
[drm]
[  168.515234]  [&lt;ffffffff811b1a97&gt;] do_vfs_ioctl+0x97/0x580
[  168.515238]  [&lt;ffffffff812a185a&gt;] ?
inode_has_perm.isra.32.constprop.62+0x2a/0x30
[  168.515240]  [&lt;ffffffff812a2ee7&gt;] ? file_has_perm+0x97/0xb0
[  168.515243]  [&lt;ffffffff811b2011&gt;] sys_ioctl+0x91/0xb0
[  168.515247]  [&lt;ffffffff8166afd9&gt;] system_call_fastpath+0x16/0x1b
[  168.515249] ---[ end trace 951f146548a30c98 ]---

I'll also attach the whole dmesg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374243811.e7FCBAfd2.25019--

--===============0020319766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0020319766==--
