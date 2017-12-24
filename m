From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103351] Nouveau fails when booting with a screen
 connected to displayport since 13a86519202c5d119d83640d6f781f3181205d2c
Date: Sun, 24 Dec 2017 23:53:04 +0000
Message-ID: <bug-103351-8800-fsmAFE46oX@http.bugs.freedesktop.org/>
References: <bug-103351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0459971549=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0459971549==
Content-Type: multipart/alternative; boundary="15141595840.49Af00Ac.24294";
 charset="UTF-8"


--15141595840.49Af00Ac.24294
Date: Sun, 24 Dec 2017 23:53:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103351

--- Comment #4 from Nikita <nikita-hyBp88Z54NTk1uMJSBkQmQ@public.gmane.org> ---
I ran into the same issue on a Lenovo T420 with 01:00.0 VGA compatible
controller: NVIDIA Corporation GF119M [Quadro NVS 4200M] (rev a1).

As soon as I plug an external monitor via DP, Nouveau oopses at
nvkm_dp_train_drive(). If I try to boot with the monitor plugged in the sys=
tem
doesn't boot at all. I attached the relevant log at the end.

The external monitor works perfectly on 4.12.9-300.fc26.x86_64 and breaks on
4.13.1-301.fc27.x86_64, the commit mentioned in this issue was introduced
between these two version.


Dec 25 01:41:47 localhost gnome-shell[1662]: Failed to apply DRM plane
transform 0: Invalid argument
Dec 25 01:41:47 localhost gnome-shell[1662]: Failed to apply DRM plane
transform 0: Invalid argument
Dec 25 01:41:48 localhost gnome-shell[1662]: JS WARNING:
[resource:///org/gnome/shell/ui/workspaceThumbnail.js 892]: reference to
undefined property "_switchWorkspaceNotifyId"
Dec 25 01:41:48 localhost gsd-color[1301]: no xrandr-Dell Inc.-DELL
U2415-7MT0167S57AS device found: Failed to find output xrandr-Dell Inc.-DELL
U2415-7MT0167S57AS
Dec 25 01:41:48 localhost kernel: BUG: unable to handle kernel NULL pointer
dereference at           (null)
Dec 25 01:41:48 localhost kernel: IP:           (null)
Dec 25 01:41:48 localhost kernel: PGD 0=20
Dec 25 01:41:48 localhost kernel: P4D 0=20
Dec 25 01:41:48 localhost kernel:=20
Dec 25 01:41:48 localhost kernel: Oops: 0010 [#1] SMP
Dec 25 01:41:48 localhost kernel: Modules linked in: rfcomm fuse ccm
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJ=
ECT
nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute bri=
dge
stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_conntrack_ipv4
nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack libcrc32c iptable_mangle
iptable_raw iptable_security ebtable_filter ebtables ip6table_filter ip6_ta=
bles
bnep sunrpc vfat fat intel_rapl x86_pkg_temp_thermal intel_powerclamp coret=
emp
kvm_intel kvm iTCO_wdt iTCO_vendor_support mei_wdt irqbypass intel_cstate
intel_uncore intel_rapl_perf arc4 joydev wmi_bmof uvcvideo iwldvm btusb btr=
tl
mac80211 btbcm btintel bluetooth videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2
Dec 25 01:41:48 localhost kernel:  videobuf2_core videodev snd_hda_codec_hd=
mi
i2c_i801 thinkpad_acpi media iwlwifi lpc_ich snd_hda_codec_conexant
snd_hda_codec_generic mei_me snd_hda_intel ecdh_generic mei snd_hda_codec
cfg80211 snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer snd
shpchp tpm_tis soundcore tpm_tis_core tpm rfkill dm_crypt nouveau
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel serio_raw
mxm_wmi i2c_algo_bit drm_kms_helper sdhci_pci ttm sdhci e1000e mmc_core drm=
 ptp
pps_core wmi video
Dec 25 01:41:48 localhost kernel: CPU: 0 PID: 68 Comm: kworker/u16:1 Not
tainted 4.13.1-301.fc27.x86_64 #1
Dec 25 01:41:48 localhost kernel: Hardware name: LENOVO 4180PC4/4180PC4, BI=
OS
83ET76WW (1.46 ) 07/05/2013
Dec 25 01:41:48 localhost kernel: Workqueue: nvkm-disp gf119_disp_super
[nouveau]
Dec 25 01:41:48 localhost kernel: task: ffff8f14901b8000 task.stack:
ffffa0d8c1250000
Dec 25 01:41:48 localhost kernel: RIP: 0010:          (null)
Dec 25 01:41:48 localhost kernel: RSP: 0018:ffffa0d8c1253c10 EFLAGS: 000102=
06
Dec 25 01:41:48 localhost kernel: RAX: ffffffffc03b5ee0 RBX: 00000000000000=
00
RCX: 0000000000000016
Dec 25 01:41:48 localhost kernel: RDX: 0000000000000000 RSI: 00000000000000=
00
RDI: ffff8f148f0fe720
Dec 25 01:41:48 localhost kernel: RBP: ffffa0d8c1253c98 R08: 00000000000000=
00
R09: 0000000000000000
Dec 25 01:41:48 localhost kernel: R10: 0000000000000000 R11: 00000000000010=
00
R12: 0000000000000000
Dec 25 01:41:48 localhost kernel: R13: 0000000000000000 R14: ffff8f148fd908=
00
R15: ffffa0d8c1253d38
Dec 25 01:41:48 localhost kernel: FS:  0000000000000000(0000)
GS:ffff8f149dc00000(0000) knlGS:0000000000000000
Dec 25 01:41:48 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 25 01:41:48 localhost kernel: CR2: 0000000000000000 CR3: 0000000122e090=
00
CR4: 00000000000406f0
Dec 25 01:41:48 localhost kernel: Call Trace:
Dec 25 01:41:48 localhost kernel:  ? nvkm_dp_train_drive+0x183/0x2c0 [nouve=
au]
Dec 25 01:41:48 localhost kernel:  nvkm_dp_acquire+0x4f3/0xcd0 [nouveau]
Dec 25 01:41:48 localhost kernel:  nv50_disp_super_2_2+0x5d/0x470 [nouveau]
Dec 25 01:41:48 localhost kernel:  ? nvkm_devinit_pll_set+0xf/0x20 [nouveau]
Dec 25 01:41:48 localhost kernel:  gf119_disp_super+0x19c/0x2f0 [nouveau]
Dec 25 01:41:48 localhost kernel:  process_one_work+0x193/0x3c0
Dec 25 01:41:48 localhost kernel:  worker_thread+0x4a/0x3a0
Dec 25 01:41:48 localhost kernel:  kthread+0x125/0x140
Dec 25 01:41:48 localhost kernel:  ? process_one_work+0x3c0/0x3c0
Dec 25 01:41:48 localhost kernel:  ? kthread_park+0x60/0x60
Dec 25 01:41:48 localhost kernel:  ret_from_fork+0x25/0x30
Dec 25 01:41:48 localhost kernel: Code:  Bad RIP value.
Dec 25 01:41:48 localhost kernel: RIP:           (null) RSP: ffffa0d8c1253c=
10
Dec 25 01:41:48 localhost kernel: CR2: 0000000000000000
Dec 25 01:41:48 localhost kernel: ---[ end trace 9a99aaab375d014e ]---
Dec 25 01:41:50 localhost abrt-dump-journal-oops[942]: abrt-dump-journal-oo=
ps:
Found oopses: 1
Dec 25 01:41:50 localhost abrt-dump-journal-oops[942]: abrt-dump-journal-oo=
ps:
Creating problem directories
Dec 25 01:41:50 localhost kernel: nouveau 0000:01:00.0: DRM: EVO timeout
Dec 25 01:41:51 localhost abrt-notification[2289]: System encountered a
non-fatal error in nvkm_dp_train_drive()
Dec 25 01:41:52 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:41:54 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:41:56 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:41:58 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:00 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:02 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:04 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:06 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:08 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:10 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:12 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:14 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:16 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:18 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:20 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15141595840.49Af00Ac.24294
Date: Sun, 24 Dec 2017 23:53:04 +0000
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
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351">bug 10335=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nikita&#64;leshenko.net" title=3D"Nikita &lt;nikita&#64;leshenko.net&gt;"> =
<span class=3D"fn">Nikita</span></a>
</span></b>
        <pre>I ran into the same issue on a Lenovo T420 with 01:00.0 VGA co=
mpatible
controller: NVIDIA Corporation GF119M [Quadro NVS 4200M] (rev a1).

As soon as I plug an external monitor via DP, Nouveau oopses at
nvkm_dp_train_drive(). If I try to boot with the monitor plugged in the sys=
tem
doesn't boot at all. I attached the relevant log at the end.

The external monitor works perfectly on 4.12.9-300.fc26.x86_64 and breaks on
4.13.1-301.fc27.x86_64, the commit mentioned in this issue was introduced
between these two version.


Dec 25 01:41:47 localhost gnome-shell[1662]: Failed to apply DRM plane
transform 0: Invalid argument
Dec 25 01:41:47 localhost gnome-shell[1662]: Failed to apply DRM plane
transform 0: Invalid argument
Dec 25 01:41:48 localhost gnome-shell[1662]: JS WARNING:
[resource:///org/gnome/shell/ui/workspaceThumbnail.js 892]: reference to
undefined property &quot;_switchWorkspaceNotifyId&quot;
Dec 25 01:41:48 localhost gsd-color[1301]: no xrandr-Dell Inc.-DELL
U2415-7MT0167S57AS device found: Failed to find output xrandr-Dell Inc.-DELL
U2415-7MT0167S57AS
Dec 25 01:41:48 localhost kernel: BUG: unable to handle kernel NULL pointer
dereference at           (null)
Dec 25 01:41:48 localhost kernel: IP:           (null)
Dec 25 01:41:48 localhost kernel: PGD 0=20
Dec 25 01:41:48 localhost kernel: P4D 0=20
Dec 25 01:41:48 localhost kernel:=20
Dec 25 01:41:48 localhost kernel: Oops: 0010 [#1] SMP
Dec 25 01:41:48 localhost kernel: Modules linked in: rfcomm fuse ccm
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJ=
ECT
nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute bri=
dge
stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_conntrack_ipv4
nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack libcrc32c iptable_mangle
iptable_raw iptable_security ebtable_filter ebtables ip6table_filter ip6_ta=
bles
bnep sunrpc vfat fat intel_rapl x86_pkg_temp_thermal intel_powerclamp coret=
emp
kvm_intel kvm iTCO_wdt iTCO_vendor_support mei_wdt irqbypass intel_cstate
intel_uncore intel_rapl_perf arc4 joydev wmi_bmof uvcvideo iwldvm btusb btr=
tl
mac80211 btbcm btintel bluetooth videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2
Dec 25 01:41:48 localhost kernel:  videobuf2_core videodev snd_hda_codec_hd=
mi
i2c_i801 thinkpad_acpi media iwlwifi lpc_ich snd_hda_codec_conexant
snd_hda_codec_generic mei_me snd_hda_intel ecdh_generic mei snd_hda_codec
cfg80211 snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer snd
shpchp tpm_tis soundcore tpm_tis_core tpm rfkill dm_crypt nouveau
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel serio_raw
mxm_wmi i2c_algo_bit drm_kms_helper sdhci_pci ttm sdhci e1000e mmc_core drm=
 ptp
pps_core wmi video
Dec 25 01:41:48 localhost kernel: CPU: 0 PID: 68 Comm: kworker/u16:1 Not
tainted 4.13.1-301.fc27.x86_64 #1
Dec 25 01:41:48 localhost kernel: Hardware name: LENOVO 4180PC4/4180PC4, BI=
OS
83ET76WW (1.46 ) 07/05/2013
Dec 25 01:41:48 localhost kernel: Workqueue: nvkm-disp gf119_disp_super
[nouveau]
Dec 25 01:41:48 localhost kernel: task: ffff8f14901b8000 task.stack:
ffffa0d8c1250000
Dec 25 01:41:48 localhost kernel: RIP: 0010:          (null)
Dec 25 01:41:48 localhost kernel: RSP: 0018:ffffa0d8c1253c10 EFLAGS: 000102=
06
Dec 25 01:41:48 localhost kernel: RAX: ffffffffc03b5ee0 RBX: 00000000000000=
00
RCX: 0000000000000016
Dec 25 01:41:48 localhost kernel: RDX: 0000000000000000 RSI: 00000000000000=
00
RDI: ffff8f148f0fe720
Dec 25 01:41:48 localhost kernel: RBP: ffffa0d8c1253c98 R08: 00000000000000=
00
R09: 0000000000000000
Dec 25 01:41:48 localhost kernel: R10: 0000000000000000 R11: 00000000000010=
00
R12: 0000000000000000
Dec 25 01:41:48 localhost kernel: R13: 0000000000000000 R14: ffff8f148fd908=
00
R15: ffffa0d8c1253d38
Dec 25 01:41:48 localhost kernel: FS:  0000000000000000(0000)
GS:ffff8f149dc00000(0000) knlGS:0000000000000000
Dec 25 01:41:48 localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 25 01:41:48 localhost kernel: CR2: 0000000000000000 CR3: 0000000122e090=
00
CR4: 00000000000406f0
Dec 25 01:41:48 localhost kernel: Call Trace:
Dec 25 01:41:48 localhost kernel:  ? nvkm_dp_train_drive+0x183/0x2c0 [nouve=
au]
Dec 25 01:41:48 localhost kernel:  nvkm_dp_acquire+0x4f3/0xcd0 [nouveau]
Dec 25 01:41:48 localhost kernel:  nv50_disp_super_2_2+0x5d/0x470 [nouveau]
Dec 25 01:41:48 localhost kernel:  ? nvkm_devinit_pll_set+0xf/0x20 [nouveau]
Dec 25 01:41:48 localhost kernel:  gf119_disp_super+0x19c/0x2f0 [nouveau]
Dec 25 01:41:48 localhost kernel:  process_one_work+0x193/0x3c0
Dec 25 01:41:48 localhost kernel:  worker_thread+0x4a/0x3a0
Dec 25 01:41:48 localhost kernel:  kthread+0x125/0x140
Dec 25 01:41:48 localhost kernel:  ? process_one_work+0x3c0/0x3c0
Dec 25 01:41:48 localhost kernel:  ? kthread_park+0x60/0x60
Dec 25 01:41:48 localhost kernel:  ret_from_fork+0x25/0x30
Dec 25 01:41:48 localhost kernel: Code:  Bad RIP value.
Dec 25 01:41:48 localhost kernel: RIP:           (null) RSP: ffffa0d8c1253c=
10
Dec 25 01:41:48 localhost kernel: CR2: 0000000000000000
Dec 25 01:41:48 localhost kernel: ---[ end trace 9a99aaab375d014e ]---
Dec 25 01:41:50 localhost abrt-dump-journal-oops[942]: abrt-dump-journal-oo=
ps:
Found oopses: 1
Dec 25 01:41:50 localhost abrt-dump-journal-oops[942]: abrt-dump-journal-oo=
ps:
Creating problem directories
Dec 25 01:41:50 localhost kernel: nouveau 0000:01:00.0: DRM: EVO timeout
Dec 25 01:41:51 localhost abrt-notification[2289]: System encountered a
non-fatal error in nvkm_dp_train_drive()
Dec 25 01:41:52 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:41:54 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:41:56 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:41:58 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:00 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:02 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:04 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:06 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:08 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:10 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:12 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:14 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:16 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:18 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeout
Dec 25 01:42:20 localhost kernel: nouveau 0000:01:00.0: DRM: base-1: timeou=
t</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15141595840.49Af00Ac.24294--

--===============0459971549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0459971549==--
