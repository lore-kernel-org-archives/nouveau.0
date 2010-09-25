From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30370] New: Nouveau module crashes with "divide
	error"
Date: Fri, 24 Sep 2010 23:01:46 -0700 (PDT)
Message-ID: <bug-30370-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=30370

           Summary: Nouveau module crashes with "divide error"
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=38947)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38947)
dmesg output with drm.debug=14  nouveau.reg_debug=0x0200

The latest version of the nouveau module crashes on my PC with a divide error.

git://anongit.freedesktop.org/nouveau/linux-2.6
Commit: 9c4f93718e0ced5c2b028cb84159a063daa5d576
Date: Fri Sep 24 09:17:02 2010 +1000

From dmesg:
...
[    4.730824] divide error: 0000 [#1] SMP 
...
[    4.737222] Pid: 667, comm: modprobe Not tainted 2.6.36-rc5+ #4 Portable
PC/Portable PC
[    4.737342] RIP: 0010:[<ffffffffa0211898>]  [<ffffffffa0211898>]
nv50_pm_clock_get+0xa8/0xc0 [nouveau]
[    4.737560] RSP: 0018:ffff880139875a20  EFLAGS: 00010246
[    4.737660] RAX: 0000000000000000 RBX: ffff880138180000 RCX:
0000000000000000
[    4.737762] RDX: 0000000000000000 RSI: 0000000000000046 RDI:
ffffc90004704034
[    4.737864] RBP: ffff880139875a28 R08: 000000000003171d R09:
0000000000000000
[    4.737965] R10: 0000000000000000 R11: 0000000000000003 R12:
0000000000000000
[    4.738067] R13: ffff880138180f68 R14: ffff880139875a78 R15:
0000000000000108
[    4.738170] FS:  00007ffdcdf4c700(0000) GS:ffff880001700000(0000)
knlGS:0000000000000000
[    4.738290] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[    4.738389] CR2: 000000000061d488 CR3: 0000000139130000 CR4:
00000000000006e0
[    4.738491] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[    4.738594] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[    4.738696] Process modprobe (pid: 667, threadinfo ffff880139874000, task
ffff88013b652920)
[    4.738815] Stack:
[    4.738904]  ffff880139b92120 ffff880139875a58 ffffffffa01d8c71
0000000000000003
[    4.739207] <0> ffff880138180f68 ffff880138180000 ffff880139b92120
ffff880139875bb8
[    4.739669] <0> ffffffffa01d8ed3 ffff880100000028 ffff880139875ac8
342079726f6d656d
[    4.740005] Call Trace:
[    4.740005]  [<ffffffffa01d8c71>] nouveau_pm_perflvl_get+0x91/0xe0 [nouveau]
[    4.740005]  [<ffffffffa01d8ed3>] nouveau_pm_init+0x103/0x3a0 [nouveau]
[    4.740005]  [<ffffffffa01d28e2>] ? nouveau_bios_init+0x1a72/0x2800
[nouveau]
[    4.740005]  [<ffffffff81088a42>] ? __get_free_pages+0x12/0x50
[    4.740005]  [<ffffffff812a35c9>] ? mutex_lock+0x19/0x50
[    4.740005]  [<ffffffffa01ad21b>] nouveau_card_init+0x3bb/0x1390 [nouveau]
[    4.740005]  [<ffffffffa01ae739>] nouveau_load+0x429/0x700 [nouveau]
[    4.740005]  [<ffffffffa0143870>] drm_get_pci_dev+0x180/0x2a0 [drm]
[    4.740005]  [<ffffffffa0212ea0>] nouveau_pci_probe+0x10/0x17 [nouveau]
[    4.740005]  [<ffffffff81168fc2>] local_pci_probe+0x12/0x20
[    4.740005]  [<ffffffff81169fd0>] pci_device_probe+0x80/0xb0
[    4.740005]  [<ffffffff811de03a>] ? driver_sysfs_add+0x7a/0xb0
[    4.740005]  [<ffffffff811de179>] driver_probe_device+0x89/0x1a0
[    4.740005]  [<ffffffff811de323>] __driver_attach+0x93/0xa0
[    4.740005]  [<ffffffff811de290>] ? __driver_attach+0x0/0xa0
[    4.740005]  [<ffffffff811dd638>] bus_for_each_dev+0x68/0x90
[    4.740005]  [<ffffffff811ddfb9>] driver_attach+0x19/0x20
[    4.740005]  [<ffffffff811dd8f8>] bus_add_driver+0xb8/0x260
[    4.740005]  [<ffffffffa0233000>] ? nouveau_init+0x0/0x4a [nouveau]
[    4.740005]  [<ffffffff811de618>] driver_register+0x78/0x140
[    4.740005]  [<ffffffffa0233000>] ? nouveau_init+0x0/0x4a [nouveau]
[    4.740005]  [<ffffffff8116a241>] __pci_register_driver+0x51/0xd0
[    4.740005]  [<ffffffffa0143a5f>] drm_pci_init+0xcf/0xe0 [drm]
[    4.740005]  [<ffffffffa0233000>] ? nouveau_init+0x0/0x4a [nouveau]
[    4.740005]  [<ffffffffa013cba3>] drm_init+0x53/0x70 [drm]
[    4.740005]  [<ffffffffa0233048>] nouveau_init+0x48/0x4a [nouveau]
[    4.740005]  [<ffffffff810001de>] do_one_initcall+0x3e/0x170
[    4.740005]  [<ffffffff8106abaa>] sys_init_module+0xba/0x200
[    4.740005]  [<ffffffff8100246b>] system_call_fastpath+0x16/0x1b

Full dmesg output attached.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
