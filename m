From: Woody Suwalski <terraluna977@gmail.com>
Subject: Nouveau nullptr on NVIDIA NVA8
Date: Sat, 30 Sep 2017 09:38:59 -0400
Message-ID: <3a1b917f-573e-554f-2546-f9c7c56bb359@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, Dave Airlie <airlied@linux.ie>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Starting with the drm merge af3c8d98508d37541d4bf57f13a984a7f73a328c for 
4.13-rc1, the NVidia NVS3100M display on Dell Latitude E6410 had a 
nullptr crash on startup. As a result later the suspend2ram was locking 
up. Traced to a null ptr in nv50_mstm_service(), which seems to be 
called only from
nouveau_connector_hotplug().

Fixed by checking if mstm is not NULL before calling the service function.

[    1.176456] Linux agpgart interface v0.103
[    1.176610] [drm] radeon kernel modesetting enabled.
[    1.176666] [drm] amdgpu kernel modesetting enabled.
[    1.176749] ACPI Warning: \_SB.PCI0.AGP.VID._DSM: Argument #4 type 
mismatch - Found [Buffer], ACPI requires [Package] (20170531/nsarguments-95)
[    1.176780] ACPI: \_SB_.PCI0.AGP_.VID_: failed to evaluate _DSM
[    1.176948] nouveau 0000:01:00.0: NVIDIA GT218 (0a8600b1)
[    1.196734] nouveau 0000:01:00.0: bios: version 70.18.53.00.04
[    1.198112] nouveau 0000:01:00.0: fb: 512 MiB DDR3
[    1.251598] [TTM] Zone  kernel: Available graphics memory: 1496332 kiB
[    1.251600] [TTM] Initializing pool allocator
[    1.251605] [TTM] Initializing DMA pool allocator
[    1.251625] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[    1.251628] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.251634] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.251637] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    1.251641] nouveau 0000:01:00.0: DRM: DCB outp 00: 048003b6 0f200014
[    1.251644] nouveau 0000:01:00.0: DRM: DCB outp 01: 02033300 00000000
[    1.251647] nouveau 0000:01:00.0: DRM: DCB outp 02: 088223a6 0f220010
[    1.251650] nouveau 0000:01:00.0: DRM: DCB outp 03: 08022362 00020010
[    1.251652] nouveau 0000:01:00.0: DRM: DCB outp 04: 028113c6 0f220010
[    1.251655] nouveau 0000:01:00.0: DRM: DCB outp 05: 02011382 00020010
[    1.251657] nouveau 0000:01:00.0: DRM: DCB conn 00: 00002047
[    1.251660] nouveau 0000:01:00.0: DRM: DCB conn 01: 00101146
[    1.251662] nouveau 0000:01:00.0: DRM: DCB conn 02: 00410246
[    1.251664] nouveau 0000:01:00.0: DRM: DCB conn 03: 00000300
[    1.278401] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.278403] [drm] Driver supports precise vblank timestamp query.
[    1.323205] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    1.473861] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 
0x70000, bo ffff8800b7baa000
[    1.476208] fbcon: nouveaufb (fb0) is primary device
[    1.830143] BUG: unable to handle kernel NULL pointer dereference at 
0000000000000020
[    1.830152] IP: nv50_mstm_service+0xc/0xb0
[    1.830153] PGD 0
[    1.830154] P4D 0

[    1.830158] Oops: 0000 [#1] PREEMPT SMP
[    1.830159] Modules linked in:
[    1.830164] CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 4.13-pingu #1
[    1.830166] Hardware name: Dell Inc. Latitude E6410/0K42JR, BIOS A16 
12/05/2013
[    1.830171] Workqueue: events nvif_notify_work
[    1.830173] task: ffff8800b79f1680 task.stack: ffffc90000154000
[    1.830176] RIP: 0010:nv50_mstm_service+0xc/0xb0
[    1.830178] RSP: 0000:ffffc90000157df0 EFLAGS: 00010286
[    1.830180] RAX: ffff8800b7096800 RBX: ffff8800b71b9418 RCX: 
ffff8800b7096800
[    1.830182] RDX: ffff8800b7a98b9c RSI: 000000000000002b RDI: 
0000000000000000
[    1.830183] RBP: 0000000000000008 R08: ffff8800b7096818 R09: 
0000000000000000
[    1.830185] R10: 0000000000000000 R11: 0000000000000040 R12: 
ffff8800b71b9000
[    1.830187] R13: 0000000000000000 R14: 0000000000000000 R15: 
ffff8800b71b9418
[    1.830189] FS:  0000000000000000(0000) GS:ffff8800bb2c0000(0000) 
knlGS:0000000000000000
[    1.830191] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.830193] CR2: 0000000000000020 CR3: 0000000002209000 CR4: 
00000000000006e0
[    1.830194] Call Trace:
[    1.830200]  ? find_encoder+0x33/0x70
[    1.830204]  ? nouveau_connector_hotplug+0x56/0x100
[    1.830206]  ? nvif_notify_work+0x1f/0xa0
[    1.830210]  ? nvkm_notify_work+0x64/0x70
[    1.830214]  ? process_one_work+0x1a3/0x320
[    1.830217]  ? worker_thread+0x42/0x3d0
[    1.830220]  ? kthread+0xf2/0x130
[    1.830223]  ? process_one_work+0x320/0x320
[    1.830225]  ? kthread_create_on_node+0x40/0x40
[    1.830228]  ? call_usermodehelper_exec_async+0x125/0x130
[    1.830233]  ? ret_from_fork+0x25/0x30
[    1.830234] Code: 89 04 24 e8 d7 2f ca ff 48 89 df e8 2f 72 c8 ff 48 
89 df e8 f7 ac 99 ff 48 83 c4 08 5b c3 90 41 54 55 48 8d 6f 08 53 48 83 
ec 18 <48> 8b 5f 20 65 48 8b 04 25 28 00 00 00 48 89 44 24 10 31 c0 c6
[    1.830276] RIP: nv50_mstm_service+0xc/0xb0 RSP: ffffc90000157df0
[    1.830277] CR2: 0000000000000020
[    1.830281] ---[ end trace 9578c3b6b1cff0d4 ]---
[    1.957826] Console: switching to colour frame buffer device 180x56
[    1.975000] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    1.975037] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 
on minor 0


Signed-off-by: Woody Suwalski <terraluna977@gmail.com>
---

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c 
b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 70d8e0d69ad5..62127f225dbd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1115,7 +1115,8 @@ nouveau_connector_hotplug(struct nvif_notify *notify)

      if (rep->mask & NVIF_NOTIFY_CONN_V0_IRQ) {
          NV_DEBUG(drm, "service %s\n", name);
-        if ((nv_encoder = find_encoder(connector, DCB_OUTPUT_DP)))
+        if ((nv_encoder = find_encoder(connector, DCB_OUTPUT_DP)) &&
+            nv_encoder->dp.mstm )
              nv50_mstm_service(nv_encoder->dp.mstm);
      } else {
          bool plugged = (rep->mask != NVIF_NOTIFY_CONN_V0_UNPLUG);
