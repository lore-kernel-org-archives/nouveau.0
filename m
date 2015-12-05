From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93267] New: BUG: unable to handle kernel paging
 request in reservation_object_wait_timeout_rcu
Date: Sat, 05 Dec 2015 21:59:46 +0000
Message-ID: <bug-93267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1928723729=="
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


--===============1928723729==
Content-Type: multipart/alternative; boundary="1449352786.fb32cAc1.15450"; charset="UTF-8"


--1449352786.fb32cAc1.15450
Date: Sat, 5 Dec 2015 21:59:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93267

            Bug ID: 93267
           Summary: BUG: unable to handle kernel paging request in
                    reservation_object_wait_timeout_rcu
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

BUG: unable to handle kernel paging request at ffffc9000327f018
IP: [<ffffffff81533a4d>] reservation_object_wait_timeout_rcu+0x31d/0x510
PGD 13a8a1067 PUD 13a8a2067 PMD 31d16067 PTE 0
Oops: 0000 [#1] PREEMPT SMP 
Modules linked in: drbg ctr ccm rfcomm bnep binfmt_misc arc4 iwldvm mac80211
iwlwifi uvcvideo cfg80211 snd_hda_codec_hdmi rtsx_usb snd_hda_codec_idt
snd_hda_codec_generic btusb videobuf2_vmalloc snd_hda_intel btrtl snd_hda_codec
btbcm videobuf2_memops btintel bluetooth videobuf2_v4l2 videobuf2_core
v4l2_common snd_hwdep videodev snd_hda_core snd_pcm dell_wmi dell_laptop
sparse_keymap dcdbas snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq
x86_pkg_temp_thermal serio_raw coretemp snd_timer snd_seq_device snd soundcore
lpc_ich parport_pc ppdev lp parport hid_generic nouveau ahci psmouse i915
libahci mxm_wmi ttm i2c_algo_bit drm_kms_helper usbhid syscopyarea hid
sysfillrect sysimgblt fb_sys_fops drm wmi video
CPU: 1 PID: 976 Comm: Xorg Not tainted 4.4.0-rc3 #60
Hardware name: Dell Inc.          Inspiron 7720/04M3YM, BIOS A07 08/16/2012
task: ffff880032b2a540 ti: ffff8801346c4000 task.ti: ffff8801346c4000
RIP: 0010:[<ffffffff81533a4d>]  [<ffffffff81533a4d>]
reservation_object_wait_timeout_rcu+0x31d/0x510
RSP: 0018:ffff8801346c7ce8  EFLAGS: 00010246
RAX: ffffc9000327f000 RBX: ffff88011e6b0300 RCX: 000000000327d000
RDX: 000000000327d000 RSI: 0000000000000000 RDI: ffffffff81c5efc0
RBP: ffff8801346c7d30 R08: 0000000000000000 R09: 0000000000000000
R10: ffff880032b2a540 R11: 0000000000000000 R12: ffff880032c99d58
R13: 0000000000000000 R14: 0000000000001d4c R15: ffff8800330009b8
FS:  00007f9271ca1980(0000) GS:ffff88013f240000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc9000327f018 CR3: 0000000135f80000 CR4: 00000000001406e0
Stack:
 ffffffff815337cd 00000001817432f1 ffff880033000a50 00000002016c7d30
 00000000fffffff0 0000000000000000 ffff880033000800 ffff880033000bf0
 ffffffffa03cd4f0 ffff8801346c7d68 ffffffffa035dced ffffffffa035dd23
Call Trace:
 [<ffffffff815337cd>] ? reservation_object_wait_timeout_rcu+0x9d/0x510
 [<ffffffffa035dced>] nouveau_gem_ioctl_cpu_prep+0x6d/0x160 [nouveau]
 [<ffffffffa035dd23>] ? nouveau_gem_ioctl_cpu_prep+0xa3/0x160 [nouveau]
 [<ffffffffa0072a2b>] drm_ioctl+0x14b/0x530 [drm]
 [<ffffffffa035dc80>] ? nouveau_gem_ioctl_pushbuf+0xce0/0xce0 [nouveau]
 [<ffffffff814e98a0>] ? rpm_resume+0xf0/0x7b0
 [<ffffffff814e9fad>] ? __pm_runtime_resume+0x4d/0x60
 [<ffffffff8110848d>] ? trace_hardirqs_on+0xd/0x10
 [<ffffffff81743392>] ? _raw_spin_unlock_irqrestore+0x42/0x70
 [<ffffffffa0354777>] nouveau_drm_ioctl+0x67/0xc0 [nouveau]
 [<ffffffff8124aa11>] do_vfs_ioctl+0x301/0x550
 [<ffffffff812566aa>] ? __fget_light+0x2a/0x90
 [<ffffffff8124acd9>] SyS_ioctl+0x79/0x90
 [<ffffffff81743c5b>] entry_SYSCALL_64_fastpath+0x16/0x73
Code: fe ff ff 48 c7 c2 18 f1 a2 81 be 92 03 00 00 48 c7 c7 f5 eb a2 81 c6 05
50 65 7f 00 01 e8 ec 30 bd ff e9 2a fe ff ff 48 8b 43 08 <48> 8b 40 18 48 85 c0
0f 84 03 fe ff ff 48 89 df ff d0 84 c0 0f 
RIP  [<ffffffff81533a4d>] reservation_object_wait_timeout_rcu+0x31d/0x510
 RSP <ffff8801346c7ce8>
CR2: ffffc9000327f018
---[ end trace 4f0c12fc10089ab5 ]---

For some reason it's easy to reproduce using Warsow 2.0 - I had hit it twice in
the main menu.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449352786.fb32cAc1.15450
Date: Sat, 5 Dec 2015 21:59:46 +0000
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
   title="NEW - BUG: unable to handle kernel paging request in reservation_object_wait_timeout_rcu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93267">93267</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: unable to handle kernel paging request in reservation_object_wait_timeout_rcu
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
          <td>marcin.slusarz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>BUG: unable to handle kernel paging request at ffffc9000327f018
IP: [&lt;ffffffff81533a4d&gt;] reservation_object_wait_timeout_rcu+0x31d/0x510
PGD 13a8a1067 PUD 13a8a2067 PMD 31d16067 PTE 0
Oops: 0000 [#1] PREEMPT SMP 
Modules linked in: drbg ctr ccm rfcomm bnep binfmt_misc arc4 iwldvm mac80211
iwlwifi uvcvideo cfg80211 snd_hda_codec_hdmi rtsx_usb snd_hda_codec_idt
snd_hda_codec_generic btusb videobuf2_vmalloc snd_hda_intel btrtl snd_hda_codec
btbcm videobuf2_memops btintel bluetooth videobuf2_v4l2 videobuf2_core
v4l2_common snd_hwdep videodev snd_hda_core snd_pcm dell_wmi dell_laptop
sparse_keymap dcdbas snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq
x86_pkg_temp_thermal serio_raw coretemp snd_timer snd_seq_device snd soundcore
lpc_ich parport_pc ppdev lp parport hid_generic nouveau ahci psmouse i915
libahci mxm_wmi ttm i2c_algo_bit drm_kms_helper usbhid syscopyarea hid
sysfillrect sysimgblt fb_sys_fops drm wmi video
CPU: 1 PID: 976 Comm: Xorg Not tainted 4.4.0-rc3 #60
Hardware name: Dell Inc.          Inspiron 7720/04M3YM, BIOS A07 08/16/2012
task: ffff880032b2a540 ti: ffff8801346c4000 task.ti: ffff8801346c4000
RIP: 0010:[&lt;ffffffff81533a4d&gt;]  [&lt;ffffffff81533a4d&gt;]
reservation_object_wait_timeout_rcu+0x31d/0x510
RSP: 0018:ffff8801346c7ce8  EFLAGS: 00010246
RAX: ffffc9000327f000 RBX: ffff88011e6b0300 RCX: 000000000327d000
RDX: 000000000327d000 RSI: 0000000000000000 RDI: ffffffff81c5efc0
RBP: ffff8801346c7d30 R08: 0000000000000000 R09: 0000000000000000
R10: ffff880032b2a540 R11: 0000000000000000 R12: ffff880032c99d58
R13: 0000000000000000 R14: 0000000000001d4c R15: ffff8800330009b8
FS:  00007f9271ca1980(0000) GS:ffff88013f240000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc9000327f018 CR3: 0000000135f80000 CR4: 00000000001406e0
Stack:
 ffffffff815337cd 00000001817432f1 ffff880033000a50 00000002016c7d30
 00000000fffffff0 0000000000000000 ffff880033000800 ffff880033000bf0
 ffffffffa03cd4f0 ffff8801346c7d68 ffffffffa035dced ffffffffa035dd23
Call Trace:
 [&lt;ffffffff815337cd&gt;] ? reservation_object_wait_timeout_rcu+0x9d/0x510
 [&lt;ffffffffa035dced&gt;] nouveau_gem_ioctl_cpu_prep+0x6d/0x160 [nouveau]
 [&lt;ffffffffa035dd23&gt;] ? nouveau_gem_ioctl_cpu_prep+0xa3/0x160 [nouveau]
 [&lt;ffffffffa0072a2b&gt;] drm_ioctl+0x14b/0x530 [drm]
 [&lt;ffffffffa035dc80&gt;] ? nouveau_gem_ioctl_pushbuf+0xce0/0xce0 [nouveau]
 [&lt;ffffffff814e98a0&gt;] ? rpm_resume+0xf0/0x7b0
 [&lt;ffffffff814e9fad&gt;] ? __pm_runtime_resume+0x4d/0x60
 [&lt;ffffffff8110848d&gt;] ? trace_hardirqs_on+0xd/0x10
 [&lt;ffffffff81743392&gt;] ? _raw_spin_unlock_irqrestore+0x42/0x70
 [&lt;ffffffffa0354777&gt;] nouveau_drm_ioctl+0x67/0xc0 [nouveau]
 [&lt;ffffffff8124aa11&gt;] do_vfs_ioctl+0x301/0x550
 [&lt;ffffffff812566aa&gt;] ? __fget_light+0x2a/0x90
 [&lt;ffffffff8124acd9&gt;] SyS_ioctl+0x79/0x90
 [&lt;ffffffff81743c5b&gt;] entry_SYSCALL_64_fastpath+0x16/0x73
Code: fe ff ff 48 c7 c2 18 f1 a2 81 be 92 03 00 00 48 c7 c7 f5 eb a2 81 c6 05
50 65 7f 00 01 e8 ec 30 bd ff e9 2a fe ff ff 48 8b 43 08 &lt;48&gt; 8b 40 18 48 85 c0
0f 84 03 fe ff ff 48 89 df ff d0 84 c0 0f 
RIP  [&lt;ffffffff81533a4d&gt;] reservation_object_wait_timeout_rcu+0x31d/0x510
 RSP &lt;ffff8801346c7ce8&gt;
CR2: ffffc9000327f018
---[ end trace 4f0c12fc10089ab5 ]---

For some reason it's easy to reproduce using Warsow 2.0 - I had hit it twice in
the main menu.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449352786.fb32cAc1.15450--

--===============1928723729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1928723729==--
