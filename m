From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107069] New: trace in kernel.log on boot
Date: Fri, 29 Jun 2018 10:03:37 +0000
Message-ID: <bug-107069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1864663315=="
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


--===============1864663315==
Content-Type: multipart/alternative; boundary="15302666171.56eC7EA.11269"
Content-Transfer-Encoding: 7bit


--15302666171.56eC7EA.11269
Date: Fri, 29 Jun 2018 10:03:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107069

            Bug ID: 107069
           Summary: trace in kernel.log on boot
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: list1-A/zMyQPmkVhaa/9Udqfwiw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

System:

Dell Inc. Precision 7510
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M100=
0M]
(rev a2)
Linux glossy 4.16.0-2-amd64 #1 SMP Debian 4.16.16-2 (2018-06-22) x86_64
GNU/Linux

Driver:
1.0.15

The following is seen in kern.log on boot:

```
Jun 29 10:40:33 glossy kernel: [   11.091832] nouveau 0000:01:00.0: DRM: MM:
using COPY for buffer copies
Jun 29 10:40:33 glossy kernel: [   11.209360] nouveau 0000:01:00.0: DRM:
allocated 1920x1200 fb: 0x80000, bo 0000000063723da8
Jun 29 10:40:33 glossy kernel: [   11.212107] fbcon: nouveaufb (fb0) is pri=
mary
device
Jun 29 10:40:33 glossy kernel: [   11.323910] nouveau 0000:01:00.0: disp:
0x0000681d[0]: INIT_GENERIC_CONDITON: unknown 0x07
Jun 29 10:40:33 glossy kernel: [   11.336792] WARNING: CPU: 3 PID: 234 at
/build/linux-uwVqDp/linux-4.16.16/drivers/gpu/drm/nouveau/include/nvkm/subd=
ev/i2c.h:170
init_rdauxr+0xe8/0x130 [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336792] Modules linked in: nls_ascii
nls_cp437 vfat fat snd_hda_codec_hdmi(+) arc4 intel_rapl nouveau(+)
x86_pkg_temp_thermal intel_powerclamp dell_wmi coretemp iwlmvm sparse
_keymap uvcvideo dell_laptop ppdev wmi_bmof kvm_intel mac80211 dell_smbios
snd_hda_codec_realtek snd_hda_codec_generic videobuf2_vmalloc
dell_wmi_descriptor kvm videobuf2_memops dcdbas videobuf2_v4l2 dell_smm_hwm
on mxm_wmi irqbypass iwlwifi videobuf2_common snd_hda_intel intel_cstate ttm
snd_hda_codec intel_uncore videodev drm_kms_helper media intel_rapl_perf
efi_pstore cfg80211 snd_hda_core drm rtsx_pci_ms snd_hwdep i2c
_algo_bit memstick snd_pcm evdev joydev snd_timer mei_me iTCO_wdt snd pcspkr
processor_thermal_device efivars iTCO_vendor_support tpm_crb serio_raw sg
soundcore mei shpchp intel_soc_dts_iosf intel_pch_thermal
Jun 29 10:40:33 glossy kernel: [   11.336828]  battery tpm_tis tpm_tis_core=
 tpm
parport_pc int3400_thermal int3403_thermal int3402_thermal wmi rng_core par=
port
acpi_thermal_rel dell_rbtn int340x_thermal_zone dell
_smo8800 video acpi_pad button rfkill ac sunrpc efivarfs ip_tables x_tables
autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb algif_skcipher af_alg dm_crypt
dm_mod raid10 raid456 async_raid6_recov async_memcpy async_p
q async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0
multipath linear md_mod sd_mod hid_generic usbhid hid crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel rtsx_pci_sdmmc pcbc mmc_core =
ahci
libahci aesni_intel xhci_pci aes_x86_64 libata crypto_simd glue_helper cryp=
td
xhci_hcd psmouse e1000e i2c_i801 rtsx_pci usbcore scsi_mod usb_common therm=
al
Jun 29 10:40:33 glossy kernel: [   11.336853] CPU: 3 PID: 234 Comm:
kworker/u16:2 Not tainted 4.16.0-2-amd64 #1 Debian 4.16.16-2
Jun 29 10:40:33 glossy kernel: [   11.336854] Hardware name: Dell Inc.
Precision 7510/02H5GH, BIOS 1.15.4 12/08/2017
Jun 29 10:40:33 glossy kernel: [   11.336882] Workqueue: nvkm-disp
gf119_disp_super [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336900] RIP: 0010:init_rdauxr+0xe8/0x=
130
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336901] RSP: 0018:ffffa61903a47c08
EFLAGS: 00010297
Jun 29 10:40:33 glossy kernel: [   11.336902] RAX: 0000000000000000 RBX:
ffffa61903a47c90 RCX: 0000000000000000
Jun 29 10:40:33 glossy kernel: [   11.336902] RDX: ffffa6190600e534 RSI:
ffffa6190600e534 RDI: 0000000001009000
Jun 29 10:40:33 glossy kernel: [   11.336903] RBP: ffff888758620000 R08:
ffffa61903a47c16 R09: ffffa61903a47c17
Jun 29 10:40:33 glossy kernel: [   11.336903] R10: 0000000000000000 R11:
0000000000000010 R12: 000000000000010a
Jun 29 10:40:33 glossy kernel: [   11.336904] R13: ffff88875704de80 R14:
0000000000000001 R15: 00000000000000fe
Jun 29 10:40:33 glossy kernel: [   11.336905] FS:  0000000000000000(0000)
GS:ffff88877dcc0000(0000) knlGS:0000000000000000
Jun 29 10:40:33 glossy kernel: [   11.336905] CS:  0010 DS: 0000 ES: 0000 C=
R0:
0000000080050033
Jun 29 10:40:33 glossy kernel: [   11.336906] CR2: 00007f6e12b3dc20 CR3:
0000000731c0a006 CR4: 00000000003606e0
Jun 29 10:40:33 glossy kernel: [   11.336907] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jun 29 10:40:33 glossy kernel: [   11.336907] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jun 29 10:40:33 glossy kernel: [   11.336907] Call Trace:
Jun 29 10:40:33 glossy kernel: [   11.336925]  ?
init_generic_condition+0x183/0x300 [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336940]  init_auxch+0xf6/0x180 [nouve=
au]
Jun 29 10:40:33 glossy kernel: [   11.336954]  nvbios_exec+0x45/0xd0 [nouve=
au]
Jun 29 10:40:33 glossy kernel: [   11.336980]  nvkm_dp_train_init+0x131/0x1=
70
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337002]  nvkm_dp_acquire+0x186/0xcd0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337016]  ? init_sub_direct+0x9e/0x100
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337029]  ? nvbios_exec+0x45/0xd0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337051]  ?
nv50_disp_super_ied_on+0x2a4/0x2b0 [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337070]  nv50_disp_super_2_2+0x64/0x4=
a0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337088]  gf119_disp_super+0x17e/0x2d0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337091]  process_one_work+0x17b/0x360
Jun 29 10:40:33 glossy kernel: [   11.337093]  worker_thread+0x2e/0x390
Jun 29 10:40:33 glossy kernel: [   11.337094]  ? process_one_work+0x360/0x3=
60
Jun 29 10:40:33 glossy kernel: [   11.337096]  kthread+0x113/0x130
Jun 29 10:40:33 glossy kernel: [   11.337097]  ?
kthread_create_worker_on_cpu+0x70/0x70
Jun 29 10:40:33 glossy kernel: [   11.337099]  ret_from_fork+0x35/0x40
Jun 29 10:40:33 glossy kernel: [   11.337100] Code: 81 4c 8d 4c 24 0f 4c 8d=
 44
24 0e 44 89 e1 ba 09 00 00 00 be 01 00 00 00 48 89 ef e8 e3 26 03 00 85 c0 =
75
1b 80 7c 24 0f 01 74 02 <0f> 0b 48 89 ef e8 be 24 03 00 0f b6 44 24 0e e9 4=
5 ff
ff ff 48=20
Jun 29 10:40:33 glossy kernel: [   11.337120] ---[ end trace 49a387302b20ee=
4a
]---
Jun 29 10:40:33 glossy kernel: [   11.337260] nouveau 0000:01:00.0: disp: o=
utp
08:0006:0f44: training failed
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15302666171.56eC7EA.11269
Date: Fri, 29 Jun 2018 10:03:37 +0000
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
   title=3D"NEW - trace in kernel.log on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107069">107069</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>trace in kernel.log on boot
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>list1&#64;gir.me.uk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System:

Dell Inc. Precision 7510
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M100=
0M]
(rev a2)
Linux glossy 4.16.0-2-amd64 #1 SMP Debian 4.16.16-2 (2018-06-22) x86_64
GNU/Linux

Driver:
1.0.15

The following is seen in kern.log on boot:

```
Jun 29 10:40:33 glossy kernel: [   11.091832] nouveau 0000:01:00.0: DRM: MM:
using COPY for buffer copies
Jun 29 10:40:33 glossy kernel: [   11.209360] nouveau 0000:01:00.0: DRM:
allocated 1920x1200 fb: 0x80000, bo 0000000063723da8
Jun 29 10:40:33 glossy kernel: [   11.212107] fbcon: nouveaufb (fb0) is pri=
mary
device
Jun 29 10:40:33 glossy kernel: [   11.323910] nouveau 0000:01:00.0: disp:
0x0000681d[0]: INIT_GENERIC_CONDITON: unknown 0x07
Jun 29 10:40:33 glossy kernel: [   11.336792] WARNING: CPU: 3 PID: 234 at
/build/linux-uwVqDp/linux-4.16.16/drivers/gpu/drm/nouveau/include/nvkm/subd=
ev/i2c.h:170
init_rdauxr+0xe8/0x130 [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336792] Modules linked in: nls_ascii
nls_cp437 vfat fat snd_hda_codec_hdmi(+) arc4 intel_rapl nouveau(+)
x86_pkg_temp_thermal intel_powerclamp dell_wmi coretemp iwlmvm sparse
_keymap uvcvideo dell_laptop ppdev wmi_bmof kvm_intel mac80211 dell_smbios
snd_hda_codec_realtek snd_hda_codec_generic videobuf2_vmalloc
dell_wmi_descriptor kvm videobuf2_memops dcdbas videobuf2_v4l2 dell_smm_hwm
on mxm_wmi irqbypass iwlwifi videobuf2_common snd_hda_intel intel_cstate ttm
snd_hda_codec intel_uncore videodev drm_kms_helper media intel_rapl_perf
efi_pstore cfg80211 snd_hda_core drm rtsx_pci_ms snd_hwdep i2c
_algo_bit memstick snd_pcm evdev joydev snd_timer mei_me iTCO_wdt snd pcspkr
processor_thermal_device efivars iTCO_vendor_support tpm_crb serio_raw sg
soundcore mei shpchp intel_soc_dts_iosf intel_pch_thermal
Jun 29 10:40:33 glossy kernel: [   11.336828]  battery tpm_tis tpm_tis_core=
 tpm
parport_pc int3400_thermal int3403_thermal int3402_thermal wmi rng_core par=
port
acpi_thermal_rel dell_rbtn int340x_thermal_zone dell
_smo8800 video acpi_pad button rfkill ac sunrpc efivarfs ip_tables x_tables
autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb algif_skcipher af_alg dm_crypt
dm_mod raid10 raid456 async_raid6_recov async_memcpy async_p
q async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0
multipath linear md_mod sd_mod hid_generic usbhid hid crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel rtsx_pci_sdmmc pcbc mmc_core =
ahci
libahci aesni_intel xhci_pci aes_x86_64 libata crypto_simd glue_helper cryp=
td
xhci_hcd psmouse e1000e i2c_i801 rtsx_pci usbcore scsi_mod usb_common therm=
al
Jun 29 10:40:33 glossy kernel: [   11.336853] CPU: 3 PID: 234 Comm:
kworker/u16:2 Not tainted 4.16.0-2-amd64 #1 Debian 4.16.16-2
Jun 29 10:40:33 glossy kernel: [   11.336854] Hardware name: Dell Inc.
Precision 7510/02H5GH, BIOS 1.15.4 12/08/2017
Jun 29 10:40:33 glossy kernel: [   11.336882] Workqueue: nvkm-disp
gf119_disp_super [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336900] RIP: 0010:init_rdauxr+0xe8/0x=
130
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336901] RSP: 0018:ffffa61903a47c08
EFLAGS: 00010297
Jun 29 10:40:33 glossy kernel: [   11.336902] RAX: 0000000000000000 RBX:
ffffa61903a47c90 RCX: 0000000000000000
Jun 29 10:40:33 glossy kernel: [   11.336902] RDX: ffffa6190600e534 RSI:
ffffa6190600e534 RDI: 0000000001009000
Jun 29 10:40:33 glossy kernel: [   11.336903] RBP: ffff888758620000 R08:
ffffa61903a47c16 R09: ffffa61903a47c17
Jun 29 10:40:33 glossy kernel: [   11.336903] R10: 0000000000000000 R11:
0000000000000010 R12: 000000000000010a
Jun 29 10:40:33 glossy kernel: [   11.336904] R13: ffff88875704de80 R14:
0000000000000001 R15: 00000000000000fe
Jun 29 10:40:33 glossy kernel: [   11.336905] FS:  0000000000000000(0000)
GS:ffff88877dcc0000(0000) knlGS:0000000000000000
Jun 29 10:40:33 glossy kernel: [   11.336905] CS:  0010 DS: 0000 ES: 0000 C=
R0:
0000000080050033
Jun 29 10:40:33 glossy kernel: [   11.336906] CR2: 00007f6e12b3dc20 CR3:
0000000731c0a006 CR4: 00000000003606e0
Jun 29 10:40:33 glossy kernel: [   11.336907] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jun 29 10:40:33 glossy kernel: [   11.336907] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jun 29 10:40:33 glossy kernel: [   11.336907] Call Trace:
Jun 29 10:40:33 glossy kernel: [   11.336925]  ?
init_generic_condition+0x183/0x300 [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.336940]  init_auxch+0xf6/0x180 [nouve=
au]
Jun 29 10:40:33 glossy kernel: [   11.336954]  nvbios_exec+0x45/0xd0 [nouve=
au]
Jun 29 10:40:33 glossy kernel: [   11.336980]  nvkm_dp_train_init+0x131/0x1=
70
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337002]  nvkm_dp_acquire+0x186/0xcd0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337016]  ? init_sub_direct+0x9e/0x100
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337029]  ? nvbios_exec+0x45/0xd0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337051]  ?
nv50_disp_super_ied_on+0x2a4/0x2b0 [nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337070]  nv50_disp_super_2_2+0x64/0x4=
a0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337088]  gf119_disp_super+0x17e/0x2d0
[nouveau]
Jun 29 10:40:33 glossy kernel: [   11.337091]  process_one_work+0x17b/0x360
Jun 29 10:40:33 glossy kernel: [   11.337093]  worker_thread+0x2e/0x390
Jun 29 10:40:33 glossy kernel: [   11.337094]  ? process_one_work+0x360/0x3=
60
Jun 29 10:40:33 glossy kernel: [   11.337096]  kthread+0x113/0x130
Jun 29 10:40:33 glossy kernel: [   11.337097]  ?
kthread_create_worker_on_cpu+0x70/0x70
Jun 29 10:40:33 glossy kernel: [   11.337099]  ret_from_fork+0x35/0x40
Jun 29 10:40:33 glossy kernel: [   11.337100] Code: 81 4c 8d 4c 24 0f 4c 8d=
 44
24 0e 44 89 e1 ba 09 00 00 00 be 01 00 00 00 48 89 ef e8 e3 26 03 00 85 c0 =
75
1b 80 7c 24 0f 01 74 02 &lt;0f&gt; 0b 48 89 ef e8 be 24 03 00 0f b6 44 24 0=
e e9 45 ff
ff ff 48=20
Jun 29 10:40:33 glossy kernel: [   11.337120] ---[ end trace 49a387302b20ee=
4a
]---
Jun 29 10:40:33 glossy kernel: [   11.337260] nouveau 0000:01:00.0: disp: o=
utp
08:0006:0f44: training failed
```</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15302666171.56eC7EA.11269--

--===============1864663315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1864663315==--
