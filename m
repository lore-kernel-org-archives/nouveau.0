From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] page allocation failure: order:5,
	mode:0x240c0c0
Date: Wed, 30 Dec 2015 21:11:22 +0000
Message-ID: <bug-93458-8800-Ix7s5UUQJO@http.bugs.freedesktop.org/>
References: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1713469541=="
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


--===============1713469541==
Content-Type: multipart/alternative; boundary="1451509882.DEE07C1.14109"; charset="UTF-8"


--1451509882.DEE07C1.14109
Date: Wed, 30 Dec 2015 21:11:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93458

--- Comment #1 from Stefan-W. Hahn <stefan.hahn-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
I can confirm this problem also for Kernel 4.3.3:

commit 35483418917d63df90bae5b2d0b7b047d7ed8ec7
Author: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Date:   Mon Dec 14 21:41:43 2015 -0800

    Linux 4.3.3

running nouveau with:
VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GTS] (rev a1)

when starting firefox (44.04b):

 firefox: page allocation failure: order:5, mode:0x2040d0
 CPU: 2 PID: 12962 Comm: firefox Tainted: G           O    4.3.3+ #13
 Hardware name: ASUSTEK COMPUTER INC P5W DH Deluxe/P5W DH Deluxe, BIOS 3002   
07/22/2010
  0000000000000000 ffff8800a38ef6a8 ffffffff8122dda4 ffff8801bfd0f018
  00000000002040d0 ffff8800a38ef738 ffffffff811164db 00000000000007c0
  ffffffff81629a38 ffff880000000042 0000000000000286 0000000000000008
 Call Trace:
  [<ffffffff8122dda4>] dump_stack+0x4c/0x78
  [<ffffffff811164db>] warn_alloc_failed+0xdb/0x130
  [<ffffffff811194b3>] __alloc_pages_nodemask+0x713/0x800
  [<ffffffff81150f51>] cache_alloc_refill+0x341/0x5f0
  [<ffffffff8115173d>] __kmalloc+0x10d/0x230
  [<ffffffffa09d6511>] ? nvkm_ramht_new+0x41/0x100 [nouveau]
  [<ffffffffa09d6511>] nvkm_ramht_new+0x41/0x100 [nouveau]
  [<ffffffffa0a415af>] g84_fifo_chan_ctor+0x14f/0x180 [nouveau]
  [<ffffffffa0a433ac>] g84_fifo_gpfifo_new+0xdc/0x320 [nouveau]
  [<ffffffffa0a2c8a3>] ? nvkm_disp_class_get+0x33/0x70 [nouveau]
  [<ffffffffa0a3ad57>] nvkm_fifo_class_new+0x17/0x20 [nouveau]
  [<ffffffffa0a2bf96>] nvkm_udevice_child_new+0x26/0x30 [nouveau]
  [<ffffffffa09d3a02>] nvkm_ioctl_new+0x132/0x2a0 [nouveau]
  [<ffffffffa0a2bf70>] ? nvkm_udevice_map+0x60/0x60 [nouveau]
  [<ffffffffa09d4160>] nvkm_ioctl+0x150/0x250 [nouveau]
  [<ffffffffa0a701a2>] nvkm_client_ioctl+0x12/0x20 [nouveau]
  [<ffffffffa09d1043>] nvif_object_ioctl+0x43/0x50 [nouveau]
  [<ffffffffa09d15e4>] nvif_object_init+0xd4/0x140 [nouveau]
  [<ffffffffa0a8632b>] nouveau_channel_new+0xbb/0x680 [nouveau]
  [<ffffffffa0a85523>] nouveau_abi16_ioctl_channel_alloc+0x123/0x340 [nouveau]
  [<ffffffffa03358ad>] drm_ioctl+0x2ad/0x4a0 [drm]
  [<ffffffff81111297>] ? unlock_page+0x27/0x30
  [<ffffffffa0a85400>] ? nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
  [<ffffffffa0a6e527>] nouveau_drm_ioctl+0x67/0xd0 [nouveau]
  [<ffffffff81170b53>] do_vfs_ioctl+0x83/0x500
  [<ffffffff810414c4>] ? __do_page_fault+0x184/0x390
  [<ffffffff8117101c>] SyS_ioctl+0x4c/0x90
  [<ffffffff814178d7>] entry_SYSCALL_64_fastpath+0x12/0x6a
 Mem-Info:
 active_anon:64168 inactive_anon:104618 isolated_anon:0
  active_file:212131 inactive_file:200223 isolated_file:0
  unevictable:0 dirty:19221 writeback:0 unstable:0
  slab_reclaimable:859742 slab_unreclaimable:17819
  mapped:26813 shmem:100 pagetables:5377 bounce:0
  free:38731 free_pcp:79 free_cma:0
 DMA free:15908kB min:24kB low:28kB high:36kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15992kB managed:15908kB mlocked:0kB dirty:0kB
writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:0kB
kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
yes
 lowmem_reserve[]: 0 2984 5947 5947
 DMA32 free:71412kB min:4944kB low:6180kB high:7416kB active_anon:130456kB
inactive_anon:208916kB active_file:425800kB inactive_file:400368kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:3128832kB
managed:3056324kB mlocked:0kB dirty:39152kB writeback:0kB mapped:53632kB
shmem:164kB slab_reclaimable:1729508kB slab_unreclaimable:32416kB
kernel_stack:3216kB pagetables:10476kB unstable:0kB bounce:0kB free_pcp:180kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:260
all_unreclaimable? no
 lowmem_reserve[]: 0 0 2962 2962
 Normal free:67604kB min:4908kB low:6132kB high:7360kB active_anon:126216kB
inactive_anon:209556kB active_file:422724kB inactive_file:400524kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:3145728kB
managed:3033980kB mlocked:0kB dirty:37732kB writeback:0kB mapped:53620kB
shmem:236kB slab_reclaimable:1709460kB slab_unreclaimable:38860kB
kernel_stack:4160kB pagetables:11032kB unstable:0kB bounce:0kB free_pcp:136kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:260
all_unreclaimable? no
 lowmem_reserve[]: 0 0 0 0
 DMA: 1*4kB (U) 0*8kB 0*16kB 1*32kB (U) 2*64kB (U) 1*128kB (U) 1*256kB (U)
0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15908kB
 DMA32: 8515*4kB (UEM) 4254*8kB (UEM) 221*16kB (UEM) 9*32kB (EM) 0*64kB 0*128kB
0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 71916kB
 Normal: 13336*4kB (UEM) 1687*8kB (UEM) 37*16kB (UEM) 18*32kB (M) 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 68008kB
 417445 total pagecache pages
 4935 pages in swap cache
 Swap cache stats: add 682285, delete 677350, find 976311/1124043
 Free swap  = 24652224kB
 Total swap = 25165812kB
 1572638 pages RAM
 0 pages HighMem/MovableOnly
 46085 pages reserved
 0 pages hwpoisoned

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1451509882.DEE07C1.14109
Date: Wed, 30 Dec 2015 21:11:22 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
              from <span class="vcard"><a class="email" href="mailto:stefan.hahn&#64;online.de" title="Stefan-W. Hahn &lt;stefan.hahn&#64;online.de&gt;"> <span class="fn">Stefan-W. Hahn</span></a>
</span></b>
        <pre>I can confirm this problem also for Kernel 4.3.3:

commit 35483418917d63df90bae5b2d0b7b047d7ed8ec7
Author: Greg Kroah-Hartman &lt;<a href="mailto:gregkh&#64;linuxfoundation.org">gregkh&#64;linuxfoundation.org</a>&gt;
Date:   Mon Dec 14 21:41:43 2015 -0800

    Linux 4.3.3

running nouveau with:
VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GTS] (rev a1)

when starting firefox (44.04b):

 firefox: page allocation failure: order:5, mode:0x2040d0
 CPU: 2 PID: 12962 Comm: firefox Tainted: G           O    4.3.3+ #13
 Hardware name: ASUSTEK COMPUTER INC P5W DH Deluxe/P5W DH Deluxe, BIOS 3002   
07/22/2010
  0000000000000000 ffff8800a38ef6a8 ffffffff8122dda4 ffff8801bfd0f018
  00000000002040d0 ffff8800a38ef738 ffffffff811164db 00000000000007c0
  ffffffff81629a38 ffff880000000042 0000000000000286 0000000000000008
 Call Trace:
  [&lt;ffffffff8122dda4&gt;] dump_stack+0x4c/0x78
  [&lt;ffffffff811164db&gt;] warn_alloc_failed+0xdb/0x130
  [&lt;ffffffff811194b3&gt;] __alloc_pages_nodemask+0x713/0x800
  [&lt;ffffffff81150f51&gt;] cache_alloc_refill+0x341/0x5f0
  [&lt;ffffffff8115173d&gt;] __kmalloc+0x10d/0x230
  [&lt;ffffffffa09d6511&gt;] ? nvkm_ramht_new+0x41/0x100 [nouveau]
  [&lt;ffffffffa09d6511&gt;] nvkm_ramht_new+0x41/0x100 [nouveau]
  [&lt;ffffffffa0a415af&gt;] g84_fifo_chan_ctor+0x14f/0x180 [nouveau]
  [&lt;ffffffffa0a433ac&gt;] g84_fifo_gpfifo_new+0xdc/0x320 [nouveau]
  [&lt;ffffffffa0a2c8a3&gt;] ? nvkm_disp_class_get+0x33/0x70 [nouveau]
  [&lt;ffffffffa0a3ad57&gt;] nvkm_fifo_class_new+0x17/0x20 [nouveau]
  [&lt;ffffffffa0a2bf96&gt;] nvkm_udevice_child_new+0x26/0x30 [nouveau]
  [&lt;ffffffffa09d3a02&gt;] nvkm_ioctl_new+0x132/0x2a0 [nouveau]
  [&lt;ffffffffa0a2bf70&gt;] ? nvkm_udevice_map+0x60/0x60 [nouveau]
  [&lt;ffffffffa09d4160&gt;] nvkm_ioctl+0x150/0x250 [nouveau]
  [&lt;ffffffffa0a701a2&gt;] nvkm_client_ioctl+0x12/0x20 [nouveau]
  [&lt;ffffffffa09d1043&gt;] nvif_object_ioctl+0x43/0x50 [nouveau]
  [&lt;ffffffffa09d15e4&gt;] nvif_object_init+0xd4/0x140 [nouveau]
  [&lt;ffffffffa0a8632b&gt;] nouveau_channel_new+0xbb/0x680 [nouveau]
  [&lt;ffffffffa0a85523&gt;] nouveau_abi16_ioctl_channel_alloc+0x123/0x340 [nouveau]
  [&lt;ffffffffa03358ad&gt;] drm_ioctl+0x2ad/0x4a0 [drm]
  [&lt;ffffffff81111297&gt;] ? unlock_page+0x27/0x30
  [&lt;ffffffffa0a85400&gt;] ? nouveau_abi16_ioctl_setparam+0x10/0x10 [nouveau]
  [&lt;ffffffffa0a6e527&gt;] nouveau_drm_ioctl+0x67/0xd0 [nouveau]
  [&lt;ffffffff81170b53&gt;] do_vfs_ioctl+0x83/0x500
  [&lt;ffffffff810414c4&gt;] ? __do_page_fault+0x184/0x390
  [&lt;ffffffff8117101c&gt;] SyS_ioctl+0x4c/0x90
  [&lt;ffffffff814178d7&gt;] entry_SYSCALL_64_fastpath+0x12/0x6a
 Mem-Info:
 active_anon:64168 inactive_anon:104618 isolated_anon:0
  active_file:212131 inactive_file:200223 isolated_file:0
  unevictable:0 dirty:19221 writeback:0 unstable:0
  slab_reclaimable:859742 slab_unreclaimable:17819
  mapped:26813 shmem:100 pagetables:5377 bounce:0
  free:38731 free_pcp:79 free_cma:0
 DMA free:15908kB min:24kB low:28kB high:36kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15992kB managed:15908kB mlocked:0kB dirty:0kB
writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:0kB
kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable?
yes
 lowmem_reserve[]: 0 2984 5947 5947
 DMA32 free:71412kB min:4944kB low:6180kB high:7416kB active_anon:130456kB
inactive_anon:208916kB active_file:425800kB inactive_file:400368kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:3128832kB
managed:3056324kB mlocked:0kB dirty:39152kB writeback:0kB mapped:53632kB
shmem:164kB slab_reclaimable:1729508kB slab_unreclaimable:32416kB
kernel_stack:3216kB pagetables:10476kB unstable:0kB bounce:0kB free_pcp:180kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:260
all_unreclaimable? no
 lowmem_reserve[]: 0 0 2962 2962
 Normal free:67604kB min:4908kB low:6132kB high:7360kB active_anon:126216kB
inactive_anon:209556kB active_file:422724kB inactive_file:400524kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:3145728kB
managed:3033980kB mlocked:0kB dirty:37732kB writeback:0kB mapped:53620kB
shmem:236kB slab_reclaimable:1709460kB slab_unreclaimable:38860kB
kernel_stack:4160kB pagetables:11032kB unstable:0kB bounce:0kB free_pcp:136kB
local_pcp:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:260
all_unreclaimable? no
 lowmem_reserve[]: 0 0 0 0
 DMA: 1*4kB (U) 0*8kB 0*16kB 1*32kB (U) 2*64kB (U) 1*128kB (U) 1*256kB (U)
0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (M) = 15908kB
 DMA32: 8515*4kB (UEM) 4254*8kB (UEM) 221*16kB (UEM) 9*32kB (EM) 0*64kB 0*128kB
0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 71916kB
 Normal: 13336*4kB (UEM) 1687*8kB (UEM) 37*16kB (UEM) 18*32kB (M) 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 68008kB
 417445 total pagecache pages
 4935 pages in swap cache
 Swap cache stats: add 682285, delete 677350, find 976311/1124043
 Free swap  = 24652224kB
 Total swap = 25165812kB
 1572638 pages RAM
 0 pages HighMem/MovableOnly
 46085 pages reserved
 0 pages hwpoisoned</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451509882.DEE07C1.14109--

--===============1713469541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1713469541==--
