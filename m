From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97438] New: Running a lot of Firefox instances
 causes kernel page fault.
Date: Mon, 22 Aug 2016 17:07:55 +0000
Message-ID: <bug-97438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023433312=="
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


--===============2023433312==
Content-Type: multipart/alternative; boundary="14718856741.2d4A.15785";
 charset="UTF-8"


--14718856741.2d4A.15785
Date: Mon, 22 Aug 2016 17:07:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97438

            Bug ID: 97438
           Summary: Running a lot of Firefox instances causes kernel page
                    fault.
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: accelrtr-zJpx2rpV7r/QT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 125951
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125951&action=3Dedit
dmesg output from startup with showed blocked processes

I noticed that sometimes application like firefox, mvp and other qt5 apps s=
tops
launching. Already running applications are not affected.

Steps to reproduce:

Using Firefox is the fastest method to reproduce bug.

1. Launch Firefox instances until kernel oops. Last instance freezes.

[  398.040470] resource sanity check: requesting [mem 0xf9fcf000-0xfa035fff=
],
which spans more than 0000:01:00.0 [mem 0xf8000000-0xf9ffffff 64bit]
[  398.040518] caller nv50_instobj_boot+0xaa/0x120 [nouveau] mapping multip=
le
BARs
[  398.040539] BUG: unable to handle kernel paging request at ffffc90000d30=
000
[  398.040567] IP: [<ffffffff813a73d1>] iowrite32+0x31/0x40
[  398.040581] PGD 12b085067 PUD 12b086067 PMD c9657067 PTE 0
[  398.040595] Oops: 0002 [#1] PREEMPT SMP
[  398.040600] Modules linked in: fuse nouveau wmi atl1c video pcspkr fbcon
bitblit softcursor font i2c_algo_bit backlight drm_kms_helper cfbfillrect
syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea ttm drm
agpgart fb fbdev
[  398.040663] CPU: 1 PID: 4704 Comm: firefox Not tainted 4.7.2-gentoo #1
[  398.040670] Hardware name: Gigabyte Technology Co., Ltd.
G41M-Combo/G41M-Combo, BIOS FA 02/29/2012
[  398.040678] task: ffff88003c14a640 ti: ffff8801070b4000 task.ti:
ffff8801070b4000
[  398.040685] RIP: 0010:[<ffffffff813a73d1>]  [<ffffffff813a73d1>]
iowrite32+0x31/0x40
[  398.040695] RSP: 0018:ffff8801070b7838  EFLAGS: 00010292
[  398.040700] RAX: ffffffffa020b940 RBX: 0000000000010000 RCX:
0000000000000000
[  398.040707] RDX: ffffc90000d30000 RSI: ffffc90000d30000 RDI:
000000003defa281
[  398.040713] RBP: ffff8801070b7840 R08: 0000000000000067 R09:
000000003dec9000
[  398.040719] R10: ffff880046925900 R11: 000000003dec9000 R12:
0000000000000000
[  398.040726] R13: 000000003defa281 R14: 0000000000000100 R15:
ffff88012a7daf40
[  398.040733] FS:  00007f1e9b8d9740(0000) GS:ffff88012fa80000(0000)
knlGS:0000000000000000
[  398.040739] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  398.040745] CR2: ffffc90000d30000 CR3: 0000000119d6f000 CR4:
00000000000406e0
[  398.040750] Stack:
[  398.040754]  ffffffffa017cb6f ffff8801070b7898 ffffffffa0182663
ffff880046925900
[  398.040766]  ffff88005e153198 000000003df1a001 000000b000000000
0000000000000067
[  398.040776]  0000000000000000 0000000000002036 ffff88012a07ba00
ffff88005e153198
[  398.040787] Call Trace:
[  398.040811]  [<ffffffffa017cb6f>] ? nvkm_instobj_wr32+0xf/0x20 [nouveau]
[  398.040836]  [<ffffffffa0182663>] nv50_vm_map+0x153/0x1a0 [nouveau]
[  398.040860]  [<ffffffffa0180917>] nvkm_vm_map_at+0xd7/0x1c0 [nouveau]
[  398.040884]  [<ffffffffa017d7e6>] nv50_instobj_map+0x16/0x20 [nouveau]
[  398.040908]  [<ffffffffa017da50>] nv50_instobj_boot+0xc0/0x120 [nouveau]
[  398.040933]  [<ffffffffa017d966>] nv50_instobj_acquire+0x46/0x70 [nouvea=
u]
[  398.040960]  [<ffffffffa017cae2>] nvkm_instobj_acquire_slow+0x12/0x30
[nouveau]
[  398.040984]  [<ffffffffa017ce26>] nvkm_instobj_new+0x56/0x150 [nouveau]
[  398.041003]  [<ffffffffa0140100>] nvkm_memory_new+0x30/0x50 [nouveau]
[  398.041010]  [<ffffffffa013ef99>] nvkm_gpuobj_new+0x119/0x200 [nouveau]
[  398.041010]  [<ffffffffa01b4657>] nv50_gr_chan_bind+0x27/0x60 [nouveau]
[  398.041010]  [<ffffffffa0140ee2>] nvkm_object_bind+0x12/0x20 [nouveau]
[  398.041010]  [<ffffffffa01a8804>] g84_fifo_chan_engine_ctor+0x34/0x40
[nouveau]
[  398.041010]  [<ffffffffa01a7b3f>] nvkm_fifo_chan_child_new+0x14f/0x270
[nouveau]
[  398.041010]  [<ffffffffa013fc53>] nvkm_ioctl_new+0x123/0x280 [nouveau]
[  398.041010]  [<ffffffff81197839>] ? ___slab_alloc+0x1e9/0x4a0
[  398.041010]  [<ffffffffa01a74cc>] ? nvkm_fifo_chan_child_get+0x5c/0x110
[nouveau]
[  398.041010]  [<ffffffffa01a79f0>] ? nvkm_fifo_chan_dtor+0xd0/0xd0 [nouve=
au]
[  398.041010]  [<ffffffffa0141570>] ? nvkm_object_new_+0x60/0x60 [nouveau]
[  398.041010]  [<ffffffffa013fffc>] nvkm_ioctl+0x1cc/0x240 [nouveau]
[  398.041010]  [<ffffffffa01d71ed>] nvkm_client_ioctl+0xd/0x10 [nouveau]
[  398.041010]  [<ffffffffa013d03d>] nvif_object_ioctl+0x3d/0x50 [nouveau]
[  398.041010]  [<ffffffffa013d59d>] nvif_object_init+0xbd/0x130 [nouveau]
[  398.041010]  [<ffffffffa01eae51>]
nouveau_abi16_ioctl_grobj_alloc+0x141/0x2d0 [nouveau]
[  398.041010]  [<ffffffffa00276bd>] drm_ioctl+0x13d/0x560 [drm]
[  398.041010]  [<ffffffffa01ead10>] ?
nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[  398.041010]  [<ffffffff81091fd5>] ? preempt_count_add+0xa5/0xc0
[  398.041010]  [<ffffffff818288eb>] ? _raw_spin_unlock_irqrestore+0x1b/0x30
[  398.041010]  [<ffffffffa01d4e32>] nouveau_drm_ioctl+0x62/0xb0 [nouveau]
[  398.041010]  [<ffffffff811b8b1b>] do_vfs_ioctl+0x8b/0x590
[  398.041010]  [<ffffffff811b9094>] SyS_ioctl+0x74/0x80
[  398.041010]  [<ffffffff81828e72>] entry_SYSCALL_64_fastpath+0x1a/0xa4
[  398.041010] Code: 00 48 89 f2 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6 =
89
f8 ef c3 55 48 c7 c6 1c 72 bb 81 48 89 d7 48 89 e5 e8 51 fe ff ff 5d c3 <89=
> 3e
c3 66 90 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff ff ff 03=20
[  398.041010] RIP  [<ffffffff813a73d1>] iowrite32+0x31/0x40
[  398.041010]  RSP <ffff8801070b7838>
[  398.041010] CR2: ffffc90000d30000
[  398.041010] ---[ end trace 0441d3b445912110 ]---
[  598.401939] sysrq: SysRq : Show Blocked State
[  598.401946]   task                        PC stack   pid father
[  598.402183] firefox         D ffff8801070b73f8 12256  4704   4699 0x0000=
0002
[  598.402193]  ffff8801070b73f8 0000000000000000 ffff88012ab61980
ffff88003c14a640
[  598.402197]  ffff8801070b7420 ffff8801070b8000 ffff88002674d15c
ffff88003c14a640
[  598.402200]  00000000ffffffff ffff88002674d160 ffff8801070b7410
ffffffff81824dea
[  598.402204] Call Trace:
[  598.402212]  [<ffffffff81824dea>] schedule+0x3a/0x90
[  598.402215]  [<ffffffff81825233>] schedule_preempt_disabled+0x13/0x20
[  598.402217]  [<ffffffff81826c50>] __mutex_lock_slowpath+0x90/0x120
[  598.402220]  [<ffffffff81826cf2>] mutex_lock+0x12/0x30
[  598.402250]  [<ffffffffa01d52b0>] nouveau_drm_preclose+0x30/0x90 [nouvea=
u]
[  598.402259]  [<ffffffffa0025fc3>] drm_release+0xb3/0x4c0 [drm]
[  598.402263]  [<ffffffff811a7a89>] __fput+0xc9/0x1d0
[  598.402265]  [<ffffffff811a7bc9>] ____fput+0x9/0x10
[  598.402269]  [<ffffffff8108a18c>] task_work_run+0x7c/0xa0
[  598.402272]  [<ffffffff81070fe7>] do_exit+0x367/0xbf0
[  598.402276]  [<ffffffff8102fa07>] oops_end+0x97/0xd0
[  598.402279]  [<ffffffff8105ef7d>] no_context+0x10d/0x360
[  598.402282]  [<ffffffff8105f247>] __bad_area_nosemaphore+0x77/0x1b0
[  598.402285]  [<ffffffff8105f38f>] bad_area_nosemaphore+0xf/0x20
[  598.402287]  [<ffffffff8105fa38>] __do_page_fault+0x88/0x510
[  598.402291]  [<ffffffff810ba2b7>] ? print_time.part.13+0x67/0x90
[  598.402293]  [<ffffffff810ba341>] ? print_prefix+0x61/0xa0
[  598.402295]  [<ffffffff8105fee2>] do_page_fault+0x22/0x30
[  598.402298]  [<ffffffff8182ae88>] page_fault+0x28/0x30
[  598.402303]  [<ffffffff813a73d1>] ? iowrite32+0x31/0x40
[  598.402322]  [<ffffffffa017cb6f>] ? nvkm_instobj_wr32+0xf/0x20 [nouveau]
[  598.402341]  [<ffffffffa0182663>] nv50_vm_map+0x153/0x1a0 [nouveau]
[  598.402361]  [<ffffffffa0180917>] nvkm_vm_map_at+0xd7/0x1c0 [nouveau]
[  598.402380]  [<ffffffffa017d7e6>] nv50_instobj_map+0x16/0x20 [nouveau]
[  598.402399]  [<ffffffffa017da50>] nv50_instobj_boot+0xc0/0x120 [nouveau]
[  598.402418]  [<ffffffffa017d966>] nv50_instobj_acquire+0x46/0x70 [nouvea=
u]
[  598.402437]  [<ffffffffa017cae2>] nvkm_instobj_acquire_slow+0x12/0x30
[nouveau]
[  598.402456]  [<ffffffffa017ce26>] nvkm_instobj_new+0x56/0x150 [nouveau]
[  598.402470]  [<ffffffffa0140100>] nvkm_memory_new+0x30/0x50 [nouveau]
[  598.402484]  [<ffffffffa013ef99>] nvkm_gpuobj_new+0x119/0x200 [nouveau]
[  598.402502]  [<ffffffffa01b4657>] nv50_gr_chan_bind+0x27/0x60 [nouveau]
[  598.402516]  [<ffffffffa0140ee2>] nvkm_object_bind+0x12/0x20 [nouveau]
[  598.402535]  [<ffffffffa01a8804>] g84_fifo_chan_engine_ctor+0x34/0x40
[nouveau]
[  598.402553]  [<ffffffffa01a7b3f>] nvkm_fifo_chan_child_new+0x14f/0x270
[nouveau]
[  598.402567]  [<ffffffffa013fc53>] nvkm_ioctl_new+0x123/0x280 [nouveau]
[  598.402570]  [<ffffffff81197839>] ? ___slab_alloc+0x1e9/0x4a0
[  598.402589]  [<ffffffffa01a74cc>] ? nvkm_fifo_chan_child_get+0x5c/0x110
[nouveau]
[  598.402607]  [<ffffffffa01a79f0>] ? nvkm_fifo_chan_dtor+0xd0/0xd0 [nouve=
au]
[  598.402622]  [<ffffffffa0141570>] ? nvkm_object_new_+0x60/0x60 [nouveau]
[  598.402636]  [<ffffffffa013fffc>] nvkm_ioctl+0x1cc/0x240 [nouveau]
[  598.402652]  [<ffffffffa01d71ed>] nvkm_client_ioctl+0xd/0x10 [nouveau]
[  598.402665]  [<ffffffffa013d03d>] nvif_object_ioctl+0x3d/0x50 [nouveau]
[  598.402678]  [<ffffffffa013d59d>] nvif_object_init+0xbd/0x130 [nouveau]
[  598.402694]  [<ffffffffa01eae51>]
nouveau_abi16_ioctl_grobj_alloc+0x141/0x2d0 [nouveau]
[  598.402700]  [<ffffffffa00276bd>] drm_ioctl+0x13d/0x560 [drm]
[  598.402715]  [<ffffffffa01ead10>] ?
nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[  598.402719]  [<ffffffff81091fd5>] ? preempt_count_add+0xa5/0xc0
[  598.402722]  [<ffffffff818288eb>] ? _raw_spin_unlock_irqrestore+0x1b/0x30
[  598.402738]  [<ffffffffa01d4e32>] nouveau_drm_ioctl+0x62/0xb0 [nouveau]
[  598.402741]  [<ffffffff811b8b1b>] do_vfs_ioctl+0x8b/0x590
[  598.402744]  [<ffffffff811b9094>] SyS_ioctl+0x74/0x80
[  598.402747]  [<ffffffff81828e72>] entry_SYSCALL_64_fastpath+0x1a/0xa4


3. Try to switch VT. Mouse disappears, Xorg freezes and switching terminal =
no
longer possible.=20


This bug also reproducible on 4.4.6-gentoo kernel

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14718856741.2d4A.15785
Date: Mon, 22 Aug 2016 17:07:54 +0000
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
   title=3D"NEW - Running a lot of Firefox instances causes kernel page fau=
lt."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438">97438</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Running a lot of Firefox instances causes kernel page fault.
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
          <td>accelrtr&#64;yandex.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125951=
" name=3D"attach_125951" title=3D"dmesg output from startup with showed blo=
cked processes">attachment 125951</a> <a href=3D"attachment.cgi?id=3D125951=
&amp;action=3Dedit" title=3D"dmesg output from startup with showed blocked =
processes">[details]</a></span>
dmesg output from startup with showed blocked processes

I noticed that sometimes application like firefox, mvp and other qt5 apps s=
tops
launching. Already running applications are not affected.

Steps to reproduce:

Using Firefox is the fastest method to reproduce bug.

1. Launch Firefox instances until kernel oops. Last instance freezes.

[  398.040470] resource sanity check: requesting [mem 0xf9fcf000-0xfa035fff=
],
which spans more than 0000:01:00.0 [mem 0xf8000000-0xf9ffffff 64bit]
[  398.040518] caller nv50_instobj_boot+0xaa/0x120 [nouveau] mapping multip=
le
BARs
[  398.040539] BUG: unable to handle kernel paging request at ffffc90000d30=
000
[  398.040567] IP: [&lt;ffffffff813a73d1&gt;] iowrite32+0x31/0x40
[  398.040581] PGD 12b085067 PUD 12b086067 PMD c9657067 PTE 0
[  398.040595] Oops: 0002 [#1] PREEMPT SMP
[  398.040600] Modules linked in: fuse nouveau wmi atl1c video pcspkr fbcon
bitblit softcursor font i2c_algo_bit backlight drm_kms_helper cfbfillrect
syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea ttm drm
agpgart fb fbdev
[  398.040663] CPU: 1 PID: 4704 Comm: firefox Not tainted 4.7.2-gentoo #1
[  398.040670] Hardware name: Gigabyte Technology Co., Ltd.
G41M-Combo/G41M-Combo, BIOS FA 02/29/2012
[  398.040678] task: ffff88003c14a640 ti: ffff8801070b4000 task.ti:
ffff8801070b4000
[  398.040685] RIP: 0010:[&lt;ffffffff813a73d1&gt;]  [&lt;ffffffff813a73d1&=
gt;]
iowrite32+0x31/0x40
[  398.040695] RSP: 0018:ffff8801070b7838  EFLAGS: 00010292
[  398.040700] RAX: ffffffffa020b940 RBX: 0000000000010000 RCX:
0000000000000000
[  398.040707] RDX: ffffc90000d30000 RSI: ffffc90000d30000 RDI:
000000003defa281
[  398.040713] RBP: ffff8801070b7840 R08: 0000000000000067 R09:
000000003dec9000
[  398.040719] R10: ffff880046925900 R11: 000000003dec9000 R12:
0000000000000000
[  398.040726] R13: 000000003defa281 R14: 0000000000000100 R15:
ffff88012a7daf40
[  398.040733] FS:  00007f1e9b8d9740(0000) GS:ffff88012fa80000(0000)
knlGS:0000000000000000
[  398.040739] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  398.040745] CR2: ffffc90000d30000 CR3: 0000000119d6f000 CR4:
00000000000406e0
[  398.040750] Stack:
[  398.040754]  ffffffffa017cb6f ffff8801070b7898 ffffffffa0182663
ffff880046925900
[  398.040766]  ffff88005e153198 000000003df1a001 000000b000000000
0000000000000067
[  398.040776]  0000000000000000 0000000000002036 ffff88012a07ba00
ffff88005e153198
[  398.040787] Call Trace:
[  398.040811]  [&lt;ffffffffa017cb6f&gt;] ? nvkm_instobj_wr32+0xf/0x20 [no=
uveau]
[  398.040836]  [&lt;ffffffffa0182663&gt;] nv50_vm_map+0x153/0x1a0 [nouveau]
[  398.040860]  [&lt;ffffffffa0180917&gt;] nvkm_vm_map_at+0xd7/0x1c0 [nouve=
au]
[  398.040884]  [&lt;ffffffffa017d7e6&gt;] nv50_instobj_map+0x16/0x20 [nouv=
eau]
[  398.040908]  [&lt;ffffffffa017da50&gt;] nv50_instobj_boot+0xc0/0x120 [no=
uveau]
[  398.040933]  [&lt;ffffffffa017d966&gt;] nv50_instobj_acquire+0x46/0x70 [=
nouveau]
[  398.040960]  [&lt;ffffffffa017cae2&gt;] nvkm_instobj_acquire_slow+0x12/0=
x30
[nouveau]
[  398.040984]  [&lt;ffffffffa017ce26&gt;] nvkm_instobj_new+0x56/0x150 [nou=
veau]
[  398.041003]  [&lt;ffffffffa0140100&gt;] nvkm_memory_new+0x30/0x50 [nouve=
au]
[  398.041010]  [&lt;ffffffffa013ef99&gt;] nvkm_gpuobj_new+0x119/0x200 [nou=
veau]
[  398.041010]  [&lt;ffffffffa01b4657&gt;] nv50_gr_chan_bind+0x27/0x60 [nou=
veau]
[  398.041010]  [&lt;ffffffffa0140ee2&gt;] nvkm_object_bind+0x12/0x20 [nouv=
eau]
[  398.041010]  [&lt;ffffffffa01a8804&gt;] g84_fifo_chan_engine_ctor+0x34/0=
x40
[nouveau]
[  398.041010]  [&lt;ffffffffa01a7b3f&gt;] nvkm_fifo_chan_child_new+0x14f/0=
x270
[nouveau]
[  398.041010]  [&lt;ffffffffa013fc53&gt;] nvkm_ioctl_new+0x123/0x280 [nouv=
eau]
[  398.041010]  [&lt;ffffffff81197839&gt;] ? ___slab_alloc+0x1e9/0x4a0
[  398.041010]  [&lt;ffffffffa01a74cc&gt;] ? nvkm_fifo_chan_child_get+0x5c/=
0x110
[nouveau]
[  398.041010]  [&lt;ffffffffa01a79f0&gt;] ? nvkm_fifo_chan_dtor+0xd0/0xd0 =
[nouveau]
[  398.041010]  [&lt;ffffffffa0141570&gt;] ? nvkm_object_new_+0x60/0x60 [no=
uveau]
[  398.041010]  [&lt;ffffffffa013fffc&gt;] nvkm_ioctl+0x1cc/0x240 [nouveau]
[  398.041010]  [&lt;ffffffffa01d71ed&gt;] nvkm_client_ioctl+0xd/0x10 [nouv=
eau]
[  398.041010]  [&lt;ffffffffa013d03d&gt;] nvif_object_ioctl+0x3d/0x50 [nou=
veau]
[  398.041010]  [&lt;ffffffffa013d59d&gt;] nvif_object_init+0xbd/0x130 [nou=
veau]
[  398.041010]  [&lt;ffffffffa01eae51&gt;]
nouveau_abi16_ioctl_grobj_alloc+0x141/0x2d0 [nouveau]
[  398.041010]  [&lt;ffffffffa00276bd&gt;] drm_ioctl+0x13d/0x560 [drm]
[  398.041010]  [&lt;ffffffffa01ead10&gt;] ?
nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[  398.041010]  [&lt;ffffffff81091fd5&gt;] ? preempt_count_add+0xa5/0xc0
[  398.041010]  [&lt;ffffffff818288eb&gt;] ? _raw_spin_unlock_irqrestore+0x=
1b/0x30
[  398.041010]  [&lt;ffffffffa01d4e32&gt;] nouveau_drm_ioctl+0x62/0xb0 [nou=
veau]
[  398.041010]  [&lt;ffffffff811b8b1b&gt;] do_vfs_ioctl+0x8b/0x590
[  398.041010]  [&lt;ffffffff811b9094&gt;] SyS_ioctl+0x74/0x80
[  398.041010]  [&lt;ffffffff81828e72&gt;] entry_SYSCALL_64_fastpath+0x1a/0=
xa4
[  398.041010] Code: 00 48 89 f2 77 25 48 81 fe 00 00 01 00 76 07 0f b7 d6 =
89
f8 ef c3 55 48 c7 c6 1c 72 bb 81 48 89 d7 48 89 e5 e8 51 fe ff ff 5d c3 &lt=
;89&gt; 3e
c3 66 90 66 2e 0f 1f 84 00 00 00 00 00 48 81 ff ff ff 03=20
[  398.041010] RIP  [&lt;ffffffff813a73d1&gt;] iowrite32+0x31/0x40
[  398.041010]  RSP &lt;ffff8801070b7838&gt;
[  398.041010] CR2: ffffc90000d30000
[  398.041010] ---[ end trace 0441d3b445912110 ]---
[  598.401939] sysrq: SysRq : Show Blocked State
[  598.401946]   task                        PC stack   pid father
[  598.402183] firefox         D ffff8801070b73f8 12256  4704   4699 0x0000=
0002
[  598.402193]  ffff8801070b73f8 0000000000000000 ffff88012ab61980
ffff88003c14a640
[  598.402197]  ffff8801070b7420 ffff8801070b8000 ffff88002674d15c
ffff88003c14a640
[  598.402200]  00000000ffffffff ffff88002674d160 ffff8801070b7410
ffffffff81824dea
[  598.402204] Call Trace:
[  598.402212]  [&lt;ffffffff81824dea&gt;] schedule+0x3a/0x90
[  598.402215]  [&lt;ffffffff81825233&gt;] schedule_preempt_disabled+0x13/0=
x20
[  598.402217]  [&lt;ffffffff81826c50&gt;] __mutex_lock_slowpath+0x90/0x120
[  598.402220]  [&lt;ffffffff81826cf2&gt;] mutex_lock+0x12/0x30
[  598.402250]  [&lt;ffffffffa01d52b0&gt;] nouveau_drm_preclose+0x30/0x90 [=
nouveau]
[  598.402259]  [&lt;ffffffffa0025fc3&gt;] drm_release+0xb3/0x4c0 [drm]
[  598.402263]  [&lt;ffffffff811a7a89&gt;] __fput+0xc9/0x1d0
[  598.402265]  [&lt;ffffffff811a7bc9&gt;] ____fput+0x9/0x10
[  598.402269]  [&lt;ffffffff8108a18c&gt;] task_work_run+0x7c/0xa0
[  598.402272]  [&lt;ffffffff81070fe7&gt;] do_exit+0x367/0xbf0
[  598.402276]  [&lt;ffffffff8102fa07&gt;] oops_end+0x97/0xd0
[  598.402279]  [&lt;ffffffff8105ef7d&gt;] no_context+0x10d/0x360
[  598.402282]  [&lt;ffffffff8105f247&gt;] __bad_area_nosemaphore+0x77/0x1b0
[  598.402285]  [&lt;ffffffff8105f38f&gt;] bad_area_nosemaphore+0xf/0x20
[  598.402287]  [&lt;ffffffff8105fa38&gt;] __do_page_fault+0x88/0x510
[  598.402291]  [&lt;ffffffff810ba2b7&gt;] ? print_time.part.13+0x67/0x90
[  598.402293]  [&lt;ffffffff810ba341&gt;] ? print_prefix+0x61/0xa0
[  598.402295]  [&lt;ffffffff8105fee2&gt;] do_page_fault+0x22/0x30
[  598.402298]  [&lt;ffffffff8182ae88&gt;] page_fault+0x28/0x30
[  598.402303]  [&lt;ffffffff813a73d1&gt;] ? iowrite32+0x31/0x40
[  598.402322]  [&lt;ffffffffa017cb6f&gt;] ? nvkm_instobj_wr32+0xf/0x20 [no=
uveau]
[  598.402341]  [&lt;ffffffffa0182663&gt;] nv50_vm_map+0x153/0x1a0 [nouveau]
[  598.402361]  [&lt;ffffffffa0180917&gt;] nvkm_vm_map_at+0xd7/0x1c0 [nouve=
au]
[  598.402380]  [&lt;ffffffffa017d7e6&gt;] nv50_instobj_map+0x16/0x20 [nouv=
eau]
[  598.402399]  [&lt;ffffffffa017da50&gt;] nv50_instobj_boot+0xc0/0x120 [no=
uveau]
[  598.402418]  [&lt;ffffffffa017d966&gt;] nv50_instobj_acquire+0x46/0x70 [=
nouveau]
[  598.402437]  [&lt;ffffffffa017cae2&gt;] nvkm_instobj_acquire_slow+0x12/0=
x30
[nouveau]
[  598.402456]  [&lt;ffffffffa017ce26&gt;] nvkm_instobj_new+0x56/0x150 [nou=
veau]
[  598.402470]  [&lt;ffffffffa0140100&gt;] nvkm_memory_new+0x30/0x50 [nouve=
au]
[  598.402484]  [&lt;ffffffffa013ef99&gt;] nvkm_gpuobj_new+0x119/0x200 [nou=
veau]
[  598.402502]  [&lt;ffffffffa01b4657&gt;] nv50_gr_chan_bind+0x27/0x60 [nou=
veau]
[  598.402516]  [&lt;ffffffffa0140ee2&gt;] nvkm_object_bind+0x12/0x20 [nouv=
eau]
[  598.402535]  [&lt;ffffffffa01a8804&gt;] g84_fifo_chan_engine_ctor+0x34/0=
x40
[nouveau]
[  598.402553]  [&lt;ffffffffa01a7b3f&gt;] nvkm_fifo_chan_child_new+0x14f/0=
x270
[nouveau]
[  598.402567]  [&lt;ffffffffa013fc53&gt;] nvkm_ioctl_new+0x123/0x280 [nouv=
eau]
[  598.402570]  [&lt;ffffffff81197839&gt;] ? ___slab_alloc+0x1e9/0x4a0
[  598.402589]  [&lt;ffffffffa01a74cc&gt;] ? nvkm_fifo_chan_child_get+0x5c/=
0x110
[nouveau]
[  598.402607]  [&lt;ffffffffa01a79f0&gt;] ? nvkm_fifo_chan_dtor+0xd0/0xd0 =
[nouveau]
[  598.402622]  [&lt;ffffffffa0141570&gt;] ? nvkm_object_new_+0x60/0x60 [no=
uveau]
[  598.402636]  [&lt;ffffffffa013fffc&gt;] nvkm_ioctl+0x1cc/0x240 [nouveau]
[  598.402652]  [&lt;ffffffffa01d71ed&gt;] nvkm_client_ioctl+0xd/0x10 [nouv=
eau]
[  598.402665]  [&lt;ffffffffa013d03d&gt;] nvif_object_ioctl+0x3d/0x50 [nou=
veau]
[  598.402678]  [&lt;ffffffffa013d59d&gt;] nvif_object_init+0xbd/0x130 [nou=
veau]
[  598.402694]  [&lt;ffffffffa01eae51&gt;]
nouveau_abi16_ioctl_grobj_alloc+0x141/0x2d0 [nouveau]
[  598.402700]  [&lt;ffffffffa00276bd&gt;] drm_ioctl+0x13d/0x560 [drm]
[  598.402715]  [&lt;ffffffffa01ead10&gt;] ?
nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[  598.402719]  [&lt;ffffffff81091fd5&gt;] ? preempt_count_add+0xa5/0xc0
[  598.402722]  [&lt;ffffffff818288eb&gt;] ? _raw_spin_unlock_irqrestore+0x=
1b/0x30
[  598.402738]  [&lt;ffffffffa01d4e32&gt;] nouveau_drm_ioctl+0x62/0xb0 [nou=
veau]
[  598.402741]  [&lt;ffffffff811b8b1b&gt;] do_vfs_ioctl+0x8b/0x590
[  598.402744]  [&lt;ffffffff811b9094&gt;] SyS_ioctl+0x74/0x80
[  598.402747]  [&lt;ffffffff81828e72&gt;] entry_SYSCALL_64_fastpath+0x1a/0=
xa4


3. Try to switch VT. Mouse disappears, Xorg freezes and switching terminal =
no
longer possible.=20


This bug also reproducible on 4.4.6-gentoo kernel</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14718856741.2d4A.15785--

--===============2023433312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2023433312==--
