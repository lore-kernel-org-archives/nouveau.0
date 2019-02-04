From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Mon, 04 Feb 2019 21:44:01 +0000
Message-ID: <bug-100567-8800-5DVudkq717@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1037243109=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1037243109==
Content-Type: multipart/alternative; boundary="15493166413.6D690.17899"
Content-Transfer-Encoding: 7bit


--15493166413.6D690.17899
Date: Mon, 4 Feb 2019 21:44:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #24 from kenorb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Happened another 3 times.

Logs and stack traces:
- https://gist.github.com/kenorb/9e6537747630f72bf7cc4a5afcc288a7
- https://gist.github.com/kenorb/0e85a737488ad8c294d70dd83d2bcd13
- https://gist.github.com/kenorb/abb9db39b04b9fd551429c79c6750883

Call Trace:
 __schedule+0x29e/0x840
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40

Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Call Trace:
 __schedule+0x29e/0x840
 ? nvkm_ioctl_ntfy_get+0x5c/0x80 [nouveau]
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nvif_object_ioctl+0x47/0x50 [nouveau]
 ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
 ? nv84_fence_read+0x2c/0x30 [nouveau]
 ? nouveau_fence_no_signaling+0x2a/0x90 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40
INFO: task kworker/u72:1:35901 blocked for more than 120 seconds.
      Tainted: G        W  O      4.18.0-13-generic #14-Ubuntu

INFO: task Xorg:5761 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
Xorg            D    0  5761   5759 0x00000004
Call Trace:
 __schedule+0x29e/0x840
 ? kfree+0x15b/0x180
 schedule+0x2c/0x80
 schedule_preempt_disabled+0xe/0x10
 __ww_mutex_lock.isra.6+0x3c1/0x660
 __ww_mutex_lock_slowpath+0x16/0x20
 ww_mutex_lock+0x34/0x50
 drm_modeset_lock+0x6e/0xb0 [drm]
 drm_crtc_get_sequence_ioctl+0xbc/0x190 [drm]
 ? drm_wait_vblank_ioctl+0x610/0x610 [drm]
 drm_ioctl_kernel+0xa4/0xf0 [drm]
 drm_ioctl+0x227/0x400 [drm]
 ? drm_wait_vblank_ioctl+0x610/0x610 [drm]
 ? ep_modify+0x160/0x160
 nouveau_drm_ioctl+0x73/0xc0 [nouveau]
 do_vfs_ioctl+0xa8/0x620
 ? __sys_recvmsg+0x88/0xa0
 ksys_ioctl+0x67/0x90
 __x64_sys_ioctl+0x1a/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f8bb9f703c7
Code: Bad RIP value.
RSP: 002b:00007ffd077cc868 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd077cc900 RCX: 00007f8bb9f703c7
RDX: 00007ffd077cc8a0 RSI: 00000000c018643b RDI: 000000000000000e
RBP: 00007ffd077cc8a0 R08: 0000000000000000 R09: 000055aba56d3850
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c018643b
R13: 000000000000000e R14: 000055aba5402c30 R15: 000055aba531dcb0
INFO: task kworker/u72:1:8681 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu

INFO: task kworker/u72:3:14273 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u72:3   D    0 14273      2 0x80000000
Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Call Trace:
 __schedule+0x29e/0x840
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15493166413.6D690.17899
Date: Mon, 4 Feb 2019 21:44:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kenorb&#64;gmail.com" title=3D"kenorb&#64;gmail.com">kenorb&#64;gmail.com</=
a>
</span></b>
        <pre>Happened another 3 times.

Logs and stack traces:
- <a href=3D"https://gist.github.com/kenorb/9e6537747630f72bf7cc4a5afcc288a=
7">https://gist.github.com/kenorb/9e6537747630f72bf7cc4a5afcc288a7</a>
- <a href=3D"https://gist.github.com/kenorb/0e85a737488ad8c294d70dd83d2bcd1=
3">https://gist.github.com/kenorb/0e85a737488ad8c294d70dd83d2bcd13</a>
- <a href=3D"https://gist.github.com/kenorb/abb9db39b04b9fd551429c79c675088=
3">https://gist.github.com/kenorb/abb9db39b04b9fd551429c79c6750883</a>

Call Trace:
 __schedule+0x29e/0x840
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40

Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Call Trace:
 __schedule+0x29e/0x840
 ? nvkm_ioctl_ntfy_get+0x5c/0x80 [nouveau]
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nvif_object_ioctl+0x47/0x50 [nouveau]
 ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
 ? nv84_fence_read+0x2c/0x30 [nouveau]
 ? nouveau_fence_no_signaling+0x2a/0x90 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40
INFO: task kworker/u72:1:35901 blocked for more than 120 seconds.
      Tainted: G        W  O      4.18.0-13-generic #14-Ubuntu

INFO: task Xorg:5761 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
Xorg            D    0  5761   5759 0x00000004
Call Trace:
 __schedule+0x29e/0x840
 ? kfree+0x15b/0x180
 schedule+0x2c/0x80
 schedule_preempt_disabled+0xe/0x10
 __ww_mutex_lock.isra.6+0x3c1/0x660
 __ww_mutex_lock_slowpath+0x16/0x20
 ww_mutex_lock+0x34/0x50
 drm_modeset_lock+0x6e/0xb0 [drm]
 drm_crtc_get_sequence_ioctl+0xbc/0x190 [drm]
 ? drm_wait_vblank_ioctl+0x610/0x610 [drm]
 drm_ioctl_kernel+0xa4/0xf0 [drm]
 drm_ioctl+0x227/0x400 [drm]
 ? drm_wait_vblank_ioctl+0x610/0x610 [drm]
 ? ep_modify+0x160/0x160
 nouveau_drm_ioctl+0x73/0xc0 [nouveau]
 do_vfs_ioctl+0xa8/0x620
 ? __sys_recvmsg+0x88/0xa0
 ksys_ioctl+0x67/0x90
 __x64_sys_ioctl+0x1a/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f8bb9f703c7
Code: Bad RIP value.
RSP: 002b:00007ffd077cc868 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd077cc900 RCX: 00007f8bb9f703c7
RDX: 00007ffd077cc8a0 RSI: 00000000c018643b RDI: 000000000000000e
RBP: 00007ffd077cc8a0 R08: 0000000000000000 R09: 000055aba56d3850
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c018643b
R13: 000000000000000e R14: 000055aba5402c30 R15: 000055aba531dcb0
INFO: task kworker/u72:1:8681 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu

INFO: task kworker/u72:3:14273 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
&quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables th=
is message.
kworker/u72:3   D    0 14273      2 0x80000000
Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Call Trace:
 __schedule+0x29e/0x840
 schedule+0x2c/0x80
 schedule_timeout+0x258/0x360
 ? nv50_wndw_atomic_destroy_state+0x1d/0x20 [nouveau]
 dma_fence_default_wait+0x1fc/0x260
 ? dma_fence_release+0xa0/0xa0
 dma_fence_wait_timeout+0x3e/0xf0
 drm_atomic_helper_wait_for_fences+0x3f/0xc0 [drm_kms_helper]
 nv50_disp_atomic_commit_tail+0x78/0x860 [nouveau]
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
 process_one_work+0x20f/0x3c0
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? pwq_unbound_release_workfn+0xd0/0xd0
 ? kthread_bind+0x40/0x40
 ret_from_fork+0x35/0x40</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15493166413.6D690.17899--

--===============1037243109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1037243109==--
