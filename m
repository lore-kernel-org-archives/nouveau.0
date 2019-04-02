From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108857] display becomes unresponsive and keyboard
 input fails
Date: Tue, 02 Apr 2019 18:15:09 +0000
Message-ID: <bug-108857-8800-rzOicpCBKP@http.bugs.freedesktop.org/>
References: <bug-108857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1409249085=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108857-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1409249085==
Content-Type: multipart/alternative; boundary="15542289093.Ea4bc.23408"
Content-Transfer-Encoding: 7bit


--15542289093.Ea4bc.23408
Date: Tue, 2 Apr 2019 18:15:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108857

--- Comment #7 from c_norman-/E1597aS9LQAvxtiuMwx3w@public.gmane.org ---
I'm hitting this as well on my newly-installed Thinkpad T480.=20

[  290.639896] nouveau 0000:01:00.0: timeout
[  290.639954] WARNING: CPU: 0 PID: 500 at
drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:86 nvkm_pmu_reset+0x148/0x160
[nouveau]
[  290.639954] Modules linked in: snd_hda_codec_hdmi arc4 mei_wdt iTCO_wdt
iTCO_vendor_support snd_soc_skl snd_soc_hdac_hda iwlmvm snd_hda_ext_core
snd_soc_skl_ipc intel_cstate(+) snd_soc_sst_ipc intel_uncore snd_soc_sst_dsp
snd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc_acpi
snd_hda_codec_generic mac80211 snd_soc_core snd_compress ac97_bus
snd_pcm_dmaengine snd_hda_intel intel_rapl_perf snd_hda_codec btusb uvcvideo
snd_hda_core btrtl snd_hwdep btbcm snd_seq btintel videobuf2_vmalloc
snd_seq_device bluetooth videobuf2_memops iwlwifi snd_pcm videobuf2_v4l2
videobuf2_common intel_wmi_thunderbolt wmi_bmof videodev cfg80211 thunderbo=
lt
joydev thinkpad_acpi i2c_i801 snd_timer media mei_me ecdh_generic ledtrig_a=
udio
ucsi_acpi typec_ucsi intel_xhci_usb_role_switch roles snd
processor_thermal_device mei typec intel_pch_thermal intel_soc_dts_iosf
int3403_thermal soundcore rfkill int340x_thermal_zone int3400_thermal
acpi_thermal_rel acpi_pad pcc_cpufreq dm_crypt i915 nouveau kvmgt mdev vfio=
 kvm
[  290.639972]  mxm_wmi ttm nvme irqbypass i2c_algo_bit crct10dif_pclmul
drm_kms_helper crc32_pclmul nvme_core crc32c_intel e1000e drm uas serio_raw
ghash_clmulni_intel usb_storage hid_multitouch wmi video
[  290.639978] CPU: 0 PID: 500 Comm: plymouthd Tainted: G        W=20=20=20=
=20=20=20=20=20
5.0.5-200.fc29.x86_64 #1
[  290.639979] Hardware name: LENOVO 20L6S29D00/20L6S29D00, BIOS N24ET48W (=
1.23
) 02/20/2019
[  290.640005] RIP: 0010:nvkm_pmu_reset+0x148/0x160 [nouveau]
[  290.640006] Code: 04 24 48 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 74 =
1e
e8 aa 75 fb db 4c 89 e2 48 c7 c7 43 df 7b c0 48 89 c6 e8 d2 8f a7 db <0f> 0=
b e9
50 ff ff ff 4c 8b 67 10 eb dc 48 8b 5f 10 eb a3 e8 b0 8c
[  290.640006] RSP: 0000:ffffa54d03aa38b8 EFLAGS: 00010286
[  290.640007] RAX: 0000000000000000 RBX: ffff92b657d82c00 RCX:
0000000000000006
[  290.640008] RDX: 0000000000000007 RSI: 0000000000000086 RDI:
ffff92b6614168c0
[  290.640008] RBP: ffff92b6583f7b40 R08: 000000000000046b R09:
0000000000000003
[  290.640009] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff92b65d2908b0
[  290.640009] R13: 0000004332f9ada6 R14: 000000432df68d37 R15:
ffff92b65d3130b0
[  290.640010] FS:  00007f9b716ac300(0000) GS:ffff92b661400000(0000)
knlGS:0000000000000000
[  290.640011] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  290.640011] CR2: 00007f56ec1877f8 CR3: 0000000856b9a003 CR4:
00000000003606f0
[  290.640012] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  290.640013] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  290.640013] Call Trace:
[  290.640041]  nvkm_pmu_init+0x16/0x40 [nouveau]
[  290.640054]  nvkm_subdev_init+0xb2/0x200 [nouveau]
[  290.640080]  nvkm_device_init+0x13b/0x280 [nouveau]
[  290.640106]  nvkm_udevice_init+0x41/0x60 [nouveau]
[  290.640119]  nvkm_object_init+0x3e/0x100 [nouveau]
[  290.640131]  nvkm_object_init+0x71/0x100 [nouveau]
[  290.640143]  nvkm_object_init+0x71/0x100 [nouveau]
[  290.640168]  nouveau_do_resume+0x28/0x150 [nouveau]
[  290.640193]  nouveau_pmops_runtime_resume+0x88/0x150 [nouveau]
[  290.640196]  pci_pm_runtime_resume+0x74/0xd0
[  290.640198]  ? pci_restore_standard_config+0x40/0x40
[  290.640200]  __rpm_callback+0xca/0x1d0
[  290.640201]  ? pci_restore_standard_config+0x40/0x40
[  290.640203]  rpm_callback+0x1f/0x70
[  290.640204]  ? pci_restore_standard_config+0x40/0x40
[  290.640205]  rpm_resume+0x5bc/0x7e0
[  290.640206]  __pm_runtime_resume+0x47/0x70
[  290.640231]  nouveau_drm_open+0x3b/0x1a0 [nouveau]
[  290.640241]  drm_file_alloc+0x15a/0x240 [drm]
[  290.640247]  drm_open+0xa7/0x210 [drm]
[  290.640253]  ? drm_dev_enter+0x19/0x50 [drm]
[  290.640259]  drm_stub_open+0xaf/0xf0 [drm]
[  290.640262]  chrdev_open+0xa2/0x1c0
[  290.640263]  ? cdev_put.part.0+0x20/0x20
[  290.640265]  do_dentry_open+0x12f/0x340
[  290.640266]  path_openat+0x2c5/0x1500
[  290.640269]  ? __alloc_pages_nodemask+0x160/0x300
[  290.640270]  do_filp_open+0x93/0x100
[  290.640272]  ? __check_object_size+0x15d/0x189
[  290.640274]  do_sys_open+0x186/0x220
[  290.640276]  do_syscall_64+0x5b/0x160
[  290.640278]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  290.640279] RIP: 0033:0x7f9b71945ca2
[  290.640280] Code: 25 00 00 41 00 3d 00 00 41 00 74 4c 48 8d 05 85 7a 0d =
00
8b 00 85 c0 75 6d 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3=
d 00
f0 ff ff 0f 87 a2 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
[  290.640281] RSP: 002b:00007fff92e0f1e0 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[  290.640282] RAX: ffffffffffffffda RBX: 00007f9b716ac270 RCX:
[  290.640282] RDX: 0000000000000002 RSI: 000055d4899fae30 RDI:
00000000ffffff9c
[  290.640283] RBP: 000055d4899fada8 R08: 000055d4899fad70 R09:
0000000000000000
[  290.640283] R10: 0000000000000000 R11: 0000000000000246 R12:
000055d4899fada0
[  290.640284] R13: 0000000000000000 R14: 0000000000000000 R15:
000055d4899fad20

Running Fedora 29

Linux dhcp-ip-deleted.fc29.x86_64 #1 SMP Wed Mar 27 20:58:04 UTC 2019 x86_64
x86_64 x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15542289093.Ea4bc.23408
Date: Tue, 2 Apr 2019 18:15:09 +0000
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
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857">bug 10885=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
c_norman&#64;yahoo.com" title=3D"c_norman&#64;yahoo.com">c_norman&#64;yahoo=
.com</a>
</span></b>
        <pre>I'm hitting this as well on my newly-installed Thinkpad T480.=
=20

[  290.639896] nouveau 0000:01:00.0: timeout
[  290.639954] WARNING: CPU: 0 PID: 500 at
drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:86 nvkm_pmu_reset+0x148/0x160
[nouveau]
[  290.639954] Modules linked in: snd_hda_codec_hdmi arc4 mei_wdt iTCO_wdt
iTCO_vendor_support snd_soc_skl snd_soc_hdac_hda iwlmvm snd_hda_ext_core
snd_soc_skl_ipc intel_cstate(+) snd_soc_sst_ipc intel_uncore snd_soc_sst_dsp
snd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc_acpi
snd_hda_codec_generic mac80211 snd_soc_core snd_compress ac97_bus
snd_pcm_dmaengine snd_hda_intel intel_rapl_perf snd_hda_codec btusb uvcvideo
snd_hda_core btrtl snd_hwdep btbcm snd_seq btintel videobuf2_vmalloc
snd_seq_device bluetooth videobuf2_memops iwlwifi snd_pcm videobuf2_v4l2
videobuf2_common intel_wmi_thunderbolt wmi_bmof videodev cfg80211 thunderbo=
lt
joydev thinkpad_acpi i2c_i801 snd_timer media mei_me ecdh_generic ledtrig_a=
udio
ucsi_acpi typec_ucsi intel_xhci_usb_role_switch roles snd
processor_thermal_device mei typec intel_pch_thermal intel_soc_dts_iosf
int3403_thermal soundcore rfkill int340x_thermal_zone int3400_thermal
acpi_thermal_rel acpi_pad pcc_cpufreq dm_crypt i915 nouveau kvmgt mdev vfio=
 kvm
[  290.639972]  mxm_wmi ttm nvme irqbypass i2c_algo_bit crct10dif_pclmul
drm_kms_helper crc32_pclmul nvme_core crc32c_intel e1000e drm uas serio_raw
ghash_clmulni_intel usb_storage hid_multitouch wmi video
[  290.639978] CPU: 0 PID: 500 Comm: plymouthd Tainted: G        W=20=20=20=
=20=20=20=20=20
5.0.5-200.fc29.x86_64 #1
[  290.639979] Hardware name: LENOVO 20L6S29D00/20L6S29D00, BIOS N24ET48W (=
1.23
) 02/20/2019
[  290.640005] RIP: 0010:nvkm_pmu_reset+0x148/0x160 [nouveau]
[  290.640006] Code: 04 24 48 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 74 =
1e
e8 aa 75 fb db 4c 89 e2 48 c7 c7 43 df 7b c0 48 89 c6 e8 d2 8f a7 db &lt;0f=
&gt; 0b e9
50 ff ff ff 4c 8b 67 10 eb dc 48 8b 5f 10 eb a3 e8 b0 8c
[  290.640006] RSP: 0000:ffffa54d03aa38b8 EFLAGS: 00010286
[  290.640007] RAX: 0000000000000000 RBX: ffff92b657d82c00 RCX:
0000000000000006
[  290.640008] RDX: 0000000000000007 RSI: 0000000000000086 RDI:
ffff92b6614168c0
[  290.640008] RBP: ffff92b6583f7b40 R08: 000000000000046b R09:
0000000000000003
[  290.640009] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff92b65d2908b0
[  290.640009] R13: 0000004332f9ada6 R14: 000000432df68d37 R15:
ffff92b65d3130b0
[  290.640010] FS:  00007f9b716ac300(0000) GS:ffff92b661400000(0000)
knlGS:0000000000000000
[  290.640011] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  290.640011] CR2: 00007f56ec1877f8 CR3: 0000000856b9a003 CR4:
00000000003606f0
[  290.640012] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  290.640013] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  290.640013] Call Trace:
[  290.640041]  nvkm_pmu_init+0x16/0x40 [nouveau]
[  290.640054]  nvkm_subdev_init+0xb2/0x200 [nouveau]
[  290.640080]  nvkm_device_init+0x13b/0x280 [nouveau]
[  290.640106]  nvkm_udevice_init+0x41/0x60 [nouveau]
[  290.640119]  nvkm_object_init+0x3e/0x100 [nouveau]
[  290.640131]  nvkm_object_init+0x71/0x100 [nouveau]
[  290.640143]  nvkm_object_init+0x71/0x100 [nouveau]
[  290.640168]  nouveau_do_resume+0x28/0x150 [nouveau]
[  290.640193]  nouveau_pmops_runtime_resume+0x88/0x150 [nouveau]
[  290.640196]  pci_pm_runtime_resume+0x74/0xd0
[  290.640198]  ? pci_restore_standard_config+0x40/0x40
[  290.640200]  __rpm_callback+0xca/0x1d0
[  290.640201]  ? pci_restore_standard_config+0x40/0x40
[  290.640203]  rpm_callback+0x1f/0x70
[  290.640204]  ? pci_restore_standard_config+0x40/0x40
[  290.640205]  rpm_resume+0x5bc/0x7e0
[  290.640206]  __pm_runtime_resume+0x47/0x70
[  290.640231]  nouveau_drm_open+0x3b/0x1a0 [nouveau]
[  290.640241]  drm_file_alloc+0x15a/0x240 [drm]
[  290.640247]  drm_open+0xa7/0x210 [drm]
[  290.640253]  ? drm_dev_enter+0x19/0x50 [drm]
[  290.640259]  drm_stub_open+0xaf/0xf0 [drm]
[  290.640262]  chrdev_open+0xa2/0x1c0
[  290.640263]  ? cdev_put.part.0+0x20/0x20
[  290.640265]  do_dentry_open+0x12f/0x340
[  290.640266]  path_openat+0x2c5/0x1500
[  290.640269]  ? __alloc_pages_nodemask+0x160/0x300
[  290.640270]  do_filp_open+0x93/0x100
[  290.640272]  ? __check_object_size+0x15d/0x189
[  290.640274]  do_sys_open+0x186/0x220
[  290.640276]  do_syscall_64+0x5b/0x160
[  290.640278]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  290.640279] RIP: 0033:0x7f9b71945ca2
[  290.640280] Code: 25 00 00 41 00 3d 00 00 41 00 74 4c 48 8d 05 85 7a 0d =
00
8b 00 85 c0 75 6d 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 &lt;48=
&gt; 3d 00
f0 ff ff 0f 87 a2 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
[  290.640281] RSP: 002b:00007fff92e0f1e0 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[  290.640282] RAX: ffffffffffffffda RBX: 00007f9b716ac270 RCX:
[  290.640282] RDX: 0000000000000002 RSI: 000055d4899fae30 RDI:
00000000ffffff9c
[  290.640283] RBP: 000055d4899fada8 R08: 000055d4899fad70 R09:
0000000000000000
[  290.640283] R10: 0000000000000000 R11: 0000000000000246 R12:
000055d4899fada0
[  290.640284] R13: 0000000000000000 R14: 0000000000000000 R15:
000055d4899fad20

Running Fedora 29

Linux dhcp-ip-deleted.fc29.x86_64 #1 SMP Wed Mar 27 20:58:04 UTC 2019 x86_64
x86_64 x86_64 GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15542289093.Ea4bc.23408--

--===============1409249085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1409249085==--
