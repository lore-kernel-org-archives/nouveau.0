From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101322] New: GM108/NV118: 0 MiB DDR3 and boot crash
 in gf100_ltc_oneinit_tag_ram
Date: Tue, 06 Jun 2017 20:30:04 +0000
Message-ID: <bug-101322-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1683752321=="
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


--===============1683752321==
Content-Type: multipart/alternative; boundary="14967810040.673f6.14425";
 charset="UTF-8"


--14967810040.673f6.14425
Date: Tue, 6 Jun 2017 20:30:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101322

            Bug ID: 101322
           Summary: GM108/NV118: 0 MiB DDR3 and boot crash in
                    gf100_ltc_oneinit_tag_ram
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131742
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131742&action=3Dedit
full dmesg log

On the Acer Z20-730 laptop, the nouveau driver crashes during boot with:

[    4.041108] nouveau 0000:01:00.0: pci: failed to adjust cap speed
[    4.041167] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed
[    9.633613] nouveau 0000:01:00.0: fb: 0 MiB DDR3
[   20.811768] divide error: 0000 [#1] SMP
[   20.813654] Modules linked in: hid_generic usbmouse usbkbd usbhid i915
nouveau(+) mxm_wmi i2c_algo_bit drm_kms_helper sdhci_pci syscopyarea
sysfillrect sysimgblt fb_sys_fops ttm sdhci drm ahci libahci wmi i2c_hid hid
video
[   20.815697] CPU: 3 PID: 200 Comm: systemd-udevd Not tainted 4.11.0-2-gen=
eric
#7+dev143.9f9ecd2beos3.2.2-Endless
[   20.817684] Hardware name: Acer Aspire Z20-730/IPMAL-BR3, BIOS D01
07/07/2016
[   20.819711] task: ffff8a3070288000 task.stack: ffffa3eb4103c000
[   20.821762] RIP: 0010:gf100_ltc_oneinit_tag_ram+0xba/0x100 [nouveau]
[   20.823789] RSP: 0018:ffffa3eb4103f6b8 EFLAGS: 00010206
[   20.825773] RAX: 00001000ffefdfff RBX: ffff8a306f915000 RCX:
ffff8a3075570030
[   20.827820] RDX: 0000000000000000 RSI: dead000000000200 RDI:
ffff8a307fd9b700
[   20.829797] RBP: ffffa3eb4103f6d0 R08: 000000000001e980 R09:
ffff8a3077003900
[   20.831825] R10: ffffa3eb40cdbda0 R11: ffff8a307fd986a4 R12:
0000000000000000
[   20.833814] R13: 0000000100005fff R14: ffff8a306fa2e400 R15:
ffff8a306f914e00
[   20.835882] FS:  00007f456d052900(0000) GS:ffff8a307fd80000(0000)
knlGS:0000000000000000
[   20.837874] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   20.839935] CR2: 00007fefceb1c020 CR3: 000000026fbc5000 CR4:
00000000003406e0
[   20.841918] Call Trace:
[   20.843972]  gm107_ltc_oneinit+0x7c/0x90 [nouveau]
[   20.845952]  nvkm_ltc_oneinit+0x13/0x20 [nouveau]
[   20.847991]  nvkm_subdev_init+0x50/0x210 [nouveau]
[   20.849977]  nvkm_device_init+0x151/0x270 [nouveau]
[   20.851997]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   20.853944]  nvkm_object_init+0x40/0x190 [nouveau]
[   20.855924]  nvkm_ioctl_new+0x179/0x290 [nouveau]
[   20.857838]  ? nvkm_client_notify+0x30/0x30 [nouveau]
[   20.859794]  ? nvkm_udevice_rd08+0x30/0x30 [nouveau]
[   20.861674]  nvkm_ioctl+0x168/0x240 [nouveau]
[   20.863576]  ? nvif_client_init+0x42/0x110 [nouveau]
[   20.865449]  nvkm_client_ioctl+0x12/0x20 [nouveau]
[   20.867368]  nvif_object_ioctl+0x42/0x50 [nouveau]
[   20.869237]  nvif_object_init+0xc2/0x130 [nouveau]
[   20.871141]  nvif_device_init+0x12/0x30 [nouveau]
[   20.872994]  nouveau_cli_init+0x15e/0x1d0 [nouveau]
[   20.874873]  nouveau_drm_load+0x67/0x8b0 [nouveau]
[   20.876674]  ? sysfs_do_create_link_sd.isra.2+0x70/0xb0
[   20.878451]  drm_dev_register+0x148/0x1e0 [drm]
[   20.880302]  drm_get_pci_dev+0xa0/0x160 [drm]
[   20.882166]  nouveau_drm_probe+0x1d9/0x260 [nouveau]

This has been reproduced on 4.12-rc3. Please let us know how we can help wi=
th
further debugging.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14967810040.673f6.14425
Date: Tue, 6 Jun 2017 20:30:04 +0000
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
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322">101322</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_oneinit_t=
ag_ram
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
          <td>dan&#64;reactivated.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131742=
" name=3D"attach_131742" title=3D"full dmesg log">attachment 131742</a> <a =
href=3D"attachment.cgi?id=3D131742&amp;action=3Dedit" title=3D"full dmesg l=
og">[details]</a></span>
full dmesg log

On the Acer Z20-730 laptop, the nouveau driver crashes during boot with:

[    4.041108] nouveau 0000:01:00.0: pci: failed to adjust cap speed
[    4.041167] nouveau 0000:01:00.0: pci: failed to adjust lnkctl speed
[    9.633613] nouveau 0000:01:00.0: fb: 0 MiB DDR3
[   20.811768] divide error: 0000 [#1] SMP
[   20.813654] Modules linked in: hid_generic usbmouse usbkbd usbhid i915
nouveau(+) mxm_wmi i2c_algo_bit drm_kms_helper sdhci_pci syscopyarea
sysfillrect sysimgblt fb_sys_fops ttm sdhci drm ahci libahci wmi i2c_hid hid
video
[   20.815697] CPU: 3 PID: 200 Comm: systemd-udevd Not tainted 4.11.0-2-gen=
eric
#7+dev143.9f9ecd2beos3.2.2-Endless
[   20.817684] Hardware name: Acer Aspire Z20-730/IPMAL-BR3, BIOS D01
07/07/2016
[   20.819711] task: ffff8a3070288000 task.stack: ffffa3eb4103c000
[   20.821762] RIP: 0010:gf100_ltc_oneinit_tag_ram+0xba/0x100 [nouveau]
[   20.823789] RSP: 0018:ffffa3eb4103f6b8 EFLAGS: 00010206
[   20.825773] RAX: 00001000ffefdfff RBX: ffff8a306f915000 RCX:
ffff8a3075570030
[   20.827820] RDX: 0000000000000000 RSI: dead000000000200 RDI:
ffff8a307fd9b700
[   20.829797] RBP: ffffa3eb4103f6d0 R08: 000000000001e980 R09:
ffff8a3077003900
[   20.831825] R10: ffffa3eb40cdbda0 R11: ffff8a307fd986a4 R12:
0000000000000000
[   20.833814] R13: 0000000100005fff R14: ffff8a306fa2e400 R15:
ffff8a306f914e00
[   20.835882] FS:  00007f456d052900(0000) GS:ffff8a307fd80000(0000)
knlGS:0000000000000000
[   20.837874] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   20.839935] CR2: 00007fefceb1c020 CR3: 000000026fbc5000 CR4:
00000000003406e0
[   20.841918] Call Trace:
[   20.843972]  gm107_ltc_oneinit+0x7c/0x90 [nouveau]
[   20.845952]  nvkm_ltc_oneinit+0x13/0x20 [nouveau]
[   20.847991]  nvkm_subdev_init+0x50/0x210 [nouveau]
[   20.849977]  nvkm_device_init+0x151/0x270 [nouveau]
[   20.851997]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   20.853944]  nvkm_object_init+0x40/0x190 [nouveau]
[   20.855924]  nvkm_ioctl_new+0x179/0x290 [nouveau]
[   20.857838]  ? nvkm_client_notify+0x30/0x30 [nouveau]
[   20.859794]  ? nvkm_udevice_rd08+0x30/0x30 [nouveau]
[   20.861674]  nvkm_ioctl+0x168/0x240 [nouveau]
[   20.863576]  ? nvif_client_init+0x42/0x110 [nouveau]
[   20.865449]  nvkm_client_ioctl+0x12/0x20 [nouveau]
[   20.867368]  nvif_object_ioctl+0x42/0x50 [nouveau]
[   20.869237]  nvif_object_init+0xc2/0x130 [nouveau]
[   20.871141]  nvif_device_init+0x12/0x30 [nouveau]
[   20.872994]  nouveau_cli_init+0x15e/0x1d0 [nouveau]
[   20.874873]  nouveau_drm_load+0x67/0x8b0 [nouveau]
[   20.876674]  ? sysfs_do_create_link_sd.isra.2+0x70/0xb0
[   20.878451]  drm_dev_register+0x148/0x1e0 [drm]
[   20.880302]  drm_get_pci_dev+0xa0/0x160 [drm]
[   20.882166]  nouveau_drm_probe+0x1d9/0x260 [nouveau]

This has been reproduced on 4.12-rc3. Please let us know how we can help wi=
th
further debugging.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14967810040.673f6.14425--

--===============1683752321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1683752321==--
