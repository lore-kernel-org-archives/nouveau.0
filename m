From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104609] New: [G96,
 9500 GT] Removing nouveau module results in BUG: unable to handle
 kernel NULL pointer dereference at 00000000000000b8
Date: Fri, 12 Jan 2018 19:16:44 +0000
Message-ID: <bug-104609-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1899214239=="
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


--===============1899214239==
Content-Type: multipart/alternative; boundary="15157846040.D3Cc31DAa.6307"
Content-Transfer-Encoding: 7bit


--15157846040.D3Cc31DAa.6307
Date: Fri, 12 Jan 2018 19:16:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104609

            Bug ID: 104609
           Summary: [G96, 9500 GT] Removing nouveau module results in BUG:
                    unable to handle kernel NULL pointer dereference at
                    00000000000000b8
           Product: Mesa
           Version: unspecified
          Hardware: All
                OS: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vedran-v8Fv/IwHOXbR7s880joybQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 136693
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136693&action=3Dedit
dmesg

Description of problem:
Removing nouveau module using modprobe -r results in BUG: unable to handle
kernel NULL pointer dereference at 00000000000000b8

Version-Release number of selected component (if applicable):
Linux 4.14.0-3-amd64 (Debian 4.14.12-2)

How reproducible:
Didn't try.

Steps to Reproduce:
1. sudo modprobe -r nouveau
2.
3.

Actual results:
[466017.592089] BUG: unable to handle kernel NULL pointer dereference at
00000000000000b8
[466017.592089] IP: nouveau_fbcon_fini+0xb8/0x120 [nouveau]
[466017.592089] PGD 0 P4D 0=20
[466017.592089] Oops: 0000 [#1] SMP NOPTI
[466017.592089] Modules linked in: ufs qnx4 hfsplus hfs minix ntfs vfat msd=
os
fat jfs xfs dm_mod cfg80211 rfkill snd_hrtimer snd_seq_midi snd_seq_midi_ev=
ent
snd_rawmidi snd_seq snd_seq_device iptable_filter fuse tun powernow_k8
amd64_edac_mod edac_mce_amd nouveau(-) kvm_amd kvm irqbypass mxm_wmi wmi vi=
deo
ppdev ttm drm_kms_helper evdev drm snd_hda_codec_realtek snd_hda_codec_gene=
ric
i2c_algo_bit snd_hda_intel serio_raw snd_hda_codec pcspkr snd_hda_core k8te=
mp
snd_hwdep snd_pcm_oss snd_mixer_oss snd_pcm snd_timer sg snd soundcore
parport_pc shpchp parport asus_atk0110 button binfmt_misc sunrpc loop ecryp=
tfs
ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb crypto_simd
cryptd glue_helper aes_x86_64 uas usb_storage hid_generic usbhid hid btrfs
zstd_decompress zstd_compress xxhash sr_mod cdrom
[466017.592089]  raid10 raid456 async_raid6_recov async_memcpy async_pq
async_xor async_tx xor sd_mod raid6_pq libcrc32c crc32c_generic raid1 raid0
multipath linear md_mod ata_generic psmouse r8169 via_rhine mii uhci_hcd
ehci_pci ehci_hcd i2c_viapro sata_via pata_via usbcore libata usb_common
scsi_mod floppy
[466017.592089] CPU: 1 PID: 26532 Comm: modprobe Not tainted 4.14.0-3-amd64=
 #1
Debian 4.14.12-2
[466017.592089] Hardware name: stem manufacturer System Product
Name/M2VTVM-VM890, BIOS 1201    03/17/2008
[466017.592089] task: ffff89b926dfc100 task.stack: ffffaae4c324c000
[466017.592089] RIP: 0010:nouveau_fbcon_fini+0xb8/0x120 [nouveau]
[466017.592089] RSP: 0018:ffffaae4c324fdb8 EFLAGS: 00010282
[466017.592089] RAX: 0000000000000000 RBX: ffff89b97b7ff800 RCX:
fffff31601e3815f
[466017.592089] RDX: 000000000000003b RSI: ffff89b97c3c3680 RDI:
0000000000000282
[466017.592089] RBP: ffff89b97b062000 R08: 0000000000000002 R09:
ffff89b976db8540
[466017.592089] R10: ffffaae4c324fdb8 R11: 0000000000000001 R12:
0000000000000000
[466017.592089] R13: ffffffffc0d52770 R14: ffff89b97cab4100 R15:
ffffffffc0d527e8
[466017.592089] FS:  00007fc9e0352540(0000) GS:ffff89b97fd00000(0000)
knlGS:0000000000000000
[466017.592089] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[466017.592089] CR2: 00000000000000b8 CR3: 0000000029b5e000 CR4:
00000000000006e0
[466017.592089] Call Trace:
[466017.592089]  nouveau_drm_unload+0x37/0xd0 [nouveau]
[466017.592089]  drm_dev_unregister+0x3c/0xe0 [drm]
[466017.592089]  drm_put_dev+0x2e/0x60 [drm]
[466017.592089]  nouveau_drm_device_remove+0x44/0x70 [nouveau]
[466017.592089]  pci_device_remove+0x36/0xb0
[466017.592089]  device_release_driver_internal+0x157/0x210
[466017.592089]  driver_detach+0x39/0x70
[466017.592089]  bus_remove_driver+0x51/0xd0
[466017.592089]  pci_unregister_driver+0x2a/0xa0
[466017.592089]  nouveau_drm_exit+0x15/0x1c5 [nouveau]
[466017.592089]  SyS_delete_module+0x18c/0x290
[466017.592089]  system_call_fast_compare_end+0xc/0x6f
[466017.592089] RIP: 0033:0x7fc9dfefcad7
[466017.592089] RSP: 002b:00007ffea4c86a38 EFLAGS: 00000206
[466017.592089] Code: e8 6e 59 f4 ff 48 8d bb 10 01 00 00 e8 62 59 f4 ff 48=
 8b
9d a0 09 00 00 4c 8b 23 48 89 df e8 30 eb d2 ff 48 89 df e8 58 f2 d2 ff <49=
> 8b
bc 24 b8 00 00 00 48 85 ff 74 31 49 8d b4 24 c0 00 00 00=20
[466017.592089] RIP: nouveau_fbcon_fini+0xb8/0x120 [nouveau] RSP:
ffffaae4c324fdb8
[466017.592089] CR2: 00000000000000b8
[466017.596375] ---[ end trace e8cb85440e5df03c ]---

Expected results:
No error.

Additional info:
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96 [GeForce 9=
500
GT] [10de:0640] (rev a1)

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15157846040.D3Cc31DAa.6307
Date: Fri, 12 Jan 2018 19:16:44 +0000
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
   title=3D"NEW - [G96, 9500 GT] Removing nouveau module results in BUG: un=
able to handle kernel NULL pointer dereference at 00000000000000b8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104609">104609</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[G96, 9500 GT] Removing nouveau module results in BUG: unable=
 to handle kernel NULL pointer dereference at 00000000000000b8
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vedran&#64;miletic.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136693=
" name=3D"attach_136693" title=3D"dmesg">attachment 136693</a> <a href=3D"a=
ttachment.cgi?id=3D136693&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

Description of problem:
Removing nouveau module using modprobe -r results in BUG: unable to handle
kernel NULL pointer dereference at 00000000000000b8

Version-Release number of selected component (if applicable):
Linux 4.14.0-3-amd64 (Debian 4.14.12-2)

How reproducible:
Didn't try.

Steps to Reproduce:
1. sudo modprobe -r nouveau
2.
3.

Actual results:
[466017.592089] BUG: unable to handle kernel NULL pointer dereference at
00000000000000b8
[466017.592089] IP: nouveau_fbcon_fini+0xb8/0x120 [nouveau]
[466017.592089] PGD 0 P4D 0=20
[466017.592089] Oops: 0000 [#1] SMP NOPTI
[466017.592089] Modules linked in: ufs qnx4 hfsplus hfs minix ntfs vfat msd=
os
fat jfs xfs dm_mod cfg80211 rfkill snd_hrtimer snd_seq_midi snd_seq_midi_ev=
ent
snd_rawmidi snd_seq snd_seq_device iptable_filter fuse tun powernow_k8
amd64_edac_mod edac_mce_amd nouveau(-) kvm_amd kvm irqbypass mxm_wmi wmi vi=
deo
ppdev ttm drm_kms_helper evdev drm snd_hda_codec_realtek snd_hda_codec_gene=
ric
i2c_algo_bit snd_hda_intel serio_raw snd_hda_codec pcspkr snd_hda_core k8te=
mp
snd_hwdep snd_pcm_oss snd_mixer_oss snd_pcm snd_timer sg snd soundcore
parport_pc shpchp parport asus_atk0110 button binfmt_misc sunrpc loop ecryp=
tfs
ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb crypto_simd
cryptd glue_helper aes_x86_64 uas usb_storage hid_generic usbhid hid btrfs
zstd_decompress zstd_compress xxhash sr_mod cdrom
[466017.592089]  raid10 raid456 async_raid6_recov async_memcpy async_pq
async_xor async_tx xor sd_mod raid6_pq libcrc32c crc32c_generic raid1 raid0
multipath linear md_mod ata_generic psmouse r8169 via_rhine mii uhci_hcd
ehci_pci ehci_hcd i2c_viapro sata_via pata_via usbcore libata usb_common
scsi_mod floppy
[466017.592089] CPU: 1 PID: 26532 Comm: modprobe Not tainted 4.14.0-3-amd64=
 #1
Debian 4.14.12-2
[466017.592089] Hardware name: stem manufacturer System Product
Name/M2VTVM-VM890, BIOS 1201    03/17/2008
[466017.592089] task: ffff89b926dfc100 task.stack: ffffaae4c324c000
[466017.592089] RIP: 0010:nouveau_fbcon_fini+0xb8/0x120 [nouveau]
[466017.592089] RSP: 0018:ffffaae4c324fdb8 EFLAGS: 00010282
[466017.592089] RAX: 0000000000000000 RBX: ffff89b97b7ff800 RCX:
fffff31601e3815f
[466017.592089] RDX: 000000000000003b RSI: ffff89b97c3c3680 RDI:
0000000000000282
[466017.592089] RBP: ffff89b97b062000 R08: 0000000000000002 R09:
ffff89b976db8540
[466017.592089] R10: ffffaae4c324fdb8 R11: 0000000000000001 R12:
0000000000000000
[466017.592089] R13: ffffffffc0d52770 R14: ffff89b97cab4100 R15:
ffffffffc0d527e8
[466017.592089] FS:  00007fc9e0352540(0000) GS:ffff89b97fd00000(0000)
knlGS:0000000000000000
[466017.592089] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[466017.592089] CR2: 00000000000000b8 CR3: 0000000029b5e000 CR4:
00000000000006e0
[466017.592089] Call Trace:
[466017.592089]  nouveau_drm_unload+0x37/0xd0 [nouveau]
[466017.592089]  drm_dev_unregister+0x3c/0xe0 [drm]
[466017.592089]  drm_put_dev+0x2e/0x60 [drm]
[466017.592089]  nouveau_drm_device_remove+0x44/0x70 [nouveau]
[466017.592089]  pci_device_remove+0x36/0xb0
[466017.592089]  device_release_driver_internal+0x157/0x210
[466017.592089]  driver_detach+0x39/0x70
[466017.592089]  bus_remove_driver+0x51/0xd0
[466017.592089]  pci_unregister_driver+0x2a/0xa0
[466017.592089]  nouveau_drm_exit+0x15/0x1c5 [nouveau]
[466017.592089]  SyS_delete_module+0x18c/0x290
[466017.592089]  system_call_fast_compare_end+0xc/0x6f
[466017.592089] RIP: 0033:0x7fc9dfefcad7
[466017.592089] RSP: 002b:00007ffea4c86a38 EFLAGS: 00000206
[466017.592089] Code: e8 6e 59 f4 ff 48 8d bb 10 01 00 00 e8 62 59 f4 ff 48=
 8b
9d a0 09 00 00 4c 8b 23 48 89 df e8 30 eb d2 ff 48 89 df e8 58 f2 d2 ff &lt=
;49&gt; 8b
bc 24 b8 00 00 00 48 85 ff 74 31 49 8d b4 24 c0 00 00 00=20
[466017.592089] RIP: nouveau_fbcon_fini+0xb8/0x120 [nouveau] RSP:
ffffaae4c324fdb8
[466017.592089] CR2: 00000000000000b8
[466017.596375] ---[ end trace e8cb85440e5df03c ]---

Expected results:
No error.

Additional info:
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96 [GeForce 9=
500
GT] [10de:0640] (rev a1)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15157846040.D3Cc31DAa.6307--

--===============1899214239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1899214239==--
