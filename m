From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104222] GNOME/Wayland desktop freezes when resizing
 Firefox window
Date: Tue, 19 Dec 2017 15:31:19 +0000
Message-ID: <bug-104222-8800-W60Lkvgudr@http.bugs.freedesktop.org/>
References: <bug-104222-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1664855196=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104222-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1664855196==
Content-Type: multipart/alternative; boundary="15136974790.a162f.24690";
 charset="UTF-8"


--15136974790.a162f.24690
Date: Tue, 19 Dec 2017 15:31:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104222

--- Comment #2 from Olli Helenius <liff-X3B1VOXEql0@public.gmane.org> ---
Another =E2=80=9Cme too=E2=80=9D. Sorry if this is redunant. On Arch Linux =
with:

> Linux emi 4.14.6-1-ARCH #1 SMP PREEMPT Thu Dec 14 21:26:16 UTC 2017 x86_6=
4 GNU/Linux

Output from `lspci`:

> 01:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GTX =
970] (rev a1) (prog-if 00 [VGA controller])
> 	Subsystem: ASUSTeK Computer Inc. GM204 [GeForce GTX 970]
> 	Flags: bus master, fast devsel, latency 0, IRQ 127
> 	Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
> 	Memory at 2fe0000000 (64-bit, prefetchable) [size=3D256M]
> 	Memory at 2ff0000000 (64-bit, prefetchable) [size=3D32M]
> 	I/O ports at e000 [size=3D128]
> 	Expansion ROM at 000c0000 [disabled] [size=3D128K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: nouveau
> 	Kernel modules: nouveau

Output from `dmesg`:

> [ 5116.198746] nouveau 0000:01:00.0: gr: TRAP ch 3 [103f3eb000 Xwayland[1=
034]]
> [ 5116.198756] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000041
> [ 5116.198760] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000041
> [ 5116.198764] nouveau 0000:01:00.0: gr: GPC0/TPC2/TEX: 80000041
> [ 5116.198770] nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000041
> [ 5116.198774] nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000000
> [ 5116.198782] nouveau 0000:01:00.0: fifo: read fault at 00075d7000 engin=
e 00 [GR] client 15 [GPC0/PE_4] reason 02 [PTE] on channel 3 [103f3eb000 Xw=
ayland[1034]]
> [ 5116.198788] nouveau 0000:01:00.0: fifo: channel 3: killed
> [ 5116.198789] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recov=
ery
> [ 5116.198792] nouveau 0000:01:00.0: fifo: engine 0: scheduled for recove=
ry
> [ 5116.198804] nouveau 0000:01:00.0: gr: TRAP ch 3 [103f3eb000 Xwayland[1=
034]]
> [ 5116.198810] nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000041
> [ 5116.198816] nouveau 0000:01:00.0: gr: GPC3/TPC0/TEX: 80000000
> [ 5116.198820] nouveau 0000:01:00.0: gr: GPC3/TPC1/TEX: 80000000
> [ 5116.198824] nouveau 0000:01:00.0: gr: GPC3/TPC3/TEX: 80000041
> [ 5116.198835] nouveau 0000:01:00.0: gr: TRAP ch 3 [103f3eb000 Xwayland[1=
034]]
> [ 5116.198842] nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000000
> [ 5116.198846] nouveau 0000:01:00.0: gr: GPC1/TPC2/TEX: 80000041
> [ 5116.198848] nouveau 0000:01:00.0: Xwayland[1034]: channel 3 killed!
> [ 5116.214208] nouveau 0000:01:00.0: fifo: write fault at 0000cec000 engi=
ne 05 [BAR2] client 08 [HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channe=
l -1 [103fefd000 unknown]

After a few minutes, this also appears:

> [ 5283.543441] INFO: task kworker/u16:0:6381 blocked for more than 120 se=
conds.
> [ 5283.543450]       Tainted: G         C      4.14.6-1-ARCH #1
> [ 5283.543453] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [ 5283.543456] kworker/u16:0   D    0  6381      2 0x80000000
> [ 5283.543556] Workqueue: events_unbound nv50_disp_atomic_commit_work [no=
uveau]
> [ 5283.543559] Call Trace:
> [ 5283.543572]  ? __schedule+0x290/0x890
> [ 5283.543580]  ? __wake_up_common+0x6d/0x120
> [ 5283.543586]  schedule+0x2f/0x90
> [ 5283.543591]  schedule_timeout+0x208/0x390
> [ 5283.543636]  ? nvkm_ioctl+0x100/0x240 [nouveau]
> [ 5283.543644]  ? dma_fence_default_wait+0x1cc/0x270
> [ 5283.543647]  dma_fence_default_wait+0x1cc/0x270
> [ 5283.543652]  ? dma_fence_release+0xa0/0xa0
> [ 5283.543657]  dma_fence_wait_timeout+0x33/0x100
> [ 5283.543674]  drm_atomic_helper_wait_for_fences+0x5d/0xc0 [drm_kms_help=
er]
> [ 5283.543756]  nv50_disp_atomic_commit_tail+0x55/0x3a70 [nouveau]
> [ 5283.543766]  process_one_work+0x1db/0x410
> [ 5283.543772]  worker_thread+0x2b/0x3d0
> [ 5283.543777]  ? process_one_work+0x410/0x410
> [ 5283.543781]  kthread+0x118/0x130
> [ 5283.543785]  ? kthread_create_on_node+0x70/0x70
> [ 5283.543789]  ret_from_fork+0x25/0x30

and repeats every 120 seconds or so.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15136974790.a162f.24690
Date: Tue, 19 Dec 2017 15:31:19 +0000
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
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GNOME/Wayland desktop freezes when resizing Firefox windo=
w"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104222">bug 10422=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liff&#64;iki.fi" title=3D"Olli Helenius &lt;liff&#64;iki.fi&gt;"> <span cla=
ss=3D"fn">Olli Helenius</span></a>
</span></b>
        <pre>Another =E2=80=9Cme too=E2=80=9D. Sorry if this is redunant. O=
n Arch Linux with:

<span class=3D"quote">&gt; Linux emi 4.14.6-1-ARCH #1 SMP PREEMPT Thu Dec 1=
4 21:26:16 UTC 2017 x86_64 GNU/Linux</span >

Output from `lspci`:

<span class=3D"quote">&gt; 01:00.0 VGA compatible controller: NVIDIA Corpor=
ation GM204 [GeForce GTX 970] (rev a1) (prog-if 00 [VGA controller])
&gt; 	Subsystem: ASUSTeK Computer Inc. GM204 [GeForce GTX 970]
&gt; 	Flags: bus master, fast devsel, latency 0, IRQ 127
&gt; 	Memory at f6000000 (32-bit, non-prefetchable) [size=3D16M]
&gt; 	Memory at 2fe0000000 (64-bit, prefetchable) [size=3D256M]
&gt; 	Memory at 2ff0000000 (64-bit, prefetchable) [size=3D32M]
&gt; 	I/O ports at e000 [size=3D128]
&gt; 	Expansion ROM at 000c0000 [disabled] [size=3D128K]
&gt; 	Capabilities: &lt;access denied&gt;
&gt; 	Kernel driver in use: nouveau
&gt; 	Kernel modules: nouveau</span >

Output from `dmesg`:

<span class=3D"quote">&gt; [ 5116.198746] nouveau 0000:01:00.0: gr: TRAP ch=
 3 [103f3eb000 Xwayland[1034]]
&gt; [ 5116.198756] nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000041
&gt; [ 5116.198760] nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000041
&gt; [ 5116.198764] nouveau 0000:01:00.0: gr: GPC0/TPC2/TEX: 80000041
&gt; [ 5116.198770] nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000041
&gt; [ 5116.198774] nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000000
&gt; [ 5116.198782] nouveau 0000:01:00.0: fifo: read fault at 00075d7000 en=
gine 00 [GR] client 15 [GPC0/PE_4] reason 02 [PTE] on channel 3 [103f3eb000=
 Xwayland[1034]]
&gt; [ 5116.198788] nouveau 0000:01:00.0: fifo: channel 3: killed
&gt; [ 5116.198789] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for re=
covery
&gt; [ 5116.198792] nouveau 0000:01:00.0: fifo: engine 0: scheduled for rec=
overy
&gt; [ 5116.198804] nouveau 0000:01:00.0: gr: TRAP ch 3 [103f3eb000 Xwaylan=
d[1034]]
&gt; [ 5116.198810] nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000041
&gt; [ 5116.198816] nouveau 0000:01:00.0: gr: GPC3/TPC0/TEX: 80000000
&gt; [ 5116.198820] nouveau 0000:01:00.0: gr: GPC3/TPC1/TEX: 80000000
&gt; [ 5116.198824] nouveau 0000:01:00.0: gr: GPC3/TPC3/TEX: 80000041
&gt; [ 5116.198835] nouveau 0000:01:00.0: gr: TRAP ch 3 [103f3eb000 Xwaylan=
d[1034]]
&gt; [ 5116.198842] nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000000
&gt; [ 5116.198846] nouveau 0000:01:00.0: gr: GPC1/TPC2/TEX: 80000041
&gt; [ 5116.198848] nouveau 0000:01:00.0: Xwayland[1034]: channel 3 killed!
&gt; [ 5116.214208] nouveau 0000:01:00.0: fifo: write fault at 0000cec000 e=
ngine 05 [BAR2] client 08 [HOST_CPU_NB] reason 0d [REGION_VIOLATION] on cha=
nnel -1 [103fefd000 unknown]</span >

After a few minutes, this also appears:

<span class=3D"quote">&gt; [ 5283.543441] INFO: task kworker/u16:0:6381 blo=
cked for more than 120 seconds.
&gt; [ 5283.543450]       Tainted: G         C      4.14.6-1-ARCH #1
&gt; [ 5283.543453] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_se=
cs&quot; disables this message.
&gt; [ 5283.543456] kworker/u16:0   D    0  6381      2 0x80000000
&gt; [ 5283.543556] Workqueue: events_unbound nv50_disp_atomic_commit_work =
[nouveau]
&gt; [ 5283.543559] Call Trace:
&gt; [ 5283.543572]  ? __schedule+0x290/0x890
&gt; [ 5283.543580]  ? __wake_up_common+0x6d/0x120
&gt; [ 5283.543586]  schedule+0x2f/0x90
&gt; [ 5283.543591]  schedule_timeout+0x208/0x390
&gt; [ 5283.543636]  ? nvkm_ioctl+0x100/0x240 [nouveau]
&gt; [ 5283.543644]  ? dma_fence_default_wait+0x1cc/0x270
&gt; [ 5283.543647]  dma_fence_default_wait+0x1cc/0x270
&gt; [ 5283.543652]  ? dma_fence_release+0xa0/0xa0
&gt; [ 5283.543657]  dma_fence_wait_timeout+0x33/0x100
&gt; [ 5283.543674]  drm_atomic_helper_wait_for_fences+0x5d/0xc0 [drm_kms_h=
elper]
&gt; [ 5283.543756]  nv50_disp_atomic_commit_tail+0x55/0x3a70 [nouveau]
&gt; [ 5283.543766]  process_one_work+0x1db/0x410
&gt; [ 5283.543772]  worker_thread+0x2b/0x3d0
&gt; [ 5283.543777]  ? process_one_work+0x410/0x410
&gt; [ 5283.543781]  kthread+0x118/0x130
&gt; [ 5283.543785]  ? kthread_create_on_node+0x70/0x70
&gt; [ 5283.543789]  ret_from_fork+0x25/0x30</span >

and repeats every 120 seconds or so.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15136974790.a162f.24690--

--===============1664855196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1664855196==--
