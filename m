From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Tue, 13 Aug 2013 20:32:50 +0000
Message-ID: <bug-64774-8800-gWFc44gC5Y@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1733017007=="
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


--===============1733017007==
Content-Type: multipart/alternative; boundary="1376425970.eb1D5C02.20158"; charset="us-ascii"


--1376425970.eb1D5C02.20158
Date: Tue, 13 Aug 2013 20:32:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #20 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

I built custom Linux 3.10.6 kernel with the patch from this bug's attachmen=
ts
(linux-3.9.9-gpu-drm-nouveau-warn-on-node-pages.patch) applied to add WARN_=
ON()
to nouveau_vma_getmap() and I'm still hitting the same issue when enabling =
an
output on nouveau gpu, which would lead to a hard kernel crash without the
patch:


[   54.324698] ------------[ cut here ]------------
[   54.324764] WARNING: at drivers/gpu/drm/nouveau/nouveau_bo.c:952
nouveau_vma_getmap.isra.11+0xc1/0xe0 [nouveau]()
[   54.324767] Modules linked in: fuse ebtable_nat ipt_MASQUERADE
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6table_mangle ip6t_REJECT
nf_conntrack_ipv6 nf_defrag_ipv6 iptable_nat nf_nat_ipv4 nf_nat iptable_man=
gle
nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ebtable_filter
ebtables ip6table_filter ip6_tables be2iscsi iscsi_boot_sysfs bnx2i cnic uio
cxgb4i cxgb4 cxgb3i cxgb3 mdio libcxgbi ib_iser rdma_cm ib_addr iw_cm ib_cm
ib_sa ib_mad ib_core iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
rfcomm bnep snd_hda_codec_realtek iTCO_wdt iTCO_vendor_support acpi_cpufreq
mperf coretemp microcode i2c_i801 arc4 snd_hda_intel uvcvideo snd_hda_codec
btusb videobuf2_vmalloc videobuf2_memops bluetooth videobuf2_core videodev
snd_hwdep media snd_seq iwldvm snd_seq_device cdc_mbim mac80211
[   54.324820]  snd_pcm lpc_ich mfd_core snd_page_alloc cdc_ncm usbnet iwlw=
ifi
cdc_wdm mii cdc_acm cfg80211 snd_timer e1000e ptp mei_me mei thinkpad_acpi
pps_core snd soundcore rfkill vhost_net tun macvtap macvlan kvm_intel kvm
uinput dm_crypt crc32_pclmul crc32c_intel nouveau i915 ghash_clmulni_intel
mxm_wmi ttm sdhci_pci i2c_algo_bit sdhci drm_kms_helper mmc_core drm wmi
i2c_core video
[   54.324858] CPU: 0 PID: 1089 Comm: Xorg Not tainted
3.10.6-100.dbg01.fc18.x86_64 #1
[   54.324861] Hardware name: LENOVO 2349H2G/2349H2G, BIOS G1ET93WW (2.53 )
03/08/2013
[   54.324863]  0000000000000009 ffff880316abd808 ffffffff81656006
ffff880316abd848
[   54.324869]  ffffffff8105d660 ffff880316abd858 ffff88032a772458
ffff8803063c0a00
[   54.324873]  ffff8803063c0a40 ffff880316abda58 ffff88032813c170
ffff880316abd858
[   54.324906] Call Trace:
[   54.324939]  [<ffffffff81656006>] dump_stack+0x19/0x1b
[   54.324950]  [<ffffffff8105d660>] warn_slowpath_common+0x70/0xa0
[   54.324957]  [<ffffffff8105d6aa>] warn_slowpath_null+0x1a/0x20
[   54.325002]  [<ffffffffa0229961>] nouveau_vma_getmap.isra.11+0xc1/0xe0
[nouveau]
[   54.325030]  [<ffffffffa01ad94a>] ? _nouveau_gpuobj_wr32+0x2a/0x30 [nouv=
eau]
[   54.325068]  [<ffffffffa0229a06>] nouveau_bo_move_m2mf.isra.12+0x86/0x140
[nouveau]
[   54.325106]  [<ffffffffa01cf633>] ? nouveau_vm_map_at+0x153/0x1c0 [nouve=
au]
[   54.325146]  [<ffffffffa022a415>] nouveau_bo_move+0xa5/0x400 [nouveau]
[   54.325169]  [<ffffffffa0088e7d>] ttm_bo_handle_move_mem+0x25d/0x630 [tt=
m]
[   54.325185]  [<ffffffffa0089d90>] ? ttm_bo_mem_space+0x180/0x360 [ttm]
[   54.325200]  [<ffffffffa008a097>] ttm_bo_move_buffer+0x127/0x140 [ttm]
[   54.325224]  [<ffffffffa008a14a>] ttm_bo_validate+0x9a/0x110 [ttm]
[   54.325261]  [<ffffffffa022ac4c>] nouveau_bo_validate+0x1c/0x20 [nouveau]
[   54.325299]  [<ffffffffa022ae7b>] nouveau_bo_pin+0x9b/0x100 [nouveau]
[   54.325307]  [<ffffffff81301d64>] ? snprintf+0x34/0x40
[   54.325348]  [<ffffffffa024da95>] nv50_crtc_mode_set_base+0x55/0xf0
[nouveau]
[   54.325364]  [<ffffffffa006d31b>] drm_crtc_helper_set_config+0x79b/0xb60
[drm_kms_helper]
[   54.325396]  [<ffffffffa003640e>] drm_mode_set_config_internal+0x2e/0x60
[drm]
[   54.325420]  [<ffffffffa0038a0b>] drm_mode_setcrtc+0xfb/0x620 [drm]
[   54.325428]  [<ffffffff81658fcd>] ? mutex_lock+0x1d/0x50
[   54.325449]  [<ffffffffa0029479>] drm_ioctl+0x549/0x680 [drm]
[   54.325474]  [<ffffffffa0038910>] ? drm_mode_setplane+0x3b0/0x3b0 [drm]
[   54.325485]  [<ffffffff811af2a7>] do_vfs_ioctl+0x97/0x580
[   54.325494]  [<ffffffff81296daa>] ?
inode_has_perm.isra.33.constprop.63+0x2a/0x30
[   54.325501]  [<ffffffff81298367>] ? file_has_perm+0x97/0xb0
[   54.325508]  [<ffffffff8119fca5>] ? __sb_end_write+0x35/0x70
[   54.325514]  [<ffffffff811af821>] SyS_ioctl+0x91/0xb0
[   54.325524]  [<ffffffff81664659>] system_call_fastpath+0x16/0x1b
[   54.325528] ---[ end trace d7d4b0036de28fa5 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1376425970.eb1D5C02.20158
Date: Tue, 13 Aug 2013 20:32:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c20">Commen=
t # 20</a>
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
I built custom Linux 3.10.6 kernel with the patch from this bug's attachmen=
ts
(linux-3.9.9-gpu-drm-nouveau-warn-on-node-pages.patch) applied to add WARN_=
ON()
to nouveau_vma_getmap() and I'm still hitting the same issue when enabling =
an
output on nouveau gpu, which would lead to a hard kernel crash without the
patch:


[   54.324698] ------------[ cut here ]------------
[   54.324764] WARNING: at drivers/gpu/drm/nouveau/nouveau_bo.c:952
nouveau_vma_getmap.isra.11+0xc1/0xe0 [nouveau]()
[   54.324767] Modules linked in: fuse ebtable_nat ipt_MASQUERADE
nf_conntrack_netbios_ns nf_conntrack_broadcast ip6table_mangle ip6t_REJECT
nf_conntrack_ipv6 nf_defrag_ipv6 iptable_nat nf_nat_ipv4 nf_nat iptable_man=
gle
nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ebtable_filter
ebtables ip6table_filter ip6_tables be2iscsi iscsi_boot_sysfs bnx2i cnic uio
cxgb4i cxgb4 cxgb3i cxgb3 mdio libcxgbi ib_iser rdma_cm ib_addr iw_cm ib_cm
ib_sa ib_mad ib_core iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
rfcomm bnep snd_hda_codec_realtek iTCO_wdt iTCO_vendor_support acpi_cpufreq
mperf coretemp microcode i2c_i801 arc4 snd_hda_intel uvcvideo snd_hda_codec
btusb videobuf2_vmalloc videobuf2_memops bluetooth videobuf2_core videodev
snd_hwdep media snd_seq iwldvm snd_seq_device cdc_mbim mac80211
[   54.324820]  snd_pcm lpc_ich mfd_core snd_page_alloc cdc_ncm usbnet iwlw=
ifi
cdc_wdm mii cdc_acm cfg80211 snd_timer e1000e ptp mei_me mei thinkpad_acpi
pps_core snd soundcore rfkill vhost_net tun macvtap macvlan kvm_intel kvm
uinput dm_crypt crc32_pclmul crc32c_intel nouveau i915 ghash_clmulni_intel
mxm_wmi ttm sdhci_pci i2c_algo_bit sdhci drm_kms_helper mmc_core drm wmi
i2c_core video
[   54.324858] CPU: 0 PID: 1089 Comm: Xorg Not tainted
3.10.6-100.dbg01.fc18.x86_64 #1
[   54.324861] Hardware name: LENOVO 2349H2G/2349H2G, BIOS G1ET93WW (2.53 )
03/08/2013
[   54.324863]  0000000000000009 ffff880316abd808 ffffffff81656006
ffff880316abd848
[   54.324869]  ffffffff8105d660 ffff880316abd858 ffff88032a772458
ffff8803063c0a00
[   54.324873]  ffff8803063c0a40 ffff880316abda58 ffff88032813c170
ffff880316abd858
[   54.324906] Call Trace:
[   54.324939]  [&lt;ffffffff81656006&gt;] dump_stack+0x19/0x1b
[   54.324950]  [&lt;ffffffff8105d660&gt;] warn_slowpath_common+0x70/0xa0
[   54.324957]  [&lt;ffffffff8105d6aa&gt;] warn_slowpath_null+0x1a/0x20
[   54.325002]  [&lt;ffffffffa0229961&gt;] nouveau_vma_getmap.isra.11+0xc1/=
0xe0
[nouveau]
[   54.325030]  [&lt;ffffffffa01ad94a&gt;] ? _nouveau_gpuobj_wr32+0x2a/0x30=
 [nouveau]
[   54.325068]  [&lt;ffffffffa0229a06&gt;] nouveau_bo_move_m2mf.isra.12+0x8=
6/0x140
[nouveau]
[   54.325106]  [&lt;ffffffffa01cf633&gt;] ? nouveau_vm_map_at+0x153/0x1c0 =
[nouveau]
[   54.325146]  [&lt;ffffffffa022a415&gt;] nouveau_bo_move+0xa5/0x400 [nouv=
eau]
[   54.325169]  [&lt;ffffffffa0088e7d&gt;] ttm_bo_handle_move_mem+0x25d/0x6=
30 [ttm]
[   54.325185]  [&lt;ffffffffa0089d90&gt;] ? ttm_bo_mem_space+0x180/0x360 [=
ttm]
[   54.325200]  [&lt;ffffffffa008a097&gt;] ttm_bo_move_buffer+0x127/0x140 [=
ttm]
[   54.325224]  [&lt;ffffffffa008a14a&gt;] ttm_bo_validate+0x9a/0x110 [ttm]
[   54.325261]  [&lt;ffffffffa022ac4c&gt;] nouveau_bo_validate+0x1c/0x20 [n=
ouveau]
[   54.325299]  [&lt;ffffffffa022ae7b&gt;] nouveau_bo_pin+0x9b/0x100 [nouve=
au]
[   54.325307]  [&lt;ffffffff81301d64&gt;] ? snprintf+0x34/0x40
[   54.325348]  [&lt;ffffffffa024da95&gt;] nv50_crtc_mode_set_base+0x55/0xf0
[nouveau]
[   54.325364]  [&lt;ffffffffa006d31b&gt;] drm_crtc_helper_set_config+0x79b=
/0xb60
[drm_kms_helper]
[   54.325396]  [&lt;ffffffffa003640e&gt;] drm_mode_set_config_internal+0x2=
e/0x60
[drm]
[   54.325420]  [&lt;ffffffffa0038a0b&gt;] drm_mode_setcrtc+0xfb/0x620 [drm]
[   54.325428]  [&lt;ffffffff81658fcd&gt;] ? mutex_lock+0x1d/0x50
[   54.325449]  [&lt;ffffffffa0029479&gt;] drm_ioctl+0x549/0x680 [drm]
[   54.325474]  [&lt;ffffffffa0038910&gt;] ? drm_mode_setplane+0x3b0/0x3b0 =
[drm]
[   54.325485]  [&lt;ffffffff811af2a7&gt;] do_vfs_ioctl+0x97/0x580
[   54.325494]  [&lt;ffffffff81296daa&gt;] ?
inode_has_perm.isra.33.constprop.63+0x2a/0x30
[   54.325501]  [&lt;ffffffff81298367&gt;] ? file_has_perm+0x97/0xb0
[   54.325508]  [&lt;ffffffff8119fca5&gt;] ? __sb_end_write+0x35/0x70
[   54.325514]  [&lt;ffffffff811af821&gt;] SyS_ioctl+0x91/0xb0
[   54.325524]  [&lt;ffffffff81664659&gt;] system_call_fastpath+0x16/0x1b
[   54.325528] ---[ end trace d7d4b0036de28fa5 ]---</pre>
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

--1376425970.eb1D5C02.20158--

--===============1733017007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1733017007==--
