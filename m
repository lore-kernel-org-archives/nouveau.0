From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102381] New: [REGRESSION] GK107GLM fails to perform
 runtime resume on W530
Date: Wed, 23 Aug 2017 21:08:25 +0000
Message-ID: <bug-102381-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0245365587=="
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


--===============0245365587==
Content-Type: multipart/alternative; boundary="15035225050.5aF3F8d.31852";
 charset="UTF-8"


--15035225050.5aF3F8d.31852
Date: Wed, 23 Aug 2017 21:08:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102381

            Bug ID: 102381
           Summary: [REGRESSION] GK107GLM fails to perform runtime resume
                    on W530
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Unfortunately haven't gotten the time to bisect this at all, but it looks l=
ike
on the latest nouveau branch that's about to get pulled into drm-next, RPM
resume makes the kernel fall over itself for kepler, at least on this Think=
Pad
W530:

[   59.376489] [TTM] Zone  kernel: Available graphics memory: 1797006 kiB
[   59.377502] [TTM] Initializing pool allocator
[   59.378540] [TTM] Initializing DMA pool allocator
[   59.379554] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   59.380994] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   59.382496] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   59.383929] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   59.385403] nouveau 0000:01:00.0: DRM: DCB outp 00: 01800f23 00010034
[   59.386829] nouveau 0000:01:00.0: DRM: DCB outp 01: 02811f00 00000000
[   59.388310] nouveau 0000:01:00.0: DRM: DCB outp 02: 02822fa6 0f420010
[   59.389724] nouveau 0000:01:00.0: DRM: DCB outp 03: 02822f62 00020010
[   59.390742] nouveau 0000:01:00.0: DRM: DCB outp 04: 04833fb6 0f220010
[   59.391669] nouveau 0000:01:00.0: DRM: DCB outp 05: 04833f72 00020010
[   59.392624] nouveau 0000:01:00.0: DRM: DCB outp 06: 08844fc6 0f220010
[   59.393589] nouveau 0000:01:00.0: DRM: DCB outp 07: 08844f82 00020010
[   59.394574] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[   59.395466] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[   59.396388] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010246
[   59.397260] nouveau 0000:01:00.0: DRM: DCB conn 03: 00020346
[   59.398172] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[   59.471850] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   59.474205] [drm] Driver supports precise vblank timestamp query.
[   59.619473] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   59.730052] [drm] Cannot find any crtc or sizes
[   59.732103] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[   59.840060] [drm] Cannot find any crtc or sizes
[   59.953061] [drm] Cannot find any crtc or sizes
[   65.759103] ACPI Warning: \_SB.PCI0.PEG.VID._DSM: Argument #4 type misma=
tch
- Found [Buffer], ACPI requires [Package] (20170531/nsarguments-95)
[   65.762275] ACPI Warning: \_SB.PCI0.PEG.VID._DSM: Argument #4 type misma=
tch
- Found [Buffer], ACPI requires [Package] (20170531/nsarguments-95)
[   66.670540] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[   66.670572] IP: nouveau_fbcon_set_suspend_work+0x45/0xf0 [nouveau]
[   66.670572] PGD 0=20
[   66.670572] P4D 0=20
[   66.670573]=20
[   66.670574] Oops: 0000 [#1] SMP
[   66.670574] Modules linked in: vfat fat nouveau snd_hda_codec_realtek
snd_hda_codec_generic i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper syscopya=
rea
sysfillrect sysimgblt fb_sys_fops drm xhci_pci snd_hda_intel xhci_hcd
intel_rapl snd_hda_codec x86_pkg_temp_thermal iTCO_wdt coretemp lpc_ich
crc32_pclmul mfd_core snd_hda_core wmi_bmof snd_pcm ehci_pci ehci_hcd snd_t=
imer
i2c_i801 shpchp thinkpad_acpi snd tpm_tis tpm_tis_core soundcore tpm video
psmouse wmi i2c_core serio_raw crc32c_intel
[   66.670589] CPU: 0 PID: 57 Comm: kworker/0:1 Not tainted
4.13.0-rc5Lyude-Test+ #1
[   66.670589] Hardware name: LENOVO 24382LU/24382LU, BIOS G5ET64WW (2.06 )
10/25/2012
[   66.670609] Workqueue: events nouveau_fbcon_set_suspend_work [nouveau]
[   66.670609] task: ffff880139269d00 task.stack: ffffc9000021c000
[   66.670626] RIP: 0010:nouveau_fbcon_set_suspend_work+0x45/0xf0 [nouveau]
[   66.670626] RSP: 0018:ffffc9000021fe48 EFLAGS: 00010286
[   66.670627] RAX: ffff880134ea0400 RBX: ffff8801392d0ea0 RCX:
0000000000000000
[   66.670627] RDX: ffff8801392d0000 RSI: 0000000000000001 RDI:
0000000000000000
[   66.670627] RBP: ffffc9000021fe50 R08: ffffc9000021fe38 R09:
0000000000000001
[   66.670628] R10: ffffc90000037a50 R11: ffff8801399abac0 R12:
ffff88013e219d80
[   66.670628] R13: ffff88013e21db00 R14: 0000000000000000 R15:
ffff8801392006c0
[   66.670629] FS:  0000000000000000(0000) GS:ffff88013e200000(0000)
knlGS:0000000000000000
[   66.670629] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.670630] CR2: 0000000000000008 CR3: 0000000001c09000 CR4:
00000000001406f0
[   66.670630] Call Trace:
[   66.670634]  process_one_work+0x193/0x3c0
[   66.670635]  worker_thread+0x4a/0x3a0
[   66.670636]  kthread+0x125/0x140
[   66.670637]  ? process_one_work+0x3c0/0x3c0
[   66.670638]  ? kthread_park+0x60/0x60
[   66.670639]  ? kthread_park+0x60/0x60
[   66.670640]  ret_from_fork+0x25/0x30
[   66.670641] Code: 8b bb f8 fa ff ff be 01 00 00 00 e8 66 c7 b6 ff 48 8b =
83
b8 f2 ff ff 48 8b 50 28 48 8b 82 98 09 00 00 48 85 c0 74 1c 48 8b 48 38 <8b=
> 49
08 89 88 08 01 00 00 48 8b 82 98 09 00 00 48 8b 40 38 83=20
[   66.670666] RIP: nouveau_fbcon_set_suspend_work+0x45/0xf0 [nouveau] RSP:
ffffc9000021fe48
[   66.670666] CR2: 0000000000000008
[   66.670669] ---[ end trace b3bf9455426555dc ]---
[   66.670670] Kernel panic - not syncing: Fatal exception
[   66.670706] Kernel Offset: disabled
[   66.703734] Rebooting in 10 seconds..
[   76.755752] ACPI MEMORY or I/O RESET_REG.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15035225050.5aF3F8d.31852
Date: Wed, 23 Aug 2017 21:08:25 +0000
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
   title=3D"NEW - [REGRESSION] GK107GLM fails to perform runtime resume on =
W530"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102381">102381</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[REGRESSION] GK107GLM fails to perform runtime resume on W530
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
          <td>lyude&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Unfortunately haven't gotten the time to bisect this at all, b=
ut it looks like
on the latest nouveau branch that's about to get pulled into drm-next, RPM
resume makes the kernel fall over itself for kepler, at least on this Think=
Pad
W530:

[   59.376489] [TTM] Zone  kernel: Available graphics memory: 1797006 kiB
[   59.377502] [TTM] Initializing pool allocator
[   59.378540] [TTM] Initializing DMA pool allocator
[   59.379554] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   59.380994] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   59.382496] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   59.383929] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   59.385403] nouveau 0000:01:00.0: DRM: DCB outp 00: 01800f23 00010034
[   59.386829] nouveau 0000:01:00.0: DRM: DCB outp 01: 02811f00 00000000
[   59.388310] nouveau 0000:01:00.0: DRM: DCB outp 02: 02822fa6 0f420010
[   59.389724] nouveau 0000:01:00.0: DRM: DCB outp 03: 02822f62 00020010
[   59.390742] nouveau 0000:01:00.0: DRM: DCB outp 04: 04833fb6 0f220010
[   59.391669] nouveau 0000:01:00.0: DRM: DCB outp 05: 04833f72 00020010
[   59.392624] nouveau 0000:01:00.0: DRM: DCB outp 06: 08844fc6 0f220010
[   59.393589] nouveau 0000:01:00.0: DRM: DCB outp 07: 08844f82 00020010
[   59.394574] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[   59.395466] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[   59.396388] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010246
[   59.397260] nouveau 0000:01:00.0: DRM: DCB conn 03: 00020346
[   59.398172] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[   59.471850] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   59.474205] [drm] Driver supports precise vblank timestamp query.
[   59.619473] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   59.730052] [drm] Cannot find any crtc or sizes
[   59.732103] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[   59.840060] [drm] Cannot find any crtc or sizes
[   59.953061] [drm] Cannot find any crtc or sizes
[   65.759103] ACPI Warning: \_SB.PCI0.PEG.VID._DSM: Argument #4 type misma=
tch
- Found [Buffer], ACPI requires [Package] (20170531/nsarguments-95)
[   65.762275] ACPI Warning: \_SB.PCI0.PEG.VID._DSM: Argument #4 type misma=
tch
- Found [Buffer], ACPI requires [Package] (20170531/nsarguments-95)
[   66.670540] BUG: unable to handle kernel NULL pointer dereference at
0000000000000008
[   66.670572] IP: nouveau_fbcon_set_suspend_work+0x45/0xf0 [nouveau]
[   66.670572] PGD 0=20
[   66.670572] P4D 0=20
[   66.670573]=20
[   66.670574] Oops: 0000 [#1] SMP
[   66.670574] Modules linked in: vfat fat nouveau snd_hda_codec_realtek
snd_hda_codec_generic i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper syscopya=
rea
sysfillrect sysimgblt fb_sys_fops drm xhci_pci snd_hda_intel xhci_hcd
intel_rapl snd_hda_codec x86_pkg_temp_thermal iTCO_wdt coretemp lpc_ich
crc32_pclmul mfd_core snd_hda_core wmi_bmof snd_pcm ehci_pci ehci_hcd snd_t=
imer
i2c_i801 shpchp thinkpad_acpi snd tpm_tis tpm_tis_core soundcore tpm video
psmouse wmi i2c_core serio_raw crc32c_intel
[   66.670589] CPU: 0 PID: 57 Comm: kworker/0:1 Not tainted
4.13.0-rc5Lyude-Test+ #1
[   66.670589] Hardware name: LENOVO 24382LU/24382LU, BIOS G5ET64WW (2.06 )
10/25/2012
[   66.670609] Workqueue: events nouveau_fbcon_set_suspend_work [nouveau]
[   66.670609] task: ffff880139269d00 task.stack: ffffc9000021c000
[   66.670626] RIP: 0010:nouveau_fbcon_set_suspend_work+0x45/0xf0 [nouveau]
[   66.670626] RSP: 0018:ffffc9000021fe48 EFLAGS: 00010286
[   66.670627] RAX: ffff880134ea0400 RBX: ffff8801392d0ea0 RCX:
0000000000000000
[   66.670627] RDX: ffff8801392d0000 RSI: 0000000000000001 RDI:
0000000000000000
[   66.670627] RBP: ffffc9000021fe50 R08: ffffc9000021fe38 R09:
0000000000000001
[   66.670628] R10: ffffc90000037a50 R11: ffff8801399abac0 R12:
ffff88013e219d80
[   66.670628] R13: ffff88013e21db00 R14: 0000000000000000 R15:
ffff8801392006c0
[   66.670629] FS:  0000000000000000(0000) GS:ffff88013e200000(0000)
knlGS:0000000000000000
[   66.670629] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.670630] CR2: 0000000000000008 CR3: 0000000001c09000 CR4:
00000000001406f0
[   66.670630] Call Trace:
[   66.670634]  process_one_work+0x193/0x3c0
[   66.670635]  worker_thread+0x4a/0x3a0
[   66.670636]  kthread+0x125/0x140
[   66.670637]  ? process_one_work+0x3c0/0x3c0
[   66.670638]  ? kthread_park+0x60/0x60
[   66.670639]  ? kthread_park+0x60/0x60
[   66.670640]  ret_from_fork+0x25/0x30
[   66.670641] Code: 8b bb f8 fa ff ff be 01 00 00 00 e8 66 c7 b6 ff 48 8b =
83
b8 f2 ff ff 48 8b 50 28 48 8b 82 98 09 00 00 48 85 c0 74 1c 48 8b 48 38 &lt=
;8b&gt; 49
08 89 88 08 01 00 00 48 8b 82 98 09 00 00 48 8b 40 38 83=20
[   66.670666] RIP: nouveau_fbcon_set_suspend_work+0x45/0xf0 [nouveau] RSP:
ffffc9000021fe48
[   66.670666] CR2: 0000000000000008
[   66.670669] ---[ end trace b3bf9455426555dc ]---
[   66.670670] Kernel panic - not syncing: Fatal exception
[   66.670706] Kernel Offset: disabled
[   66.703734] Rebooting in 10 seconds..
[   76.755752] ACPI MEMORY or I/O RESET_REG.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15035225050.5aF3F8d.31852--

--===============0245365587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0245365587==--
