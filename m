From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] page allocation failure: order:5,
	mode:0x240c0c0
Date: Fri, 01 Jan 2016 13:44:52 +0000
Message-ID: <bug-93458-8800-60ojSnsjID@http.bugs.freedesktop.org/>
References: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0083118409=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0083118409==
Content-Type: multipart/alternative; boundary="1451655892.CeDDEBA1.24290"; charset="UTF-8"


--1451655892.CeDDEBA1.24290
Date: Fri, 1 Jan 2016 13:44:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93458

--- Comment #2 from Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> ---
Same here on kernel 4.4.0-rc7, NV86 (GeForce 8500 GT). Right now even glxgears
produces the error:

[160746.465409] glxgears: page allocation failure: order:5, mode:0x26040c0
[160746.465415] CPU: 0 PID: 18218 Comm: glxgears Not tainted 4.4.0-rc7-nouveau
#1
[160746.465416] Hardware name: . ./I-45C(Intel i945GC-ICH7), BIOS 6.00 PG
09/18/2008
[160746.465418]  0000000000000000 000000004a0928fb ffffffff811f4533
00000000026040c0
[160746.465422]  ffffffff810d6eb5 ffff880000000042 0000000000000002
026240c0ffffffe0
[160746.465424]  ffffffff815797a0 0000000000000020 000000004a0928fb
0000000000000002
[160746.465426] Call Trace:
[160746.465434]  [<ffffffff811f4533>] ? dump_stack+0x40/0x5d
[160746.465439]  [<ffffffff810d6eb5>] ? warn_alloc_failed+0xf5/0x150
[160746.465442]  [<ffffffff810d9533>] ? __alloc_pages_nodemask+0x163/0x820
[160746.465446]  [<ffffffff8110661d>] ? cache_alloc_refill+0x2ed/0x530
[160746.465448]  [<ffffffff81106a80>] ? __kmalloc+0x90/0xd0
[160746.465479]  [<ffffffffa0144efb>] ? nvkm_ramht_new+0x3b/0xe0 [nouveau]
[160746.465495]  [<ffffffffa01ab83a>] ? g84_fifo_chan_ctor+0x13a/0x170
[nouveau]
[160746.465508]  [<ffffffffa01ad349>] ? g84_fifo_gpfifo_new+0xb9/0x2e0
[nouveau]
[160746.465521]  [<ffffffffa01977f0>] ? nvkm_udevice_child_get+0x70/0x110
[nouveau]
[160746.465530]  [<ffffffffa01427e7>] ? nvkm_ioctl_new+0x147/0x290 [nouveau]
[160746.465543]  [<ffffffffa0197760>] ? nvkm_udevice_map+0x40/0x40 [nouveau]
[160746.465552]  [<ffffffffa0142e17>] ? nvkm_ioctl+0xf7/0x240 [nouveau]
[160746.465565]  [<ffffffffa01ed198>] ? nouveau_channel_prep+0x1b8/0x2c0
[nouveau]
[160746.465573]  [<ffffffffa0140685>] ? nvif_object_init+0xb5/0x120 [nouveau]
[160746.465584]  [<ffffffffa01ed358>] ? nouveau_channel_new+0xb8/0x680
[nouveau]
[160746.465595]  [<ffffffffa01ec483>] ?
nouveau_abi16_ioctl_channel_alloc+0xd3/0x2d0 [nouveau]
[160746.465603]  [<ffffffffa0068618>] ? drm_copy_field+0x38/0x50 [drm]
[160746.465607]  [<ffffffffa006825c>] ? drm_ioctl+0x12c/0x4b0 [drm]
[160746.465618]  [<ffffffffa01ec3b0>] ? nouveau_abi16_ioctl_setparam+0x10/0x10
[nouveau]
[160746.465629]  [<ffffffffa01d618b>] ? nouveau_drm_ioctl+0x5b/0xb0 [nouveau]
[160746.465641]  [<ffffffffa01d845b>] ? nouveau_compat_ioctl+0xb/0x20 [nouveau]
[160746.465644]  [<ffffffff811501a1>] ? compat_SyS_ioctl+0xb1/0x1110
[160746.465646]  [<ffffffff8110e48b>] ? vfs_getattr_nosec+0x2b/0x30
[160746.465648]  [<ffffffff8110e638>] ? vfs_fstat+0x28/0x50
[160746.465651]  [<ffffffff810026a1>] ? do_fast_syscall_32+0x91/0x140
[160746.465655]  [<ffffffff813d5322>] ? sysenter_flags_fixed+0x8/0x12
[160746.465656] Mem-Info:
[160746.465660] active_anon:32765 inactive_anon:43188 isolated_anon:0
[160746.465660]  active_file:262031 inactive_file:229737 isolated_file:0
[160746.465660]  unevictable:0 dirty:1 writeback:0 unstable:0
[160746.465660]  slab_reclaimable:76470 slab_unreclaimable:6333
[160746.465660]  mapped:28713 shmem:1115 pagetables:919 bounce:0
[160746.465660]  free:174183 free_pcp:96 free_cma:0
[160746.465668] DMA free:13032kB min:32kB low:40kB high:48kB active_anon:64kB
inactive_anon:460kB active_file:1128kB inactive_file:564kB unevictable:0kB
isolated(anon):0kB isolated(file):0kB present:15992kB managed:15908kB
mlocked:0kB dirty:0kB writeback:0kB mapped:608kB shmem:84kB
slab_reclaimable:116kB slab_unreclaimable:64kB kernel_stack:16kB pagetables:4kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[160746.465669] lowmem_reserve[]: 0 3251 3251 3251
[160746.465676] DMA32 free:683700kB min:7280kB low:9100kB high:10920kB
active_anon:130996kB inactive_anon:172292kB active_file:1046996kB
inactive_file:918384kB unevictable:0kB isolated(anon):0kB isolated(file):0kB
present:3390396kB managed:3330656kB mlocked:0kB dirty:4kB writeback:0kB
mapped:114244kB shmem:4376kB slab_reclaimable:305764kB
slab_unreclaimable:25268kB kernel_stack:2896kB pagetables:3672kB unstable:0kB
bounce:0kB free_pcp:384kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
pages_scanned:640 all_unreclaimable? no
[160746.465677] lowmem_reserve[]: 0 0 0 0
[160746.465680] DMA: 6*4kB (UME) 2*8kB (ME) 2*16kB (UM) 3*32kB (UM) 1*64kB (M)
2*128kB (UE) 3*256kB (UME) 3*512kB (UME) 2*1024kB (ME) 2*2048kB (UE) 1*4096kB
(M) = 13032kB
[160746.465692] DMA32: 67543*4kB (UME) 31650*8kB (UME) 7187*16kB (UME)
1124*32kB (UME) 149*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB
0*4096kB = 683868kB
[160746.465700] 493070 total pagecache pages
[160746.465702] 164 pages in swap cache
[160746.465704] Swap cache stats: add 11080, delete 10916, find 520799/521195
[160746.465705] Free swap  = 3695116kB
[160746.465706] Total swap = 3719040kB
[160746.465707] 851597 pages RAM
[160746.465708] 0 pages HighMem/MovableOnly
[160746.465709] 14956 pages reserved

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1451655892.CeDDEBA1.24290
Date: Fri, 1 Jan 2016 13:44:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
              from <span class="vcard"><a class="email" href="mailto:svenjoac&#64;gmx.de" title="Sven Joachim &lt;svenjoac&#64;gmx.de&gt;"> <span class="fn">Sven Joachim</span></a>
</span></b>
        <pre>Same here on kernel 4.4.0-rc7, NV86 (GeForce 8500 GT). Right now even glxgears
produces the error:

[160746.465409] glxgears: page allocation failure: order:5, mode:0x26040c0
[160746.465415] CPU: 0 PID: 18218 Comm: glxgears Not tainted 4.4.0-rc7-nouveau
#1
[160746.465416] Hardware name: . ./I-45C(Intel i945GC-ICH7), BIOS 6.00 PG
09/18/2008
[160746.465418]  0000000000000000 000000004a0928fb ffffffff811f4533
00000000026040c0
[160746.465422]  ffffffff810d6eb5 ffff880000000042 0000000000000002
026240c0ffffffe0
[160746.465424]  ffffffff815797a0 0000000000000020 000000004a0928fb
0000000000000002
[160746.465426] Call Trace:
[160746.465434]  [&lt;ffffffff811f4533&gt;] ? dump_stack+0x40/0x5d
[160746.465439]  [&lt;ffffffff810d6eb5&gt;] ? warn_alloc_failed+0xf5/0x150
[160746.465442]  [&lt;ffffffff810d9533&gt;] ? __alloc_pages_nodemask+0x163/0x820
[160746.465446]  [&lt;ffffffff8110661d&gt;] ? cache_alloc_refill+0x2ed/0x530
[160746.465448]  [&lt;ffffffff81106a80&gt;] ? __kmalloc+0x90/0xd0
[160746.465479]  [&lt;ffffffffa0144efb&gt;] ? nvkm_ramht_new+0x3b/0xe0 [nouveau]
[160746.465495]  [&lt;ffffffffa01ab83a&gt;] ? g84_fifo_chan_ctor+0x13a/0x170
[nouveau]
[160746.465508]  [&lt;ffffffffa01ad349&gt;] ? g84_fifo_gpfifo_new+0xb9/0x2e0
[nouveau]
[160746.465521]  [&lt;ffffffffa01977f0&gt;] ? nvkm_udevice_child_get+0x70/0x110
[nouveau]
[160746.465530]  [&lt;ffffffffa01427e7&gt;] ? nvkm_ioctl_new+0x147/0x290 [nouveau]
[160746.465543]  [&lt;ffffffffa0197760&gt;] ? nvkm_udevice_map+0x40/0x40 [nouveau]
[160746.465552]  [&lt;ffffffffa0142e17&gt;] ? nvkm_ioctl+0xf7/0x240 [nouveau]
[160746.465565]  [&lt;ffffffffa01ed198&gt;] ? nouveau_channel_prep+0x1b8/0x2c0
[nouveau]
[160746.465573]  [&lt;ffffffffa0140685&gt;] ? nvif_object_init+0xb5/0x120 [nouveau]
[160746.465584]  [&lt;ffffffffa01ed358&gt;] ? nouveau_channel_new+0xb8/0x680
[nouveau]
[160746.465595]  [&lt;ffffffffa01ec483&gt;] ?
nouveau_abi16_ioctl_channel_alloc+0xd3/0x2d0 [nouveau]
[160746.465603]  [&lt;ffffffffa0068618&gt;] ? drm_copy_field+0x38/0x50 [drm]
[160746.465607]  [&lt;ffffffffa006825c&gt;] ? drm_ioctl+0x12c/0x4b0 [drm]
[160746.465618]  [&lt;ffffffffa01ec3b0&gt;] ? nouveau_abi16_ioctl_setparam+0x10/0x10
[nouveau]
[160746.465629]  [&lt;ffffffffa01d618b&gt;] ? nouveau_drm_ioctl+0x5b/0xb0 [nouveau]
[160746.465641]  [&lt;ffffffffa01d845b&gt;] ? nouveau_compat_ioctl+0xb/0x20 [nouveau]
[160746.465644]  [&lt;ffffffff811501a1&gt;] ? compat_SyS_ioctl+0xb1/0x1110
[160746.465646]  [&lt;ffffffff8110e48b&gt;] ? vfs_getattr_nosec+0x2b/0x30
[160746.465648]  [&lt;ffffffff8110e638&gt;] ? vfs_fstat+0x28/0x50
[160746.465651]  [&lt;ffffffff810026a1&gt;] ? do_fast_syscall_32+0x91/0x140
[160746.465655]  [&lt;ffffffff813d5322&gt;] ? sysenter_flags_fixed+0x8/0x12
[160746.465656] Mem-Info:
[160746.465660] active_anon:32765 inactive_anon:43188 isolated_anon:0
[160746.465660]  active_file:262031 inactive_file:229737 isolated_file:0
[160746.465660]  unevictable:0 dirty:1 writeback:0 unstable:0
[160746.465660]  slab_reclaimable:76470 slab_unreclaimable:6333
[160746.465660]  mapped:28713 shmem:1115 pagetables:919 bounce:0
[160746.465660]  free:174183 free_pcp:96 free_cma:0
[160746.465668] DMA free:13032kB min:32kB low:40kB high:48kB active_anon:64kB
inactive_anon:460kB active_file:1128kB inactive_file:564kB unevictable:0kB
isolated(anon):0kB isolated(file):0kB present:15992kB managed:15908kB
mlocked:0kB dirty:0kB writeback:0kB mapped:608kB shmem:84kB
slab_reclaimable:116kB slab_unreclaimable:64kB kernel_stack:16kB pagetables:4kB
unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? no
[160746.465669] lowmem_reserve[]: 0 3251 3251 3251
[160746.465676] DMA32 free:683700kB min:7280kB low:9100kB high:10920kB
active_anon:130996kB inactive_anon:172292kB active_file:1046996kB
inactive_file:918384kB unevictable:0kB isolated(anon):0kB isolated(file):0kB
present:3390396kB managed:3330656kB mlocked:0kB dirty:4kB writeback:0kB
mapped:114244kB shmem:4376kB slab_reclaimable:305764kB
slab_unreclaimable:25268kB kernel_stack:2896kB pagetables:3672kB unstable:0kB
bounce:0kB free_pcp:384kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
pages_scanned:640 all_unreclaimable? no
[160746.465677] lowmem_reserve[]: 0 0 0 0
[160746.465680] DMA: 6*4kB (UME) 2*8kB (ME) 2*16kB (UM) 3*32kB (UM) 1*64kB (M)
2*128kB (UE) 3*256kB (UME) 3*512kB (UME) 2*1024kB (ME) 2*2048kB (UE) 1*4096kB
(M) = 13032kB
[160746.465692] DMA32: 67543*4kB (UME) 31650*8kB (UME) 7187*16kB (UME)
1124*32kB (UME) 149*64kB (UM) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB
0*4096kB = 683868kB
[160746.465700] 493070 total pagecache pages
[160746.465702] 164 pages in swap cache
[160746.465704] Swap cache stats: add 11080, delete 10916, find 520799/521195
[160746.465705] Free swap  = 3695116kB
[160746.465706] Total swap = 3719040kB
[160746.465707] 851597 pages RAM
[160746.465708] 0 pages HighMem/MovableOnly
[160746.465709] 14956 pages reserved</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451655892.CeDDEBA1.24290--

--===============0083118409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0083118409==--
