From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: 2.6.39-rc6, nouveau: unload trips on freed memory (SLUB poison)
Date: Thu, 5 May 2011 22:19:22 +0200
Message-ID: <20110505221922.402da0f2@neptune.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

With 2.6.39-rc6 I'm hitting the following (relevant part from objdump of
drm_mm.o at bottom).
Some part of node passed to drm_mm_remove_node() is being use after free
and hits SLUB poison.

Bruno


[  328.447498] drm: unregistered panic notifier
[  328.447648] [drm] nouveau 0000:02:00.0: 0xAFD8: Parsing digital output script table
[  328.448642] [drm] nouveau 0000:02:00.0: Restoring VGA fonts
[  328.450949] [drm:drm_mm_takedown] *ERROR* Memory manager not clean. Delaying takedown
[  328.451141] BUG: unable to handle kernel paging request at 6b6b6b6f
[  328.451275] IP: [<c124d39a>] drm_mm_remove_node+0x5a/0xc0
[  328.451391] *pde = 00000000 
[  328.451479] Oops: 0002 [#1] 
       previous Oops was complaint about CAP_SYS_ADMIN versus CAP_SYSLOG

[  328.451566] last sysfs file: /sys/devices/platform/w83627hf.656/temp3_input
[  328.451625] Modules linked in: nouveau(-) ttm drm_kms_helper video nfs lockd nfs_acl sunrpc snd_intel8x0 snd_ac97_codec ac97_bus snd_pcm pcspkr snd_timer snd snd_page_alloc
[  328.452361] 
[  328.452410] Pid: 1740, comm: rmmod Tainted: G        W   2.6.39-rc6-jupiter-00001-g443badf-dirty #11 NVIDIA Corporation. nFORCE-MCP/MS-6373
[  328.452594] EIP: 0060:[<c124d39a>] EFLAGS: 00010202 CPU: 0
[  328.452650] EIP is at drm_mm_remove_node+0x5a/0xc0
[  328.452703] EAX: da4dd240 EBX: dcf44be0 ECX: dcf44bd0 EDX: dcf44bd8
[  328.452759] ESI: 6b6b6b6b EDI: 6b6b6b6b EBP: dd64fdb8 ESP: dd64fdac
[  328.452815]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[  328.452870] Process rmmod (pid: 1740, ti=dd64e000 task=dd7fe120 task.ti=dd64e000)
[  328.452931] Stack:
[  328.452978]  da4dd240 dcf44bd0 da4dd150 dd64fdc8 c124d417 dbebfb04 00000000 dd64fdd4
[  328.453360]  deb9f281 00000090 dd64fde0 deb99853 dbebfad0 dd64fdf0 deb99b5e dbf00148
[  328.453717]  dbebfad0 dd64fe18 deb9beed 00000000 00000000 def5e632 00004d98 00000000
[  328.454099] Call Trace:
[  328.454153]  [<c124d417>] drm_mm_put_block+0x17/0x50
[  328.454223]  [<deb9f281>] ttm_bo_man_put_node+0x11/0x20 [ttm]
[  328.454283]  [<deb99853>] ttm_bo_mem_put+0x23/0x30 [ttm]
[  328.454364]  [<deb99b5e>] ttm_bo_cleanup_memtype_use+0x2e/0x60 [ttm]
[  328.454425]  [<deb9beed>] ttm_bo_release+0x17d/0x1b0 [ttm]
[  328.454516]  [<def5e632>] ? nouveau_gpuobj_takedown+0x92/0x100 [nouveau]
[  328.454578]  [<deb9bd70>] ? ttm_bo_create+0xf0/0xf0 [ttm]
[  328.454639]  [<c11bd8ec>] kref_put+0x2c/0x60
[  328.454697]  [<deb99aa8>] ttm_bo_unref+0x18/0x20 [ttm]
[  328.454762]  [<def5dd77>] nouveau_mem_vram_fini+0x37/0xa0 [nouveau]
[  328.454829]  [<def59c85>] nouveau_unload+0xd5/0x150 [nouveau]
[  328.454888]  [<c1248e03>] drm_put_dev+0xb3/0x1c0
[  328.454953]  [<def59010>] nouveau_pci_remove+0x10/0x20 [nouveau]
[  328.455010]  [<c11d0baf>] pci_device_remove+0x3f/0xf0
[  328.455070]  [<c12611cb>] __device_release_driver+0x4b/0xa0
[  328.455126]  [<c1261297>] driver_detach+0x77/0x80
[  328.455181]  [<c126057b>] bus_remove_driver+0x5b/0xa0
[  328.455236]  [<c1261ae6>] driver_unregister+0x46/0x80
[  328.455314]  [<c110087f>] ? sysfs_remove_file+0xf/0x20
[  328.455369]  [<c11d0e4a>] pci_unregister_driver+0x2a/0x70
[  328.455438]  [<c124acaf>] drm_pci_exit+0x7f/0x90
[  328.455506]  [<defd5f17>] nouveau_exit+0x1b/0x22 [nouveau]
[  328.455564]  [<c105cdbb>] sys_delete_module+0x19b/0x1f0
[  328.455622]  [<c10a42d2>] ? do_munmap+0x212/0x2f0
[  328.455678]  [<c13971d7>] sysenter_do_call+0x12/0x26
[  328.455731] Code: 8b 70 08 8b 58 0c 89 5e 04 89 33 c7 40 08 00 01 10 00 c7 40 0c 00 02 20 00 0f b6 5a 10 f6 c3 01 74 57 8b 7a 08 8b 72 0c 8d 5a 08 
[  328.457446]  77 04 89 3e 8b 31 89 5e 04 89 72 08 89 4a 0c 89 19 8b 08 8b 
[  328.458342] EIP: [<c124d39a>] drm_mm_remove_node+0x5a/0xc0 SS:ESP 0068:dd64fdac
[  328.458481] CR2: 000000006b6b6b6f
[  328.459085] ---[ end trace cb7019e5756bd7f0 ]---
[  502.313511] =============================================================================
[  502.313597] BUG kmalloc-96: Poison overwritten
[  502.313650] -----------------------------------------------------------------------------
[  502.313653] 
[  502.313774] INFO: 0xdcf44bd0-0xdcf44bd7. First byte 0xd0 instead of 0x6b
[  502.313832] INFO: Slab 0xddfce880 objects=36 used=26 fp=0xdcf44bd0 flags=0x400000c0
[  502.313895] INFO: Object 0xdcf44bd0 @offset=3024 fp=0xdcf44e00
[  502.313897] 
[  502.313995] Bytes b4 0xdcf44bc0:  cc cc cc cc d0 4b f4 dc 5a 5a 5a 5a 5a 5a 5a 5a <CC><CC><CC><CC><D0>K<F4><DC>ZZZZZZZZ
[  502.314708]   Object 0xdcf44bd0:  d0 4b f4 dc d0 4b f4 dc 6b 6b 6b 6b 6b 6b 6b 6b <D0>K<F4><DC><D0>K<F4><DC>kkkkkkkk
[  502.315417]   Object 0xdcf44be0:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
[  502.316134]   Object 0xdcf44bf0:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
[  502.316852]   Object 0xdcf44c00:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
[  502.317570]   Object 0xdcf44c10:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
[  502.318286]   Object 0xdcf44c20:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5 kkkkkkkkkkkkkkk<A5>
[  502.319014]  Redzone 0xdcf44c30:  bb bb bb bb                                     <BB><BB><BB><BB>            
[  502.319724]  Padding 0xdcf44c38:  5a 5a 5a 5a 5a 5a 5a 5a                         ZZZZZZZZ        
[  502.320004] Pid: 1750, comm: agetty Tainted: G      D W   2.6.39-rc6-jupiter-00001-g443badf-dirty #11
[  502.320004] Call Trace:
[  502.320004]  [<c10afe33>] print_trailer+0xe3/0x130
[  502.320004]  [<c10b0244>] check_bytes_and_report+0xc4/0x100
[  502.320004]  [<c10b1277>] check_object+0x1c7/0x210
[  502.320004]  [<c10b1752>] alloc_debug_processing+0xc2/0x140
[  502.320004]  [<c10b1942>] T.1001+0x172/0x1a0
[  502.320004]  [<c10f8b31>] ? __proc_create+0x81/0x110
[  502.320004]  [<c10f8b31>] ? __proc_create+0x81/0x110
[  502.320004]  [<c10b1d60>] __kmalloc+0x180/0x1a0
[  502.320004]  [<c10f8b31>] ? __proc_create+0x81/0x110
[  502.320004]  [<c10f8b31>] __proc_create+0x81/0x110
[  502.320004]  [<c10f92f3>] proc_mkdir_mode+0x23/0x50
[  502.320004]  [<c10f932f>] proc_mkdir+0xf/0x20
[  502.320004]  [<c106a229>] register_handler_proc+0xd9/0xf0
[  502.320004]  [<c1068063>] __setup_irq+0x1e3/0x330
[  502.320004]  [<c10b1b0c>] ? kmem_cache_alloc_trace+0x9c/0xf0
[  502.320004]  [<c10688eb>] ? request_threaded_irq+0x7b/0x120
[  502.320004]  [<c1237b60>] ? serial8250_handle_port+0x2c0/0x2c0
[  502.320004]  [<c106892e>] request_threaded_irq+0xbe/0x120
[  502.320004]  [<c1236681>] serial8250_startup+0x5c1/0x600
[  502.320004]  [<c1233114>] uart_startup+0x44/0x130
[  502.320004]  [<c12332f5>] uart_open+0xf5/0x180
[  502.320004]  [<c121ea9a>] tty_open+0x1fa/0x490
[  502.320004]  [<c10bbff6>] chrdev_open+0xa6/0x190
[  502.320004]  [<c10b7733>] __dentry_open+0x103/0x2a0
[  502.320004]  [<c10b79b6>] nameidata_to_filp+0x66/0x80
[  502.320004]  [<c10bbf50>] ? register_chrdev_region+0xa0/0xa0
[  502.320004]  [<c10c3150>] do_last+0x1a0/0x700
[  502.320004]  [<c10c42c2>] path_openat+0x92/0x320
[  502.320004]  [<c10b02b8>] ? init_object+0x38/0x70
[  502.320004]  [<c10c4630>] do_filp_open+0x30/0x80
[  502.320004]  [<c10ce572>] ? alloc_fd+0x62/0xe0
[  502.320004]  [<c10c2741>] ? getname_flags+0x61/0xe0
[  502.320004]  [<c10b87ed>] do_sys_open+0xed/0x1e0
[  502.320004]  [<c10b8949>] sys_open+0x29/0x40
[  502.320004]  [<c13971d7>] sysenter_do_call+0x12/0x26
[  502.320004] FIX kmalloc-96: Restoring 0xdcf44bd0-0xdcf44bd7=0x6b
[  502.320004] 
[  502.320004] FIX kmalloc-96: Marking all objects used




00000720 <drm_mm_remove_node>:

/**
 * Remove a memory node from the allocator.
 */
void drm_mm_remove_node(struct drm_mm_node *node)
{
 720:   55                      push   %ebp
        struct drm_mm *mm = node->mm;
 721:   8b 48 1c                mov    0x1c(%eax),%ecx

/**
 * Remove a memory node from the allocator.
 */
void drm_mm_remove_node(struct drm_mm_node *node)
{
 724:   89 e5                   mov    %esp,%ebp
 726:   57                      push   %edi
 727:   56                      push   %esi
 728:   53                      push   %ebx
        struct drm_mm *mm = node->mm;
        struct drm_mm_node *prev_node;

        BUG_ON(node->scanned_block || node->scanned_prev_free
 729:   0f b6 58 10             movzbl 0x10(%eax),%ebx
 72d:   f6 c3 0e                test   $0xe,%bl
 730:   0f 85 9d 00 00 00       jne    7d3 <drm_mm_remove_node+0xb3>
                                   || node->scanned_next_free);

        prev_node =
            list_entry(node->node_list.prev, struct drm_mm_node, node_list);

        if (node->hole_follows) {
 736:   83 e3 01                and    $0x1,%ebx

        BUG_ON(node->scanned_block || node->scanned_prev_free
                                   || node->scanned_next_free);

        prev_node =
            list_entry(node->node_list.prev, struct drm_mm_node, node_list);
 739:   8b 50 04                mov    0x4(%eax),%edx

        if (node->hole_follows) {
 73c:   74 72                   je     7b0 <drm_mm_remove_node+0x90>
}

static inline unsigned long drm_mm_hole_node_end(struct drm_mm_node *hole_node)
{
        struct drm_mm_node *next_node =
                list_entry(hole_node->node_list.next, struct drm_mm_node,
 73e:   8b 30                   mov    (%eax),%esi

        prev_node =
            list_entry(node->node_list.prev, struct drm_mm_node, node_list);

        if (node->hole_follows) {
                BUG_ON(drm_mm_hole_node_start(node)
 740:   8b 58 18                mov    0x18(%eax),%ebx
 743:   03 58 14                add    0x14(%eax),%ebx
}

static inline unsigned long drm_mm_hole_node_end(struct drm_mm_node *hole_node)
{
        struct drm_mm_node *next_node =
                list_entry(hole_node->node_list.next, struct drm_mm_node,
 746:   3b 5e 14                cmp    0x14(%esi),%ebx
 749:   0f 84 88 00 00 00       je     7d7 <drm_mm_remove_node+0xb7>
        __list_del(entry->prev, entry->next);
}

static inline void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
 74f:   8b 70 08                mov    0x8(%eax),%esi
 752:   8b 58 0c                mov    0xc(%eax),%ebx
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head * prev, struct list_head * next)
{
        next->prev = prev;
 755:   89 5e 04                mov    %ebx,0x4(%esi)
        prev->next = next;
 758:   89 33                   mov    %esi,(%ebx)
}

static inline void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        entry->next = LIST_POISON1;
 75a:   c7 40 08 00 01 10 00    movl   $0x100100,0x8(%eax)
        entry->prev = LIST_POISON2;
 761:   c7 40 0c 00 02 20 00    movl   $0x200200,0xc(%eax)
                list_del(&node->hole_stack);
        } else
                BUG_ON(drm_mm_hole_node_start(node)
                                != drm_mm_hole_node_end(node));

        if (!prev_node->hole_follows) {
 768:   0f b6 5a 10             movzbl 0x10(%edx),%ebx
 76c:   f6 c3 01                test   $0x1,%bl
 76f:   74 57                   je     7c8 <drm_mm_remove_node+0xa8>
 * in an undefined state.
 */
#ifndef CONFIG_DEBUG_LIST
static inline void __list_del_entry(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
 771:   8b 7a 08                mov    0x8(%edx),%edi
 774:   8b 72 0c                mov    0xc(%edx),%esi
                prev_node->hole_follows = 1;
                list_add(&prev_node->hole_stack, &mm->hole_stack);
        } else
                list_move(&prev_node->hole_stack, &mm->hole_stack);
 777:   8d 5a 08                lea    0x8(%edx),%ebx
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head * prev, struct list_head * next)
{
        next->prev = prev;
 77a:   89 77 04                mov    %esi,0x4(%edi)
        prev->next = next;
 77d:   89 3e                   mov    %edi,(%esi)
 * Insert a new entry after the specified head.
 * This is good for implementing stacks.
 */
static inline void list_add(struct list_head *new, struct list_head *head)
{
        __list_add(new, head, head->next);
 77f:   8b 31                   mov    (%ecx),%esi
#ifndef CONFIG_DEBUG_LIST
static inline void __list_add(struct list_head *new,
                              struct list_head *prev,
                              struct list_head *next)
{
        next->prev = new;
 781:   89 5e 04                mov    %ebx,0x4(%esi)
        new->next = next;
 784:   89 72 08                mov    %esi,0x8(%edx)
        new->prev = prev;
 787:   89 4a 0c                mov    %ecx,0xc(%edx)
        prev->next = new;
 78a:   89 19                   mov    %ebx,(%ecx)
        __list_del(entry->prev, entry->next);
}

static inline void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
 78c:   8b 08                   mov    (%eax),%ecx
 78e:   8b 50 04                mov    0x4(%eax),%edx
 * This is only for internal list manipulation where we know
 * the prev/next entries already!
 */
static inline void __list_del(struct list_head * prev, struct list_head * next)
{
        next->prev = prev;
 791:   89 51 04                mov    %edx,0x4(%ecx)
        prev->next = next;
 794:   89 0a                   mov    %ecx,(%edx)

        list_del(&node->node_list);
        node->allocated = 0;
}
 796:   5b                      pop    %ebx
 797:   5e                      pop    %esi
}

static inline void list_del(struct list_head *entry)
{
        __list_del(entry->prev, entry->next);
        entry->next = LIST_POISON1;
 798:   c7 00 00 01 10 00       movl   $0x100100,(%eax)
        entry->prev = LIST_POISON2;
 79e:   c7 40 04 00 02 20 00    movl   $0x200200,0x4(%eax)
                list_add(&prev_node->hole_stack, &mm->hole_stack);
        } else
                list_move(&prev_node->hole_stack, &mm->hole_stack);

        list_del(&node->node_list);
        node->allocated = 0;
 7a5:   80 60 10 df             andb   $0xdf,0x10(%eax)
}
 7a9:   5f                      pop    %edi
 7aa:   c9                      leave  
 7ab:   c3                      ret    
 7ac:   8d 74 26 00             lea    0x0(%esi,%eiz,1),%esi
}

static inline unsigned long drm_mm_hole_node_end(struct drm_mm_node *hole_node)
{
        struct drm_mm_node *next_node =
                list_entry(hole_node->node_list.next, struct drm_mm_node,
 7b0:   8b 30                   mov    (%eax),%esi
        if (node->hole_follows) {
                BUG_ON(drm_mm_hole_node_start(node)
                                == drm_mm_hole_node_end(node));
                list_del(&node->hole_stack);
        } else
                BUG_ON(drm_mm_hole_node_start(node)
 7b2:   8b 58 18                mov    0x18(%eax),%ebx
 7b5:   03 58 14                add    0x14(%eax),%ebx
}

static inline unsigned long drm_mm_hole_node_end(struct drm_mm_node *hole_node)
{
        struct drm_mm_node *next_node =
                list_entry(hole_node->node_list.next, struct drm_mm_node,
 7b8:   3b 5e 14                cmp    0x14(%esi),%ebx
 7bb:   74 ab                   je     768 <drm_mm_remove_node+0x48>
        if (node->hole_follows) {
                BUG_ON(drm_mm_hole_node_start(node)
                                == drm_mm_hole_node_end(node));
                list_del(&node->hole_stack);
        } else
                BUG_ON(drm_mm_hole_node_start(node)
 7bd:   0f 0b                   ud2a   
 7bf:   eb fe                   jmp    7bf <drm_mm_remove_node+0x9f>
 7c1:   8d b4 26 00 00 00 00    lea    0x0(%esi,%eiz,1),%esi
                                != drm_mm_hole_node_end(node));

        if (!prev_node->hole_follows) {
                prev_node->hole_follows = 1;
 7c8:   83 cb 01                or     $0x1,%ebx
 7cb:   88 5a 10                mov    %bl,0x10(%edx)
                list_add(&prev_node->hole_stack, &mm->hole_stack);
 7ce:   8d 5a 08                lea    0x8(%edx),%ebx
 7d1:   eb ac                   jmp    77f <drm_mm_remove_node+0x5f>
void drm_mm_remove_node(struct drm_mm_node *node)
{
        struct drm_mm *mm = node->mm;
        struct drm_mm_node *prev_node;

        BUG_ON(node->scanned_block || node->scanned_prev_free
 7d3:   0f 0b                   ud2a   
 7d5:   eb fe                   jmp    7d5 <drm_mm_remove_node+0xb5>

        prev_node =
            list_entry(node->node_list.prev, struct drm_mm_node, node_list);

        if (node->hole_follows) {
                BUG_ON(drm_mm_hole_node_start(node)
 7d7:   0f 0b                   ud2a   
 7d9:   eb fe                   jmp    7d9 <drm_mm_remove_node+0xb9>
 7db:   90                      nop
 7dc:   8d 74 26 00             lea    0x0(%esi,%eiz,1),%esi
