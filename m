From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100431] New: nv50: memory corruption due to
 use-after-free of dma_fence
Date: Tue, 28 Mar 2017 09:06:46 +0000
Message-ID: <bug-100431-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0656953999=="
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


--===============0656953999==
Content-Type: multipart/alternative; boundary="14906920061.d7C1f.2471";
 charset="UTF-8"


--14906920061.d7C1f.2471
Date: Tue, 28 Mar 2017 09:06:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100431

            Bug ID: 100431
           Summary: nv50: memory corruption due to use-after-free of
                    dma_fence
           Product: xorg
           Version: unspecified
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hello all,

I am trying to debug an elusive memory corruption bug on my arm64
machine which appears to be in the nouveau driver.

I got the following splat from the refcount debugging code:

"""
refcount_t: underflow; use-after-free.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 3366 at lib/refcount.c:128
refcount_sub_and_test+0xe8/0x108
Modules linked in: fuse nouveau ttm drm_kms_helper drm ip_tables x_tables i=
pv6

CPU: 0 PID: 3366 Comm: gnome-shell Not tainted 4.11.0-rc3-00407-g97da3854c5=
26
#1
Hardware name: AMD Seattle/Seattle, BIOS 11:14:27 Mar 20 2017
task: ffffffd6cca5b600 task.stack: ffffffd6c8120000
PC is at refcount_sub_and_test+0xe8/0x108
LR is at refcount_sub_and_test+0xe8/0x108
pc : [<ffffffa1f81af7f0>] lr : [<ffffffa1f81af7f0>] pstate: 20000145
sp : ffffffd6c81237c0
x29: ffffffd6c81237c0 x28: 0000000000000028
x27: ffffffd6cca5b610 x26: ffffffd6b4417080
x25: ffffffd68715a000 x24: ffffffd6cca5b610
x23: ffffffd68b513680 x22: ffffffa1f8473a30
x21: ffffffd6c7cc9e00 x20: 0000000000000001
x19: ffffffd68b513500 x18: 0000000000000020
x17: 0000007fb64d3db0 x16: ffffffa1f8473f18
x15: 000000003040d230 x14: 0000000200000000
x13: 0000000200000010 x12: ffffffffffffffff
x11: 1ffffff43f3e8e1f x10: ffffff843f3e8e1f
x9 : dfffff9000000000 x8 : ffffffa1f9f470fc
x7 : 0000000000000000 x6 : ffffff843f3e8e20
x5 : ffffff843f3e8e20 x4 : 0000000000000000
x3 : 0000003600d52000 x2 : dfffff9000000000
x1 : ffffff8ad90246c6 x0 : 0000000000000026

---[ end trace d188d18d5d3d25db ]---
Call trace:
Exception stack(0xffffffd6c8123590 to 0xffffffd6c81236c0)
3580:                                   ffffffd68b513500 0000008000000000
35a0: ffffffd6c81237c0 ffffffa1f81af7f0 0000000020000145 000000000000003d
35c0: ffffffd68715a000 ffffffa1f7e591b8 0000000041b58ab3 ffffffa1f8fe11b8
35e0: ffffffa1f7cf15b8 ffffffa1f8473a30 ffffffd68b513680 ffffffd6cca5b610
3600: ffffffd68715a000 ffffffd6b4417080 ffffffd6c81237c0 ffffffd6c81237c0
3620: ffffffd6c8123780 00000000ffffffc8 0000000041b58ab3 ffffffa1f8fea138
3640: ffffffa1f7dc0540 ffffffa1f7cfad28 ffffffa1f7ee9ee8 ffffff9001162e10
3660: ffffff900113f084 ffffff9000ed84b8 ffffff900113200c ffffffa1f7f2c910
3680: ffffffa1f7f2d20c ffffffa1f7cf3730 0000000000000026 ffffff8ad90246c6
36a0: dfffff9000000000 0000003600d52000 0000000000000000 ffffff843f3e8e20
[<ffffffa1f81af7f0>] refcount_sub_and_test+0xe8/0x108
[<ffffffa1f81af824>] refcount_dec_and_test+0x14/0x20
[<ffffffa1f847405c>] reservation_object_add_excl_fence+0x144/0x1e0
[<ffffff900113cce0>] nouveau_bo_fence+0x50/0x60 [nouveau]
[<ffffff900113d1dc>] validate_fini_no_ticket+0xc4/0x190 [nouveau]
[<ffffff900113e1fc>] nouveau_gem_ioctl_pushbuf+0x49c/0x1c78 [nouveau]
[<ffffff9000ed84b8>] drm_ioctl+0x280/0x590 [drm]
[<ffffff900113200c>] nouveau_drm_ioctl+0x8c/0x100 [nouveau]
[<ffffffa1f7f2c910>] do_vfs_ioctl+0x130/0x9a0
[<ffffffa1f7f2d20c>] SyS_ioctl+0x8c/0xa0
[<ffffffa1f7cf3730>] el0_svc_naked+0x24/0x28
"""

Enabling KASAN gives some additional information, many reports similar to


"""
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in nouveau_fence_sync+0x154/0x398 [nouveau]
                       at addr ffffffd69064f808
Read of size 8 by task gnome-shell/3366
CPU: 4 PID: 3366 Comm: gnome-shell Tainted: G        W
                                   4.11.0-rc3-00407-g97da3854c526 #1
Hardware name: AMD Seattle/Seattle, BIOS 11:14:27 Mar 20 2017
Call trace:
[<ffffffa1f7cfb1f8>] dump_backtrace+0x0/0x300
[<ffffffa1f7cfb50c>] show_stack+0x14/0x20
[<ffffffa1f8188788>] dump_stack+0xa8/0xd0
[<ffffffa1f7eea964>] kasan_object_err+0x24/0x80
[<ffffffa1f7eeabec>] kasan_report_error+0x1cc/0x4f0
[<ffffffa1f7eeb2e8>] kasan_report+0x38/0x40
[<ffffffa1f7ee985c>] __asan_load8+0x84/0x98
[<ffffff9001162a9c>] nouveau_fence_sync+0x154/0x398 [nouveau]
[<ffffff900113e904>] nouveau_gem_ioctl_pushbuf+0xba4/0x1c78 [nouveau]
[<ffffff9000ed84b8>] drm_ioctl+0x280/0x590 [drm]
[<ffffff900113200c>] nouveau_drm_ioctl+0x8c/0x100 [nouveau]
[<ffffffa1f7f2c910>] do_vfs_ioctl+0x130/0x9a0
[<ffffffa1f7f2d20c>] SyS_ioctl+0x8c/0xa0
[<ffffffa1f7cf3730>] el0_svc_naked+0x24/0x28
Object at ffffffd69064f800, in cache kmalloc-256 size: 256
Allocated:
PID =3D 3366
 save_stack_trace_tsk+0x0/0x220
 save_stack_trace+0x18/0x20
 kasan_kmalloc+0xd8/0x188
 nouveau_fence_new+0xb0/0x150 [nouveau]
 nouveau_gem_ioctl_pushbuf+0x1324/0x1c78 [nouveau]
 drm_ioctl+0x280/0x590 [drm]
 nouveau_drm_ioctl+0x8c/0x100 [nouveau]
 do_vfs_ioctl+0x130/0x9a0
 SyS_ioctl+0x8c/0xa0
 el0_svc_naked+0x24/0x28
Freed:
PID =3D 0
 save_stack_trace_tsk+0x0/0x220
 save_stack_trace+0x18/0x20
 kasan_slab_free+0x88/0x188
 kfree+0x70/0x1e0
 rcu_process_callbacks+0x290/0x6a8
 __do_softirq+0x1a0/0x328
Memory state around the buggy address:
 ffffffd69064f700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffffffd69064f780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffffffd69064f800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffffffd69064f880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffffffd69064f900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
"""

I guess these are both results of the fact that a dma_fence object was
freed but still turns up in some list.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14906920061.d7C1f.2471
Date: Tue, 28 Mar 2017 09:06:46 +0000
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
   title=3D"NEW - nv50: memory corruption due to use-after-free of dma_fenc=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100431">100431</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv50: memory corruption due to use-after-free of dma_fence
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
          <td>ARM
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
          <td>ard.biesheuvel&#64;linaro.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello all,

I am trying to debug an elusive memory corruption bug on my arm64
machine which appears to be in the nouveau driver.

I got the following splat from the refcount debugging code:

&quot;&quot;&quot;
refcount_t: underflow; use-after-free.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 3366 at lib/refcount.c:128
refcount_sub_and_test+0xe8/0x108
Modules linked in: fuse nouveau ttm drm_kms_helper drm ip_tables x_tables i=
pv6

CPU: 0 PID: 3366 Comm: gnome-shell Not tainted 4.11.0-rc3-00407-g97da3854c5=
26
#1
Hardware name: AMD Seattle/Seattle, BIOS 11:14:27 Mar 20 2017
task: ffffffd6cca5b600 task.stack: ffffffd6c8120000
PC is at refcount_sub_and_test+0xe8/0x108
LR is at refcount_sub_and_test+0xe8/0x108
pc : [&lt;ffffffa1f81af7f0&gt;] lr : [&lt;ffffffa1f81af7f0&gt;] pstate: 200=
00145
sp : ffffffd6c81237c0
x29: ffffffd6c81237c0 x28: 0000000000000028
x27: ffffffd6cca5b610 x26: ffffffd6b4417080
x25: ffffffd68715a000 x24: ffffffd6cca5b610
x23: ffffffd68b513680 x22: ffffffa1f8473a30
x21: ffffffd6c7cc9e00 x20: 0000000000000001
x19: ffffffd68b513500 x18: 0000000000000020
x17: 0000007fb64d3db0 x16: ffffffa1f8473f18
x15: 000000003040d230 x14: 0000000200000000
x13: 0000000200000010 x12: ffffffffffffffff
x11: 1ffffff43f3e8e1f x10: ffffff843f3e8e1f
x9 : dfffff9000000000 x8 : ffffffa1f9f470fc
x7 : 0000000000000000 x6 : ffffff843f3e8e20
x5 : ffffff843f3e8e20 x4 : 0000000000000000
x3 : 0000003600d52000 x2 : dfffff9000000000
x1 : ffffff8ad90246c6 x0 : 0000000000000026

---[ end trace d188d18d5d3d25db ]---
Call trace:
Exception stack(0xffffffd6c8123590 to 0xffffffd6c81236c0)
3580:                                   ffffffd68b513500 0000008000000000
35a0: ffffffd6c81237c0 ffffffa1f81af7f0 0000000020000145 000000000000003d
35c0: ffffffd68715a000 ffffffa1f7e591b8 0000000041b58ab3 ffffffa1f8fe11b8
35e0: ffffffa1f7cf15b8 ffffffa1f8473a30 ffffffd68b513680 ffffffd6cca5b610
3600: ffffffd68715a000 ffffffd6b4417080 ffffffd6c81237c0 ffffffd6c81237c0
3620: ffffffd6c8123780 00000000ffffffc8 0000000041b58ab3 ffffffa1f8fea138
3640: ffffffa1f7dc0540 ffffffa1f7cfad28 ffffffa1f7ee9ee8 ffffff9001162e10
3660: ffffff900113f084 ffffff9000ed84b8 ffffff900113200c ffffffa1f7f2c910
3680: ffffffa1f7f2d20c ffffffa1f7cf3730 0000000000000026 ffffff8ad90246c6
36a0: dfffff9000000000 0000003600d52000 0000000000000000 ffffff843f3e8e20
[&lt;ffffffa1f81af7f0&gt;] refcount_sub_and_test+0xe8/0x108
[&lt;ffffffa1f81af824&gt;] refcount_dec_and_test+0x14/0x20
[&lt;ffffffa1f847405c&gt;] reservation_object_add_excl_fence+0x144/0x1e0
[&lt;ffffff900113cce0&gt;] nouveau_bo_fence+0x50/0x60 [nouveau]
[&lt;ffffff900113d1dc&gt;] validate_fini_no_ticket+0xc4/0x190 [nouveau]
[&lt;ffffff900113e1fc&gt;] nouveau_gem_ioctl_pushbuf+0x49c/0x1c78 [nouveau]
[&lt;ffffff9000ed84b8&gt;] drm_ioctl+0x280/0x590 [drm]
[&lt;ffffff900113200c&gt;] nouveau_drm_ioctl+0x8c/0x100 [nouveau]
[&lt;ffffffa1f7f2c910&gt;] do_vfs_ioctl+0x130/0x9a0
[&lt;ffffffa1f7f2d20c&gt;] SyS_ioctl+0x8c/0xa0
[&lt;ffffffa1f7cf3730&gt;] el0_svc_naked+0x24/0x28
&quot;&quot;&quot;

Enabling KASAN gives some additional information, many reports similar to


&quot;&quot;&quot;
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in nouveau_fence_sync+0x154/0x398 [nouveau]
                       at addr ffffffd69064f808
Read of size 8 by task gnome-shell/3366
CPU: 4 PID: 3366 Comm: gnome-shell Tainted: G        W
                                   4.11.0-rc3-00407-g97da3854c526 #1
Hardware name: AMD Seattle/Seattle, BIOS 11:14:27 Mar 20 2017
Call trace:
[&lt;ffffffa1f7cfb1f8&gt;] dump_backtrace+0x0/0x300
[&lt;ffffffa1f7cfb50c&gt;] show_stack+0x14/0x20
[&lt;ffffffa1f8188788&gt;] dump_stack+0xa8/0xd0
[&lt;ffffffa1f7eea964&gt;] kasan_object_err+0x24/0x80
[&lt;ffffffa1f7eeabec&gt;] kasan_report_error+0x1cc/0x4f0
[&lt;ffffffa1f7eeb2e8&gt;] kasan_report+0x38/0x40
[&lt;ffffffa1f7ee985c&gt;] __asan_load8+0x84/0x98
[&lt;ffffff9001162a9c&gt;] nouveau_fence_sync+0x154/0x398 [nouveau]
[&lt;ffffff900113e904&gt;] nouveau_gem_ioctl_pushbuf+0xba4/0x1c78 [nouveau]
[&lt;ffffff9000ed84b8&gt;] drm_ioctl+0x280/0x590 [drm]
[&lt;ffffff900113200c&gt;] nouveau_drm_ioctl+0x8c/0x100 [nouveau]
[&lt;ffffffa1f7f2c910&gt;] do_vfs_ioctl+0x130/0x9a0
[&lt;ffffffa1f7f2d20c&gt;] SyS_ioctl+0x8c/0xa0
[&lt;ffffffa1f7cf3730&gt;] el0_svc_naked+0x24/0x28
Object at ffffffd69064f800, in cache kmalloc-256 size: 256
Allocated:
PID =3D 3366
 save_stack_trace_tsk+0x0/0x220
 save_stack_trace+0x18/0x20
 kasan_kmalloc+0xd8/0x188
 nouveau_fence_new+0xb0/0x150 [nouveau]
 nouveau_gem_ioctl_pushbuf+0x1324/0x1c78 [nouveau]
 drm_ioctl+0x280/0x590 [drm]
 nouveau_drm_ioctl+0x8c/0x100 [nouveau]
 do_vfs_ioctl+0x130/0x9a0
 SyS_ioctl+0x8c/0xa0
 el0_svc_naked+0x24/0x28
Freed:
PID =3D 0
 save_stack_trace_tsk+0x0/0x220
 save_stack_trace+0x18/0x20
 kasan_slab_free+0x88/0x188
 kfree+0x70/0x1e0
 rcu_process_callbacks+0x290/0x6a8
 __do_softirq+0x1a0/0x328
Memory state around the buggy address:
 ffffffd69064f700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffffffd69064f780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
<span class=3D"quote">&gt;ffffffd69064f800: fb fb fb fb fb fb fb fb fb fb f=
b fb fb fb fb fb</span >
                      ^
 ffffffd69064f880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffffffd69064f900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
&quot;&quot;&quot;

I guess these are both results of the fact that a dma_fence object was
freed but still turns up in some list.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14906920061.d7C1f.2471--

--===============0656953999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0656953999==--
