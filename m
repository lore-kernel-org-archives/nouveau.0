From: Zlatko Calusic <zcalusic@bitsync.net>
Subject: Re: [Nouveau] [RFC PATCH] drm/nouveau: use vmalloc for pgt allocation
Date: Tue, 11 Jun 2013 11:51:52 +0200
Message-ID: <51B6F338.9050605@bitsync.net>
References: <1362509833-28968-1-git-send-email-marcin.slusarz@gmail.com> <51B6E6C2.2090407@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <51B6E6C2.2090407@canonical.com>
Sender: stable-owner@vger.kernel.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: Marcin Slusarz <marcin.slusarz@gmail.com>, nouveau@lists.freedesktop.org, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On 11.06.2013 10:58, Maarten Lankhorst wrote:
> Op 05-03-13 19:57, Marcin Slusarz schreef:
>> Page tables on nv50 take 48kB, which can be hard to allocate in one piece.
>> Let's use vmalloc.
>>
>> Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
>> Cc: stable@vger.kernel.org [3.7+]
>> ---
>>   drivers/gpu/drm/nouveau/core/subdev/vm/base.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> index 77c67fc..e66fb77 100644
>> --- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> +++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
>> @@ -362,7 +362,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
>>   	vm->fpde = offset >> (vmm->pgt_bits + 12);
>>   	vm->lpde = (offset + length - 1) >> (vmm->pgt_bits + 12);
>>   
>> -	vm->pgt  = kcalloc(vm->lpde - vm->fpde + 1, sizeof(*vm->pgt), GFP_KERNEL);
>> +	vm->pgt  = vzalloc((vm->lpde - vm->fpde + 1) * sizeof(*vm->pgt));
>>   	if (!vm->pgt) {
>>   		kfree(vm);
>>   		return -ENOMEM;
>> @@ -371,7 +371,7 @@ nouveau_vm_create(struct nouveau_vmmgr *vmm, u64 offset, u64 length,
>>   	ret = nouveau_mm_init(&vm->mm, mm_offset >> 12, mm_length >> 12,
>>   			      block >> 12);
>>   	if (ret) {
>> -		kfree(vm->pgt);
>> +		vfree(vm->pgt);
>>   		kfree(vm);
>>   		return ret;
>>   	}
>> @@ -446,7 +446,7 @@ nouveau_vm_del(struct nouveau_vm *vm)
>>   	}
>>   
>>   	nouveau_mm_fini(&vm->mm);
>> -	kfree(vm->pgt);
>> +	vfree(vm->pgt);
>>   	kfree(vm);
>>   }
> Could this patch be upstreamed?
> 
> I was hitting the same allocation failure on my fermi after keeping my system running for a
> a week, and doing plenty of suspend/resume cycles (16+) in between it was failing an order 6
> allocation, which I assume means it was attempting to allocate 256 kilobyte of physical memory
> contiguously. My system has 16 gigabyte of ram, and had about 4 gb free afterwards when I
> checked, so it wasn't like there was not enough memory. It was probably just too fragmented
> to allocate with kmalloc, while vmalloc doesn't require the memory to be physicallly contiguous.
> 

Same thing here. Except I don't do suspend/resume. Occasionally I get this:

Jun  8 22:29:15 atlas kernel: iceweasel: page allocation failure: order:4, mode:0x10c0d0
Jun  8 22:29:15 atlas kernel: CPU: 1 PID: 15976 Comm: iceweasel Not tainted 3.10.0-rc4+ #1
Jun  8 22:29:15 atlas kernel: Hardware name: System manufacturer System Product Name/P5Q PRO TURBO, BIOS 0602    08/04/2009
Jun  8 22:29:15 atlas kernel: 0000000000000000 ffff8800190a5920 ffffffff81574002 ffff8800190a59a8
Jun  8 22:29:15 atlas kernel: ffffffff810d29b0 0000000000000380 0000000000000010 0000000000000010
Jun  8 22:29:15 atlas kernel: ffff8800190a5978 00000000000003c0 0000001000000001 0000000000000002
Jun  8 22:29:15 atlas kernel: Call Trace:
Jun  8 22:29:15 atlas kernel: [<ffffffff81574002>] dump_stack+0x19/0x1b
Jun  8 22:29:15 atlas kernel: [<ffffffff810d29b0>] warn_alloc_failed+0xf0/0x140
Jun  8 22:29:15 atlas kernel: [<ffffffff810d4a1a>] __alloc_pages_nodemask+0x17a/0x6a0
Jun  8 22:29:15 atlas kernel: [<ffffffff810d4f52>] __get_free_pages+0x12/0x50
Jun  8 22:29:15 atlas kernel: [<ffffffff810fd8ed>] __kmalloc+0xed/0x140
Jun  8 22:29:15 atlas kernel: [<ffffffff8130a9ce>] nouveau_vm_create+0xae/0x140
Jun  8 22:29:15 atlas kernel: [<ffffffff8130c1db>] nv50_vm_create+0x2b/0x30
Jun  8 22:29:15 atlas kernel: [<ffffffff8130aa8a>] nouveau_vm_new+0x2a/0x30
Jun  8 22:29:15 atlas kernel: [<ffffffff81363769>] nouveau_drm_open+0xc9/0x150
Jun  8 22:29:15 atlas kernel: [<ffffffff81070719>] ? ns_capable+0x29/0x50
Jun  8 22:29:15 atlas kernel: [<ffffffff812c7173>] drm_open+0x283/0x6e0
Jun  8 22:29:15 atlas kernel: [<ffffffff812c76d8>] drm_stub_open+0x108/0x1a0
Jun  8 22:29:15 atlas kernel: [<ffffffff81104f46>] chrdev_open+0x96/0x1c0
Jun  8 22:29:15 atlas kernel: [<ffffffff8110b2f2>] ? generic_permission+0xe2/0x100
Jun  8 22:29:15 atlas kernel: [<ffffffff81104eb0>] ? cdev_put+0x20/0x20
Jun  8 22:29:15 atlas kernel: [<ffffffff810feffe>] do_dentry_open.isra.17+0x1ee/0x280
Jun  8 22:29:15 atlas kernel: [<ffffffff810ff179>] finish_open+0x19/0x30
Jun  8 22:29:15 atlas kernel: [<ffffffff8110e1be>] do_last.isra.65+0x26e/0xc30
Jun  8 22:29:15 atlas kernel: [<ffffffff8110b503>] ? inode_permission+0x13/0x50
Jun  8 22:29:15 atlas kernel: [<ffffffff8110b808>] ? link_path_walk+0x68/0x8a0
Jun  8 22:29:15 atlas kernel: [<ffffffff8110ec2e>] path_openat.isra.66+0xae/0x480
Jun  8 22:29:15 atlas kernel: [<ffffffff8110f34c>] do_filp_open+0x3c/0x90
Jun  8 22:29:15 atlas kernel: [<ffffffff8111b52b>] ? __alloc_fd+0xcb/0x120
Jun  8 22:29:15 atlas kernel: [<ffffffff8110025f>] do_sys_open+0xef/0x1d0
Jun  8 22:29:15 atlas kernel: [<ffffffff8110035d>] SyS_open+0x1d/0x20
Jun  8 22:29:15 atlas kernel: [<ffffffff81579492>] system_call_fastpath+0x16/0x1b
Jun  8 22:29:15 atlas kernel: Mem-Info:
Jun  8 22:29:15 atlas kernel: DMA per-cpu:
Jun  8 22:29:15 atlas kernel: CPU    0: hi:    0, btch:   1 usd:   0
Jun  8 22:29:15 atlas kernel: CPU    1: hi:    0, btch:   1 usd:   0
Jun  8 22:29:15 atlas kernel: DMA32 per-cpu:
Jun  8 22:29:15 atlas kernel: CPU    0: hi:  186, btch:  31 usd: 108
Jun  8 22:29:15 atlas kernel: CPU    1: hi:  186, btch:  31 usd:   0
Jun  8 22:29:15 atlas kernel: Normal per-cpu:
Jun  8 22:29:15 atlas kernel: CPU    0: hi:  186, btch:  31 usd:  96
Jun  8 22:29:15 atlas kernel: CPU    1: hi:  186, btch:  31 usd:   0
Jun  8 22:29:15 atlas kernel: active_anon:884379 inactive_anon:7116 isolated_anon:0
Jun  8 22:29:15 atlas kernel: active_file:444168 inactive_file:483902 isolated_file:32
Jun  8 22:29:15 atlas kernel: unevictable:10 dirty:3173 writeback:0 unstable:0
Jun  8 22:29:15 atlas kernel: free:103104 slab_reclaimable:41561 slab_unreclaimable:8207
Jun  8 22:29:15 atlas kernel: mapped:41417 shmem:11137 pagetables:8576 bounce:0
Jun  8 22:29:15 atlas kernel: free_cma:0
Jun  8 22:29:15 atlas kernel: DMA free:15888kB min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:15980kB managed:15896kB mlocked:0kB dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:8kB kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? yes
Jun  8 22:29:15 atlas kernel: lowmem_reserve[]: 0 3237 7960 7960
Jun  8 22:29:15 atlas kernel: DMA32 free:387096kB min:4636kB low:5792kB high:6952kB active_anon:1002804kB inactive_anon:12248kB active_file:823744kB inactive_file:886900kB unevictable:8kB isolated(anon):0kB isolated(file):0kB present:3390912kB managed:3315368kB mlocked:8kB dirty:5264kB writeback:0kB mapped:31200kB shmem:20504kB slab_reclaimable:92620kB slab_unreclaimable:8764kB kernel_stack:352kB pagetables:4704kB unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:108 all_unreclaimable? no
Jun  8 22:29:15 atlas kernel: lowmem_reserve[]: 0 0 4723 4723
Jun  8 22:29:15 atlas kernel: Normal free:9432kB min:6764kB low:8452kB high:10144kB active_anon:2534712kB inactive_anon:16216kB active_file:952928kB inactive_file:1048580kB unevictable:32kB isolated(anon):0kB isolated(file):128kB present:4980736kB managed:4836504kB mlocked:32kB dirty:7428kB writeback:0kB mapped:134468kB shmem:24044kB slab_reclaimable:73624kB slab_unreclaimable:24056kB kernel_stack:3584kB pagetables:29600kB unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:128 all_unreclaimable? no
Jun  8 22:29:15 atlas kernel: lowmem_reserve[]: 0 0 0 0
Jun  8 22:29:15 atlas kernel: DMA: 0*4kB 0*8kB 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (MR) = 15888kB
Jun  8 22:29:15 atlas kernel: DMA32: 7294*4kB (EM) 34492*8kB (UEM) 5096*16kB (UEM) 1*32kB (M) 1*64kB (R) 0*128kB 0*256kB 1*512kB (R) 0*1024kB 0*2048kB 0*4096kB = 387256kB
Jun  8 22:29:15 atlas kernel: Normal: 1787*4kB (UEM) 60*8kB (UEM) 13*16kB (UM) 1*32kB (R) 5*64kB (R) 3*128kB (R) 0*256kB 0*512kB 1*1024kB (R) 0*2048kB 0*4096kB = 9596kB
Jun  8 22:29:15 atlas kernel: 939160 total pagecache pages
Jun  8 22:29:15 atlas kernel: 2097151 pages RAM
Jun  8 22:29:15 atlas kernel: 54796 pages reserved
Jun  8 22:29:15 atlas kernel: 1246398 pages shared
Jun  8 22:29:15 atlas kernel: 1323236 pages non-shared

-- 
Zlatko
