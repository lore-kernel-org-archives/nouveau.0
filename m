From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26813] New: Nouveau ioremap WARNING with current
 Linus' git tree
Date: Mon,  1 Mar 2010 01:02:19 -0800 (PST)
Message-ID: <bug-26813-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26813

           Summary: Nouveau ioremap WARNING with current Linus' git tree
           Product: xorg
           Version: 7.5
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: me-uiRdBs8odbtmTBlB0Cgj/Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=33658)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33658)
full dmesg output

when using gentoo ebuilds from x11 overlay with current Linus' git tree (commit
30ff056c42c665b9ea535d8515890857ae382540) we get the following WARNING:

[   14.072340] ------------[ cut here ]------------
[   14.072355] WARNING: at arch/x86/mm/ioremap.c:111
__ioremap_caller+0xd1/0x247()
[   14.072361] Hardware name: 6458DE9
[   14.072365] Modules linked in: nouveau(+) ttm drm_kms_helper drm sdhci_pci
sdhci i2c_algo_bit cfbcopyarea cfbimgblt cfbfillrect
[   14.072391] Pid: 1188, comm: modprobe Not tainted 2.6.33 #11
[   14.072396] Call Trace:
[   14.072407]  [<c1030bbe>] warn_slowpath_common+0x65/0x95
[   14.072416]  [<c1030c00>] warn_slowpath_null+0x12/0x15
[   14.072425]  [<c101d24a>] __ioremap_caller+0xd1/0x247
[   14.072435]  [<c10b6e4b>] ? create_object+0x1fa/0x207
[   14.072443]  [<c101d464>] ioremap_wc+0x1e/0x28
[   14.072455]  [<f81a19d0>] ? ttm_mem_reg_ioremap+0x70/0x93 [ttm]
[   14.072467]  [<f81a19d0>] ttm_mem_reg_ioremap+0x70/0x93 [ttm]
[   14.072498]  [<f8217588>] ? nouveau_bo_wr32+0x3ab/0x735 [nouveau]
[   14.072510]  [<f81a1f74>] ttm_bo_move_memcpy+0x63/0x257 [ttm]
[   14.072528]  [<f8163619>] ? drm_mm_put_block+0x161/0x228 [drm]
[   14.072538]  [<c10b3130>] ? kmem_cache_alloc_notrace+0xa5/0xb1
[   14.072555]  [<f8163807>] ? drm_mm_add_space_to_tail+0xa0/0xe2 [drm]
[   14.072583]  [<f8217588>] ? nouveau_bo_wr32+0x3ab/0x735 [nouveau]
[   14.072610]  [<f8217884>] nouveau_bo_wr32+0x6a7/0x735 [nouveau]
[   14.072621]  [<f81a092c>] ? ttm_bo_mem_space+0x16b/0x840 [ttm]
[   14.072649]  [<f8217588>] ? nouveau_bo_wr32+0x3ab/0x735 [nouveau]
[   14.072660]  [<f819fe80>] ttm_bo_unmap_virtual+0x1ec/0x45f [ttm]
[   14.072672]  [<f81a13a6>] ttm_bo_move_buffer+0x9b/0xd5 [ttm]
[   14.072683]  [<f81a1465>] ttm_bo_validate+0x85/0xc6 [ttm]
[   14.072695]  [<f81a1736>] ttm_bo_init+0x290/0x2bb [ttm]
[   14.072722]  [<f8217e40>] nouveau_bo_new+0x29a/0x396 [nouveau]
[   14.072749]  [<f8217ea5>] ? nouveau_bo_new+0x2ff/0x396 [nouveau]
[   14.072766]  [<f8163662>] ? drm_mm_put_block+0x1aa/0x228 [drm]
[   14.072792]  [<f8211a94>] nouveau_mem_init+0x25b/0x3b7 [nouveau]
[   14.072818]  [<f8210533>] nouveau_card_init+0x9b6/0xc98 [nouveau]
[   14.072843]  [<f8210b8c>] nouveau_load+0x377/0x3c3 [nouveau]
[   14.072861]  [<f8160978>] drm_get_dev+0x2f6/0x42b [drm]
[   14.072888]  [<f8249e7a>] cleanup_module+0xb6/0xb8 [nouveau]
[   14.072898]  [<c11aeb42>] local_pci_probe+0x13/0x15
[   14.072906]  [<c11af5ba>] pci_device_probe+0x48/0x6b
[   14.072916]  [<c1216dba>] driver_probe_device+0x7e/0x10a
[   14.072924]  [<c1216e8e>] __driver_attach+0x48/0x64
[   14.072932]  [<c121678e>] bus_for_each_dev+0x42/0x6c
[   14.072940]  [<c1216c84>] driver_attach+0x19/0x1b
[   14.072948]  [<c1216e46>] ? __driver_attach+0x0/0x64
[   14.072956]  [<c12161d6>] bus_add_driver+0xa7/0x1d9
[   14.072965]  [<c12170fb>] driver_register+0x90/0xf0
[   14.072973]  [<c11af792>] __pci_register_driver+0x3d/0x96
[   14.072989]  [<f815c813>] drm_init+0x60/0xb8 [drm]
[   14.073014]  [<f825f000>] ? init_module+0x0/0x47 [nouveau]
[   14.073063]  [<f825f045>] init_module+0x45/0x47 [nouveau]
[   14.073071]  [<c1001143>] do_one_initcall+0x51/0x136
[   14.073080]  [<c105a08c>] sys_init_module+0xac/0x1e0
[   14.073088]  [<c10028cc>] sysenter_do_call+0x12/0x22
[   14.073094] ---[ end trace 57a804da750a5a87 ]---

I also merged current nouveau/linux-2.6 from freedesktop.org into Linus' tree
and the same problem arose.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
