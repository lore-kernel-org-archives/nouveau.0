From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] page allocation failure: order:5,
	mode:0x240c0c0
Date: Sun, 17 Apr 2016 06:32:54 +0000
Message-ID: <bug-93458-8800-qQ6CjD0UlI@http.bugs.freedesktop.org/>
References: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1282337569=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1282337569==
Content-Type: multipart/alternative; boundary="14608747743.6d60a.14919";
 charset="UTF-8"


--14608747743.6d60a.14919
Date: Sun, 17 Apr 2016 06:32:54 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93458

Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |freedesktop-wf/ZkUcLzLDOr/ThvNiZoQ@public.gmane.org
                   |                            |me

--- Comment #5 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
I've run into this exact same failure on Linux kernel 4.4.7-gentoo.

01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1)

systemmonitor: page allocation failure: order:5, mode:0x240c0c0
CPU: 2 PID: 25678 Comm: systemmonitor Not tainted 4.4.7-gentoo #1
Hardware name:                  /D975XBX2, BIOS
BX97520J.86A.2836.2008.0728.1946 07/28/2008
 0000000000000000 ffffffff815e2614 000000000240c0c0 ffff88010005b970
 ffffffff810bbc14 ffff880193810000 0000000000000000 ffffffff81a7cbc0
 0000000000000005 0000000000000040 ffff880193810000 000000000240c0c0
Call Trace:
 [<ffffffff815e2614>] ? dump_stack+0x46/0x59
 [<ffffffff810bbc14>] ? warn_alloc_failed+0xd4/0x120
 [<ffffffff810be22f>] ? __alloc_pages_nodemask+0x16f/0x910
 [<ffffffff810bebb7>] ? alloc_kmem_pages+0x17/0x80
 [<ffffffff810d142f>] ? kmalloc_order+0xf/0x40
 [<ffffffff8135dfcb>] ? nvkm_ramht_new+0x3b/0xe0
 [<ffffffff813bbc8a>] ? g84_fifo_chan_ctor+0x13a/0x170
 [<ffffffff813bd739>] ? g84_fifo_gpfifo_new+0xb9/0x2e0
 [<ffffffff813a8190>] ? nvkm_udevice_child_get+0x60/0xf0
 [<ffffffff8135b99d>] ? nvkm_ioctl_new+0x11d/0x260
 [<ffffffff813a8110>] ? nvkm_udevice_map+0x40/0x40
 [<ffffffff8135bfb7>] ? nvkm_ioctl+0xf7/0x240
 [<ffffffff813599d5>] ? nvif_object_init+0xb5/0x120
 [<ffffffff813fb828>] ? nouveau_channel_new+0xa8/0x660
 [<ffffffff813fa9f3>] ? nouveau_abi16_ioctl_channel_alloc+0xd3/0x2d0
 [<ffffffff8135a1c0>] ? nvkm_client_notify+0x20/0x20
 [<ffffffff813347d9>] ? drm_ioctl+0x119/0x480
 [<ffffffff810e315a>] ? page_add_file_rmap+0x2a/0x50
 [<ffffffff813fa920>] ? nouveau_abi16_ioctl_setparam+0x10/0x10
 [<ffffffff813e4f9b>] ? nouveau_drm_ioctl+0x5b/0xb0
 [<ffffffff811112f3>] ? do_vfs_ioctl+0x293/0x470
 [<ffffffff81033c69>] ? __do_page_fault+0x169/0x380
 [<ffffffff81111506>] ? SyS_ioctl+0x36/0x70
 [<ffffffff815e8a1b>] ? entry_SYSCALL_64_fastpath+0x16/0x6e
Mem-Info:
active_anon:254439 inactive_anon:246298 isolated_anon:0
 active_file:689086 inactive_file:691252 isolated_file:0
 unevictable:44 dirty:24538 writeback:0 unstable:0
 slab_reclaimable:50180 slab_unreclaimable:9054
 mapped:71902 shmem:9819 pagetables:6004 bounce:0
 free:28497 free_pcp:31 free_cma:0
DMA free:15828kB min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15928kB managed:15844kB mlocked:0kB dirty:0kB
writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:16kB
kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
yes
lowmem_reserve[]: 0 3234 7957 7957
DMA32 free:37400kB min:4576kB low:5720kB high:6864kB active_anon:312136kB
inactive_anon:457768kB active_file:1151848kB inactive_file:1153596kB
unevictable:120kB isolated(anon):0kB isolated(file):0kB present:3389592kB
managed:3314852kB mlocked:120kB dirty:26704kB writeback:0kB mapped:122180kB
shmem:15400kB slab_reclaimable:81552kB slab_unreclaimable:13116kB
kernel_stack:2544kB pagetables:9160kB unstable:0kB bounce:0kB free_pcp:4kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 4722 4722
Normal free:60760kB min:6684kB low:8352kB high:10024kB active_anon:705620kB
inactive_anon:527424kB active_file:1604496kB inactive_file:1611412kB
unevictable:56kB isolated(anon):0kB isolated(file):0kB present:4980736kB
managed:4836224kB mlocked:56kB dirty:71448kB writeback:0kB mapped:165428kB
shmem:23876kB slab_reclaimable:119168kB slab_unreclaimable:23084kB
kernel_stack:4976kB pagetables:14856kB unstable:0kB bounce:0kB free_pcp:120kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 0 0
DMA: 1*4kB (U) 0*8kB 1*16kB (U) 0*32kB 1*64kB (U) 1*128kB (U) 1*256kB (U)
0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15828kB
DMA32: 8708*4kB (UME) 334*8kB (UME) 17*16kB (UME) 0*32kB 0*64kB 0*128kB 0*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB = 37776kB
Normal: 15206*4kB (UME) 3*8kB (U) 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB
0*1024kB 0*2048kB 0*4096kB = 60848kB
1390493 total pagecache pages
276 pages in swap cache
Swap cache stats: add 8903, delete 8627, find 314/531
Free swap  = 8354200kB
Total swap = 8388604kB
2096564 pages RAM
0 pages HighMem/MovableOnly
54834 pages reserved


(In reply to Zlatko Calusic from comment #4)
> I've had lots of success using the attached patch. 4 days and still running
> strong, no page allocation failures. But, some core developer should
> probably confirm that using vmalloc instead of kmalloc is ok in that
> function.

I would venture a guess that the memory allocated for a GPU FIFO buffer needs
to be physically continuous, as it will be used for DMA, so using vmalloc is a
bad idea that may lead to incorrect pages being read/written by DMA.

Aside: Does this bug report belong on this bug tracker, or would it be more
appropriate on the kernel bug tracker? This is a problem in the kernel, not in
the DDX.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14608747743.6d60a.14919
Date: Sun, 17 Apr 2016 06:32:54 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:freedesktop&#64;mattwhitlock.name" title="Matt Whitlock &lt;freedesktop&#64;mattwhitlock.name&gt;"> <span class="fn">Matt Whitlock</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>freedesktop&#64;mattwhitlock.name
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;mattwhitlock.name" title="Matt Whitlock &lt;freedesktop&#64;mattwhitlock.name&gt;"> <span class="fn">Matt Whitlock</span></a>
</span></b>
        <pre>I've run into this exact same failure on Linux kernel 4.4.7-gentoo.

01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1)

systemmonitor: page allocation failure: order:5, mode:0x240c0c0
CPU: 2 PID: 25678 Comm: systemmonitor Not tainted 4.4.7-gentoo #1
Hardware name:                  /D975XBX2, BIOS
BX97520J.86A.2836.2008.0728.1946 07/28/2008
 0000000000000000 ffffffff815e2614 000000000240c0c0 ffff88010005b970
 ffffffff810bbc14 ffff880193810000 0000000000000000 ffffffff81a7cbc0
 0000000000000005 0000000000000040 ffff880193810000 000000000240c0c0
Call Trace:
 [&lt;ffffffff815e2614&gt;] ? dump_stack+0x46/0x59
 [&lt;ffffffff810bbc14&gt;] ? warn_alloc_failed+0xd4/0x120
 [&lt;ffffffff810be22f&gt;] ? __alloc_pages_nodemask+0x16f/0x910
 [&lt;ffffffff810bebb7&gt;] ? alloc_kmem_pages+0x17/0x80
 [&lt;ffffffff810d142f&gt;] ? kmalloc_order+0xf/0x40
 [&lt;ffffffff8135dfcb&gt;] ? nvkm_ramht_new+0x3b/0xe0
 [&lt;ffffffff813bbc8a&gt;] ? g84_fifo_chan_ctor+0x13a/0x170
 [&lt;ffffffff813bd739&gt;] ? g84_fifo_gpfifo_new+0xb9/0x2e0
 [&lt;ffffffff813a8190&gt;] ? nvkm_udevice_child_get+0x60/0xf0
 [&lt;ffffffff8135b99d&gt;] ? nvkm_ioctl_new+0x11d/0x260
 [&lt;ffffffff813a8110&gt;] ? nvkm_udevice_map+0x40/0x40
 [&lt;ffffffff8135bfb7&gt;] ? nvkm_ioctl+0xf7/0x240
 [&lt;ffffffff813599d5&gt;] ? nvif_object_init+0xb5/0x120
 [&lt;ffffffff813fb828&gt;] ? nouveau_channel_new+0xa8/0x660
 [&lt;ffffffff813fa9f3&gt;] ? nouveau_abi16_ioctl_channel_alloc+0xd3/0x2d0
 [&lt;ffffffff8135a1c0&gt;] ? nvkm_client_notify+0x20/0x20
 [&lt;ffffffff813347d9&gt;] ? drm_ioctl+0x119/0x480
 [&lt;ffffffff810e315a&gt;] ? page_add_file_rmap+0x2a/0x50
 [&lt;ffffffff813fa920&gt;] ? nouveau_abi16_ioctl_setparam+0x10/0x10
 [&lt;ffffffff813e4f9b&gt;] ? nouveau_drm_ioctl+0x5b/0xb0
 [&lt;ffffffff811112f3&gt;] ? do_vfs_ioctl+0x293/0x470
 [&lt;ffffffff81033c69&gt;] ? __do_page_fault+0x169/0x380
 [&lt;ffffffff81111506&gt;] ? SyS_ioctl+0x36/0x70
 [&lt;ffffffff815e8a1b&gt;] ? entry_SYSCALL_64_fastpath+0x16/0x6e
Mem-Info:
active_anon:254439 inactive_anon:246298 isolated_anon:0
 active_file:689086 inactive_file:691252 isolated_file:0
 unevictable:44 dirty:24538 writeback:0 unstable:0
 slab_reclaimable:50180 slab_unreclaimable:9054
 mapped:71902 shmem:9819 pagetables:6004 bounce:0
 free:28497 free_pcp:31 free_cma:0
DMA free:15828kB min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15928kB managed:15844kB mlocked:0kB dirty:0kB
writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:16kB
kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
yes
lowmem_reserve[]: 0 3234 7957 7957
DMA32 free:37400kB min:4576kB low:5720kB high:6864kB active_anon:312136kB
inactive_anon:457768kB active_file:1151848kB inactive_file:1153596kB
unevictable:120kB isolated(anon):0kB isolated(file):0kB present:3389592kB
managed:3314852kB mlocked:120kB dirty:26704kB writeback:0kB mapped:122180kB
shmem:15400kB slab_reclaimable:81552kB slab_unreclaimable:13116kB
kernel_stack:2544kB pagetables:9160kB unstable:0kB bounce:0kB free_pcp:4kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 4722 4722
Normal free:60760kB min:6684kB low:8352kB high:10024kB active_anon:705620kB
inactive_anon:527424kB active_file:1604496kB inactive_file:1611412kB
unevictable:56kB isolated(anon):0kB isolated(file):0kB present:4980736kB
managed:4836224kB mlocked:56kB dirty:71448kB writeback:0kB mapped:165428kB
shmem:23876kB slab_reclaimable:119168kB slab_unreclaimable:23084kB
kernel_stack:4976kB pagetables:14856kB unstable:0kB bounce:0kB free_pcp:120kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 0 0
DMA: 1*4kB (U) 0*8kB 1*16kB (U) 0*32kB 1*64kB (U) 1*128kB (U) 1*256kB (U)
0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15828kB
DMA32: 8708*4kB (UME) 334*8kB (UME) 17*16kB (UME) 0*32kB 0*64kB 0*128kB 0*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB = 37776kB
Normal: 15206*4kB (UME) 3*8kB (U) 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB
0*1024kB 0*2048kB 0*4096kB = 60848kB
1390493 total pagecache pages
276 pages in swap cache
Swap cache stats: add 8903, delete 8627, find 314/531
Free swap  = 8354200kB
Total swap = 8388604kB
2096564 pages RAM
0 pages HighMem/MovableOnly
54834 pages reserved


(In reply to Zlatko Calusic from <a href="show_bug.cgi?id=93458#c4">comment #4</a>)
<span class="quote">&gt; I've had lots of success using the attached patch. 4 days and still running
&gt; strong, no page allocation failures. But, some core developer should
&gt; probably confirm that using vmalloc instead of kmalloc is ok in that
&gt; function.</span >

I would venture a guess that the memory allocated for a GPU FIFO buffer needs
to be physically continuous, as it will be used for DMA, so using vmalloc is a
bad idea that may lead to incorrect pages being read/written by DMA.

Aside: Does this bug report belong on this bug tracker, or would it be more
appropriate on the kernel bug tracker? This is a problem in the kernel, not in
the DDX.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14608747743.6d60a.14919--

--===============1282337569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1282337569==--
