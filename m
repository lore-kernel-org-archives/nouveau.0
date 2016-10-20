From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97462] Graphics deadlock "ILLEGAL_MTHD" in nouveau
 with mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5
Date: Thu, 20 Oct 2016 13:51:19 +0000
Message-ID: <bug-97462-8800-PPVHDc8mCs@http.bugs.freedesktop.org/>
References: <bug-97462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010349894=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0010349894==
Content-Type: multipart/alternative; boundary="14769714790.Edae.12064";
 charset="UTF-8"


--14769714790.Edae.12064
Date: Thu, 20 Oct 2016 13:51:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

--- Comment #13 from wadev-cl+VPiYnx/0HWmgEVkV9KA@public.gmane.org ---
No dice, I am still having the problem.

In the meantime, today I tried it with

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.3.2
OpenGL core profile shading language version string: 3.30

on Debian Jessie.

it does exactly the same (with hardware acceleration enabled).

But in that case, instead of messages about ILLEGAL_MTHD, I get like

Oct 20 09:54:59 terra kernel: [23578.198775] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Oct 20 09:54:59 terra kernel: [23578.198780] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[20598]] subc 0 mthd 0x0000 data 0x00000000
Oct 20 09:54:59 terra kernel: [23578.198795] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0808 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198816] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0810 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198837] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_ENUM] ch 5 [0x007f9ec000 Compositor[20598]] subc 0 class
0x9297 mthd 0x0814 data 0x000000c0
Oct 20 09:54:59 terra kernel: [23578.198858] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0818 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198879] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ec000 Compositor[20598]] subc 0 cla=
ss
0x9297 mthd 0x081c data 0x000000$
Oct 20 09:54:59 terra kernel: [23578.198899] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0820 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198920] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x2490 data 0x000$
Oct 20 09:54:59 terra kernel: [23578.198940] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0fc8 data 0x600$
Oct 20 09:54:59 terra kernel: [23578.198953] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Oct 20 09:54:59 terra kernel: [23578.198955] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[20598]] subc 0 mthd 0x0000 data 0x00000000
Oct 20 09:54:59 terra kernel: [23578.198969] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x1160 data 0x446$
Oct 20 09:55:03 terra kernel: [23582.489822] nouveau E[   PFIFO][0000:01:00=
.0]
SCHED_ERROR [ CTXSW_TIMEOUT ]
Oct 20 09:55:03 terra kernel: [23582.489828] nouveau E[   PFIFO][0000:01:00=
.0]
PPPP engine fault on channel 5, recovering...
Oct 20 09:55:03 terra kernel: [23582.489876] nouveau 0000:01:00.0: firmware:
failed to load nouveau/nvd9_fuc086 (-2)
Oct 20 09:55:03 terra kernel: [23582.489877] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Oct 20 09:55:03 terra kernel: [23582.489878] nouveau 0000:01:00.0: Falling =
back
to user helper
Oct 20 09:55:03 terra kernel: [23582.490392] nouveau 0000:01:00.0: firmware:
failed to load nouveau/nvd9_fuc086d (-2)
Oct 20 09:55:03 terra kernel: [23582.490394] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Oct 20 09:55:03 terra kernel: [23582.490395] nouveau 0000:01:00.0: Falling =
back
to user helper
Oct 20 09:55:03 terra kernel: [23582.490763] nouveau E[    PPPP][0000:01:00=
.0]
unable to load firmware data
Oct 20 09:55:03 terra kernel: [23582.490764] ------------[ cut here
]------------
Oct 20 09:55:03 terra kernel: [23582.490788] WARNING: CPU: 0 PID: 20731 at
/build/linux-EZT6bx/linux-3.16.36/drivers/gpu/drm/nouveau/core/engine/fifo/=
nvc0.c:422
nvc0_fifo_recover_work+0x271$
Oct 20 09:55:03 terra kernel: [23582.490789] Modules linked in: tun bnep
bluetooth 6lowpan_iphc binfmt_misc vmhgfs(O) vmw_vmci fuse lp
snd_hda_codec_hdmi x86_pkg_temp_thermal intel_powercla$
Oct 20 09:55:03 terra kernel: [23582.490821] CPU: 0 PID: 20731 Comm:
kworker/0:2 Tainted: G           O  3.16.0-4-amd64 #1 Debian 3.16.36-1+deb8=
u1

and then (another attempt):

Oct 20 14:02:32 terra kernel: [38416.887838] Call Trace:
Oct 20 14:02:32 terra kernel: [38416.887966]  [<ffffffffa02ae32b>] ?
nouveau_fence_update+0x5b/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888121]  [<ffffffffa02ae925>] ?
nouveau_fence_wait+0xb5/0x190 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888267]  [<ffffffffa02acf85>] ?
nouveau_channel_idle+0x65/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888414]  [<ffffffffa02b566a>] ?
nouveau_abi16_chan_fini.isra.3+0x2a/0x1b0 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888598]  [<ffffffffa02b59ee>] ?
nouveau_abi16_fini+0x3e/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888743]  [<ffffffffa02abd03>] ?
nouveau_drm_preclose+0x33/0x90 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888885]  [<ffffffffa010f753>] ?
drm_release+0x53/0x5e0 [drm]
Oct 20 14:02:32 terra kernel: [38416.889020]  [<ffffffff811ac1aa>] ?
__fput+0xca/0x1d0
Oct 20 14:02:32 terra kernel: [38416.889160]  [<ffffffff8108670c>] ?
task_work_run+0x8c/0xb0
Oct 20 14:02:32 terra kernel: [38416.889293]  [<ffffffff8106ac61>] ?
do_exit+0x2b1/0xa70
Oct 20 14:02:32 terra kernel: [38416.889425]  [<ffffffff81017277>] ?
oops_end+0x97/0xe0
Oct 20 14:02:32 terra kernel: [38416.889557]  [<ffffffff8150ec7c>] ?
no_context+0x2b2/0x2be
Oct 20 14:02:32 terra kernel: [38416.889690]  [<ffffffff81058593>] ?
__do_page_fault+0x463/0x4f0
Oct 20 14:02:32 terra kernel: [38416.889825]  [<ffffffff8101e1c6>] ?
__switch_to_xtra+0x136/0x170
Oct 20 14:02:32 terra kernel: [38416.889960]  [<ffffffff81012900>] ?
__switch_to+0x480/0x5a0
Oct 20 14:02:32 terra kernel: [38416.890093]  [<ffffffff8151a568>] ?
page_fault+0x28/0x30
Oct 20 14:02:32 terra kernel: [38416.890240]  [<ffffffffa02b73b1>] ?
nv84_fence_read+0x21/0x30 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890385]  [<ffffffffa02ae32b>] ?
nouveau_fence_update+0x5b/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890531]  [<ffffffffa02ae6a0>] ?
nouveau_fence_wait_uevent.isra.2+0x350/0x3e0 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890709]  [<ffffffff810a9590>] ?
prepare_to_wait_event+0xf0/0xf0
Oct 20 14:02:32 terra kernel: [38416.890852]  [<ffffffffa02ae8ef>] ?
nouveau_fence_wait+0x7f/0x190 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890998]  [<ffffffffa02ae32b>] ?
nouveau_fence_update+0x5b/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.891148]  [<ffffffffa00d4685>] ?
ttm_bo_wait+0x85/0x180 [ttm]
Oct 20 14:02:32 terra kernel: [38416.891291]  [<ffffffffa02b534f>] ?
nouveau_gem_ioctl_cpu_prep+0x4f/0xd0 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.891469]  [<ffffffffa010e8a7>] ?
drm_ioctl+0x1c7/0x5b0 [drm]
Oct 20 14:02:32 terra kernel: [38416.891604]  [<ffffffff81079ee1>] ?
__set_current_blocked+0x31/0x50
Oct 20 14:02:32 terra kernel: [38416.891740]  [<ffffffff810135e9>] ?
do_signal+0x199/0xa10
Oct 20 14:02:32 terra kernel: [38416.891872]  [<ffffffff8101f6b2>] ?
__restore_xstate_sig+0x82/0x570
Oct 20 14:02:32 terra kernel: [38416.892015]  [<ffffffffa02abb0e>] ?
nouveau_drm_ioctl+0x5e/0x90 [nouveau]


The strange thing is that it *may* not be the proposed synchronization rela=
ted
issue, rather in relation to the DRM ioctl(s), or at least I so guessed, as
when I connect from another machine, forcefully remove nouveau module - aft=
er
killing Xorg and display manager - with "rmmod -f nouveau" then re-probe the
module, it "picks up" where it dropped, with the exception of seemingly not
even the initialization can pass and thus cannot get my tty back, but errors
are kept being dumped on the screen, just without cursor (or caret or whatn=
ot)
or anything.

--

Paviluf, could you please mention your firefox version and the output of yo=
ur
glxinfo - at least the core profile one pertaining to mesa version?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14769714790.Edae.12064
Date: Thu, 20 Oct 2016 13:51:19 +0000
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
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462">bug 97462<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wadev&#64;mailbox.hu" title=3D"wadev&#64;mailbox.hu">wadev&#64;mailbox.hu</=
a>
</span></b>
        <pre>No dice, I am still having the problem.

In the meantime, today I tried it with

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.3.2
OpenGL core profile shading language version string: 3.30

on Debian Jessie.

it does exactly the same (with hardware acceleration enabled).

But in that case, instead of messages about ILLEGAL_MTHD, I get like

Oct 20 09:54:59 terra kernel: [23578.198775] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Oct 20 09:54:59 terra kernel: [23578.198780] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[20598]] subc 0 mthd 0x0000 data 0x00000000
Oct 20 09:54:59 terra kernel: [23578.198795] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0808 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198816] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0810 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198837] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_ENUM] ch 5 [0x007f9ec000 Compositor[20598]] subc 0 class
0x9297 mthd 0x0814 data 0x000000c0
Oct 20 09:54:59 terra kernel: [23578.198858] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0818 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198879] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ec000 Compositor[20598]] subc 0 cla=
ss
0x9297 mthd 0x081c data 0x000000$
Oct 20 09:54:59 terra kernel: [23578.198899] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0820 data 0x200$
Oct 20 09:54:59 terra kernel: [23578.198920] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x2490 data 0x000$
Oct 20 09:54:59 terra kernel: [23578.198940] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x0fc8 data 0x600$
Oct 20 09:54:59 terra kernel: [23578.198953] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Oct 20 09:54:59 terra kernel: [23578.198955] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[20598]] subc 0 mthd 0x0000 data 0x00000000
Oct 20 09:54:59 terra kernel: [23578.198969] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ec000 Compositor[20598]] subc 0
class 0x9297 mthd 0x1160 data 0x446$
Oct 20 09:55:03 terra kernel: [23582.489822] nouveau E[   PFIFO][0000:01:00=
.0]
SCHED_ERROR [ CTXSW_TIMEOUT ]
Oct 20 09:55:03 terra kernel: [23582.489828] nouveau E[   PFIFO][0000:01:00=
.0]
PPPP engine fault on channel 5, recovering...
Oct 20 09:55:03 terra kernel: [23582.489876] nouveau 0000:01:00.0: firmware:
failed to load nouveau/nvd9_fuc086 (-2)
Oct 20 09:55:03 terra kernel: [23582.489877] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Oct 20 09:55:03 terra kernel: [23582.489878] nouveau 0000:01:00.0: Falling =
back
to user helper
Oct 20 09:55:03 terra kernel: [23582.490392] nouveau 0000:01:00.0: firmware:
failed to load nouveau/nvd9_fuc086d (-2)
Oct 20 09:55:03 terra kernel: [23582.490394] nouveau 0000:01:00.0: Direct
firmware load failed with error -2
Oct 20 09:55:03 terra kernel: [23582.490395] nouveau 0000:01:00.0: Falling =
back
to user helper
Oct 20 09:55:03 terra kernel: [23582.490763] nouveau E[    PPPP][0000:01:00=
.0]
unable to load firmware data
Oct 20 09:55:03 terra kernel: [23582.490764] ------------[ cut here
]------------
Oct 20 09:55:03 terra kernel: [23582.490788] WARNING: CPU: 0 PID: 20731 at
/build/linux-EZT6bx/linux-3.16.36/drivers/gpu/drm/nouveau/core/engine/fifo/=
nvc0.c:422
nvc0_fifo_recover_work+0x271$
Oct 20 09:55:03 terra kernel: [23582.490789] Modules linked in: tun bnep
bluetooth 6lowpan_iphc binfmt_misc vmhgfs(O) vmw_vmci fuse lp
snd_hda_codec_hdmi x86_pkg_temp_thermal intel_powercla$
Oct 20 09:55:03 terra kernel: [23582.490821] CPU: 0 PID: 20731 Comm:
kworker/0:2 Tainted: G           O  3.16.0-4-amd64 #1 Debian 3.16.36-1+deb8=
u1

and then (another attempt):

Oct 20 14:02:32 terra kernel: [38416.887838] Call Trace:
Oct 20 14:02:32 terra kernel: [38416.887966]  [&lt;ffffffffa02ae32b&gt;] ?
nouveau_fence_update+0x5b/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888121]  [&lt;ffffffffa02ae925&gt;] ?
nouveau_fence_wait+0xb5/0x190 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888267]  [&lt;ffffffffa02acf85&gt;] ?
nouveau_channel_idle+0x65/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888414]  [&lt;ffffffffa02b566a&gt;] ?
nouveau_abi16_chan_fini.isra.3+0x2a/0x1b0 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888598]  [&lt;ffffffffa02b59ee&gt;] ?
nouveau_abi16_fini+0x3e/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888743]  [&lt;ffffffffa02abd03&gt;] ?
nouveau_drm_preclose+0x33/0x90 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.888885]  [&lt;ffffffffa010f753&gt;] ?
drm_release+0x53/0x5e0 [drm]
Oct 20 14:02:32 terra kernel: [38416.889020]  [&lt;ffffffff811ac1aa&gt;] ?
__fput+0xca/0x1d0
Oct 20 14:02:32 terra kernel: [38416.889160]  [&lt;ffffffff8108670c&gt;] ?
task_work_run+0x8c/0xb0
Oct 20 14:02:32 terra kernel: [38416.889293]  [&lt;ffffffff8106ac61&gt;] ?
do_exit+0x2b1/0xa70
Oct 20 14:02:32 terra kernel: [38416.889425]  [&lt;ffffffff81017277&gt;] ?
oops_end+0x97/0xe0
Oct 20 14:02:32 terra kernel: [38416.889557]  [&lt;ffffffff8150ec7c&gt;] ?
no_context+0x2b2/0x2be
Oct 20 14:02:32 terra kernel: [38416.889690]  [&lt;ffffffff81058593&gt;] ?
__do_page_fault+0x463/0x4f0
Oct 20 14:02:32 terra kernel: [38416.889825]  [&lt;ffffffff8101e1c6&gt;] ?
__switch_to_xtra+0x136/0x170
Oct 20 14:02:32 terra kernel: [38416.889960]  [&lt;ffffffff81012900&gt;] ?
__switch_to+0x480/0x5a0
Oct 20 14:02:32 terra kernel: [38416.890093]  [&lt;ffffffff8151a568&gt;] ?
page_fault+0x28/0x30
Oct 20 14:02:32 terra kernel: [38416.890240]  [&lt;ffffffffa02b73b1&gt;] ?
nv84_fence_read+0x21/0x30 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890385]  [&lt;ffffffffa02ae32b&gt;] ?
nouveau_fence_update+0x5b/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890531]  [&lt;ffffffffa02ae6a0&gt;] ?
nouveau_fence_wait_uevent.isra.2+0x350/0x3e0 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890709]  [&lt;ffffffff810a9590&gt;] ?
prepare_to_wait_event+0xf0/0xf0
Oct 20 14:02:32 terra kernel: [38416.890852]  [&lt;ffffffffa02ae8ef&gt;] ?
nouveau_fence_wait+0x7f/0x190 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.890998]  [&lt;ffffffffa02ae32b&gt;] ?
nouveau_fence_update+0x5b/0x80 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.891148]  [&lt;ffffffffa00d4685&gt;] ?
ttm_bo_wait+0x85/0x180 [ttm]
Oct 20 14:02:32 terra kernel: [38416.891291]  [&lt;ffffffffa02b534f&gt;] ?
nouveau_gem_ioctl_cpu_prep+0x4f/0xd0 [nouveau]
Oct 20 14:02:32 terra kernel: [38416.891469]  [&lt;ffffffffa010e8a7&gt;] ?
drm_ioctl+0x1c7/0x5b0 [drm]
Oct 20 14:02:32 terra kernel: [38416.891604]  [&lt;ffffffff81079ee1&gt;] ?
__set_current_blocked+0x31/0x50
Oct 20 14:02:32 terra kernel: [38416.891740]  [&lt;ffffffff810135e9&gt;] ?
do_signal+0x199/0xa10
Oct 20 14:02:32 terra kernel: [38416.891872]  [&lt;ffffffff8101f6b2&gt;] ?
__restore_xstate_sig+0x82/0x570
Oct 20 14:02:32 terra kernel: [38416.892015]  [&lt;ffffffffa02abb0e&gt;] ?
nouveau_drm_ioctl+0x5e/0x90 [nouveau]


The strange thing is that it *may* not be the proposed synchronization rela=
ted
issue, rather in relation to the DRM ioctl(s), or at least I so guessed, as
when I connect from another machine, forcefully remove nouveau module - aft=
er
killing Xorg and display manager - with &quot;rmmod -f nouveau&quot; then r=
e-probe the
module, it &quot;picks up&quot; where it dropped, with the exception of see=
mingly not
even the initialization can pass and thus cannot get my tty back, but errors
are kept being dumped on the screen, just without cursor (or caret or whatn=
ot)
or anything.

--

Paviluf, could you please mention your firefox version and the output of yo=
ur
glxinfo - at least the core profile one pertaining to mesa version?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14769714790.Edae.12064--

--===============0010349894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0010349894==--
