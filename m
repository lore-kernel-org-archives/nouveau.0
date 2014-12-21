From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87552] New: [NV1A] 3.18.1 BUG on modprobe nouveau in
 drivers/gpu/drm/nouveau/core/core/event.c:42
Date: Sun, 21 Dec 2014 13:47:24 +0000
Message-ID: <bug-87552-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1751224268=="
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


--===============1751224268==
Content-Type: multipart/alternative; boundary="1419169644.23b7c1.7694"; charset="UTF-8"


--1419169644.23b7c1.7694
Date: Sun, 21 Dec 2014 13:47:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87552

            Bug ID: 87552
           Summary: [NV1A] 3.18.1 BUG on modprobe nouveau in
                    drivers/gpu/drm/nouveau/core/core/event.c:42
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

[  289.984831] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  289.991043] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  289.997439] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  290.003256] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[  290.045349] nouveau  [   VBIOS][0000:02:00.0] ... checksum invalid
[  290.051619] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[  290.058391] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  290.064895] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[  290.071710] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  290.078205] nouveau  [   VBIOS][0000:02:00.0] checking PCIROM for image...
[  290.085961] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  290.092511] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[  290.099003] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  290.105141] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  290.111606] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.120249] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.128356] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.135257] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.142279] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  290.148881] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  290.155987] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  290.161882] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  290.173304] nouveau  [     CLK][0000:02:00.0] --:   
[  290.178387] ------------[ cut here ]------------
[  290.180008] kernel BUG at
/usr/src/linux-git/drivers/gpu/drm/nouveau/core/core/event.c:42!
[  290.180008] invalid opcode: 0000 [#1] 
[  290.180008] Modules linked in: nouveau(+) wmi ttm drm_kms_helper nfsv3
nfs_acl nfs lockd grace sunrpc
[  290.180008] CPU: 0 PID: 41 Comm: kworker/0:2 Not tainted 3.18.1-jupiter #1
[  290.180008] Hardware name: NVIDIA Corporation. nFORCE-MCP/MS-6373, BIOS 6.00
PG 04/12/2002
[  290.180008] Workqueue: events nouveau_pstate_work [nouveau]
[  290.180008] task: dd71c000 ti: dd720000 task.ti: dd720000
[  290.180008] EIP: 0060:[<dea19e63>] EFLAGS: 00010046 CPU: 0
[  290.180008] EIP is at nvkm_event_get+0x3/0x10 [nouveau]
[  290.180008] EAX: dc31eab4 EBX: 00000286 ECX: 00000000 EDX: 00000001
[  290.180008] ESI: 00000000 EDI: ffffffff EBP: dd721ea8 ESP: dd721ea8
[  290.180008]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[  290.180008] CR0: 8005003b CR2: b7742000 CR3: 1cf95000 CR4: 000007d0
[  290.180008] Stack:
[  290.180008]  dd721eb4 dea1ce02 dce7cb28 dd721f04 dea2f386 00000000 00000005
deaea246
[  290.180008]  ffffffff 00000001 ffffffff ffffffff ffffffff 00000000 00000000
dd71c000
[  290.180008]  dce07670 ffffffff 00000000 dce7ca50 dce7cb28 00000000 dd6f8e70
dd721f44
[  290.180008] Call Trace:
[  290.180008]  [<dea1ce02>] nvkm_notify_get+0x32/0x40 [nouveau]
[  290.180008]  [<dea2f386>] nouveau_pstate_work+0x396/0x3a0 [nouveau]
[  290.180008]  [<c1048af7>] process_one_work+0x1d7/0x360
[  290.180008]  [<c104912f>] worker_thread+0x2af/0x380
[  290.180008]  [<c1048e80>] ? rescuer_thread+0x1d0/0x1d0
[  290.180008]  [<c1048e80>] ? rescuer_thread+0x1d0/0x1d0
[  290.180008]  [<c104cb64>] kthread+0xa4/0xb0
[  290.180008]  [<c14bcc40>] ret_from_kernel_thread+0x20/0x30
[  290.180008]  [<c104cac0>] ? flush_kthread_worker+0x70/0x70
[  290.180008] Code: cf a9 e2 90 8d 74 26 00 83 c4 0c 5b 5e 5f 5d c3 66 90 66
90 66 90 66 90 55 89 e5 0f 0b 8d 74 
[  290.180008] EIP: [<dea19e63>] nvkm_event_get+0x3/0x10 [nouveau] SS:ESP
0068:dd721ea8
[  290.180008] ---[ end trace da282f24d1451e27 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419169644.23b7c1.7694
Date: Sun, 21 Dec 2014 13:47:24 +0000
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
   title="NEW - [NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87552">87552</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42
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
        <pre>[  289.984831] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  289.991043] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  289.997439] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  290.003256] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[  290.045349] nouveau  [   VBIOS][0000:02:00.0] ... checksum invalid
[  290.051619] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[  290.058391] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  290.064895] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[  290.071710] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  290.078205] nouveau  [   VBIOS][0000:02:00.0] checking PCIROM for image...
[  290.085961] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  290.092511] nouveau  [   VBIOS][0000:02:00.0] using image from PCIROM
[  290.099003] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  290.105141] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  290.111606] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.120249] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.128356] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.135257] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  290.142279] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  290.148881] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  290.155987] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  290.161882] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  290.173304] nouveau  [     CLK][0000:02:00.0] --:   
[  290.178387] ------------[ cut here ]------------
[  290.180008] kernel BUG at
/usr/src/linux-git/drivers/gpu/drm/nouveau/core/core/event.c:42!
[  290.180008] invalid opcode: 0000 [#1] 
[  290.180008] Modules linked in: nouveau(+) wmi ttm drm_kms_helper nfsv3
nfs_acl nfs lockd grace sunrpc
[  290.180008] CPU: 0 PID: 41 Comm: kworker/0:2 Not tainted 3.18.1-jupiter #1
[  290.180008] Hardware name: NVIDIA Corporation. nFORCE-MCP/MS-6373, BIOS 6.00
PG 04/12/2002
[  290.180008] Workqueue: events nouveau_pstate_work [nouveau]
[  290.180008] task: dd71c000 ti: dd720000 task.ti: dd720000
[  290.180008] EIP: 0060:[&lt;dea19e63&gt;] EFLAGS: 00010046 CPU: 0
[  290.180008] EIP is at nvkm_event_get+0x3/0x10 [nouveau]
[  290.180008] EAX: dc31eab4 EBX: 00000286 ECX: 00000000 EDX: 00000001
[  290.180008] ESI: 00000000 EDI: ffffffff EBP: dd721ea8 ESP: dd721ea8
[  290.180008]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[  290.180008] CR0: 8005003b CR2: b7742000 CR3: 1cf95000 CR4: 000007d0
[  290.180008] Stack:
[  290.180008]  dd721eb4 dea1ce02 dce7cb28 dd721f04 dea2f386 00000000 00000005
deaea246
[  290.180008]  ffffffff 00000001 ffffffff ffffffff ffffffff 00000000 00000000
dd71c000
[  290.180008]  dce07670 ffffffff 00000000 dce7ca50 dce7cb28 00000000 dd6f8e70
dd721f44
[  290.180008] Call Trace:
[  290.180008]  [&lt;dea1ce02&gt;] nvkm_notify_get+0x32/0x40 [nouveau]
[  290.180008]  [&lt;dea2f386&gt;] nouveau_pstate_work+0x396/0x3a0 [nouveau]
[  290.180008]  [&lt;c1048af7&gt;] process_one_work+0x1d7/0x360
[  290.180008]  [&lt;c104912f&gt;] worker_thread+0x2af/0x380
[  290.180008]  [&lt;c1048e80&gt;] ? rescuer_thread+0x1d0/0x1d0
[  290.180008]  [&lt;c1048e80&gt;] ? rescuer_thread+0x1d0/0x1d0
[  290.180008]  [&lt;c104cb64&gt;] kthread+0xa4/0xb0
[  290.180008]  [&lt;c14bcc40&gt;] ret_from_kernel_thread+0x20/0x30
[  290.180008]  [&lt;c104cac0&gt;] ? flush_kthread_worker+0x70/0x70
[  290.180008] Code: cf a9 e2 90 8d 74 26 00 83 c4 0c 5b 5e 5f 5d c3 66 90 66
90 66 90 66 90 55 89 e5 0f 0b 8d 74 
[  290.180008] EIP: [&lt;dea19e63&gt;] nvkm_event_get+0x3/0x10 [nouveau] SS:ESP
0068:dd721ea8
[  290.180008] ---[ end trace da282f24d1451e27 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419169644.23b7c1.7694--

--===============1751224268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1751224268==--
