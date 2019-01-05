From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Sat, 05 Jan 2019 21:29:37 +0000
Message-ID: <bug-100567-8800-HF5FvhVRCh@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0186099139=="
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


--===============0186099139==
Content-Type: multipart/alternative; boundary="15467237774.ec1D6f.438"
Content-Transfer-Encoding: 7bit


--15467237774.ec1D6f.438
Date: Sat, 5 Jan 2019 21:29:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #18 from kenorb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
The same problem on Ubuntu 18.10, kernel 4.18.0-13.

I've got 4x GPU: GTX 1080 Ti (3-Way SLI Connector), NVIDIA GeForce GTX 1080=
 Ti
graphics card with 3584 cores.

$ uname -a
Linux Ubuntu-PC 4.18.0-13-generic #14-Ubuntu SMP Wed Dec 5 09:04:24 UTC 2018
x86_64 x86_64 x86_64 GNU/Linux

Errors in kern.log file:

nouveau 0000:65:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:65:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:65:00.0: fifo: channel 2: killed
nouveau 0000:65:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:65:00.0: Xorg[5447]: channel 2 killed!
nouveau 0000:65:00.0: systemd-logind[3394]: nv50cal_space: -16
nouveau 0000:65:00.0: systemd-logind[3394]: nv50cal_space: -16
(the same message repeated 800x over and over again)

The system got freeze (no mouse or keyboard reaction), however kernel react=
ed
on few Magic SysRq keys, so here are some stack traces:

INFO: task kworker/u72:8:492 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u72:8   D    0   492      2 0x80000000
Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]

Call Trace at 20:25:50:
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

Same call trace at 20:29:51 (few minutes later while Xorg was frozen):
Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Call Trace:
 __schedule+0x29e/0x840
 ? apic_timer_interrupt+0xa/0x20
 ? __drm_crtc_commit_free+0x12/0x20 [drm]
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

Another one:
INFO: task Xorg:5447 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
Xorg            D    0  5447   5445 0x00000004
Call Trace:
 __schedule+0x29e/0x840
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
 ? do_iter_write+0xe1/0x1a0
 ? do_iter_write+0xe1/0x1a0
 nouveau_drm_ioctl+0x73/0xc0 [nouveau]
 do_vfs_ioctl+0xa8/0x620
 ? __sys_recvmsg+0x88/0xa0
 ksys_ioctl+0x67/0x90
 __x64_sys_ioctl+0x1a/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f3f654b93c7
Code: Bad RIP value.
RSP: 002b:00007ffd57bbf168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd57bbf200 RCX: 00007f3f654b93c7
RDX: 00007ffd57bbf1a0 RSI: 00000000c018643b RDI: 000000000000000e
RBP: 00007ffd57bbf1a0 R08: 0000000000000000 R09: 00005646eb8ff7c0
R10: 00005646eb54ad30 R11: 0000000000000246 R12: 00000000c018643b
R13: 000000000000000e R14: 00005646eb54b800 R15: 00005646eb466880

Full log: https://gist.github.com/kenorb/5b95caa1694dbf7f030ccc808a110856

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15467237774.ec1D6f.438
Date: Sat, 5 Jan 2019 21:29:37 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c18">Comme=
nt # 18</a>
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
        <pre>The same problem on Ubuntu 18.10, kernel 4.18.0-13.

I've got 4x GPU: GTX 1080 Ti (3-Way SLI Connector), NVIDIA GeForce GTX 1080=
 Ti
graphics card with 3584 cores.

$ uname -a
Linux Ubuntu-PC 4.18.0-13-generic #14-Ubuntu SMP Wed Dec 5 09:04:24 UTC 2018
x86_64 x86_64 x86_64 GNU/Linux

Errors in kern.log file:

nouveau 0000:65:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:65:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:65:00.0: fifo: channel 2: killed
nouveau 0000:65:00.0: fifo: engine 0: scheduled for recovery
nouveau 0000:65:00.0: Xorg[5447]: channel 2 killed!
nouveau 0000:65:00.0: systemd-logind[3394]: nv50cal_space: -16
nouveau 0000:65:00.0: systemd-logind[3394]: nv50cal_space: -16
(the same message repeated 800x over and over again)

The system got freeze (no mouse or keyboard reaction), however kernel react=
ed
on few Magic SysRq keys, so here are some stack traces:

INFO: task kworker/u72:8:492 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
&quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables th=
is message.
kworker/u72:8   D    0   492      2 0x80000000
Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]

Call Trace at 20:25:50:
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

Same call trace at 20:29:51 (few minutes later while Xorg was frozen):
Workqueue: events_unbound nv50_disp_atomic_commit_work [nouveau]
Call Trace:
 __schedule+0x29e/0x840
 ? apic_timer_interrupt+0xa/0x20
 ? __drm_crtc_commit_free+0x12/0x20 [drm]
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

Another one:
INFO: task Xorg:5447 blocked for more than 120 seconds.
      Tainted: G           O      4.18.0-13-generic #14-Ubuntu
&quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables th=
is message.
Xorg            D    0  5447   5445 0x00000004
Call Trace:
 __schedule+0x29e/0x840
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
 ? do_iter_write+0xe1/0x1a0
 ? do_iter_write+0xe1/0x1a0
 nouveau_drm_ioctl+0x73/0xc0 [nouveau]
 do_vfs_ioctl+0xa8/0x620
 ? __sys_recvmsg+0x88/0xa0
 ksys_ioctl+0x67/0x90
 __x64_sys_ioctl+0x1a/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f3f654b93c7
Code: Bad RIP value.
RSP: 002b:00007ffd57bbf168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd57bbf200 RCX: 00007f3f654b93c7
RDX: 00007ffd57bbf1a0 RSI: 00000000c018643b RDI: 000000000000000e
RBP: 00007ffd57bbf1a0 R08: 0000000000000000 R09: 00005646eb8ff7c0
R10: 00005646eb54ad30 R11: 0000000000000246 R12: 00000000c018643b
R13: 000000000000000e R14: 00005646eb54b800 R15: 00005646eb466880

Full log: <a href=3D"https://gist.github.com/kenorb/5b95caa1694dbf7f030ccc8=
08a110856">https://gist.github.com/kenorb/5b95caa1694dbf7f030ccc808a110856<=
/a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15467237774.ec1D6f.438--

--===============0186099139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0186099139==--
