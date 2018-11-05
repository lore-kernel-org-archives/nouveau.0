From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108658] New: gt215 scheduling while atomic warning
Date: Mon, 05 Nov 2018 11:51:08 +0000
Message-ID: <bug-108658-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1613673349=="
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


--===============1613673349==
Content-Type: multipart/alternative; boundary="15414186681.B41c533d.15371"
Content-Transfer-Encoding: 7bit


--15414186681.B41c533d.15371
Date: Mon, 5 Nov 2018 11:51:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108658

            Bug ID: 108658
           Summary: gt215 scheduling while atomic warning
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Booting v4.20-rc1 on a arm64 with a Geforce 210 card inserted produces the
following splat:

nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)
hub 2-0:1.0: 4 ports detected
nouveau 0000:02:00.0: bios: version 70.18.8a.00.06
nouveau 0000:02:00.0: fb: 1024 MiB DDR3
BUG: scheduling while atomic: kworker/0:1/12/0x00000002
Modules linked in: hid_apple hid_generic usbhid hid sd_mod nouveau(+) xhci_=
pci
i2c_algo_bit xhci_hcd ttm ahci_platform libahci_platform drm_kms_helper lib=
ahci
libata drm usbcore amd_xgbe scsi_mod libphy
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 4.20.0-rc1+ #5
Hardware name: AMD Seattle/Seattle, BIOS 20:07:19 Oct  2 2018
Workqueue: events nvkm_pstate_work [nouveau]
Call trace:
 dump_backtrace+0x0/0x1d0
 show_stack+0x24/0x30
 dump_stack+0x98/0xbc
 __schedule_bug+0x64/0x80
 __schedule+0x818/0x9b8
 schedule+0x40/0xa8
 gt215_pmu_send+0x274/0x2a8 [nouveau]
 nvkm_pmu_send+0x60/0x80 [nouveau]
 nvkm_memx_init+0x5c/0x120 [nouveau]
 gt215_ram_calc+0x12f8/0x4d58 [nouveau]
 gt215_ram_calc+0x2a0/0x4d58 [nouveau]
 nvkm_pstate_work+0x18c/0x6b0 [nouveau]
 process_one_work+0x1a8/0x438
 worker_thread+0x54/0x3f8
 kthread+0x104/0x130
 ret_from_fork+0x10/0x18
[TTM] Zone  kernel: Available graphics memory: 16460910 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau 0000:02:00.0: DRM: VRAM: 1024 MiB
nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
nouveau 0000:02:00.0: DRM: TMDS table version 2.0
nouveau 0000:02:00.0: DRM: DCB version 4.0
nouveau 0000:02:00.0: DRM: DCB outp 00: 02000300 00000000
nouveau 0000:02:00.0: DRM: DCB outp 01: 01000302 00020030
nouveau 0000:02:00.0: DRM: DCB outp 02: 02021362 00020010
nouveau 0000:02:00.0: DRM: DCB outp 04: 01032310 00000000
nouveau 0000:02:00.0: DRM: DCB conn 00: 00001030
nouveau 0000:02:00.0: DRM: DCB conn 01: 00002161
nouveau 0000:02:00.0: DRM: DCB conn 02: 00000200
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
BUG: scheduling while atomic: kworker/0:1/12/0x00000000
Modules linked in: hid_apple hid_generic usbhid hid sd_mod nouveau(+) xhci_=
pci
i2c_algo_bit xhci_hcd ttm ahci_platform libahci_platform drm_kms_helper lib=
ahci
libata drm usbcore amd_xgbe scsi_mod libphy
CPU: 0 PID: 12 Comm: kworker/0:1 Tainted: G        W         4.20.0-rc1+ #5
Hardware name: AMD Seattle/Seattle, BIOS 20:07:19 Oct  2 2018
Workqueue: events nvkm_pstate_work [nouveau]
Call trace:
 dump_backtrace+0x0/0x1d0
 show_stack+0x24/0x30
 dump_stack+0x98/0xbc
 __schedule_bug+0x64/0x80
 __schedule+0x818/0x9b8
 schedule+0x40/0xa8
 gt215_pmu_send+0x274/0x2a8 [nouveau]
 nvkm_pmu_send+0x60/0x80 [nouveau]
 nvkm_memx_train_result+0x5c/0xe8 [nouveau]
 gt215_ram_calc+0xbd8/0x4d58 [nouveau]
 nvkm_pstate_work+0x18c/0x6b0 [nouveau]
 process_one_work+0x1a8/0x438
 worker_thread+0x54/0x3f8
 kthread+0x104/0x130
 ret_from_fork+0x10/0x18
nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:02:00.0: DRM: allocated 1920x1200 fb: 0x70000, bo (____ptrval_=
___)
Console: switching to colour frame buffer device 240x75
nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15414186681.B41c533d.15371
Date: Mon, 5 Nov 2018 11:51:08 +0000
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
   title=3D"NEW - gt215 scheduling while atomic warning"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108658">108658</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>gt215 scheduling while atomic warning
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>major
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
          <td>ard.biesheuvel&#64;linaro.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Booting v4.20-rc1 on a arm64 with a Geforce 210 card inserted =
produces the
following splat:

nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)
hub 2-0:1.0: 4 ports detected
nouveau 0000:02:00.0: bios: version 70.18.8a.00.06
nouveau 0000:02:00.0: fb: 1024 MiB DDR3
BUG: scheduling while atomic: kworker/0:1/12/0x00000002
Modules linked in: hid_apple hid_generic usbhid hid sd_mod nouveau(+) xhci_=
pci
i2c_algo_bit xhci_hcd ttm ahci_platform libahci_platform drm_kms_helper lib=
ahci
libata drm usbcore amd_xgbe scsi_mod libphy
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 4.20.0-rc1+ #5
Hardware name: AMD Seattle/Seattle, BIOS 20:07:19 Oct  2 2018
Workqueue: events nvkm_pstate_work [nouveau]
Call trace:
 dump_backtrace+0x0/0x1d0
 show_stack+0x24/0x30
 dump_stack+0x98/0xbc
 __schedule_bug+0x64/0x80
 __schedule+0x818/0x9b8
 schedule+0x40/0xa8
 gt215_pmu_send+0x274/0x2a8 [nouveau]
 nvkm_pmu_send+0x60/0x80 [nouveau]
 nvkm_memx_init+0x5c/0x120 [nouveau]
 gt215_ram_calc+0x12f8/0x4d58 [nouveau]
 gt215_ram_calc+0x2a0/0x4d58 [nouveau]
 nvkm_pstate_work+0x18c/0x6b0 [nouveau]
 process_one_work+0x1a8/0x438
 worker_thread+0x54/0x3f8
 kthread+0x104/0x130
 ret_from_fork+0x10/0x18
[TTM] Zone  kernel: Available graphics memory: 16460910 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[TTM] Initializing DMA pool allocator
nouveau 0000:02:00.0: DRM: VRAM: 1024 MiB
nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
nouveau 0000:02:00.0: DRM: TMDS table version 2.0
nouveau 0000:02:00.0: DRM: DCB version 4.0
nouveau 0000:02:00.0: DRM: DCB outp 00: 02000300 00000000
nouveau 0000:02:00.0: DRM: DCB outp 01: 01000302 00020030
nouveau 0000:02:00.0: DRM: DCB outp 02: 02021362 00020010
nouveau 0000:02:00.0: DRM: DCB outp 04: 01032310 00000000
nouveau 0000:02:00.0: DRM: DCB conn 00: 00001030
nouveau 0000:02:00.0: DRM: DCB conn 01: 00002161
nouveau 0000:02:00.0: DRM: DCB conn 02: 00000200
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
BUG: scheduling while atomic: kworker/0:1/12/0x00000000
Modules linked in: hid_apple hid_generic usbhid hid sd_mod nouveau(+) xhci_=
pci
i2c_algo_bit xhci_hcd ttm ahci_platform libahci_platform drm_kms_helper lib=
ahci
libata drm usbcore amd_xgbe scsi_mod libphy
CPU: 0 PID: 12 Comm: kworker/0:1 Tainted: G        W         4.20.0-rc1+ #5
Hardware name: AMD Seattle/Seattle, BIOS 20:07:19 Oct  2 2018
Workqueue: events nvkm_pstate_work [nouveau]
Call trace:
 dump_backtrace+0x0/0x1d0
 show_stack+0x24/0x30
 dump_stack+0x98/0xbc
 __schedule_bug+0x64/0x80
 __schedule+0x818/0x9b8
 schedule+0x40/0xa8
 gt215_pmu_send+0x274/0x2a8 [nouveau]
 nvkm_pmu_send+0x60/0x80 [nouveau]
 nvkm_memx_train_result+0x5c/0xe8 [nouveau]
 gt215_ram_calc+0xbd8/0x4d58 [nouveau]
 nvkm_pstate_work+0x18c/0x6b0 [nouveau]
 process_one_work+0x1a8/0x438
 worker_thread+0x54/0x3f8
 kthread+0x104/0x130
 ret_from_fork+0x10/0x18
nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:02:00.0: DRM: allocated 1920x1200 fb: 0x70000, bo (____ptrval_=
___)
Console: switching to colour frame buffer device 240x75
nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15414186681.B41c533d.15371--

--===============1613673349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1613673349==--
