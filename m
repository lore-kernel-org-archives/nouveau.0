From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97438] Running a lot of Firefox instances causes
 kernel page fault.
Date: Mon, 12 Sep 2016 16:15:10 +0000
Message-ID: <bug-97438-8800-vJB3A0WEIo@http.bugs.freedesktop.org/>
References: <bug-97438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1431074066=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1431074066==
Content-Type: multipart/alternative; boundary="14736969102.9d4c1.32188";
 charset="UTF-8"


--14736969102.9d4c1.32188
Date: Mon, 12 Sep 2016 16:15:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97438

--- Comment #3 from freedesktop.loser137-99sIRBiOKkeIIQEfbqrPhw@public.gmane.org ---
I have the same problem. When trying to start a qt5-application like kontac=
t,
dolphin or systemsettings5, they do not start and there is the following oo=
ps
in dmesg:
[  279.775857] resource sanity check: requesting [mem 0xcff02000-0xd0001fff=
],
which spans more than 0000:01:00.0 [mem 0xce000000-0xcfffffff 64bit pref]
[  279.775907] caller nv50_instobj_boot+0xac/0x120 [nouveau] mapping multip=
le
BARs
[  279.776152] BUG: unable to handle kernel paging request at ffffc900009d0=
000
[  279.776461] IP: [<ffffffff81304b2e>] iowrite32+0x2e/0x40
[  279.776831] PGD 1334a0067 PUD 1334a1067 PMD 7f948067 PTE 0
[  279.779156] Oops: 0002 [#1] PREEMPT SMP
[  279.781473] Modules linked in: rfcomm bnep xt_owner iptable_filter btusb
sha256_ssse3 sha256_generic cbc btrtl btbcm dm_crypt btintel bluetooth dm_m=
od
hid_generic usbhid uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4=
l2
videobuf2_core videodev media uas hid arc4 iwlmvm mac80211 mousedev
intel_powerclamp joydev coretemp acer_wmi kvm_intel iTCO_wdt
iTCO_vendor_support sparse_keymap kvm iwlwifi irqbypass crc32c_intel mei_me=
 mei
snd_hda_codec_hdmi lpc_ich cfg80211 rfkill snd_hda_codec_generic intel_csta=
te
psmouse input_leds led_class pcspkr serio_raw intel_ips fjes snd_hda_intel
snd_hda_codec ac thermal battery intel_agp snd_hda_core shpchp intel_gtt ev=
dev
snd_hwdep snd_pcm i2c_i801 mac_hid acpi_cpufreq tpm_tis tpm sch_fq_codel
snd_seq_dummy usbip_host usbip_core loop snd_seq_oss snd_seq_midi_event
[  279.783730]  snd_seq snd_seq_device snd_timer snd soundcore cuse fuse sg
vhba(O) ip_tables x_tables ext4 crc16 jbd2 mbcache usb_storage sr_mod cdrom
sd_mod atkbd libps2 ahci libahci libata ehci_pci ehci_hcd scsi_mod usbcore
usb_common i8042 serio tg3 ptp pps_core broadcom bcm_phy_lib libphy nouveau
button video mxm_wmi wmi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect
sysimgblt fb_sys_fops ttm drm
[  279.785630] CPU: 2 PID: 1722 Comm: systemsettings5 Tainted: G           =
O=20=20=20
4.7.2-1-ARCH #1
[  279.786280] Hardware name: Acer             TravelMate8572TG /BAP50-CP=
=20=20=20=20=20=20
 , BIOS V1.27   04/25/2011
[  279.786929] task: ffff880049dcb400 ti: ffff88003e8e4000 task.ti:
ffff88003e8e4000
[  279.787581] RIP: 0010:[<ffffffff81304b2e>]  [<ffffffff81304b2e>]
iowrite32+0x2e/0x40
[  279.788238] RSP: 0018:ffff88003e8e7948  EFLAGS: 00010292
[  279.788896] RAX: ffffffffa01e0240 RBX: 0000000000010000 RCX:
0000000000000009
[  279.789558] RDX: 000000003dffb081 RSI: ffffc900009d0000 RDI:
000000003dffb081
[  279.790224] RBP: ffff88003e8e7950 R08: 0000000000000100 R09:
000000003defd000
[  279.790893] R10: ffff88003c137400 R11: 000000003defd000 R12:
0000000000000000
[  279.791555] R13: 000000003dffb081 R14: 0000000000000010 R15:
ffff88007f93a440
[  279.792225] FS:  00007f1fab406180(0000) GS:ffff880137d00000(0000)
knlGS:0000000000000000
[  279.792890] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  279.793556] CR2: ffffc900009d0000 CR3: 000000003c488000 CR4:
00000000000006e0
[  279.794237] Stack:
[  279.794910]  ffffffffa014cec4 ffff88003e8e79a8 ffffffffa0152e57
ffff88003c137400
[  279.795589]  ffff88004a293918 000000003dffd001 0000000000000000
0000000000000100
[  279.796283]  0000000000000000 0000000000002002 ffff8800b9b56000
ffff88004a293918
[  279.796966] Call Trace:
[  279.797668]  [<ffffffffa014cec4>] ? nvkm_instobj_wr32+0x14/0x20 [nouveau]
[  279.798344]  [<ffffffffa0152e57>] nv50_vm_map+0x157/0x1a0 [nouveau]
[  279.799032]  [<ffffffffa0150f6d>] nvkm_vm_map_at+0xdd/0x1d0 [nouveau]
[  279.799722]  [<ffffffffa014dc8b>] nv50_instobj_map+0x1b/0x20 [nouveau]
[  279.800412]  [<ffffffffa014def2>] nv50_instobj_boot+0xc2/0x120 [nouveau]
[  279.801100]  [<ffffffffa014de0b>] nv50_instobj_acquire+0x4b/0x70 [nouvea=
u]
[  279.801789]  [<ffffffffa014cdf7>] nvkm_instobj_acquire_slow+0x17/0x30
[nouveau]
[  279.802482]  [<ffffffffa014d19a>] nvkm_instobj_new+0x6a/0x180 [nouveau]
[  279.803166]  [<ffffffffa01075d4>] nvkm_memory_new+0x44/0x80 [nouveau]
[  279.803859]  [<ffffffffa0151a6f>] nvkm_vm_get+0x15f/0x250 [nouveau]
[  279.804553]  [<ffffffffa01af152>] nouveau_bo_vma_add+0x32/0xa0 [nouveau]
[  279.805239]  [<ffffffffa01ad26e>] ? nouveau_bo_map+0x6e/0xb0 [nouveau]
[  279.805932]  [<ffffffffa01c0612>] nouveau_channel_prep+0x1d2/0x290 [nouv=
eau]
[  279.806634]  [<ffffffffa01c0727>] nouveau_channel_new+0x57/0x6e0 [nouvea=
u]
[  279.807334]  [<ffffffffa0104a2d>] ? nvif_device_init+0x2d/0x30 [nouveau]
[  279.808029]  [<ffffffff811d71b0>] ? kmem_cache_alloc_trace+0x1c0/0x1e0
[  279.808744]  [<ffffffffa01bf824>]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x340 [nouveau]
[  279.809456]  [<ffffffffa00059a2>] drm_ioctl+0x152/0x540 [drm]
[  279.810171]  [<ffffffffa01bf740>] ? nouveau_abi16_ioctl_setparam+0x10/0x=
10
[nouveau]
[  279.810891]  [<ffffffffa01a8554>] nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[  279.811598]  [<ffffffff8120cd72>] do_vfs_ioctl+0xa2/0x5d0
[  279.812318]  [<ffffffff81217e07>] ? __fget+0x77/0xb0
[  279.813030]  [<ffffffff8120d319>] SyS_ioctl+0x79/0x90
[  279.813744]  [<ffffffff815de7b2>] entry_SYSCALL_64_fastpath+0x1a/0xa4
[  279.814454] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6 =
89
f8 ef c3 55 48 89 f7 48 c7 c6 f2 37 73 81 48 89 e5 e8 54 fe ff ff 5d c3 <89=
> 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[  279.815989] RIP  [<ffffffff81304b2e>] iowrite32+0x2e/0x40
[  279.816741]  RSP <ffff88003e8e7948>
[  279.817490] CR2: ffffc900009d0000
[  279.822806] ---[ end trace ec9eb859880e3d78 ]---

Like accelrtr I cannot switch to VT afterwards.
Should I upload additional logs here or open a new bug?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14736969102.9d4c1.32188
Date: Mon, 12 Sep 2016 16:15:10 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Running a lot of Firefox instances causes ke=
rnel page fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Running a lot of Firefox instances causes ke=
rnel page fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438">bug 97438<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop.loser137&#64;safersignup.com" title=3D"freedesktop.loser137&#64=
;safersignup.com">freedesktop.loser137&#64;safersignup.com</a>
</span></b>
        <pre>I have the same problem. When trying to start a qt5-applicatio=
n like kontact,
dolphin or systemsettings5, they do not start and there is the following oo=
ps
in dmesg:
[  279.775857] resource sanity check: requesting [mem 0xcff02000-0xd0001fff=
],
which spans more than 0000:01:00.0 [mem 0xce000000-0xcfffffff 64bit pref]
[  279.775907] caller nv50_instobj_boot+0xac/0x120 [nouveau] mapping multip=
le
BARs
[  279.776152] BUG: unable to handle kernel paging request at ffffc900009d0=
000
[  279.776461] IP: [&lt;ffffffff81304b2e&gt;] iowrite32+0x2e/0x40
[  279.776831] PGD 1334a0067 PUD 1334a1067 PMD 7f948067 PTE 0
[  279.779156] Oops: 0002 [#1] PREEMPT SMP
[  279.781473] Modules linked in: rfcomm bnep xt_owner iptable_filter btusb
sha256_ssse3 sha256_generic cbc btrtl btbcm dm_crypt btintel bluetooth dm_m=
od
hid_generic usbhid uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4=
l2
videobuf2_core videodev media uas hid arc4 iwlmvm mac80211 mousedev
intel_powerclamp joydev coretemp acer_wmi kvm_intel iTCO_wdt
iTCO_vendor_support sparse_keymap kvm iwlwifi irqbypass crc32c_intel mei_me=
 mei
snd_hda_codec_hdmi lpc_ich cfg80211 rfkill snd_hda_codec_generic intel_csta=
te
psmouse input_leds led_class pcspkr serio_raw intel_ips fjes snd_hda_intel
snd_hda_codec ac thermal battery intel_agp snd_hda_core shpchp intel_gtt ev=
dev
snd_hwdep snd_pcm i2c_i801 mac_hid acpi_cpufreq tpm_tis tpm sch_fq_codel
snd_seq_dummy usbip_host usbip_core loop snd_seq_oss snd_seq_midi_event
[  279.783730]  snd_seq snd_seq_device snd_timer snd soundcore cuse fuse sg
vhba(O) ip_tables x_tables ext4 crc16 jbd2 mbcache usb_storage sr_mod cdrom
sd_mod atkbd libps2 ahci libahci libata ehci_pci ehci_hcd scsi_mod usbcore
usb_common i8042 serio tg3 ptp pps_core broadcom bcm_phy_lib libphy nouveau
button video mxm_wmi wmi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect
sysimgblt fb_sys_fops ttm drm
[  279.785630] CPU: 2 PID: 1722 Comm: systemsettings5 Tainted: G           =
O=20=20=20
4.7.2-1-ARCH #1
[  279.786280] Hardware name: Acer             TravelMate8572TG /BAP50-CP=
=20=20=20=20=20=20
 , BIOS V1.27   04/25/2011
[  279.786929] task: ffff880049dcb400 ti: ffff88003e8e4000 task.ti:
ffff88003e8e4000
[  279.787581] RIP: 0010:[&lt;ffffffff81304b2e&gt;]  [&lt;ffffffff81304b2e&=
gt;]
iowrite32+0x2e/0x40
[  279.788238] RSP: 0018:ffff88003e8e7948  EFLAGS: 00010292
[  279.788896] RAX: ffffffffa01e0240 RBX: 0000000000010000 RCX:
0000000000000009
[  279.789558] RDX: 000000003dffb081 RSI: ffffc900009d0000 RDI:
000000003dffb081
[  279.790224] RBP: ffff88003e8e7950 R08: 0000000000000100 R09:
000000003defd000
[  279.790893] R10: ffff88003c137400 R11: 000000003defd000 R12:
0000000000000000
[  279.791555] R13: 000000003dffb081 R14: 0000000000000010 R15:
ffff88007f93a440
[  279.792225] FS:  00007f1fab406180(0000) GS:ffff880137d00000(0000)
knlGS:0000000000000000
[  279.792890] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  279.793556] CR2: ffffc900009d0000 CR3: 000000003c488000 CR4:
00000000000006e0
[  279.794237] Stack:
[  279.794910]  ffffffffa014cec4 ffff88003e8e79a8 ffffffffa0152e57
ffff88003c137400
[  279.795589]  ffff88004a293918 000000003dffd001 0000000000000000
0000000000000100
[  279.796283]  0000000000000000 0000000000002002 ffff8800b9b56000
ffff88004a293918
[  279.796966] Call Trace:
[  279.797668]  [&lt;ffffffffa014cec4&gt;] ? nvkm_instobj_wr32+0x14/0x20 [n=
ouveau]
[  279.798344]  [&lt;ffffffffa0152e57&gt;] nv50_vm_map+0x157/0x1a0 [nouveau]
[  279.799032]  [&lt;ffffffffa0150f6d&gt;] nvkm_vm_map_at+0xdd/0x1d0 [nouve=
au]
[  279.799722]  [&lt;ffffffffa014dc8b&gt;] nv50_instobj_map+0x1b/0x20 [nouv=
eau]
[  279.800412]  [&lt;ffffffffa014def2&gt;] nv50_instobj_boot+0xc2/0x120 [no=
uveau]
[  279.801100]  [&lt;ffffffffa014de0b&gt;] nv50_instobj_acquire+0x4b/0x70 [=
nouveau]
[  279.801789]  [&lt;ffffffffa014cdf7&gt;] nvkm_instobj_acquire_slow+0x17/0=
x30
[nouveau]
[  279.802482]  [&lt;ffffffffa014d19a&gt;] nvkm_instobj_new+0x6a/0x180 [nou=
veau]
[  279.803166]  [&lt;ffffffffa01075d4&gt;] nvkm_memory_new+0x44/0x80 [nouve=
au]
[  279.803859]  [&lt;ffffffffa0151a6f&gt;] nvkm_vm_get+0x15f/0x250 [nouveau]
[  279.804553]  [&lt;ffffffffa01af152&gt;] nouveau_bo_vma_add+0x32/0xa0 [no=
uveau]
[  279.805239]  [&lt;ffffffffa01ad26e&gt;] ? nouveau_bo_map+0x6e/0xb0 [nouv=
eau]
[  279.805932]  [&lt;ffffffffa01c0612&gt;] nouveau_channel_prep+0x1d2/0x290=
 [nouveau]
[  279.806634]  [&lt;ffffffffa01c0727&gt;] nouveau_channel_new+0x57/0x6e0 [=
nouveau]
[  279.807334]  [&lt;ffffffffa0104a2d&gt;] ? nvif_device_init+0x2d/0x30 [no=
uveau]
[  279.808029]  [&lt;ffffffff811d71b0&gt;] ? kmem_cache_alloc_trace+0x1c0/0=
x1e0
[  279.808744]  [&lt;ffffffffa01bf824&gt;]
nouveau_abi16_ioctl_channel_alloc+0xe4/0x340 [nouveau]
[  279.809456]  [&lt;ffffffffa00059a2&gt;] drm_ioctl+0x152/0x540 [drm]
[  279.810171]  [&lt;ffffffffa01bf740&gt;] ? nouveau_abi16_ioctl_setparam+0=
x10/0x10
[nouveau]
[  279.810891]  [&lt;ffffffffa01a8554&gt;] nouveau_drm_ioctl+0x74/0xc0 [nou=
veau]
[  279.811598]  [&lt;ffffffff8120cd72&gt;] do_vfs_ioctl+0xa2/0x5d0
[  279.812318]  [&lt;ffffffff81217e07&gt;] ? __fget+0x77/0xb0
[  279.813030]  [&lt;ffffffff8120d319&gt;] SyS_ioctl+0x79/0x90
[  279.813744]  [&lt;ffffffff815de7b2&gt;] entry_SYSCALL_64_fastpath+0x1a/0=
xa4
[  279.814454] Code: ff ff 03 00 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6 =
89
f8 ef c3 55 48 89 f7 48 c7 c6 f2 37 73 81 48 89 e5 e8 54 fe ff ff 5d c3 &lt=
;89&gt; 3e
c3 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff=20
[  279.815989] RIP  [&lt;ffffffff81304b2e&gt;] iowrite32+0x2e/0x40
[  279.816741]  RSP &lt;ffff88003e8e7948&gt;
[  279.817490] CR2: ffffc900009d0000
[  279.822806] ---[ end trace ec9eb859880e3d78 ]---

Like accelrtr I cannot switch to VT afterwards.
Should I upload additional logs here or open a new bug?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14736969102.9d4c1.32188--

--===============1431074066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1431074066==--
