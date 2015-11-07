From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92852] New: NV34: WARNING: ... at
 drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()
Date: Sat, 07 Nov 2015 05:09:39 +0000
Message-ID: <bug-92852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1968669973=="
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


--===============1968669973==
Content-Type: multipart/alternative; boundary="1446872979.48BD1.22126"; charset="UTF-8"


--1446872979.48BD1.22126
Date: Sat, 7 Nov 2015 05:09:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92852

            Bug ID: 92852
           Summary: NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924
                    drm_vblank_count_and_time+0x71/0x80 [drm]()
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 119457
  --> https://bugs.freedesktop.org/attachment.cgi?id=119457&action=edit
dmesg 4.3.0-1.fc24.i686 NV34

NV34 / 4.3.0-1.fc24.i686
Both, DRI3/XPresent and GLX, use_compositing true:

dmesg:
WARNING: CPU: 0 PID: 1654 at drivers/gpu/drm/drm_irq.c:924
drm_vblank_count_and_time+0x71/0x80 [drm]()
...
Call Trace:
 [<c071d550>] dump_stack+0x41/0x61
 [<c045de97>] warn_slowpath_common+0x87/0xc0
 [<f7e1b811>] ? drm_vblank_count_and_time+0x71/0x80 [drm]
 [<f7e1b811>] ? drm_vblank_count_and_time+0x71/0x80 [drm]
 [<c045dfa2>] warn_slowpath_null+0x22/0x30
 [<f7e1b811>] drm_vblank_count_and_time+0x71/0x80 [drm]
 [<f7e1c05c>] drm_send_vblank_event+0x6c/0x80 [drm]
 [<f85d37d6>] nouveau_finish_page_flip+0x66/0x120 [nouveau]
 [<f85d38b6>] nouveau_flip_complete+0x26/0x220 [nouveau]
 [<f85d2470>] ? nouveau_display_vblstamp+0x70/0x80 [nouveau]
 [<f8536c40>] nvif_notify+0x90/0x160 [nouveau]
 [<c049af8f>] ? __wake_up+0x3f/0x50
 [<c0ac2b8d>] ? _raw_spin_unlock_irqrestore+0xd/0x10
 [<f7e1d170>] ? drm_handle_vblank+0x210/0x360 [drm]
 [<f85c8dd8>] nvkm_client_ntfy+0x78/0x80 [nouveau]
 [<f8536ed8>] nvkm_client_notify+0x28/0x30 [nouveau]
 [<f8539cb5>] nvkm_notify_send+0x75/0x120 [nouveau]
 [<f8537d95>] nvkm_event_send+0xb5/0xe0 [nouveau]
 [<f85c58fe>] nvkm_sw_chan_mthd+0x5e/0x80 [nouveau]
 [<f85c4f91>] nvkm_sw_mthd+0x91/0xb0 [nouveau]
 [<f8596d8f>] nv04_fifo_intr+0x5ff/0x770 [nouveau]
 [<c0ac2b8d>] ? _raw_spin_unlock_irqrestore+0xd/0x10
 [<f8537d7b>] ? nvkm_event_send+0x9b/0xe0 [nouveau]
 [<f85960e1>] nvkm_fifo_intr+0x11/0x20 [nouveau]
 [<f85375f9>] nvkm_engine_intr+0x19/0x20 [nouveau]
 [<f853b623>] nvkm_subdev_intr+0x13/0x20 [nouveau]
 [<f8577871>] nvkm_mc_intr+0x61/0xf0 [nouveau]
 [<c080e2ee>] ? add_interrupt_randomness+0x14e/0x1b0
 [<f857bf42>] nvkm_pci_intr+0x42/0x80 [nouveau]
 [<c04b5006>] handle_irq_event_percpu+0x76/0x190
 [<c04b7d60>] ? handle_simple_irq+0x70/0x70
 [<c04b514a>] handle_irq_event+0x2a/0x50
 [<c04b7dd2>] handle_fasteoi_irq+0x72/0x120
 [<c04060c3>] handle_irq+0xa3/0xd0
 <IRQ>  [<c040589c>] do_IRQ+0x3c/0xc0
 [<c072adad>] ? __copy_to_user_ll+0xd/0x10
 [<c0ac3a73>] common_interrupt+0x33/0x38
 [<c05cf255>] ? __fget_light+0x35/0x50
 [<c05cf282>] __fdget+0x12/0x20
 [<c05c825d>] do_sys_poll+0x2bd/0x570
 [<c072b07c>] ? _copy_from_user+0x3c/0x50
 [<c05b5408>] ? rw_copy_check_uvector+0x58/0x110
 [<c0a69076>] ? unix_stream_recvmsg+0x46/0x60
 [<c0a66f40>] ? unix_set_peek_off+0x50/0x50
 [<c09a476d>] ? sock_recvmsg+0x3d/0x50
 [<c09a5be6>] ? ___sys_recvmsg+0x116/0x150
 [<c048d8a8>] ? check_preempt_wakeup+0xe8/0x220
 [<c05c6ea0>] ? poll_select_copy_remaining+0x130/0x130
 [<c09ae2f8>] ? __alloc_skb+0x78/0x1e0
 [<c05cf282>] ? __fdget+0x12/0x20
 [<c09a6684>] ? __sys_recvmsg+0x44/0x80
 [<c09a70ae>] ? SYSC_socketcall+0x7ae/0x9c0
 [<c0a68718>] ? unix_stream_sendmsg+0x358/0x380
 [<c09a514d>] ? sock_sendmsg+0x2d/0x40
 [<c05b4a60>] ? do_readv_writev+0x140/0x350
 [<c04cb81a>] ? ktime_get+0x4a/0x120
 [<c09a5160>] ? sock_sendmsg+0x40/0x40
 [<c04f857f>] ? __audit_syscall_entry+0xaf/0x110
 [<c04012a4>] ? do_audit_syscall_entry.isra.9+0x44/0x50
 [<c0401607>] ? syscall_trace_enter_phase1+0x107/0x130
 [<c05c8643>] SyS_poll+0xc3/0x100
 [<c0ac32e1>] syscall_call+0x7/0x7
---[ end trace aac837c2925b2e70 ]---
nouveau 0000:01:00.0: Xorg[494]: failed to idle channel 0xcccc0000 [Xorg[494]]
nouveau 0000:01:00.0: Xorg[494]: failed to idle channel 0xcccc0000 [Xorg[494]]
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table
nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script table
nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table
nouveau 0000:01:00.0: Xorg[1847]: failed to idle channel 0xcccc0000
[Xorg[1847]]
nouveau 0000:01:00.0: Xorg[1847]: failed to idle channel 0xcccc0000
[Xorg[1847]]
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table
nouveau 0000:01:00.0: gr: intr 00100000 [ERROR] nsource 00000100
[DMA_W_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 1 [Xorg[2211]] subc 0
class 0039 mthd 0100 data 00000000
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0001
[Xorg[2211]]
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0001
[Xorg[2211]]
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c:46/nv20_gr_chan_fini()!
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 0 [DRM] get ff2c4784 put ff2c4784
state df2c4785 (err: MEM_FAULT) push 00000100
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script table
nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
nouveau 0000:01:00.0: gr: idle timed out with status 00022001
nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
nouveau 0000:01:00.0: gr: idle timed out with status 00022001
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table

$ dmesg | grep drm_vblank_count_and_time | wc -l
256

WARNING going and going, doesn't spare ring buffer.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446872979.48BD1.22126
Date: Sat, 7 Nov 2015 05:09:39 +0000
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
   title="NEW - NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92852">92852</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()
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
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119457" name="attach_119457" title="dmesg 4.3.0-1.fc24.i686 NV34">attachment 119457</a> <a href="attachment.cgi?id=119457&amp;action=edit" title="dmesg 4.3.0-1.fc24.i686 NV34">[details]</a></span>
dmesg 4.3.0-1.fc24.i686 NV34

NV34 / 4.3.0-1.fc24.i686
Both, DRI3/XPresent and GLX, use_compositing true:

dmesg:
WARNING: CPU: 0 PID: 1654 at drivers/gpu/drm/drm_irq.c:924
drm_vblank_count_and_time+0x71/0x80 [drm]()
...
Call Trace:
 [&lt;c071d550&gt;] dump_stack+0x41/0x61
 [&lt;c045de97&gt;] warn_slowpath_common+0x87/0xc0
 [&lt;f7e1b811&gt;] ? drm_vblank_count_and_time+0x71/0x80 [drm]
 [&lt;f7e1b811&gt;] ? drm_vblank_count_and_time+0x71/0x80 [drm]
 [&lt;c045dfa2&gt;] warn_slowpath_null+0x22/0x30
 [&lt;f7e1b811&gt;] drm_vblank_count_and_time+0x71/0x80 [drm]
 [&lt;f7e1c05c&gt;] drm_send_vblank_event+0x6c/0x80 [drm]
 [&lt;f85d37d6&gt;] nouveau_finish_page_flip+0x66/0x120 [nouveau]
 [&lt;f85d38b6&gt;] nouveau_flip_complete+0x26/0x220 [nouveau]
 [&lt;f85d2470&gt;] ? nouveau_display_vblstamp+0x70/0x80 [nouveau]
 [&lt;f8536c40&gt;] nvif_notify+0x90/0x160 [nouveau]
 [&lt;c049af8f&gt;] ? __wake_up+0x3f/0x50
 [&lt;c0ac2b8d&gt;] ? _raw_spin_unlock_irqrestore+0xd/0x10
 [&lt;f7e1d170&gt;] ? drm_handle_vblank+0x210/0x360 [drm]
 [&lt;f85c8dd8&gt;] nvkm_client_ntfy+0x78/0x80 [nouveau]
 [&lt;f8536ed8&gt;] nvkm_client_notify+0x28/0x30 [nouveau]
 [&lt;f8539cb5&gt;] nvkm_notify_send+0x75/0x120 [nouveau]
 [&lt;f8537d95&gt;] nvkm_event_send+0xb5/0xe0 [nouveau]
 [&lt;f85c58fe&gt;] nvkm_sw_chan_mthd+0x5e/0x80 [nouveau]
 [&lt;f85c4f91&gt;] nvkm_sw_mthd+0x91/0xb0 [nouveau]
 [&lt;f8596d8f&gt;] nv04_fifo_intr+0x5ff/0x770 [nouveau]
 [&lt;c0ac2b8d&gt;] ? _raw_spin_unlock_irqrestore+0xd/0x10
 [&lt;f8537d7b&gt;] ? nvkm_event_send+0x9b/0xe0 [nouveau]
 [&lt;f85960e1&gt;] nvkm_fifo_intr+0x11/0x20 [nouveau]
 [&lt;f85375f9&gt;] nvkm_engine_intr+0x19/0x20 [nouveau]
 [&lt;f853b623&gt;] nvkm_subdev_intr+0x13/0x20 [nouveau]
 [&lt;f8577871&gt;] nvkm_mc_intr+0x61/0xf0 [nouveau]
 [&lt;c080e2ee&gt;] ? add_interrupt_randomness+0x14e/0x1b0
 [&lt;f857bf42&gt;] nvkm_pci_intr+0x42/0x80 [nouveau]
 [&lt;c04b5006&gt;] handle_irq_event_percpu+0x76/0x190
 [&lt;c04b7d60&gt;] ? handle_simple_irq+0x70/0x70
 [&lt;c04b514a&gt;] handle_irq_event+0x2a/0x50
 [&lt;c04b7dd2&gt;] handle_fasteoi_irq+0x72/0x120
 [&lt;c04060c3&gt;] handle_irq+0xa3/0xd0
 &lt;IRQ&gt;  [&lt;c040589c&gt;] do_IRQ+0x3c/0xc0
 [&lt;c072adad&gt;] ? __copy_to_user_ll+0xd/0x10
 [&lt;c0ac3a73&gt;] common_interrupt+0x33/0x38
 [&lt;c05cf255&gt;] ? __fget_light+0x35/0x50
 [&lt;c05cf282&gt;] __fdget+0x12/0x20
 [&lt;c05c825d&gt;] do_sys_poll+0x2bd/0x570
 [&lt;c072b07c&gt;] ? _copy_from_user+0x3c/0x50
 [&lt;c05b5408&gt;] ? rw_copy_check_uvector+0x58/0x110
 [&lt;c0a69076&gt;] ? unix_stream_recvmsg+0x46/0x60
 [&lt;c0a66f40&gt;] ? unix_set_peek_off+0x50/0x50
 [&lt;c09a476d&gt;] ? sock_recvmsg+0x3d/0x50
 [&lt;c09a5be6&gt;] ? ___sys_recvmsg+0x116/0x150
 [&lt;c048d8a8&gt;] ? check_preempt_wakeup+0xe8/0x220
 [&lt;c05c6ea0&gt;] ? poll_select_copy_remaining+0x130/0x130
 [&lt;c09ae2f8&gt;] ? __alloc_skb+0x78/0x1e0
 [&lt;c05cf282&gt;] ? __fdget+0x12/0x20
 [&lt;c09a6684&gt;] ? __sys_recvmsg+0x44/0x80
 [&lt;c09a70ae&gt;] ? SYSC_socketcall+0x7ae/0x9c0
 [&lt;c0a68718&gt;] ? unix_stream_sendmsg+0x358/0x380
 [&lt;c09a514d&gt;] ? sock_sendmsg+0x2d/0x40
 [&lt;c05b4a60&gt;] ? do_readv_writev+0x140/0x350
 [&lt;c04cb81a&gt;] ? ktime_get+0x4a/0x120
 [&lt;c09a5160&gt;] ? sock_sendmsg+0x40/0x40
 [&lt;c04f857f&gt;] ? __audit_syscall_entry+0xaf/0x110
 [&lt;c04012a4&gt;] ? do_audit_syscall_entry.isra.9+0x44/0x50
 [&lt;c0401607&gt;] ? syscall_trace_enter_phase1+0x107/0x130
 [&lt;c05c8643&gt;] SyS_poll+0xc3/0x100
 [&lt;c0ac32e1&gt;] syscall_call+0x7/0x7
---[ end trace aac837c2925b2e70 ]---
nouveau 0000:01:00.0: Xorg[494]: failed to idle channel 0xcccc0000 [Xorg[494]]
nouveau 0000:01:00.0: Xorg[494]: failed to idle channel 0xcccc0000 [Xorg[494]]
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table
nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script table
nouveau 0000:01:00.0: DRM: GPU lockup - switching to software fbcon
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table
nouveau 0000:01:00.0: Xorg[1847]: failed to idle channel 0xcccc0000
[Xorg[1847]]
nouveau 0000:01:00.0: Xorg[1847]: failed to idle channel 0xcccc0000
[Xorg[1847]]
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table
nouveau 0000:01:00.0: gr: intr 00100000 [ERROR] nsource 00000100
[DMA_W_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 1 [Xorg[2211]] subc 0
class 0039 mthd 0100 data 00000000
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0001
[Xorg[2211]]
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0001
[Xorg[2211]]
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c:46/nv20_gr_chan_fini()!
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 0 [DRM] get ff2c4784 put ff2c4784
state df2c4785 (err: MEM_FAULT) push 00000100
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: Xorg[2211]: failed to idle channel 0xcccc0000
[Xorg[2211]]
nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script table
nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
nouveau 0000:01:00.0: gr: idle timed out with status 00022001
nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
nouveau 0000:01:00.0: gr: idle timed out with status 00022001
nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script table

$ dmesg | grep drm_vblank_count_and_time | wc -l
256

WARNING going and going, doesn't spare ring buffer.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446872979.48BD1.22126--

--===============1968669973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1968669973==--
