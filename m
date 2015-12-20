From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] New: page allocation failure: order:5,
	mode:0x240c0c0
Date: Sun, 20 Dec 2015 10:36:34 +0000
Message-ID: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1887750377=="
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


--===============1887750377==
Content-Type: multipart/alternative; boundary="1450607794.Fcf781.23155"; charset="UTF-8"


--1450607794.Fcf781.23155
Date: Sun, 20 Dec 2015 10:36:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93458

            Bug ID: 93458
           Summary: page allocation failure: order:5, mode:0x240c0c0
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: zcalusic-7aYyyD3GOf7R7s880joybQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Kernel 4.4.0-rc5+, G94. The below failed allocation happens pretty often, with
various applications like Xorg, iceweasel, icedove, mplayer, qpdfview. The
order 5 is a pretty big contiguous allocation, if memory is fragmented the
linux kernel will give up pretty fast (if the order is above 3, IIRC). Maybe
somewhere kmalloc should be replaced with vmalloc? Didn't see any of these
errors in kernel 4.2.0.

soffice.bin: page allocation failure: order:5, mode:0x240c0c0
CPU: 1 PID: 22830 Comm: soffice.bin Tainted: G        W       4.4.0-rc5+ #1
Hardware name: System manufacturer System Product Name/P5Q PRO TURBO, BIOS 0701
   10/08/2012
 0000000000000005 ffff8801357ef840 ffffffff812f4509 000000000240c0c0
 ffff8801357ef8c8 ffffffff8114d2c4 0000000081a04c80 ffffffff81a058b0
 ffff8801357ef890 0242c0c000000020 0000000000000042 0000000000000000
Call Trace:
 [<ffffffff812f4509>] dump_stack+0x4b/0x72
 [<ffffffff8114d2c4>] warn_alloc_failed+0xd4/0x120
 [<ffffffff8114f853>] __alloc_pages_nodemask+0x103/0x780
 [<ffffffff811500d2>] alloc_kmem_pages+0x12/0x20
 [<ffffffff81161a03>] kmalloc_order+0x13/0x40
 [<ffffffff8117a517>] __kmalloc+0xb7/0xf0
 [<ffffffff813e87b0>] nvkm_ramht_new+0x40/0xf0
 [<ffffffff8144ff40>] g84_fifo_chan_ctor+0x140/0x170
 [<ffffffff81451b87>] g84_fifo_gpfifo_new+0xc7/0x300
 [<ffffffff8143c366>] ? nvkm_disp_class_get+0x26/0x60
 [<ffffffff81449d02>] nvkm_fifo_class_new+0x12/0x20
 [<ffffffff8143baf1>] nvkm_udevice_child_new+0x21/0x30
 [<ffffffff813e5f8e>] nvkm_ioctl_new+0x10e/0x260
 [<ffffffff8143bad0>] ? nvkm_udevice_map+0x40/0x40
 [<ffffffff813e6602>] nvkm_ioctl+0x102/0x250
 [<ffffffff8147d90d>] nvkm_client_ioctl+0xd/0x10
 [<ffffffff813e38cc>] nvif_object_ioctl+0x3c/0x50
 [<ffffffff813e3e7d>] nvif_object_init+0xbd/0x130
 [<ffffffff81492866>] nouveau_channel_new+0xa6/0x630
 [<ffffffff813e4198>] ? nvif_device_init+0x28/0x30
 [<ffffffff81491a2a>] nouveau_abi16_ioctl_channel_alloc+0xda/0x2d0
 [<ffffffff813be0ad>] ? drm_copy_field+0x3d/0x60
 [<ffffffff813bdc9e>] drm_ioctl+0x13e/0x510
 [<ffffffff81491950>] ? nouveau_abi16_ioctl_setparam+0x10/0x10
 [<ffffffff8147b6c3>] nouveau_drm_ioctl+0x63/0xc0
 [<ffffffff8118ff33>] do_vfs_ioctl+0x283/0x460
 [<ffffffff81079d1e>] ? __do_page_fault+0x16e/0x350
 [<ffffffff8119014c>] SyS_ioctl+0x3c/0x70
 [<ffffffff816f6557>] entry_SYSCALL_64_fastpath+0x12/0x66
Mem-Info:
active_anon:317858 inactive_anon:24125 isolated_anon:0
 active_file:651188 inactive_file:665467 isolated_file:0
 unevictable:8 dirty:87 writeback:0 unstable:0
 slab_reclaimable:334053 slab_unreclaimable:14431
 mapped:105321 shmem:34094 pagetables:8218 bounce:0
 free:14592 free_pcp:30 free_cma:0
DMA free:15888kB min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15980kB managed:15896kB mlocked:0kB dirty:0kB
writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:8kB
kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
yes
lowmem_reserve[]: 0 3235 7959 7959
DMA32 free:29480kB min:4636kB low:5792kB high:6952kB active_anon:510136kB
inactive_anon:40212kB active_file:1038872kB inactive_file:1060372kB
unevictable:32kB isolated(anon):0kB isolated(file):0kB present:3390912kB
managed:3314444kB mlocked:32kB dirty:68kB writeback:0kB mapped:171940kB
shmem:55828kB slab_reclaimable:589856kB slab_unreclaimable:18792kB
kernel_stack:3008kB pagetables:12812kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 4723 4723
Normal free:13000kB min:6768kB low:8460kB high:10152kB active_anon:761296kB
inactive_anon:56288kB active_file:1565880kB inactive_file:1601496kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:4980736kB
managed:4836480kB mlocked:0kB dirty:280kB writeback:0kB mapped:249344kB
shmem:80548kB slab_reclaimable:746356kB slab_unreclaimable:38924kB
kernel_stack:5728kB pagetables:20060kB unstable:0kB bounce:0kB free_pcp:120kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 0 0
DMA: 0*4kB 0*8kB 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15888kB
DMA32: 1691*4kB (UME) 2651*8kB (UME) 50*16kB (UME) 9*32kB (ME) 7*64kB (E)
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 29508kB
Normal: 2315*4kB (UME) 167*8kB (UME) 117*16kB (UME) 8*32kB (UE) 3*64kB (E)
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 12916kB
1350813 total pagecache pages
2096907 pages RAM
0 pages HighMem/MovableOnly
55202 pages reserved

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450607794.Fcf781.23155
Date: Sun, 20 Dec 2015 10:36:34 +0000
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
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">93458</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>page allocation failure: order:5, mode:0x240c0c0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>normal
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
          <td>zcalusic&#64;bitsync.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Kernel 4.4.0-rc5+, G94. The below failed allocation happens pretty often, with
various applications like Xorg, iceweasel, icedove, mplayer, qpdfview. The
order 5 is a pretty big contiguous allocation, if memory is fragmented the
linux kernel will give up pretty fast (if the order is above 3, IIRC). Maybe
somewhere kmalloc should be replaced with vmalloc? Didn't see any of these
errors in kernel 4.2.0.

soffice.bin: page allocation failure: order:5, mode:0x240c0c0
CPU: 1 PID: 22830 Comm: soffice.bin Tainted: G        W       4.4.0-rc5+ #1
Hardware name: System manufacturer System Product Name/P5Q PRO TURBO, BIOS 0701
   10/08/2012
 0000000000000005 ffff8801357ef840 ffffffff812f4509 000000000240c0c0
 ffff8801357ef8c8 ffffffff8114d2c4 0000000081a04c80 ffffffff81a058b0
 ffff8801357ef890 0242c0c000000020 0000000000000042 0000000000000000
Call Trace:
 [&lt;ffffffff812f4509&gt;] dump_stack+0x4b/0x72
 [&lt;ffffffff8114d2c4&gt;] warn_alloc_failed+0xd4/0x120
 [&lt;ffffffff8114f853&gt;] __alloc_pages_nodemask+0x103/0x780
 [&lt;ffffffff811500d2&gt;] alloc_kmem_pages+0x12/0x20
 [&lt;ffffffff81161a03&gt;] kmalloc_order+0x13/0x40
 [&lt;ffffffff8117a517&gt;] __kmalloc+0xb7/0xf0
 [&lt;ffffffff813e87b0&gt;] nvkm_ramht_new+0x40/0xf0
 [&lt;ffffffff8144ff40&gt;] g84_fifo_chan_ctor+0x140/0x170
 [&lt;ffffffff81451b87&gt;] g84_fifo_gpfifo_new+0xc7/0x300
 [&lt;ffffffff8143c366&gt;] ? nvkm_disp_class_get+0x26/0x60
 [&lt;ffffffff81449d02&gt;] nvkm_fifo_class_new+0x12/0x20
 [&lt;ffffffff8143baf1&gt;] nvkm_udevice_child_new+0x21/0x30
 [&lt;ffffffff813e5f8e&gt;] nvkm_ioctl_new+0x10e/0x260
 [&lt;ffffffff8143bad0&gt;] ? nvkm_udevice_map+0x40/0x40
 [&lt;ffffffff813e6602&gt;] nvkm_ioctl+0x102/0x250
 [&lt;ffffffff8147d90d&gt;] nvkm_client_ioctl+0xd/0x10
 [&lt;ffffffff813e38cc&gt;] nvif_object_ioctl+0x3c/0x50
 [&lt;ffffffff813e3e7d&gt;] nvif_object_init+0xbd/0x130
 [&lt;ffffffff81492866&gt;] nouveau_channel_new+0xa6/0x630
 [&lt;ffffffff813e4198&gt;] ? nvif_device_init+0x28/0x30
 [&lt;ffffffff81491a2a&gt;] nouveau_abi16_ioctl_channel_alloc+0xda/0x2d0
 [&lt;ffffffff813be0ad&gt;] ? drm_copy_field+0x3d/0x60
 [&lt;ffffffff813bdc9e&gt;] drm_ioctl+0x13e/0x510
 [&lt;ffffffff81491950&gt;] ? nouveau_abi16_ioctl_setparam+0x10/0x10
 [&lt;ffffffff8147b6c3&gt;] nouveau_drm_ioctl+0x63/0xc0
 [&lt;ffffffff8118ff33&gt;] do_vfs_ioctl+0x283/0x460
 [&lt;ffffffff81079d1e&gt;] ? __do_page_fault+0x16e/0x350
 [&lt;ffffffff8119014c&gt;] SyS_ioctl+0x3c/0x70
 [&lt;ffffffff816f6557&gt;] entry_SYSCALL_64_fastpath+0x12/0x66
Mem-Info:
active_anon:317858 inactive_anon:24125 isolated_anon:0
 active_file:651188 inactive_file:665467 isolated_file:0
 unevictable:8 dirty:87 writeback:0 unstable:0
 slab_reclaimable:334053 slab_unreclaimable:14431
 mapped:105321 shmem:34094 pagetables:8218 bounce:0
 free:14592 free_pcp:30 free_cma:0
DMA free:15888kB min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15980kB managed:15896kB mlocked:0kB dirty:0kB
writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:8kB
kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
yes
lowmem_reserve[]: 0 3235 7959 7959
DMA32 free:29480kB min:4636kB low:5792kB high:6952kB active_anon:510136kB
inactive_anon:40212kB active_file:1038872kB inactive_file:1060372kB
unevictable:32kB isolated(anon):0kB isolated(file):0kB present:3390912kB
managed:3314444kB mlocked:32kB dirty:68kB writeback:0kB mapped:171940kB
shmem:55828kB slab_reclaimable:589856kB slab_unreclaimable:18792kB
kernel_stack:3008kB pagetables:12812kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 4723 4723
Normal free:13000kB min:6768kB low:8460kB high:10152kB active_anon:761296kB
inactive_anon:56288kB active_file:1565880kB inactive_file:1601496kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:4980736kB
managed:4836480kB mlocked:0kB dirty:280kB writeback:0kB mapped:249344kB
shmem:80548kB slab_reclaimable:746356kB slab_unreclaimable:38924kB
kernel_stack:5728kB pagetables:20060kB unstable:0kB bounce:0kB free_pcp:120kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
no
lowmem_reserve[]: 0 0 0 0
DMA: 0*4kB 0*8kB 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15888kB
DMA32: 1691*4kB (UME) 2651*8kB (UME) 50*16kB (UME) 9*32kB (ME) 7*64kB (E)
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 29508kB
Normal: 2315*4kB (UME) 167*8kB (UME) 117*16kB (UME) 8*32kB (UE) 3*64kB (E)
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 12916kB
1350813 total pagecache pages
2096907 pages RAM
0 pages HighMem/MovableOnly
55202 pages reserved</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450607794.Fcf781.23155--

--===============1887750377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1887750377==--
