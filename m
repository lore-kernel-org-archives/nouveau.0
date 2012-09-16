From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: POST the card before GPIO
	initialization
Date: Mon, 17 Sep 2012 01:15:24 +0200
Message-ID: <20120916231524.GA25218@joi.lan>
References: <20120913222133.GA8982@joi.lan>
	<20120914064459.GE4289@nisroch.bne.redhat.com>
	<20120914114518.GA3619@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120914114518.GA3619-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Sep 14, 2012 at 01:45:18PM +0200, Marcin Slusarz wrote:
> On Fri, Sep 14, 2012 at 04:44:59PM +1000, Ben Skeggs wrote:
> > On Fri, Sep 14, 2012 at 12:21:33AM +0200, Marcin Slusarz wrote:
> > > Otherwise my card (nv92) never resumes from suspend to ram, hanging on
> > > nv_mask in nv50_gpio_drive. Before rework, initialization was done only
> > > from POST, so this patch restores previous behaviour.
> > This patch would break the cold-boot behaviour (DEVINIT needs GPIO etc
> > to have been created so it can call out to them).
> > 
> > I've modified nouveau git so that it restores the behaviour of the first
> > version of the rework and has DEVINIT be the first in the init ordering,
> > but delays its init until all its dependencies have been created.
> > 
> > Can you confirm your issue is resolved now?
> 
> Yes.

If you haven't noticed, all channel closes result in oops now. For me, usually
they occur in nouveau_bo_placement_set / set_placement_range. I didn't debug it
extensively, but it seems there's a "problem" in nv_device().

I bisected it to "drm/nouveau/devinit: better handle some ctor/init ordering
corner-cases".

Sep 14 18:11:49 [kernel] [  140.284334] BUG: unable to handle kernel NULL pointer dereference at 00000000000000b8
Sep 14 18:11:49 [kernel] [  140.284373] IP: [<ffffffffa045d015>] nouveau_bo_placement_set+0xf5/0x209 [nouveau]
Sep 14 18:11:49 [kernel] [  140.284432] PGD 1a0d13067 PUD 1a4f6d067 PMD 0 
Sep 14 18:11:49 [kernel] [  140.284466] Oops: 0000 [#1] PREEMPT SMP 
Sep 14 18:11:49 [kernel] [  140.284492] Modules linked in: nouveau drm_kms_helper ttm drm i2c_algo_bit [last unloaded: drm]
Sep 14 18:11:49 [kernel] [  140.284558] CPU 2 
Sep 14 18:11:49 [kernel] [  140.284571] Pid: 6610, comm: glxgears Not tainted 3.6.0-rc5+ #1144 System manufacturer System Product Name/P6T SE
Sep 14 18:11:49 [kernel] [  140.284596] RIP: 0010:[<ffffffffa045d015>]  [<ffffffffa045d015>] nouveau_bo_placement_set+0xf5/0x209 [nouveau]
Sep 14 18:11:49 [kernel] [  140.284649] RSP: 0018:ffff8801525b1ca8  EFLAGS: 00010286
Sep 14 18:11:49 [kernel] [  140.284663] RAX: ffff8801a627ac00 RBX: ffff88016e4a4800 RCX: 0000000000000000
Sep 14 18:11:49 [kernel] [  140.284679] RDX: ffff8801b3325a00 RSI: ffffffffa0528810 RDI: ffff88016e4a49c0
Sep 14 18:11:49 [kernel] [  140.284695] RBP: ffff8801525b1cc8 R08: 0000000000000000 R09: 0000000010000000
Sep 14 18:11:49 [kernel] [  140.284710] R10: 0000000000000246 R11: ffff8801a51a3a80 R12: 0000000000070000
Sep 14 18:11:49 [kernel] [  140.284725] R13: 0000000000210002 R14: 0000000000000000 R15: ffff8801b3324a00
Sep 14 18:11:49 [kernel] [  140.284741] FS:  00007fd33ff5c700(0000) GS:ffff8801bfc80000(0000) knlGS:0000000000000000
Sep 14 18:11:49 [kernel] [  140.284758] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Sep 14 18:11:49 [kernel] [  140.284772] CR2: 00000000000000b8 CR3: 00000001a144b000 CR4: 00000000000007e0
Sep 14 18:11:49 [kernel] [  140.284788] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
Sep 14 18:11:49 [kernel] [  140.284803] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Sep 14 18:11:49 [kernel] [  140.284819] Process glxgears (pid: 6610, threadinfo ffff8801525b0000, task ffff8801b7426800)
Sep 14 18:11:49 [kernel] [  140.284835] Stack:
Sep 14 18:11:49 [kernel] [  140.284843]  ffff88016e4a4800 ffff8801b8a83198 ffff8801b305d800 0000000000000040
Sep 14 18:11:49 [kernel] [  140.284884]  ffff8801525b1cf8 ffffffffa045d72c 2222222222222222 2222222222222222
Sep 14 18:11:49 [kernel] [  140.284923]  ffff8801a71e8540 ffff88016e4a4800 ffff8801525b1d28 ffffffffa045f59c
Sep 14 18:11:49 [kernel] [  140.284958] Call Trace:
Sep 14 18:11:49 [kernel] [  140.285000]  [<ffffffffa045d72c>] nouveau_bo_unpin+0x46/0x9e [nouveau]
Sep 14 18:11:49 [kernel] [  140.285043]  [<ffffffffa045f59c>] nouveau_gem_object_del+0x49/0x85 [nouveau]
Sep 14 18:11:49 [kernel] [  140.285068]  [<ffffffffa02bac8c>] drm_gem_object_free+0x26/0x28 [drm]
Sep 14 18:11:49 [kernel] [  140.285089]  [<ffffffffa02baf5e>] drm_gem_object_release_handle+0x7c/0x8f [drm]
Sep 14 18:11:49 [kernel] [  140.285107]  [<ffffffff9029434e>] idr_for_each+0x6e/0xb3
Sep 14 18:11:49 [kernel] [  140.285129]  [<ffffffffa02baee2>] ? drm_gem_private_object_init+0x2f/0x2f [drm]
Sep 14 18:11:49 [kernel] [  140.285152]  [<ffffffffa02bb3c6>] drm_gem_release+0x1d/0x33 [drm]
Sep 14 18:11:49 [kernel] [  140.285173]  [<ffffffffa02b9e2d>] drm_release+0x287/0x544 [drm]
Sep 14 18:11:49 [kernel] [  140.285191]  [<ffffffff900efbf1>] __fput+0xe8/0x1c1
Sep 14 18:11:49 [kernel] [  140.285206]  [<ffffffff900efcd3>] ____fput+0x9/0xb
Sep 14 18:11:49 [kernel] [  140.285223]  [<ffffffff9006c21a>] task_work_run+0x58/0x72
Sep 14 18:11:49 [kernel] [  140.285241]  [<ffffffff9002c7e6>] do_notify_resume+0x6b/0x7c
Sep 14 18:11:49 [kernel] [  140.285259]  [<ffffffff904bb232>] int_signal+0x12/0x17
Sep 14 18:11:49 [kernel] [  140.285273] Code: 0d 81 79 30 ad 0b ef 75 0f 85 90 00 00 00 45 84 c9 74 0e 48 85 c9 74 78 81 79 30 ad 0b ef 75 eb 6d 48 8b 89 40 02 00 00 48 85 d2 <48> 8b b1 b8 00 00 00 74 09 81 7a 30 ad 0b ef 75 75 61 48 85 c0 

Sometimes it crashes like this:
Sep 14 18:14:27 [kernel] [   96.208802] BUG: unable to handle kernel NULL pointer dereference at 00000000000000a0
Sep 14 18:14:27 [kernel] [   96.209194] IP: [<ffffffffa009735f>] nouveau_timer_wait_eq+0xd3/0x18a [nouveau]
Sep 14 18:14:27 [kernel] [   96.209599] PGD 0 
Sep 14 18:14:27 [kernel] [   96.209973] Oops: 0000 [#1] PREEMPT SMP 
Sep 14 18:14:27 [kernel] [   96.210364] Modules linked in: nouveau i2c_algo_bit drm_kms_helper ttm drm
Sep 14 18:14:27 [kernel] [   96.210793] CPU 2 
Sep 14 18:14:27 [kernel] [   96.210807] Pid: 2640, comm: X Not tainted 3.6.0-rc5+ #1144 System manufacturer System Product Name/P6T SE
Sep 14 18:14:27 [kernel] [   96.211581] RIP: 0010:[<ffffffffa009735f>]  [<ffffffffa009735f>] nouveau_timer_wait_eq+0xd3/0x18a [nouveau]
Sep 14 18:14:27 [kernel] [   96.212015] RSP: 0018:ffff8801b387db48  EFLAGS: 00010046
Sep 14 18:14:27 [kernel] [   96.212425] RAX: ffff8801b41ab400 RBX: ffff8801b6cfe400 RCX: 0000000000000001
Sep 14 18:14:27 [kernel] [   96.212844] RDX: ffffffffa028f810 RSI: 0000000077359400 RDI: 0000000000000000
Sep 14 18:14:27 [kernel] [   96.213389] RBP: ffff8801b387db98 R08: 0000000000000000 R09: 0000000010000000
Sep 14 18:14:27 [kernel] [   96.213990] R10: ffffffffa000c844 R11: ffff8801b41a8000 R12: 0000000077359400
Sep 14 18:14:27 [kernel] [   96.214597] R13: 0000000000100c80 R14: 0000000000000001 R15: 0000000000000000
Sep 14 18:14:27 [kernel] [   96.215216] FS:  0000000000000000(0000) GS:ffff8801bfc80000(0000) knlGS:0000000000000000
Sep 14 18:14:27 [kernel] [   96.215852] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Sep 14 18:14:27 [kernel] [   96.216497] CR2: 00000000000000a0 CR3: 0000000001a0c000 CR4: 00000000000007e0
Sep 14 18:14:27 [kernel] [   96.217164] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
Sep 14 18:14:27 [kernel] [   96.217846] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Sep 14 18:14:27 [kernel] [   96.218532] Process X (pid: 2640, threadinfo ffff8801b387c000, task ffff8801b6fa5480)
Sep 14 18:14:27 [kernel] [   96.219213] Stack:
Sep 14 18:14:27 [kernel] [   96.219907]  0000000000000000 ffff8801b4291500 0000000000000282 0000000000000006
Sep 14 18:14:27 [kernel] [   96.220639]  ffff8801b41a8000 ffff8801b6cfe400 0000000000000006 0000000000000282
Sep 14 18:14:27 [kernel] [   96.221364]  ffff8801b42915e0 ffff8801b42e6e00 ffff8801b387dbc8 ffffffffa009b110
Sep 14 18:14:27 [kernel] [   96.222105] Call Trace:
Sep 14 18:14:27 [kernel] [   96.222863]  [<ffffffffa009b110>] nv50_vm_flush_engine+0x15c/0x1bc [nouveau]
Sep 14 18:14:27 [kernel] [   96.223615]  [<ffffffffa00765c5>] nv50_bar_unmap+0x83/0x90 [nouveau]
Sep 14 18:14:27 [kernel] [   96.224403]  [<ffffffffa01c2d25>] nouveau_ttm_io_mem_free+0xd5/0xd7 [nouveau]
Sep 14 18:14:27 [kernel] [   96.225173]  [<ffffffffa004ae50>] ttm_mem_io_free+0x48/0x4a [ttm]
Sep 14 18:14:27 [kernel] [   96.225984]  [<ffffffffa004b52e>] ttm_mem_io_free_vm+0x4b/0x4d [ttm]
Sep 14 18:14:27 [kernel] [   96.226806]  [<ffffffffa004918e>] ttm_bo_release+0x81/0x206 [ttm]
Sep 14 18:14:27 [kernel] [   96.227639]  [<ffffffff904b87ef>] ? __mutex_lock_slowpath+0x266/0x294
Sep 14 18:14:27 [kernel] [   96.228480]  [<ffffffffa0049349>] ttm_bo_unref+0x36/0x43 [ttm]
Sep 14 18:14:27 [kernel] [   96.229363]  [<ffffffffa01c65bf>] nouveau_gem_object_del+0x6c/0x85 [nouveau]
Sep 14 18:14:27 [kernel] [   96.230223]  [<ffffffffa0004c8c>] drm_gem_object_free+0x26/0x28 [drm]
Sep 14 18:14:27 [kernel] [   96.231103]  [<ffffffffa0004f5e>] drm_gem_object_release_handle+0x7c/0x8f [drm]
Sep 14 18:14:27 [kernel] [   96.231997]  [<ffffffff9029434e>] idr_for_each+0x6e/0xb3
Sep 14 18:14:27 [kernel] [   96.232918]  [<ffffffffa0004ee2>] ? drm_gem_private_object_init+0x2f/0x2f [drm]
Sep 14 18:14:27 [kernel] [   96.233858]  [<ffffffffa00053c6>] drm_gem_release+0x1d/0x33 [drm]
Sep 14 18:14:27 [kernel] [   96.234796]  [<ffffffffa0003e2d>] drm_release+0x287/0x544 [drm]
Sep 14 18:14:27 [kernel] [   96.235747]  [<ffffffff90100669>] ? d_set_d_op+0x9f/0x9f
Sep 14 18:14:27 [kernel] [   96.236711]  [<ffffffff900efbf1>] __fput+0xe8/0x1c1
Sep 14 18:14:27 [kernel] [   96.237668]  [<ffffffff900efcd3>] ____fput+0x9/0xb
Sep 14 18:14:27 [kernel] [   96.238624]  [<ffffffff9006c21a>] task_work_run+0x58/0x72
Sep 14 18:14:27 [kernel] [   96.239580]  [<ffffffff9005b383>] do_exit+0x25a/0x748
Sep 14 18:14:27 [kernel] [   96.240530]  [<ffffffff904ba51f>] ? _raw_spin_unlock_irq+0x9/0x2b
Sep 14 18:14:27 [kernel] [   96.241487]  [<ffffffff9006c1fe>] ? task_work_run+0x3c/0x72
Sep 14 18:14:27 [kernel] [   96.242437]  [<ffffffff9005baf3>] do_group_exit+0x71/0x99
Sep 14 18:14:27 [kernel] [   96.243389]  [<ffffffff9005bb2d>] sys_exit_group+0x12/0x12
Sep 14 18:14:27 [kernel] [   96.244349]  [<ffffffff904bafa6>] system_call_fastpath+0x1a/0x1f
Sep 14 18:14:27 [kernel] [   96.245313] Code: 48 8b 03 48 c7 c1 c1 b5 23 a0 31 d2 48 c7 c6 8b b5 23 a0 31 ff 44 8b 00 31 c0 e8 2d d7 fd ff 0f 0b 4c 8b b8 38 02 00 00 4c 89 ff <41> ff 97 a0 00 00 00 48 89 45 c0 44 89 e8 48 89 45 b8 48 85 db 
Sep 14 18:14:27 [kernel] [   96.246471] RIP  [<ffffffffa009735f>] nouveau_timer_wait_eq+0xd3/0x18a [nouveau]
Sep 14 18:14:27 [kernel] [   96.247519]  RSP <ffff8801b387db48>
Sep 14 18:14:27 [kernel] [   96.248568] CR2: 00000000000000a0
Sep 14 18:14:27 [kernel] [   96.249627] ---[ end trace d435624aa9458cea ]---

Marcin
