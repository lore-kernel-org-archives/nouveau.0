From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23830] New: nouvea modules on 2.6.31-rc6 failed
Date: Wed,  9 Sep 2009 21:10:12 -0700 (PDT)
Message-ID: <bug-23830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=23830

           Summary: nouvea modules on 2.6.31-rc6 failed
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fourstar10_2000-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Compile Error when nouveau linked to current kernel version 2.6.31-rc6
Otherwise kernel version 2.6.31-rc6 does boot and give me a command prompt. The
only version that gets this far on my machine.

  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-x86
  CALL    scripts/checksyscalls.sh
  CHK     include/linux/compile.h
  CC      drivers/gpu/drm/ttm/ttm_agp_backend.o
In file included from
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/agp.h:4,
                 from drivers/gpu/drm/ttm/ttm_agp_backend.c:39:
include/linux/swiotlb.h:48: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:48: warning: its scope is only this definition or
declaration, which is probably not what you want
include/linux/swiotlb.h:51: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:63: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:68: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:72: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:76: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:80: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:84: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:89: warning: 'enum dma_data_direction' declared inside
parameter list
include/linux/swiotlb.h:94: warning: 'enum dma_data_direction' declared inside
parameter list
In file included from
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/agp.h:8,
                 from drivers/gpu/drm/ttm/ttm_agp_backend.c:39:
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:
In function 'get_dma_ops':
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:29:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:32:
error: dereferencing pointer to incomplete type
In file included from
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:36,
                 from
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/agp.h:8,
                 from drivers/gpu/drm/ttm/ttm_agp_backend.c:39:
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:12: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:11: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_map_single_attrs':
include/asm-generic/dma-mapping-common.h:18: error: implicit declaration of
function 'valid_dma_direction'
include/asm-generic/dma-mapping-common.h:19: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:31: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:30: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_unmap_single_attrs':
include/asm-generic/dma-mapping-common.h:36: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:37: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:43: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:42: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_map_sg_attrs':
include/asm-generic/dma-mapping-common.h:52: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:60: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:59: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_unmap_sg_attrs':
include/asm-generic/dma-mapping-common.h:66: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:67: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:72: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:72: error: parameter 5 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_map_page':
include/asm-generic/dma-mapping-common.h:79: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:86: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:86: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_unmap_page':
include/asm-generic/dma-mapping-common.h:91: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:92: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:98: warning: 'enum dma_data_direction'
declared inside parameter list
include/asm-generic/dma-mapping-common.h:98: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function
'dma_sync_single_for_cpu':
include/asm-generic/dma-mapping-common.h:103: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:104: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:111: warning: 'enum
dma_data_direction' declared inside parameter list
include/asm-generic/dma-mapping-common.h:111: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function
'dma_sync_single_for_device':
include/asm-generic/dma-mapping-common.h:116: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:117: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:126: warning: 'enum
dma_data_direction' declared inside parameter list
include/asm-generic/dma-mapping-common.h:126: error: parameter 5 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function
'dma_sync_single_range_for_cpu':
include/asm-generic/dma-mapping-common.h:131: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:132: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:137: error: type of formal parameter 4
is incomplete
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:144: warning: 'enum
dma_data_direction' declared inside parameter list
include/asm-generic/dma-mapping-common.h:144: error: parameter 5 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function
'dma_sync_single_range_for_device':
include/asm-generic/dma-mapping-common.h:149: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:150: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:155: error: type of formal parameter 4
is incomplete
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:160: warning: 'enum
dma_data_direction' declared inside parameter list
include/asm-generic/dma-mapping-common.h:160: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_sync_sg_for_cpu':
include/asm-generic/dma-mapping-common.h:165: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:166: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h: At top level:
include/asm-generic/dma-mapping-common.h:173: warning: 'enum
dma_data_direction' declared inside parameter list
include/asm-generic/dma-mapping-common.h:173: error: parameter 4 ('dir') has
incomplete type
include/asm-generic/dma-mapping-common.h: In function 'dma_sync_sg_for_device':
include/asm-generic/dma-mapping-common.h:178: error: dereferencing pointer to
incomplete type
include/asm-generic/dma-mapping-common.h:179: error: dereferencing pointer to
incomplete type
In file included from
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/agp.h:8,
                 from drivers/gpu/drm/ttm/ttm_agp_backend.c:39:
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:
In function 'dma_mapping_error':
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:42:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:43:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:
At top level:
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:60:
warning: 'enum dma_data_direction' declared inside parameter list
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:60:
error: parameter 4 ('dir') has incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:
In function 'dma_alloc_coherent_mask':
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:77:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:79:
error: implicit declaration of function 'DMA_BIT_MASK'
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:
In function 'dma_alloc_coherent':
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:114:
error: implicit declaration of function 'is_device_dma_capable'
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:117:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:120:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:
In function 'dma_free_coherent':
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:138:
error: dereferencing pointer to incomplete type
/usr/src/linux-2.6.31_pvops-xen-rebase.master.tree-2009-08-31/arch/x86/include/asm/dma-mapping.h:139:
error: dereferencing pointer to incomplete type
make[4]: *** [drivers/gpu/drm/ttm/ttm_agp_backend.o] Error 1
make[3]: *** [drivers/gpu/drm/ttm] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2


thanks
steve


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
