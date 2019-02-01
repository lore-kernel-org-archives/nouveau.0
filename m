From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109529] New: [NV46] unable to handle kernel paging
 request
Date: Fri, 01 Feb 2019 11:27:03 +0000
Message-ID: <bug-109529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1822347932=="
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


--===============1822347932==
Content-Type: multipart/alternative; boundary="15490204230.af0134.29981"
Content-Transfer-Encoding: 7bit


--15490204230.af0134.29981
Date: Fri, 1 Feb 2019 11:27:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109529

            Bug ID: 109529
           Summary: [NV46] unable to handle kernel paging request
           Product: Mesa
           Version: 18.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dflogeras2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Dell D820 w Quadro NVS 110M
Gentoo running kernel 4.19.x (see below)
Mesa 18.2.8 and GIT (see below)
Compiled with GCC 7.3.0


I've started trying to use nouveau since the Nvidia driver has finally been
removed from Gentoo's repos.  I had some bumps in the road attempting to use
plasma, so I thought I'd give it a break and just use LXQT until I have to =
more
time to diagnose those issues.  It seems to work much more smoothly.

However, I am seeing the odd lockup.  It manifests itself in such a way that
eventually I simply cannot open any new applications.  Usually one is stuck=
 in
the background @ 100% cpu at this point.  I cannot kill it even as root with
signal 9.  I have discovered that if I login to LXQT and just open a 15-20
konsoles, I can trigger the behaviour faster than under normal use.  The on=
ly
workaround at this point is a reboot.

This kernel log was captured while running 4.19.14 kernel and mesa-18.2.8. =
 I
have since upgraded to 4.19.18 kernel and mesa-9999 (Gentoo language for GIT
head).  When I'm back in the office I'll attempt to break it on this
configuration.  I'm happy to recompile things, bisect, patch etc.  since I
already have all the source.  Any help appreciated.


[  243.143035] BUG: unable to handle kernel paging request at f7d373cc
[  243.143060] *pde =3D 35816067 *pte =3D 00000000=20
[  243.143070] Oops: 0000 [#1] PREEMPT SMP
[  243.143079] CPU: 1 PID: 4483 Comm: konsole Not tainted 4.19.14-gentoo #1
[  243.143087] Hardware name: Dell Inc. Latitude D820                   /, =
BIOS
A10 01/27/2010
[  243.143147] EIP: nvkm_ramht_search+0x6f/0x92 [nouveau]
[  243.143156] Code: e4 8b 4d f0 83 e9 04 89 d3 d3 e3 31 de 89 f3 eb 0e 83 =
c3
01 39 58 0c 77 02 31 db 39 f3 74 20 8d 0c 1b 01 d9 01 c9 01 c9 01 c1 <39> 5=
1 18
75 e2 39 79 1c 75 dd 8b 41 14 83 c4 10 5b 5e 5f 5d c3 31
[  243.143176] EAX: f7d22000 EBX: 00001c4f ECX: f7d373b4 EDX: 00000010
[  243.143184] ESI: 00001c4f EDI: beef0201 EBP: e26dbb30 ESP: e26dbb14
[  243.143192] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010286
[  243.143200] CR0: 80050033 CR2: f7d373cc CR3: 22652000 CR4: 000006d0
[  243.143207] Call Trace:
[  243.143243]  nvkm_ramht_insert+0x1b/0xbc [nouveau]
[  243.143287]  ? nv04_dmaobj_new+0x53/0xfa [nouveau]
[  243.143330]  nv40_fifo_dma_object_ctor+0x77/0xbf [nouveau]
[  243.143374]  nvkm_fifo_chan_child_new+0x1b7/0x20c [nouveau]
[  243.143419]  ? nvkm_dma_oclass_new+0x42/0x42 [nouveau]
[  243.143462]  ? nvkm_fifo_chan_child_del+0x76/0x76 [nouveau]
[  243.143506]  ? nvkm_fifo_chan_init+0x17/0x17 [nouveau]
[  243.143541]  nvkm_ioctl_new+0x1ab/0x268 [nouveau]
[  243.143550]  ? __insert_vmap_area+0x5b/0x98
[  243.143559]  ? _raw_spin_unlock+0x10/0x23
[  243.143565]  ? alloc_vmap_area.isra.8+0x250/0x2e8
[  243.143571]  ? _raw_read_unlock+0x16/0x29
[  243.143614]  ? nvkm_fifo_chan_child_del+0x76/0x76 [nouveau]
[  243.143657]  ? nvkm_dma_oclass_new+0x42/0x42 [nouveau]
[  243.143693]  ? nvkm_ioctl_del+0x9a/0x9a [nouveau]
[  243.143727]  nvkm_ioctl+0xe8/0x275 [nouveau]
[  243.143766]  ? nvkm_client_ioctl+0x1c/0x22 [nouveau]
[  243.143807]  nvkm_client_ioctl+0x1c/0x22 [nouveau]
[  243.143846]  ? nvkm_client_map+0xf/0xf [nouveau]
[  243.143861]  nvif_object_ioctl+0x47/0x66 [nouveau]
[  243.143861]  nvif_object_init+0xbc/0x1a0 [nouveau]
[  243.143861]  nouveau_channel_new+0x25e/0x6b5 [nouveau]
[  243.143861]  ? nvif_device_init+0x50/0x57 [nouveau]
[  243.143861]  nouveau_abi16_ioctl_channel_alloc+0xb6/0x321 [nouveau]
[  243.143861]  ? nouveau_abi16_ioctl_setparam+0xa/0xa [nouveau]
[  243.143861]  drm_ioctl_kernel+0x5d/0x97 [drm]
[  243.143861]  drm_ioctl+0x2d6/0x3a2 [drm]
[  243.143861]  ? nouveau_abi16_ioctl_setparam+0xa/0xa [nouveau]
[  243.143861]  ? _raw_spin_unlock_irqrestore+0x12/0x2b
[  243.143861]  ? __pm_runtime_resume+0x3b/0x45
[  243.143861]  nouveau_drm_ioctl+0x53/0x9a [nouveau]
[  243.143861]  ? nouveau_pmops_thaw+0xf/0xf [nouveau]
[  243.143861]  do_vfs_ioctl+0x85/0x635
[  243.143861]  ? _raw_spin_unlock+0x10/0x23
[  243.143861]  ? handle_mm_fault+0x67d/0x859
[  243.143861]  ? __fget+0x5c/0x93
[  243.143861]  ? __fget_light+0x43/0x4d
[  243.143861]  ksys_ioctl+0x33/0x52
[  243.143861]  sys_ioctl+0x11/0x13
[  243.143861]  do_fast_syscall_32+0x8f/0x1c2
[  243.143861]  entry_SYSENTER_32+0x6b/0xbe
[  243.143861] EIP: 0xb7fb9af5
[  243.143861] Code: 82 f8 ff ff 8b 55 08 8b 80 5c cd ff ff 85 d2 74 02 89 =
02
5d c3 8b 04 24 c3 8b 0c 24 c3 8b 1c 24 c3 51 52 55 89 e5 0f 34 cd 80 <5d> 5=
a 59
c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
[  243.143861] EAX: ffffffda EBX: 0000000f ECX: c0586442 EDX: bff74b24
[  243.143861] ESI: 01274e40 EDI: c0586442 EBP: 0000000f ESP: bff74aa8
[  243.143861] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200296
[  243.143861] Modules linked in: nls_iso8859_1 nls_cp437 vfat fat nouveau
i2c_algo_bit drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect
sysimgblt fb_sys_fops cfbcopyarea ttm drm drm_panel_orientation_quirks tun =
nfs
lockd grace sunrpc bnep cdc_acm usb_storage btusb btbcm btintel bluetooth
ecdh_generic cp210x usbserial joydev btrfs xor zstd_decompress zstd_compress
xxhash lzo_compress lzo_decompress zlib_deflate raid6_pq arc4 pcmcia iwl3945
iwlegacy mac80211 dell_laptop coretemp psmouse dell_smbios dcdbas yenta_soc=
ket
dell_wmi_descriptor i2c_i801 pcmcia_rsrc tg3 pcmcia_core cfg80211 ptp sr_mod
rfkill pps_core libphy cdrom snd_hda_codec_idt uhci_hcd snd_hda_codec_gener=
ic
ehci_pci ehci_hcd snd_hda_intel usbcore snd_hda_codec snd_hda_core usb_comm=
on
snd_pcm snd_timer intel_agp snd intel_gtt
[  243.143861]  soundcore agpgart
[  243.143861] CR2: 00000000f7d373cc
[  243.146080] ---[ end trace 0570214cb6b5ba77 ]---
[  243.146080] EIP: nvkm_ramht_search+0x6f/0x92 [nouveau]
[  243.146080] Code: e4 8b 4d f0 83 e9 04 89 d3 d3 e3 31 de 89 f3 eb 0e 83 =
c3
01 39 58 0c 77 02 31 db 39 f3 74 20 8d 0c 1b 01 d9 01 c9 01 c9 01 c1 <39> 5=
1 18
75 e2 39 79 1c 75 dd 8b 41 14 83 c4 10 5b 5e 5f 5d c3 31
[  243.146080] EAX: f7d22000 EBX: 00001c4f ECX: f7d373b4 EDX: 00000010
[  243.146080] ESI: 00001c4f EDI: beef0201 EBP: e26dbb30 ESP: d055d43c
[  243.146080] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010286
[  243.146080] CR0: 80050033 CR2: f7d373cc CR3: 22652000 CR4: 000006d0

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15490204230.af0134.29981
Date: Fri, 1 Feb 2019 11:27:03 +0000
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
   title=3D"NEW - [NV46] unable to handle kernel paging request"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109529">109529</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV46] unable to handle kernel paging request
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.2
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
          <td>dflogeras2&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Dell D820 w Quadro NVS 110M
Gentoo running kernel 4.19.x (see below)
Mesa 18.2.8 and GIT (see below)
Compiled with GCC 7.3.0


I've started trying to use nouveau since the Nvidia driver has finally been
removed from Gentoo's repos.  I had some bumps in the road attempting to use
plasma, so I thought I'd give it a break and just use LXQT until I have to =
more
time to diagnose those issues.  It seems to work much more smoothly.

However, I am seeing the odd lockup.  It manifests itself in such a way that
eventually I simply cannot open any new applications.  Usually one is stuck=
 in
the background &#64; 100% cpu at this point.  I cannot kill it even as root=
 with
signal 9.  I have discovered that if I login to LXQT and just open a 15-20
konsoles, I can trigger the behaviour faster than under normal use.  The on=
ly
workaround at this point is a reboot.

This kernel log was captured while running 4.19.14 kernel and mesa-18.2.8. =
 I
have since upgraded to 4.19.18 kernel and mesa-9999 (Gentoo language for GIT
head).  When I'm back in the office I'll attempt to break it on this
configuration.  I'm happy to recompile things, bisect, patch etc.  since I
already have all the source.  Any help appreciated.


[  243.143035] BUG: unable to handle kernel paging request at f7d373cc
[  243.143060] *pde =3D 35816067 *pte =3D 00000000=20
[  243.143070] Oops: 0000 [#1] PREEMPT SMP
[  243.143079] CPU: 1 PID: 4483 Comm: konsole Not tainted 4.19.14-gentoo #1
[  243.143087] Hardware name: Dell Inc. Latitude D820                   /, =
BIOS
A10 01/27/2010
[  243.143147] EIP: nvkm_ramht_search+0x6f/0x92 [nouveau]
[  243.143156] Code: e4 8b 4d f0 83 e9 04 89 d3 d3 e3 31 de 89 f3 eb 0e 83 =
c3
01 39 58 0c 77 02 31 db 39 f3 74 20 8d 0c 1b 01 d9 01 c9 01 c9 01 c1 &lt;39=
&gt; 51 18
75 e2 39 79 1c 75 dd 8b 41 14 83 c4 10 5b 5e 5f 5d c3 31
[  243.143176] EAX: f7d22000 EBX: 00001c4f ECX: f7d373b4 EDX: 00000010
[  243.143184] ESI: 00001c4f EDI: beef0201 EBP: e26dbb30 ESP: e26dbb14
[  243.143192] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010286
[  243.143200] CR0: 80050033 CR2: f7d373cc CR3: 22652000 CR4: 000006d0
[  243.143207] Call Trace:
[  243.143243]  nvkm_ramht_insert+0x1b/0xbc [nouveau]
[  243.143287]  ? nv04_dmaobj_new+0x53/0xfa [nouveau]
[  243.143330]  nv40_fifo_dma_object_ctor+0x77/0xbf [nouveau]
[  243.143374]  nvkm_fifo_chan_child_new+0x1b7/0x20c [nouveau]
[  243.143419]  ? nvkm_dma_oclass_new+0x42/0x42 [nouveau]
[  243.143462]  ? nvkm_fifo_chan_child_del+0x76/0x76 [nouveau]
[  243.143506]  ? nvkm_fifo_chan_init+0x17/0x17 [nouveau]
[  243.143541]  nvkm_ioctl_new+0x1ab/0x268 [nouveau]
[  243.143550]  ? __insert_vmap_area+0x5b/0x98
[  243.143559]  ? _raw_spin_unlock+0x10/0x23
[  243.143565]  ? alloc_vmap_area.isra.8+0x250/0x2e8
[  243.143571]  ? _raw_read_unlock+0x16/0x29
[  243.143614]  ? nvkm_fifo_chan_child_del+0x76/0x76 [nouveau]
[  243.143657]  ? nvkm_dma_oclass_new+0x42/0x42 [nouveau]
[  243.143693]  ? nvkm_ioctl_del+0x9a/0x9a [nouveau]
[  243.143727]  nvkm_ioctl+0xe8/0x275 [nouveau]
[  243.143766]  ? nvkm_client_ioctl+0x1c/0x22 [nouveau]
[  243.143807]  nvkm_client_ioctl+0x1c/0x22 [nouveau]
[  243.143846]  ? nvkm_client_map+0xf/0xf [nouveau]
[  243.143861]  nvif_object_ioctl+0x47/0x66 [nouveau]
[  243.143861]  nvif_object_init+0xbc/0x1a0 [nouveau]
[  243.143861]  nouveau_channel_new+0x25e/0x6b5 [nouveau]
[  243.143861]  ? nvif_device_init+0x50/0x57 [nouveau]
[  243.143861]  nouveau_abi16_ioctl_channel_alloc+0xb6/0x321 [nouveau]
[  243.143861]  ? nouveau_abi16_ioctl_setparam+0xa/0xa [nouveau]
[  243.143861]  drm_ioctl_kernel+0x5d/0x97 [drm]
[  243.143861]  drm_ioctl+0x2d6/0x3a2 [drm]
[  243.143861]  ? nouveau_abi16_ioctl_setparam+0xa/0xa [nouveau]
[  243.143861]  ? _raw_spin_unlock_irqrestore+0x12/0x2b
[  243.143861]  ? __pm_runtime_resume+0x3b/0x45
[  243.143861]  nouveau_drm_ioctl+0x53/0x9a [nouveau]
[  243.143861]  ? nouveau_pmops_thaw+0xf/0xf [nouveau]
[  243.143861]  do_vfs_ioctl+0x85/0x635
[  243.143861]  ? _raw_spin_unlock+0x10/0x23
[  243.143861]  ? handle_mm_fault+0x67d/0x859
[  243.143861]  ? __fget+0x5c/0x93
[  243.143861]  ? __fget_light+0x43/0x4d
[  243.143861]  ksys_ioctl+0x33/0x52
[  243.143861]  sys_ioctl+0x11/0x13
[  243.143861]  do_fast_syscall_32+0x8f/0x1c2
[  243.143861]  entry_SYSENTER_32+0x6b/0xbe
[  243.143861] EIP: 0xb7fb9af5
[  243.143861] Code: 82 f8 ff ff 8b 55 08 8b 80 5c cd ff ff 85 d2 74 02 89 =
02
5d c3 8b 04 24 c3 8b 0c 24 c3 8b 1c 24 c3 51 52 55 89 e5 0f 34 cd 80 &lt;5d=
&gt; 5a 59
c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
[  243.143861] EAX: ffffffda EBX: 0000000f ECX: c0586442 EDX: bff74b24
[  243.143861] ESI: 01274e40 EDI: c0586442 EBP: 0000000f ESP: bff74aa8
[  243.143861] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200296
[  243.143861] Modules linked in: nls_iso8859_1 nls_cp437 vfat fat nouveau
i2c_algo_bit drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect
sysimgblt fb_sys_fops cfbcopyarea ttm drm drm_panel_orientation_quirks tun =
nfs
lockd grace sunrpc bnep cdc_acm usb_storage btusb btbcm btintel bluetooth
ecdh_generic cp210x usbserial joydev btrfs xor zstd_decompress zstd_compress
xxhash lzo_compress lzo_decompress zlib_deflate raid6_pq arc4 pcmcia iwl3945
iwlegacy mac80211 dell_laptop coretemp psmouse dell_smbios dcdbas yenta_soc=
ket
dell_wmi_descriptor i2c_i801 pcmcia_rsrc tg3 pcmcia_core cfg80211 ptp sr_mod
rfkill pps_core libphy cdrom snd_hda_codec_idt uhci_hcd snd_hda_codec_gener=
ic
ehci_pci ehci_hcd snd_hda_intel usbcore snd_hda_codec snd_hda_core usb_comm=
on
snd_pcm snd_timer intel_agp snd intel_gtt
[  243.143861]  soundcore agpgart
[  243.143861] CR2: 00000000f7d373cc
[  243.146080] ---[ end trace 0570214cb6b5ba77 ]---
[  243.146080] EIP: nvkm_ramht_search+0x6f/0x92 [nouveau]
[  243.146080] Code: e4 8b 4d f0 83 e9 04 89 d3 d3 e3 31 de 89 f3 eb 0e 83 =
c3
01 39 58 0c 77 02 31 db 39 f3 74 20 8d 0c 1b 01 d9 01 c9 01 c9 01 c1 &lt;39=
&gt; 51 18
75 e2 39 79 1c 75 dd 8b 41 14 83 c4 10 5b 5e 5f 5d c3 31
[  243.146080] EAX: f7d22000 EBX: 00001c4f ECX: f7d373b4 EDX: 00000010
[  243.146080] ESI: 00001c4f EDI: beef0201 EBP: e26dbb30 ESP: d055d43c
[  243.146080] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010286
[  243.146080] CR0: 80050033 CR2: f7d373cc CR3: 22652000 CR4: 000006d0</pre>
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

--15490204230.af0134.29981--

--===============1822347932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1822347932==--
