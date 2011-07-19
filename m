From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39362] New: NVAF (320M) crash on modprobe
Date: Mon, 18 Jul 2011 23:26:24 -0700 (PDT)
Message-ID: <bug-39362-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39362

           Summary: NVAF (320M) crash on modprobe
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bjt23-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=49286)
 View: https://bugs.freedesktop.org/attachment.cgi?id=49286
 Review: https://bugs.freedesktop.org/review?bug=39362&attachment=49286

patch to use nv50 clock getters for nvaf

I have a:

[   94.061308] [drm] nouveau 0000:02:00.0: Detected an NV50 generation card
(0x0af100a2)

But it looks like it's trying to use the NVA3 clock getters.  Patch attached;
crash goes away afterward.

I also noticed nouveau_state.c:667 includes NVAF in the list of chips that call
nva3_copy_create().  Seems to not cause any problems, but I thought I'd draw
attention to it just in case...

[   94.517049] [drm] nouveau 0000:02:00.0: 4 available performance level(s)
[   94.517055] [drm] nouveau 0000:02:00.0: 0: core 405MHz shader 405MHz memory
405MHz voltage 900mV
[   94.517061] [drm] nouveau 0000:02:00.0: 1: core 450MHz shader 810MHz memory
450MHz voltage 900mV
[   94.517066] [drm] nouveau 0000:02:00.0: 2: core 450MHz shader 810MHz memory
450MHz voltage 900mV
[   94.517072] [drm] nouveau 0000:02:00.0: 3: core 450MHz shader 950MHz memory
450MHz voltage 900mV
[   94.517269] CPU 0 
[   94.517317] Modules linked in: nouveau(+) ttm drm_kms_helper drm mxm_wmi wmi
lib80211_crypt_tkip wl(P) uvcvideo
[   94.517846] 
[   94.517893] Pid: 6301, comm: modprobe Tainted: P            3.0.0-rc7+ #45
Apple Inc. MacBookAir3,1/Mac-942452F5819B1C1B
[   94.518004] RIP: 0010:[<ffffffffa0362e20>]  [<ffffffffa0362e20>]
read_pll+0x92/0x9f [nouveau]
[   94.518004] RSP: 0018:ffff880138ed5a10  EFLAGS: 00010246
[   94.518004] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[   94.518004] RDX: 0000000000000000 RSI: 0000000000004128 RDI:
ffff880137980000
[   94.518004] RBP: ffff880138ed5a38 R08: 0000000000000002 R09:
00000000fffffffe
[   94.518004] R10: ffff8801b8ed59b7 R11: 0000000000000000 R12:
ffff88013b7b7800
[   94.518004] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000002
[   94.518004] FS:  00007fb721312700(0000) GS:ffff88013fc00000(0000)
knlGS:0000000000000000
[   94.518004] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[   94.518004] CR2: 00007fb7212cc00f CR3: 000000013ae59000 CR4:
00000000000406f0
[   94.518004] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   94.518004] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
0000000000000400
[   94.518004] Process modprobe (pid: 6301, threadinfo ffff880138ed4000, task
ffff88013b7d0000)
[   94.518004]  ffff8801379813f8 ffff88013b7b7800 ffff880137980000
ffff880138ed5aa8
[   94.518004]  0000000000000198 ffff880138ed5a58 ffffffffa03630d4
ffff8801379813f8
[   94.518004]  ffff88013b7b7800 ffff880138ed5a88 ffffffffa0321038
ffff88013b7b7800
[   94.518004]  [<ffffffffa03630d4>] nva3_pm_clocks_get+0x43/0x89 [nouveau]
[   94.518004]  [<ffffffffa0321038>] nouveau_pm_perflvl_get+0x35/0xd4 [nouveau]
[   94.518004]  [<ffffffffa0321414>] nouveau_pm_init+0xe9/0x379 [nouveau]
[   94.518004]  [<ffffffffa031bc01>] ? nouveau_bios_init+0x1e44/0x1ffb
[nouveau]
[   94.518004]  [<ffffffff810b9858>] ? __pte_alloc_kernel+0x57/0x80
[   94.518004]  [<ffffffff813461c9>] ? vga_client_register+0x5b/0x69
[   94.518004]  [<ffffffffa03038cd>] nouveau_card_init+0xfd7/0x14b1 [nouveau]
[   94.518004]  [<ffffffffa03043e2>] nouveau_load+0x559/0x5a0 [nouveau]
[   94.518004]  [<ffffffffa02ad4aa>] drm_get_pci_dev+0x163/0x268 [drm]
[   94.518004]  [<ffffffff815e21a6>] ? _raw_spin_unlock_irqrestore+0x20/0x2b
[   94.518004]  [<ffffffffa03656dc>] nouveau_pci_probe+0x10/0x12 [nouveau]
[   94.518004]  [<ffffffff812c9b16>] local_pci_probe+0x3f/0x70
[   94.518004]  [<ffffffff812ca0de>] pci_device_probe+0x65/0x96
[   94.518004]  [<ffffffff81128421>] ? sysfs_create_link+0xe/0x10
[   94.518004]  [<ffffffff8134b405>] driver_probe_device+0xbc/0x156
[   94.518004]  [<ffffffff8134b4f7>] __driver_attach+0x58/0x7c
[   94.518004]  [<ffffffff8134b49f>] ? driver_probe_device+0x156/0x156
[   94.518004]  [<ffffffff8134a67b>] bus_for_each_dev+0x51/0x7d
[   94.518004]  [<ffffffff8134b0d0>] driver_attach+0x19/0x1b
[   94.518004]  [<ffffffff8134ad31>] bus_add_driver+0xab/0x1ff
[   94.518004]  [<ffffffff8134b9fa>] driver_register+0x96/0x103
[   94.518004]  [<ffffffff812ca33b>] __pci_register_driver+0x51/0xbd
[   94.518004]  [<ffffffffa02ad639>] drm_pci_init+0x8a/0xef [drm]
[   94.518004]  [<ffffffffa038e000>] ? 0xffffffffa038dfff
[   94.518004]  [<ffffffffa038e000>] ? 0xffffffffa038dfff
[   94.518004]  [<ffffffffa038e04f>] nouveau_init+0x4f/0x51 [nouveau]
[   94.518004]  [<ffffffff810002e5>] do_one_initcall+0x7a/0x129
[   94.518004]  [<ffffffff81087a7e>] sys_init_module+0x83/0x1cb
[   94.518004]  [<ffffffff815e2b7b>] system_call_fastpath+0x16/0x1b
[   94.518004]  RSP <ffff880138ed5a10>
[   94.533513] ---[ end trace 3440fc5959a83764 ]---

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
