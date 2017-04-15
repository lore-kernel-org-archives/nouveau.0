From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100691] New: [4.10] BUG: KASAN: use-after-free in
 drm_calc_vbltimestamp_from_scanoutpos+0x625/0x740
Date: Sat, 15 Apr 2017 19:48:24 +0000
Message-ID: <bug-100691-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0076970853=="
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


--===============0076970853==
Content-Type: multipart/alternative; boundary="14922857041.6857210.11649";
 charset="UTF-8"


--14922857041.6857210.11649
Date: Sat, 15 Apr 2017 19:48:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100691

            Bug ID: 100691
           Summary: [4.10] BUG: KASAN: use-after-free in
                    drm_calc_vbltimestamp_from_scanoutpos+0x625/0x740
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130857
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130857&action=3Dedit
dmesg for 4.10.9 with KASAN with files + lines added

Since upgrading from kernel 4.9.9 to 4.10.5 (and 4.10.9), I ended up with c=
lear
signs of memory corruption that finished with two kernel panics. The second
trace seems related to bug 100431.

When trying to reproduce it with 4.10.9, I failed to reproduce those issues,
but instead I found this one. It seems to happen when I try to open a new
window in KDE Plasma on Arch Linux (though I am not sure of the exact trigg=
er).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in drm_calc_vbltimestamp_from_scanoutpos+0x625/0=
x740
at addr ffff880739ecbfb0 (drivers/gpu/drm/drm_irq.c:743)
Read of size 4 by task swapper/4/0
CPU: 4 PID: 0 Comm: swapper/4 Not tainted 4.10.9kasan #10
Hardware name: Notebook                         P65_P67RGRERA/P65_P67RGRERA,
BIOS 1.05.16 05/16/2016
Call Trace:
 <IRQ>
 dump_stack+0x68/0x96 (lib/dump_stack.c:27)
 kasan_object_err+0x21/0x70 (mm/kasan/report.c:159)
 kasan_report.part.1+0x213/0x4e0
 ? drm_calc_vbltimestamp_from_scanoutpos+0x625/0x740
(drivers/gpu/drm/drm_irq.c:743)
 __asan_report_load4_noabort+0x2e/0x30 (mm/kasan/report.c:331)
 drm_calc_vbltimestamp_from_scanoutpos+0x625/0x740
(drivers/gpu/drm/drm_irq.c:743)
 ? drm_irq_install+0x570/0x570 (drivers/gpu/drm/drm_irq.c:459)
 ? trace_hardirqs_off+0xd/0x10 (kernel/locking/lockdep.c:2780)
 ? _raw_spin_unlock_irqrestore+0x4b/0x50 (kernel/locking/spinlock.c:190)
 ? try_to_wake_up+0xc6/0xd00 (kernel/sched/core.c:2010)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? migrate_swap_stop+0x790/0x790 (kernel/sched/core.c:1291)
 ? drm_handle_vblank+0x1c1/0x7d0 (drivers/gpu/drm/drm_irq.c:1704)
 nouveau_display_vblstamp+0x16d/0x2a0 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_display.c:159)
 drm_get_last_vbltimestamp+0xcb/0x160 (drivers/gpu/drm/drm_irq.c:878)
 ? get_drm_timestamp+0x40/0x40 (drivers/gpu/drm/drm_irq.c:848)
 ? trace_hardirqs_off+0xd/0x10 (kernel/locking/lockdep.c:2780)
 ? _raw_spin_unlock_irqrestore+0x4b/0x50 (kernel/locking/spinlock.c:190)
 ? nouveau_fence_wait_uevent_handler+0xc9/0x140 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_fence.c:148)
 drm_update_vblank_count+0x16a/0x870 (drivers/gpu/drm/drm_irq.c:150)
 ? store_vblank+0x2c0/0x2c0 (drivers/gpu/drm/drm_irq.c:79)
 drm_handle_vblank+0x14a/0x7d0 (drivers/gpu/drm/drm_irq.c:1704)
 ? trace_hardirqs_off+0xd/0x10 (kernel/locking/lockdep.c:2780)
 ? drm_crtc_wait_one_vblank+0x90/0x90 (drivers/gpu/drm/drm_irq.c:1252)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? cpuacct_charge+0x240/0x400 (kernel/sched/cpuacct.c:349)
 drm_crtc_handle_vblank+0x63/0x90 (drivers/gpu/drm/drm_irq.c:1755)
 ? find_next_bit+0x18/0x20 (lib/find_bit.c:63)
 nouveau_display_vblank_handler+0x15/0x20 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_display.c:50)
 nvif_notify+0x25f/0x570 [nouveau] (drivers/gpu/drm/nouveau/nvif/notify.c:1=
13)
 ? nvif_notify_get+0x160/0x160 [nouveau]
(drivers/gpu/drm/nouveau/nvif/notify.c:83)
 ? nv50_disp_vblank_fini_+0x57/0x80 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:102)
 ? nvkm_disp_vblank_fini+0x5f/0x90 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:41)
 ? nvkm_client_driver_init+0x100/0x100 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_nvif.c:110)
 nvkm_client_ntfy+0xc9/0x100 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_nvif.c:81)
 nvkm_client_notify+0xea/0x140 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/client.c:46)
 ? _raw_spin_unlock_irqrestore+0x4b/0x50 (kernel/locking/spinlock.c:190)
 nvkm_notify_send+0x224/0x520 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/notify.c:92)
 nvkm_event_send+0x208/0x270 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/event.c:54)
 nvkm_disp_vblank+0x74/0x90 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:85)
 ? nvkm_disp_dtor+0x540/0x540 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:247)
 gf119_disp_intr+0x1d6/0x690 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c:447)
 nv50_disp_intr_+0x4a/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:116)
 nvkm_disp_intr+0x53/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:204)
 nvkm_engine_intr+0x57/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/engine.c:71)
 nvkm_subdev_intr+0x54/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/subdev.c:88)
 nvkm_mc_intr+0x23a/0x4b0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c:79)
 ? nvkm_mc_intr_rearm+0xa0/0xa0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c:62)
 ? nv40_pci_wr08+0x68/0xa0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c:35)
 ? nvkm_pci_wr08+0x57/0x90 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:39)
 nvkm_pci_intr+0xcc/0x170 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:70)
 ? nvkm_pci_fini+0xd0/0xd0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:84)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? nvkm_pci_fini+0xd0/0xd0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:84)
 __handle_irq_event_percpu+0xe1/0x630 (kernel/irq/handle.c:136)
 handle_irq_event_percpu+0x69/0x130 (kernel/irq/handle.c:181)
 ? __handle_irq_event_percpu+0x630/0x630 (kernel/irq/handle.c:136)
 ? handle_edge_irq+0x30/0x850 (kernel/irq/chip.c:622)
 handle_irq_event+0xa7/0x140 (kernel/irq/handle.c:195)
 handle_edge_irq+0x1cd/0x850 (kernel/irq/chip.c:622)
 handle_irq+0x105/0x2a0 (arch/x86/kernel/irq_64.c:69)
 ? __local_bh_enable+0x37/0x60 (kernel/softirq.c:139)
 do_IRQ+0x7d/0x1a0 (arch/x86/kernel/irq.c:213)
 common_interrupt+0x90/0x90 (arch/x86/entry/entry_64.S:452)
RIP: 0010:cpuidle_enter_state+0x10d/0x7d0 (drivers/cpuidle/cpuidle.c:188)
RSP: 0018:ffff88077228fdc0 EFLAGS: 00000202 ORIG_RAX: ffffffffffffff1e
RAX: 0000000000000003 RBX: ffff8807761297b8 RCX: 000000000000001f
RDX: 0000000000000004 RSI: 1ffff100eec23d1b RDI: ffffffff839ec680
RBP: ffff88077228fe18 R08: 0000000000012314 R09: ffffffff83a10980
R10: ffff88077611dfc4 R11: ffff88077611dfe4 R12: 0000000000000008
R13: ffffffff83a10c98 R14: 000000001e85c873 R15: 0000000000000300
 </IRQ>
 ? set_cpu_sd_state_idle+0x145/0x230 (kernel/sched/fair.c:8557)
 cpuidle_enter+0x17/0x20 (drivers/cpuidle/cpuidle.c:282)
 call_cpuidle+0x47/0xc0 (kernel/sched/idle.c:103)
 ? cpuidle_select+0x59/0x80 (drivers/cpuidle/cpuidle.c:266)
 ? rcu_idle_enter+0x7e/0xa0 (kernel/rcu/tree.c:749)
 do_idle+0x22c/0x2e0 (kernel/sched/idle.c:209)
 cpu_startup_entry+0x1d/0x20 (kernel/sched/idle.c:326)
 start_secondary+0x298/0x360 (arch/x86/kernel/smpboot.c:224)
 ? set_cpu_sibling_map+0x1a40/0x1a40 (arch/x86/kernel/smpboot.c:525)
 start_cpu+0x14/0x14 (arch/x86/kernel/head_64.S:301)
Object at ffff880739ecbf00, in cache kmalloc-1024 size: 1024
Allocated:
PID =3D 535
 save_stack_trace+0x1b/0x20 (arch/x86/kernel/stacktrace.c:56)
 save_stack+0x46/0xd0 (mm/kasan/kasan.c:493)
 kasan_kmalloc+0xad/0xe0 (mm/kasan/kasan.c:585)
 kmem_cache_alloc_trace+0xf1/0x280 (mm/slub.c:2739)
 nv50_head_atomic_duplicate_state+0x72/0x700 [nouveau]
(drivers/gpu/drm/nouveau/nv50_display.c:2323)
 drm_atomic_get_crtc_state+0x1be/0x3d0 (drivers/gpu/drm/drm_atomic.c:264)
 drm_atomic_get_plane_state+0x2a5/0x3e0 (drivers/gpu/drm/drm_atomic.c:679)
 drm_atomic_helper_update_plane+0x10b/0x3b0
(drivers/gpu/drm/drm_atomic_helper.c:2089)
 __setplane_internal+0x417/0x950 (drivers/gpu/drm/drm_plane.c:457)
 drm_mode_cursor_universal+0x397/0xb30 (drivers/gpu/drm/drm_plane.c:599)
 drm_mode_cursor_common+0x173/0x750 (drivers/gpu/drm/drm_plane.c:675)
 drm_mode_cursor_ioctl+0x90/0xb0 (drivers/gpu/drm/drm_plane.c:733)
 drm_ioctl+0x4b0/0xba0 (drivers/gpu/drm/drm_ioctl.c:657)
 nouveau_drm_ioctl+0xf9/0x1e0 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_drm.c:925)
 do_vfs_ioctl+0x184/0xff0 (fs/ioctl.c:624)
 SyS_ioctl+0x79/0x90 (fs/ioctl.c:689)
 entry_SYSCALL_64_fastpath+0x18/0xad (arch/x86/entry/entry_64.S:188)
Freed:
PID =3D 535
 save_stack_trace+0x1b/0x20 (arch/x86/kernel/stacktrace.c:56)
 save_stack+0x46/0xd0 (mm/kasan/kasan.c:493)
 kasan_slab_free+0x73/0xc0 (mm/kasan/kasan.c:560)
 kfree+0xd9/0x2a0 (mm/slub.c:3862)
 nv50_head_atomic_destroy_state+0x1d/0x20 [nouveau]
(drivers/gpu/drm/nouveau/nv50_display.c:2315)
 drm_atomic_state_default_clear+0x372/0x930 (drivers/gpu/drm/drm_atomic.c:1=
41)
 nv50_disp_atomic_state_clear+0x124/0x1b0 [nouveau]
(drivers/gpu/drm/nouveau/nv50_display.c:4301)
 drm_atomic_state_clear+0x80/0xb0 (drivers/gpu/drm/drm_atomic.c:210)
 __drm_atomic_state_free+0x3a/0xe0 (drivers/gpu/drm/drm_atomic.c:229)
 drm_atomic_helper_update_plane+0x2b3/0x3b0
(drivers/gpu/drm/drm_atomic_helper.c:2089)
 __setplane_internal+0x417/0x950 (drivers/gpu/drm/drm_plane.c:457)
 drm_mode_cursor_universal+0x397/0xb30 (drivers/gpu/drm/drm_plane.c:599)
 drm_mode_cursor_common+0x173/0x750 (drivers/gpu/drm/drm_plane.c:675)
 drm_mode_cursor_ioctl+0x90/0xb0 (drivers/gpu/drm/drm_plane.c:733)
 drm_ioctl+0x4b0/0xba0 (drivers/gpu/drm/drm_ioctl.c:657)
 nouveau_drm_ioctl+0xf9/0x1e0 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_drm.c:925)
 do_vfs_ioctl+0x184/0xff0 (fs/ioctl.c:624)
 SyS_ioctl+0x79/0x90 (fs/ioctl.c:689)
 entry_SYSCALL_64_fastpath+0x18/0xad (arch/x86/entry/entry_64.S:188)
Memory state around the buggy address:
 ffff880739ecbe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff880739ecbf00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff880739ecbf80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff880739ecc000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff880739ecc080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14922857041.6857210.11649
Date: Sat, 15 Apr 2017 19:48:24 +0000
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
   title=3D"NEW - [4.10] BUG: KASAN: use-after-free in drm_calc_vbltimestam=
p_from_scanoutpos+0x625/0x740"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100691">100691</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[4.10] BUG: KASAN: use-after-free in drm_calc_vbltimestamp_fr=
om_scanoutpos+0x625/0x740
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
          <td>peter&#64;lekensteyn.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130857=
" name=3D"attach_130857" title=3D"dmesg for 4.10.9 with KASAN with files + =
lines added">attachment 130857</a> <a href=3D"attachment.cgi?id=3D130857&am=
p;action=3Dedit" title=3D"dmesg for 4.10.9 with KASAN with files + lines ad=
ded">[details]</a></span>
dmesg for 4.10.9 with KASAN with files + lines added

Since upgrading from kernel 4.9.9 to 4.10.5 (and 4.10.9), I ended up with c=
lear
signs of memory corruption that finished with two kernel panics. The second
trace seems related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv50: memory corruption due to use-after-free of dma_fenc=
e"
   href=3D"show_bug.cgi?id=3D100431">bug 100431</a>.

When trying to reproduce it with 4.10.9, I failed to reproduce those issues,
but instead I found this one. It seems to happen when I try to open a new
window in KDE Plasma on Arch Linux (though I am not sure of the exact trigg=
er).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in drm_calc_vbltimestamp_from_scanoutpos+0x625/0=
x740
at addr ffff880739ecbfb0 (drivers/gpu/drm/drm_irq.c:743)
Read of size 4 by task swapper/4/0
CPU: 4 PID: 0 Comm: swapper/4 Not tainted 4.10.9kasan #10
Hardware name: Notebook                         P65_P67RGRERA/P65_P67RGRERA,
BIOS 1.05.16 05/16/2016
Call Trace:
 &lt;IRQ&gt;
 dump_stack+0x68/0x96 (lib/dump_stack.c:27)
 kasan_object_err+0x21/0x70 (mm/kasan/report.c:159)
 kasan_report.part.1+0x213/0x4e0
 ? drm_calc_vbltimestamp_from_scanoutpos+0x625/0x740
(drivers/gpu/drm/drm_irq.c:743)
 __asan_report_load4_noabort+0x2e/0x30 (mm/kasan/report.c:331)
 drm_calc_vbltimestamp_from_scanoutpos+0x625/0x740
(drivers/gpu/drm/drm_irq.c:743)
 ? drm_irq_install+0x570/0x570 (drivers/gpu/drm/drm_irq.c:459)
 ? trace_hardirqs_off+0xd/0x10 (kernel/locking/lockdep.c:2780)
 ? _raw_spin_unlock_irqrestore+0x4b/0x50 (kernel/locking/spinlock.c:190)
 ? try_to_wake_up+0xc6/0xd00 (kernel/sched/core.c:2010)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? migrate_swap_stop+0x790/0x790 (kernel/sched/core.c:1291)
 ? drm_handle_vblank+0x1c1/0x7d0 (drivers/gpu/drm/drm_irq.c:1704)
 nouveau_display_vblstamp+0x16d/0x2a0 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_display.c:159)
 drm_get_last_vbltimestamp+0xcb/0x160 (drivers/gpu/drm/drm_irq.c:878)
 ? get_drm_timestamp+0x40/0x40 (drivers/gpu/drm/drm_irq.c:848)
 ? trace_hardirqs_off+0xd/0x10 (kernel/locking/lockdep.c:2780)
 ? _raw_spin_unlock_irqrestore+0x4b/0x50 (kernel/locking/spinlock.c:190)
 ? nouveau_fence_wait_uevent_handler+0xc9/0x140 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_fence.c:148)
 drm_update_vblank_count+0x16a/0x870 (drivers/gpu/drm/drm_irq.c:150)
 ? store_vblank+0x2c0/0x2c0 (drivers/gpu/drm/drm_irq.c:79)
 drm_handle_vblank+0x14a/0x7d0 (drivers/gpu/drm/drm_irq.c:1704)
 ? trace_hardirqs_off+0xd/0x10 (kernel/locking/lockdep.c:2780)
 ? drm_crtc_wait_one_vblank+0x90/0x90 (drivers/gpu/drm/drm_irq.c:1252)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? cpuacct_charge+0x240/0x400 (kernel/sched/cpuacct.c:349)
 drm_crtc_handle_vblank+0x63/0x90 (drivers/gpu/drm/drm_irq.c:1755)
 ? find_next_bit+0x18/0x20 (lib/find_bit.c:63)
 nouveau_display_vblank_handler+0x15/0x20 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_display.c:50)
 nvif_notify+0x25f/0x570 [nouveau] (drivers/gpu/drm/nouveau/nvif/notify.c:1=
13)
 ? nvif_notify_get+0x160/0x160 [nouveau]
(drivers/gpu/drm/nouveau/nvif/notify.c:83)
 ? nv50_disp_vblank_fini_+0x57/0x80 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:102)
 ? nvkm_disp_vblank_fini+0x5f/0x90 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:41)
 ? nvkm_client_driver_init+0x100/0x100 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_nvif.c:110)
 nvkm_client_ntfy+0xc9/0x100 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_nvif.c:81)
 nvkm_client_notify+0xea/0x140 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/client.c:46)
 ? _raw_spin_unlock_irqrestore+0x4b/0x50 (kernel/locking/spinlock.c:190)
 nvkm_notify_send+0x224/0x520 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/notify.c:92)
 nvkm_event_send+0x208/0x270 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/event.c:54)
 nvkm_disp_vblank+0x74/0x90 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:85)
 ? nvkm_disp_dtor+0x540/0x540 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:247)
 gf119_disp_intr+0x1d6/0x690 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c:447)
 nv50_disp_intr_+0x4a/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:116)
 nvkm_disp_intr+0x53/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c:204)
 nvkm_engine_intr+0x57/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/engine.c:71)
 nvkm_subdev_intr+0x54/0x70 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/core/subdev.c:88)
 nvkm_mc_intr+0x23a/0x4b0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c:79)
 ? nvkm_mc_intr_rearm+0xa0/0xa0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c:62)
 ? nv40_pci_wr08+0x68/0xa0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c:35)
 ? nvkm_pci_wr08+0x57/0x90 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:39)
 nvkm_pci_intr+0xcc/0x170 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:70)
 ? nvkm_pci_fini+0xd0/0xd0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:84)
 ? debug_check_no_locks_freed+0x280/0x280 (kernel/locking/lockdep.c:4270)
 ? nvkm_pci_fini+0xd0/0xd0 [nouveau]
(drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:84)
 __handle_irq_event_percpu+0xe1/0x630 (kernel/irq/handle.c:136)
 handle_irq_event_percpu+0x69/0x130 (kernel/irq/handle.c:181)
 ? __handle_irq_event_percpu+0x630/0x630 (kernel/irq/handle.c:136)
 ? handle_edge_irq+0x30/0x850 (kernel/irq/chip.c:622)
 handle_irq_event+0xa7/0x140 (kernel/irq/handle.c:195)
 handle_edge_irq+0x1cd/0x850 (kernel/irq/chip.c:622)
 handle_irq+0x105/0x2a0 (arch/x86/kernel/irq_64.c:69)
 ? __local_bh_enable+0x37/0x60 (kernel/softirq.c:139)
 do_IRQ+0x7d/0x1a0 (arch/x86/kernel/irq.c:213)
 common_interrupt+0x90/0x90 (arch/x86/entry/entry_64.S:452)
RIP: 0010:cpuidle_enter_state+0x10d/0x7d0 (drivers/cpuidle/cpuidle.c:188)
RSP: 0018:ffff88077228fdc0 EFLAGS: 00000202 ORIG_RAX: ffffffffffffff1e
RAX: 0000000000000003 RBX: ffff8807761297b8 RCX: 000000000000001f
RDX: 0000000000000004 RSI: 1ffff100eec23d1b RDI: ffffffff839ec680
RBP: ffff88077228fe18 R08: 0000000000012314 R09: ffffffff83a10980
R10: ffff88077611dfc4 R11: ffff88077611dfe4 R12: 0000000000000008
R13: ffffffff83a10c98 R14: 000000001e85c873 R15: 0000000000000300
 &lt;/IRQ&gt;
 ? set_cpu_sd_state_idle+0x145/0x230 (kernel/sched/fair.c:8557)
 cpuidle_enter+0x17/0x20 (drivers/cpuidle/cpuidle.c:282)
 call_cpuidle+0x47/0xc0 (kernel/sched/idle.c:103)
 ? cpuidle_select+0x59/0x80 (drivers/cpuidle/cpuidle.c:266)
 ? rcu_idle_enter+0x7e/0xa0 (kernel/rcu/tree.c:749)
 do_idle+0x22c/0x2e0 (kernel/sched/idle.c:209)
 cpu_startup_entry+0x1d/0x20 (kernel/sched/idle.c:326)
 start_secondary+0x298/0x360 (arch/x86/kernel/smpboot.c:224)
 ? set_cpu_sibling_map+0x1a40/0x1a40 (arch/x86/kernel/smpboot.c:525)
 start_cpu+0x14/0x14 (arch/x86/kernel/head_64.S:301)
Object at ffff880739ecbf00, in cache kmalloc-1024 size: 1024
Allocated:
PID =3D 535
 save_stack_trace+0x1b/0x20 (arch/x86/kernel/stacktrace.c:56)
 save_stack+0x46/0xd0 (mm/kasan/kasan.c:493)
 kasan_kmalloc+0xad/0xe0 (mm/kasan/kasan.c:585)
 kmem_cache_alloc_trace+0xf1/0x280 (mm/slub.c:2739)
 nv50_head_atomic_duplicate_state+0x72/0x700 [nouveau]
(drivers/gpu/drm/nouveau/nv50_display.c:2323)
 drm_atomic_get_crtc_state+0x1be/0x3d0 (drivers/gpu/drm/drm_atomic.c:264)
 drm_atomic_get_plane_state+0x2a5/0x3e0 (drivers/gpu/drm/drm_atomic.c:679)
 drm_atomic_helper_update_plane+0x10b/0x3b0
(drivers/gpu/drm/drm_atomic_helper.c:2089)
 __setplane_internal+0x417/0x950 (drivers/gpu/drm/drm_plane.c:457)
 drm_mode_cursor_universal+0x397/0xb30 (drivers/gpu/drm/drm_plane.c:599)
 drm_mode_cursor_common+0x173/0x750 (drivers/gpu/drm/drm_plane.c:675)
 drm_mode_cursor_ioctl+0x90/0xb0 (drivers/gpu/drm/drm_plane.c:733)
 drm_ioctl+0x4b0/0xba0 (drivers/gpu/drm/drm_ioctl.c:657)
 nouveau_drm_ioctl+0xf9/0x1e0 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_drm.c:925)
 do_vfs_ioctl+0x184/0xff0 (fs/ioctl.c:624)
 SyS_ioctl+0x79/0x90 (fs/ioctl.c:689)
 entry_SYSCALL_64_fastpath+0x18/0xad (arch/x86/entry/entry_64.S:188)
Freed:
PID =3D 535
 save_stack_trace+0x1b/0x20 (arch/x86/kernel/stacktrace.c:56)
 save_stack+0x46/0xd0 (mm/kasan/kasan.c:493)
 kasan_slab_free+0x73/0xc0 (mm/kasan/kasan.c:560)
 kfree+0xd9/0x2a0 (mm/slub.c:3862)
 nv50_head_atomic_destroy_state+0x1d/0x20 [nouveau]
(drivers/gpu/drm/nouveau/nv50_display.c:2315)
 drm_atomic_state_default_clear+0x372/0x930 (drivers/gpu/drm/drm_atomic.c:1=
41)
 nv50_disp_atomic_state_clear+0x124/0x1b0 [nouveau]
(drivers/gpu/drm/nouveau/nv50_display.c:4301)
 drm_atomic_state_clear+0x80/0xb0 (drivers/gpu/drm/drm_atomic.c:210)
 __drm_atomic_state_free+0x3a/0xe0 (drivers/gpu/drm/drm_atomic.c:229)
 drm_atomic_helper_update_plane+0x2b3/0x3b0
(drivers/gpu/drm/drm_atomic_helper.c:2089)
 __setplane_internal+0x417/0x950 (drivers/gpu/drm/drm_plane.c:457)
 drm_mode_cursor_universal+0x397/0xb30 (drivers/gpu/drm/drm_plane.c:599)
 drm_mode_cursor_common+0x173/0x750 (drivers/gpu/drm/drm_plane.c:675)
 drm_mode_cursor_ioctl+0x90/0xb0 (drivers/gpu/drm/drm_plane.c:733)
 drm_ioctl+0x4b0/0xba0 (drivers/gpu/drm/drm_ioctl.c:657)
 nouveau_drm_ioctl+0xf9/0x1e0 [nouveau]
(drivers/gpu/drm/nouveau/nouveau_drm.c:925)
 do_vfs_ioctl+0x184/0xff0 (fs/ioctl.c:624)
 SyS_ioctl+0x79/0x90 (fs/ioctl.c:689)
 entry_SYSCALL_64_fastpath+0x18/0xad (arch/x86/entry/entry_64.S:188)
Memory state around the buggy address:
 ffff880739ecbe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff880739ecbf00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
<span class=3D"quote">&gt;ffff880739ecbf80: fb fb fb fb fb fb fb fb fb fb f=
b fb fb fb fb fb</span >
                                     ^
 ffff880739ecc000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff880739ecc080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14922857041.6857210.11649--

--===============0076970853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0076970853==--
