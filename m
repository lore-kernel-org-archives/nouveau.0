From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103721] [GM107] Frequent freezes with nouveau on
 Thinkpad P50
Date: Sat, 31 Mar 2018 00:44:18 +0000
Message-ID: <bug-103721-8800-DGmF7WxUiZ@http.bugs.freedesktop.org/>
References: <bug-103721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0272278934=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0272278934==
Content-Type: multipart/alternative; boundary="15224570591.B9b3Caff.20661"
Content-Transfer-Encoding: 7bit


--15224570591.B9b3Caff.20661
Date: Sat, 31 Mar 2018 00:44:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

--- Comment #12 from Goncalo Gomes <gagomes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've also been experiencing this for at least 2 to 3 years and would love to
help getting to the bottom of it. For a good while, this would only reprodu=
ce
every 15 - 40 days. Often during playing of videos, but recently it became =
3 -
10 times per day. It's nigh on impossible to do anything productive anymore=
.=20

I run Ubuntu 16.04.2 LTS, with the gnome-panel emulation (+ compiz); I noti=
ce
these hangs tend to reproduce far too easily when using anything that is ha=
rd
on graphics or makes good use of fullscreen. For example

* google-chrome
* atom
* mplayer / vlc


I am more than happy to help with identify the root cause of the issue as I
seem to be able to replicate it on demand. I'm happy to run developer debug
builds and provide as much input as possible.

From today:

[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: runlist 0: scheduled=
 for
recovery
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: channel 5: killed
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: engine 7: scheduled =
for
recovery
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: engine 0: scheduled =
for
recovery
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: compiz[3120]: channel 5
killed!
[Sat Mar 31 01:22:39 2018] [drm:drm_atomic_helper_swap_state [drm_kms_helpe=
r]]
*ERROR* [CRTC:38:head-0] hw_done timed out
[Sat Mar 31 01:22:50 2018] [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [CRTC:38:head-0] hw_done timed out
[Sat Mar 31 01:23:00 2018] [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [CRTC:38:head-0] flip_done timed out
[Sat Mar 31 01:25:16 2018] INFO: task kworker/u16:0:21874 blocked for more =
than
120 seconds.
[Sat Mar 31 01:25:16 2018]       Not tainted 4.13.0-37-generic
#42~16.04.1-Ubuntu
[Sat Mar 31 01:25:16 2018] "echo 0 > /proc/sys/kernel/hung_task_timeout_sec=
s"
disables this message.
[Sat Mar 31 01:25:16 2018] kworker/u16:0   D    0 21874      2 0x80000000
[Sat Mar 31 01:25:16 2018] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
[Sat Mar 31 01:25:16 2018] Call Trace:
[Sat Mar 31 01:25:16 2018]  __schedule+0x3d6/0x8b0
[Sat Mar 31 01:25:16 2018]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
[Sat Mar 31 01:25:16 2018]  schedule+0x36/0x80
[Sat Mar 31 01:25:16 2018]  schedule_timeout+0x1f3/0x360
[Sat Mar 31 01:25:16 2018]  ? nvkm_client_ioctl+0x12/0x20 [nouveau]
[Sat Mar 31 01:25:16 2018]  ? nvif_object_ioctl+0x47/0x50 [nouveau]
[Sat Mar 31 01:25:16 2018]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
[Sat Mar 31 01:25:16 2018]  ? nv84_fence_read+0x2e/0x30 [nouveau]
[Sat Mar 31 01:25:16 2018]  dma_fence_default_wait+0x1c5/0x260
[Sat Mar 31 01:25:16 2018]  ? dma_fence_default_wait+0x1c5/0x260
[Sat Mar 31 01:25:16 2018]  ? dma_fence_free+0x20/0x20
[Sat Mar 31 01:25:16 2018]  dma_fence_wait_timeout+0x3f/0x100
[Sat Mar 31 01:25:16 2018]  drm_atomic_helper_wait_for_fences+0x40/0xc0
[drm_kms_helper]
[Sat Mar 31 01:25:16 2018]  nv50_disp_atomic_commit_tail+0x55/0x3b70 [nouve=
au]
[Sat Mar 31 01:25:16 2018]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[Sat Mar 31 01:25:16 2018]  process_one_work+0x15b/0x410
[Sat Mar 31 01:25:16 2018]  worker_thread+0x4b/0x460
[Sat Mar 31 01:25:16 2018]  kthread+0x10c/0x140
[Sat Mar 31 01:25:16 2018]  ? process_one_work+0x410/0x410
[Sat Mar 31 01:25:16 2018]  ? kthread_create_on_node+0x70/0x70
[Sat Mar 31 01:25:16 2018]  ret_from_fork+0x35/0x40


root@darkside:/proc/21874# cat stack
[<ffffffff9104d575>] dma_fence_default_wait+0x1c5/0x260
[<ffffffff9104d06f>] dma_fence_wait_timeout+0x3f/0x100
[<ffffffffc0506ba0>] drm_atomic_helper_wait_for_fences+0x40/0xc0
[drm_kms_helper]
[<ffffffffc081f7a5>] nv50_disp_atomic_commit_tail+0x55/0x3b70 [nouveau]
[<ffffffffc08232d2>] nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[<ffffffff90aa23ab>] process_one_work+0x15b/0x410
[<ffffffff90aa26ab>] worker_thread+0x4b/0x460
[<ffffffff90aa8b5c>] kthread+0x10c/0x140
[<ffffffff91400485>] ret_from_fork+0x35/0x40
[<ffffffffffffffff>] 0xffffffffffffffff

More than happy to help fixing this issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15224570591.B9b3Caff.20661
Date: Sat, 31 Mar 2018 00:44:19 +0000
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
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">bug 10372=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gagomes&#64;gmail.com" title=3D"Goncalo Gomes &lt;gagomes&#64;gmail.com&gt;=
"> <span class=3D"fn">Goncalo Gomes</span></a>
</span></b>
        <pre>I've also been experiencing this for at least 2 to 3 years and=
 would love to
help getting to the bottom of it. For a good while, this would only reprodu=
ce
every 15 - 40 days. Often during playing of videos, but recently it became =
3 -
10 times per day. It's nigh on impossible to do anything productive anymore=
.=20

I run Ubuntu 16.04.2 LTS, with the gnome-panel emulation (+ compiz); I noti=
ce
these hangs tend to reproduce far too easily when using anything that is ha=
rd
on graphics or makes good use of fullscreen. For example

* google-chrome
* atom
* mplayer / vlc


I am more than happy to help with identify the root cause of the issue as I
seem to be able to replicate it on demand. I'm happy to run developer debug
builds and provide as much input as possible.

From today:

[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a
[CTXSW_TIMEOUT]
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: runlist 0: scheduled=
 for
recovery
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: channel 5: killed
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: engine 7: scheduled =
for
recovery
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: fifo: engine 0: scheduled =
for
recovery
[Sat Mar 31 01:22:32 2018] nouveau 0000:01:00.0: compiz[3120]: channel 5
killed!
[Sat Mar 31 01:22:39 2018] [drm:drm_atomic_helper_swap_state [drm_kms_helpe=
r]]
*ERROR* [CRTC:38:head-0] hw_done timed out
[Sat Mar 31 01:22:50 2018] [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [CRTC:38:head-0] hw_done timed out
[Sat Mar 31 01:23:00 2018] [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [CRTC:38:head-0] flip_done timed out
[Sat Mar 31 01:25:16 2018] INFO: task kworker/u16:0:21874 blocked for more =
than
120 seconds.
[Sat Mar 31 01:25:16 2018]       Not tainted 4.13.0-37-generic
#42~16.04.1-Ubuntu
[Sat Mar 31 01:25:16 2018] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_tim=
eout_secs&quot;
disables this message.
[Sat Mar 31 01:25:16 2018] kworker/u16:0   D    0 21874      2 0x80000000
[Sat Mar 31 01:25:16 2018] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
[Sat Mar 31 01:25:16 2018] Call Trace:
[Sat Mar 31 01:25:16 2018]  __schedule+0x3d6/0x8b0
[Sat Mar 31 01:25:16 2018]  ? nvkm_ioctl_ntfy_get+0x69/0xb0 [nouveau]
[Sat Mar 31 01:25:16 2018]  schedule+0x36/0x80
[Sat Mar 31 01:25:16 2018]  schedule_timeout+0x1f3/0x360
[Sat Mar 31 01:25:16 2018]  ? nvkm_client_ioctl+0x12/0x20 [nouveau]
[Sat Mar 31 01:25:16 2018]  ? nvif_object_ioctl+0x47/0x50 [nouveau]
[Sat Mar 31 01:25:16 2018]  ? nouveau_bo_rd32+0x2a/0x30 [nouveau]
[Sat Mar 31 01:25:16 2018]  ? nv84_fence_read+0x2e/0x30 [nouveau]
[Sat Mar 31 01:25:16 2018]  dma_fence_default_wait+0x1c5/0x260
[Sat Mar 31 01:25:16 2018]  ? dma_fence_default_wait+0x1c5/0x260
[Sat Mar 31 01:25:16 2018]  ? dma_fence_free+0x20/0x20
[Sat Mar 31 01:25:16 2018]  dma_fence_wait_timeout+0x3f/0x100
[Sat Mar 31 01:25:16 2018]  drm_atomic_helper_wait_for_fences+0x40/0xc0
[drm_kms_helper]
[Sat Mar 31 01:25:16 2018]  nv50_disp_atomic_commit_tail+0x55/0x3b70 [nouve=
au]
[Sat Mar 31 01:25:16 2018]  nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[Sat Mar 31 01:25:16 2018]  process_one_work+0x15b/0x410
[Sat Mar 31 01:25:16 2018]  worker_thread+0x4b/0x460
[Sat Mar 31 01:25:16 2018]  kthread+0x10c/0x140
[Sat Mar 31 01:25:16 2018]  ? process_one_work+0x410/0x410
[Sat Mar 31 01:25:16 2018]  ? kthread_create_on_node+0x70/0x70
[Sat Mar 31 01:25:16 2018]  ret_from_fork+0x35/0x40


root&#64;darkside:/proc/21874# cat stack
[&lt;ffffffff9104d575&gt;] dma_fence_default_wait+0x1c5/0x260
[&lt;ffffffff9104d06f&gt;] dma_fence_wait_timeout+0x3f/0x100
[&lt;ffffffffc0506ba0&gt;] drm_atomic_helper_wait_for_fences+0x40/0xc0
[drm_kms_helper]
[&lt;ffffffffc081f7a5&gt;] nv50_disp_atomic_commit_tail+0x55/0x3b70 [nouvea=
u]
[&lt;ffffffffc08232d2&gt;] nv50_disp_atomic_commit_work+0x12/0x20 [nouveau]
[&lt;ffffffff90aa23ab&gt;] process_one_work+0x15b/0x410
[&lt;ffffffff90aa26ab&gt;] worker_thread+0x4b/0x460
[&lt;ffffffff90aa8b5c&gt;] kthread+0x10c/0x140
[&lt;ffffffff91400485&gt;] ret_from_fork+0x35/0x40
[&lt;ffffffffffffffff&gt;] 0xffffffffffffffff

More than happy to help fixing this issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15224570591.B9b3Caff.20661--

--===============0272278934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0272278934==--
