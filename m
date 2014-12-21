From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87554] New: [NV1A] 3.19-rc1 NULL dereference on
 modprobe in pramin_fini
Date: Sun, 21 Dec 2014 15:06:34 +0000
Message-ID: <bug-87554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0012675502=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0012675502==
Content-Type: multipart/alternative; boundary="1419174394.CA58d61.1896"; charset="UTF-8"


--1419174394.CA58d61.1896
Date: Sun, 21 Dec 2014 15:06:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87554

            Bug ID: 87554
           Summary: [NV1A] 3.19-rc1 NULL dereference on modprobe in
                    pramin_fini
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

[  441.685835] wmi: Mapper loaded
[  442.129083] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 12
[  442.135019] PCI: setting IRQ 12 as level-triggered
[  442.144839] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  442.151063] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  442.157481] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  442.172505] BUG: unable to handle kernel NULL pointer dereference at  
(null)
[  442.179823] IP: [<dea2c6c6>] pramin_fini+0x6/0x30 [nouveau]
[  442.180015] *pde = 00000000 
[  442.180015] Oops: 0000 [#1] 
[  442.180015] Modules linked in: nouveau(+) wmi ttm drm_kms_helper nfsv3
nfs_acl nfs lockd grace sunrpc
[  442.180015] CPU: 0 PID: 1267 Comm: modprobe Not tainted 3.19.0-rc1-jupiter
#1
[  442.180015] Hardware name: NVIDIA Corporation. nFORCE-MCP/MS-6373, BIOS 6.00
PG 04/12/2002
[  442.180015] task: dc010c90 ti: dcfba000 task.ti: dcfba000
[  442.180015] EIP: 0060:[<dea2c6c6>] EFLAGS: 00010286 CPU: 0
[  442.180015] EIP is at pramin_fini+0x6/0x30 [nouveau]
[  442.180015] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: dea2c6c0
[  442.180015] ESI: dcfbb8a4 EDI: deacf670 EBP: dcfbb834 ESP: dcfbb830
[  442.180015]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[  442.180015] CR0: 8005003b CR2: 00000000 CR3: 1c042000 CR4: 000007d0
[  442.180015] Stack:
[  442.180015]  dcedad90 dcfbb860 dea2c02e dcedad90 00000004 deaef771 deaef81b
00000000
[  442.180015]  deaf5320 dcfbb8a4 dcfbb884 dcfbb884 dcfbb994 dea2c2db dcfbb87c
c10dbf41
[  442.180015]  ddfcdb40 dd401180 dcedad90 00000000 dcfbb8a4 10000001 deaf54a0
00000000
[  442.180015] Call Trace:
[  442.180015]  [<dea2c02e>] shadow_method+0x8e/0xe0 [nouveau]
[  442.180015]  [<dea2c2db>] nvbios_shadow+0x25b/0x360 [nouveau]
[  442.180015]  [<c10dbf41>] ? init_object+0x51/0x60
[  442.180015]  [<dea1f0eb>] nouveau_bios_ctor+0x4b/0x3b0 [nouveau]
[  442.180015]  [<c10dd62f>] ? kmem_cache_alloc_trace+0xcf/0x160
[  442.180015]  [<dea1cd25>] nouveau_object_ctor+0x35/0xd0 [nouveau]
[  442.180015]  [<dea64ebf>] nouveau_devobj_ctor+0x77f/0x880 [nouveau]
[  442.180015]  [<dea1cd25>] nouveau_object_ctor+0x35/0xd0 [nouveau]
[  442.180015]  [<dea1bb89>] nvkm_ioctl_new+0x229/0x300 [nouveau]
[  442.180015]  [<dea1c020>] nvkm_ioctl+0x2a0/0x340 [nouveau]
[  442.180015]  [<deaa913c>] nvkm_client_ioctl+0x1c/0x30 [nouveau]
[  442.180015]  [<dea9ccee>] nvif_object_ioctl+0x7e/0x90 [nouveau]
[  442.180015]  [<dea9d44a>] nvif_object_init+0x10a/0x130 [nouveau]
[  442.180015]  [<dea9d7a8>] nvif_device_init+0x28/0x50 [nouveau]
[  442.180015]  [<dea9f630>] nouveau_drm_load+0x2e0/0x560 [nouveau]
[  442.180015]  [<c12c6bff>] drm_dev_register+0x5f/0xe0
[  442.180015]  [<c12c9231>] drm_get_pci_dev+0xe1/0x1a0
[  442.180015]  [<c122e9f5>] ? pcibios_set_master+0x25/0x80
[  442.180015]  [<dea9f068>] nouveau_drm_probe+0x1a8/0x1d0 [nouveau]
[  442.180015]  [<c122fed5>] pci_device_probe+0x65/0xc0
[  442.180015]  [<c12e801d>] driver_probe_device+0x14d/0x330
[  442.180015]  [<c12e824d>] __driver_attach+0x4d/0x80
[  442.180015]  [<c12e8200>] ? driver_probe_device+0x330/0x330
[  442.180015]  [<c12e68dc>] bus_for_each_dev+0x3c/0x70
[  442.180015]  [<c12e7b7c>] driver_attach+0x1c/0x30
[  442.180015]  [<c12e8200>] ? driver_probe_device+0x330/0x330
[  442.180015]  [<c12e76ec>] bus_add_driver+0xdc/0x1f0
[  442.180015]  [<c12e89b7>] driver_register+0x87/0xc0
[  442.180015]  [<c10dffff>] ? migrate_page_copy+0x18f/0x250
[  442.180015]  [<c122ffb8>] __pci_register_driver+0x28/0x30
[  442.180015]  [<c12c933b>] drm_pci_init+0x4b/0xe0
[  442.180015]  [<deb39235>] nouveau_drm_init+0x235/0x1000 [nouveau]
[  442.180015]  [<c1000441>] ? do_one_initcall+0xb1/0x1d0
[  442.180015]  [<c10004b4>] do_one_initcall+0x124/0x1d0
[  442.180015]  [<deb39000>] ? 0xdeb39000
[  442.180015]  [<deb39000>] ? 0xdeb39000
[  442.180015]  [<c10dd344>] ? kfree+0x134/0x140
[  442.180015]  [<c10d52ac>] ? __vunmap+0xcc/0xe0
[  442.180015]  [<c10d52ac>] ? __vunmap+0xcc/0xe0
[  442.180015]  [<c10d52ac>] ? __vunmap+0xcc/0xe0
[  442.180015]  [<c10d52ac>] ? __vunmap+0xcc/0xe0
[  442.180015]  [<c107e125>] load_module+0x1035/0x16b0
[  442.180015]  [<c107e885>] SyS_init_module+0xe5/0xf0
[  442.180015]  [<c14c23d2>] sysenter_do_call+0x12/0x12
[  442.180015] Code: 43 7f e2 39 5d f0 89 07 77 e3 eb 08 90 c7 45 ec 00 00 00
00 8b 45 ec 83 c4 08 5b 5e 5f 5d c3 
[  442.180015] EIP: [<dea2c6c6>] pramin_fini+0x6/0x30 [nouveau] SS:ESP
0068:dcfbb830
[  442.180015] CR2: 0000000000000000
[  442.555577] ---[ end trace 5944a013025347a6 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419174394.CA58d61.1896
Date: Sun, 21 Dec 2014 15:06:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV1A] 3.19-rc1 NULL dereference on modprobe in pramin_fini"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87554">87554</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV1A] 3.19-rc1 NULL dereference on modprobe in pramin_fini
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
          <td>x86 (IA32)
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
          <td>bonbons67&#64;internet.lu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>[  441.685835] wmi: Mapper loaded
[  442.129083] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 12
[  442.135019] PCI: setting IRQ 12 as level-triggered
[  442.144839] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  442.151063] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  442.157481] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  442.172505] BUG: unable to handle kernel NULL pointer dereference at  
(null)
[  442.179823] IP: [&lt;dea2c6c6&gt;] pramin_fini+0x6/0x30 [nouveau]
[  442.180015] *pde = 00000000 
[  442.180015] Oops: 0000 [#1] 
[  442.180015] Modules linked in: nouveau(+) wmi ttm drm_kms_helper nfsv3
nfs_acl nfs lockd grace sunrpc
[  442.180015] CPU: 0 PID: 1267 Comm: modprobe Not tainted 3.19.0-rc1-jupiter
#1
[  442.180015] Hardware name: NVIDIA Corporation. nFORCE-MCP/MS-6373, BIOS 6.00
PG 04/12/2002
[  442.180015] task: dc010c90 ti: dcfba000 task.ti: dcfba000
[  442.180015] EIP: 0060:[&lt;dea2c6c6&gt;] EFLAGS: 00010286 CPU: 0
[  442.180015] EIP is at pramin_fini+0x6/0x30 [nouveau]
[  442.180015] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: dea2c6c0
[  442.180015] ESI: dcfbb8a4 EDI: deacf670 EBP: dcfbb834 ESP: dcfbb830
[  442.180015]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[  442.180015] CR0: 8005003b CR2: 00000000 CR3: 1c042000 CR4: 000007d0
[  442.180015] Stack:
[  442.180015]  dcedad90 dcfbb860 dea2c02e dcedad90 00000004 deaef771 deaef81b
00000000
[  442.180015]  deaf5320 dcfbb8a4 dcfbb884 dcfbb884 dcfbb994 dea2c2db dcfbb87c
c10dbf41
[  442.180015]  ddfcdb40 dd401180 dcedad90 00000000 dcfbb8a4 10000001 deaf54a0
00000000
[  442.180015] Call Trace:
[  442.180015]  [&lt;dea2c02e&gt;] shadow_method+0x8e/0xe0 [nouveau]
[  442.180015]  [&lt;dea2c2db&gt;] nvbios_shadow+0x25b/0x360 [nouveau]
[  442.180015]  [&lt;c10dbf41&gt;] ? init_object+0x51/0x60
[  442.180015]  [&lt;dea1f0eb&gt;] nouveau_bios_ctor+0x4b/0x3b0 [nouveau]
[  442.180015]  [&lt;c10dd62f&gt;] ? kmem_cache_alloc_trace+0xcf/0x160
[  442.180015]  [&lt;dea1cd25&gt;] nouveau_object_ctor+0x35/0xd0 [nouveau]
[  442.180015]  [&lt;dea64ebf&gt;] nouveau_devobj_ctor+0x77f/0x880 [nouveau]
[  442.180015]  [&lt;dea1cd25&gt;] nouveau_object_ctor+0x35/0xd0 [nouveau]
[  442.180015]  [&lt;dea1bb89&gt;] nvkm_ioctl_new+0x229/0x300 [nouveau]
[  442.180015]  [&lt;dea1c020&gt;] nvkm_ioctl+0x2a0/0x340 [nouveau]
[  442.180015]  [&lt;deaa913c&gt;] nvkm_client_ioctl+0x1c/0x30 [nouveau]
[  442.180015]  [&lt;dea9ccee&gt;] nvif_object_ioctl+0x7e/0x90 [nouveau]
[  442.180015]  [&lt;dea9d44a&gt;] nvif_object_init+0x10a/0x130 [nouveau]
[  442.180015]  [&lt;dea9d7a8&gt;] nvif_device_init+0x28/0x50 [nouveau]
[  442.180015]  [&lt;dea9f630&gt;] nouveau_drm_load+0x2e0/0x560 [nouveau]
[  442.180015]  [&lt;c12c6bff&gt;] drm_dev_register+0x5f/0xe0
[  442.180015]  [&lt;c12c9231&gt;] drm_get_pci_dev+0xe1/0x1a0
[  442.180015]  [&lt;c122e9f5&gt;] ? pcibios_set_master+0x25/0x80
[  442.180015]  [&lt;dea9f068&gt;] nouveau_drm_probe+0x1a8/0x1d0 [nouveau]
[  442.180015]  [&lt;c122fed5&gt;] pci_device_probe+0x65/0xc0
[  442.180015]  [&lt;c12e801d&gt;] driver_probe_device+0x14d/0x330
[  442.180015]  [&lt;c12e824d&gt;] __driver_attach+0x4d/0x80
[  442.180015]  [&lt;c12e8200&gt;] ? driver_probe_device+0x330/0x330
[  442.180015]  [&lt;c12e68dc&gt;] bus_for_each_dev+0x3c/0x70
[  442.180015]  [&lt;c12e7b7c&gt;] driver_attach+0x1c/0x30
[  442.180015]  [&lt;c12e8200&gt;] ? driver_probe_device+0x330/0x330
[  442.180015]  [&lt;c12e76ec&gt;] bus_add_driver+0xdc/0x1f0
[  442.180015]  [&lt;c12e89b7&gt;] driver_register+0x87/0xc0
[  442.180015]  [&lt;c10dffff&gt;] ? migrate_page_copy+0x18f/0x250
[  442.180015]  [&lt;c122ffb8&gt;] __pci_register_driver+0x28/0x30
[  442.180015]  [&lt;c12c933b&gt;] drm_pci_init+0x4b/0xe0
[  442.180015]  [&lt;deb39235&gt;] nouveau_drm_init+0x235/0x1000 [nouveau]
[  442.180015]  [&lt;c1000441&gt;] ? do_one_initcall+0xb1/0x1d0
[  442.180015]  [&lt;c10004b4&gt;] do_one_initcall+0x124/0x1d0
[  442.180015]  [&lt;deb39000&gt;] ? 0xdeb39000
[  442.180015]  [&lt;deb39000&gt;] ? 0xdeb39000
[  442.180015]  [&lt;c10dd344&gt;] ? kfree+0x134/0x140
[  442.180015]  [&lt;c10d52ac&gt;] ? __vunmap+0xcc/0xe0
[  442.180015]  [&lt;c10d52ac&gt;] ? __vunmap+0xcc/0xe0
[  442.180015]  [&lt;c10d52ac&gt;] ? __vunmap+0xcc/0xe0
[  442.180015]  [&lt;c10d52ac&gt;] ? __vunmap+0xcc/0xe0
[  442.180015]  [&lt;c107e125&gt;] load_module+0x1035/0x16b0
[  442.180015]  [&lt;c107e885&gt;] SyS_init_module+0xe5/0xf0
[  442.180015]  [&lt;c14c23d2&gt;] sysenter_do_call+0x12/0x12
[  442.180015] Code: 43 7f e2 39 5d f0 89 07 77 e3 eb 08 90 c7 45 ec 00 00 00
00 8b 45 ec 83 c4 08 5b 5e 5f 5d c3 
[  442.180015] EIP: [&lt;dea2c6c6&gt;] pramin_fini+0x6/0x30 [nouveau] SS:ESP
0068:dcfbb830
[  442.180015] CR2: 0000000000000000
[  442.555577] ---[ end trace 5944a013025347a6 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419174394.CA58d61.1896--

--===============0012675502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0012675502==--
