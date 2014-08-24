From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
Subject: Kernel crash in 3.17-rc1 when loading nouveau on
	(non-POSTed) NV1A
Date: Sun, 24 Aug 2014 21:52:55 +0200
Message-ID: <20140824215255.4a9e5ec8@neptune.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

System was booted with PCI graphics card first in VGA text mode.

Loading nouveau from there on causes the following BUG, after what
kernel produces trace over trace until overflowing its stack.
(trace captured via netconsole)

[  154.323717] wmi: Mapper loaded
[  154.735793] nouveau 0000:02:00.0: enabling device (0004 -> 0006)
[  154.743189] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 16
[  154.754844] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x01a000b1
[  154.761111] nouveau  [  DEVICE][0000:02:00.0] Chipset: nForce (NV1A)
[  154.767534] nouveau  [  DEVICE][0000:02:00.0] Family : NV10
[  154.773918] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[  154.832093] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  154.838624] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[  154.845146] nouveau  [   VBIOS][0000:02:00.0] BMP version 5.14
[  154.851300] nouveau  [   VBIOS][0000:02:00.0] version 03.1a.01.03.00
[  154.857785] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  154.866214] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  154.874456] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  154.881386] nouveau W[   VBIOS][0000:02:00.0] DCB contains no useful data
[  154.888274] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[  154.894789] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  155.060171] nouveau W[  PTIMER][0000:02:00.0] unknown input clock freq
[  155.066831] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[  155.073960] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[  155.079857] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  155.090902] nouveau  [     CLK][0000:02:00.0] --:   
[  155.096002] ------------[ cut here ]------------
[  155.100004] kernel BUG at /usr/src/linux-git/drivers/gpu/drm/nouveau/core/core/event.c:42!

This is a BUG_ON(!spin_is_locked(&event->refs_lock))

Is that a valid check for CONFIG_SMP=n?
As far as I know spin_locks are NOOP on UP configs... and in the recent
past that kind of test has been complained about on lkml.

[  155.100004] invalid opcode: 0000 [#1] 
[  155.100004] Modules linked in: nouveau(+) wmi ttm drm_kms_helper nfsv3 nfs_acl nfs lockd sunrpc
[  155.100004] CPU: 0 PID: 15 Comm: kworker/0:1 Not tainted 3.17.0-rc1-jupiter-00002-gec30df4 #6
[  155.100004] Hardware name: NVIDIA Corporation. nFORCE-MCP/MS-6373, BIOS 6.00 PG 04/12/2002
[  155.100004] Workqueue: events nouveau_pstate_work [nouveau]
[  155.100004] task: dd451c70 ti: dd5c8000 task.ti: dd5c8000
[  155.100004] EIP: 0060:[<dea19e13>] EFLAGS: 00010046 CPU: 0
[  155.100004] EIP is at nvkm_event_get+0x3/0x10 [nouveau]
[  155.100004] EAX: dcd4c484 EBX: 00000286 ECX: 00000000 EDX: 00000001
[  155.100004] ESI: 00000000 EDI: ffffffff EBP: dd5c9ea8 ESP: dd5c9ea8
[  155.100004]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[  155.100004] CR0: 8005003b CR2: b77d9000 CR3: 1ce83000 CR4: 000007d0
[  155.100004] Stack:
[  155.100004]  dd5c9eb4 dea1cc92 dd694d34 dd5c9f04 dea2e3b6 00000000 00000005 deae3e69
[  155.100004]  ffffffff 00000001 ffffffff ffffffff ffffffff 00000000 00000000 dd451c70
[  155.100004]  c05bc820 ffffffff 00000000 dd694c60 dd694d34 00000000 dd5b8070 dd5c9f44
[  155.100004] Call Trace:
[  155.100004]  [<dea1cc92>] nvkm_notify_get+0x32/0x40 [nouveau]
[  155.100004]  [<dea2e3b6>] nouveau_pstate_work+0x396/0x3a0 [nouveau]
[  155.100004]  [<c1047fa7>] process_one_work+0x1d7/0x340
[  155.100004]  [<c10485bf>] worker_thread+0x2af/0x380
[  155.100004]  [<c1048310>] ? rescuer_thread+0x1d0/0x1d0
[  155.100004]  [<c1048310>] ? rescuer_thread+0x1d0/0x1d0
[  155.100004]  [<c104bfa4>] kthread+0xa4/0xb0
[  155.100004]  [<c14b6c00>] ret_from_kernel_thread+0x20/0x30
[  155.100004]  [<c104bf00>] ? flush_kthread_worker+0x70/0x70
[  155.100004] Code: 71 a9 e2 90 8d 74 26 00 83 c4 0c 5b 5e 5f 5d c3 66 90 66 90 66 90 66 90 55 89 e5 0f 0b 8d 74 26 00 8d bc 27 00 00 00 00 55 89 e5 <0f> 0b 8d 74 
[  155.100004] EIP: [<dea19e13>] nvkm_event_get+0x3/0x10 [nouveau] SS:ESP 0068:dd5c9ea8
[  155.100004] ---[ end trace 6142147b1d3fed4d ]---

things go downhill from here on.
