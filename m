From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: kvm+nouveau induced lockdep  gripe
Date: Sat, 24 Oct 2020 05:38:23 +0200
Message-ID: <8922fa338e3ea737371875b007ca8451b961bc0a.camel@gmx.de>
References: <20201021125324.ualpvrxvzyie6d7d@linutronix.de>
 <a23a826af7c108ea5651e73b8fbae5e653f16e86.camel@gmx.de>
 <20201023090108.5lunh4vqfpkllmap@linutronix.de>
 <20201024022236.19608-1-hdanton@sina.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201024022236.19608-1-hdanton-k+cT0dCbe1g@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hillf Danton <hdanton-k+cT0dCbe1g@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-rt-users <linux-rt-users-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 2020-10-24 at 10:22 +0800, Hillf Danton wrote:
>
> Looks like we can break the lock chain by moving ttm bo's release
> method out of mmap_lock, see diff below.

Ah, the perfect compliment to morning java, a patchlet to wedge in and
see what happens.

wedge/build/boot <schlurp... ahhh>

Mmm, box says no banana... a lot.

[   30.456921] ================================
[   30.456924] WARNING: inconsistent lock state
[   30.456928] 5.9.0.gf11901e-master #2 Tainted: G S          E
[   30.456932] --------------------------------
[   30.456935] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   30.456940] ksoftirqd/4/36 [HC0[0]:SC1[1]:HE1:SE0] takes:
[   30.456944] ffff8e2c8bde9e40 (&mgr->vm_lock){++?+}-{2:2}, at: drm_vma_offset_remove+0x14/0x70 [drm]
[   30.456976] {SOFTIRQ-ON-W} state was registered at:
[   30.456982]   lock_acquire+0x1a7/0x3b0
[   30.456987]   _raw_write_lock+0x2f/0x40
[   30.457006]   drm_vma_offset_add+0x1c/0x60 [drm]
[   30.457013]   ttm_bo_init_reserved+0x28b/0x460 [ttm]
[   30.457020]   ttm_bo_init+0x57/0x110 [ttm]
[   30.457066]   nouveau_bo_init+0xb0/0xc0 [nouveau]
[   30.457108]   nouveau_bo_new+0x4d/0x60 [nouveau]
[   30.457145]   nv84_fence_create+0xb9/0x130 [nouveau]
[   30.457180]   nvc0_fence_create+0xe/0x47 [nouveau]
[   30.457221]   nouveau_drm_device_init+0x3d9/0x800 [nouveau]
[   30.457262]   nouveau_drm_probe+0xfb/0x200 [nouveau]
[   30.457268]   local_pci_probe+0x42/0x90
[   30.457272]   pci_device_probe+0xe7/0x1a0
[   30.457276]   really_probe+0xf7/0x4d0
[   30.457280]   driver_probe_device+0x5d/0x140
[   30.457284]   device_driver_attach+0x4f/0x60
[   30.457288]   __driver_attach+0xa4/0x140
[   30.457292]   bus_for_each_dev+0x67/0x90
[   30.457296]   bus_add_driver+0x18c/0x230
[   30.457299]   driver_register+0x5b/0xf0
[   30.457304]   do_one_initcall+0x54/0x2f0
[   30.457309]   do_init_module+0x5b/0x21b
[   30.457314]   load_module+0x1e40/0x2370
[   30.457317]   __do_sys_finit_module+0x98/0xe0
[   30.457321]   do_syscall_64+0x33/0x40
[   30.457326]   entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   30.457329] irq event stamp: 366850
[   30.457335] hardirqs last  enabled at (366850): [<ffffffffa11312ff>] rcu_nocb_unlock_irqrestore+0x4f/0x60
[   30.457342] hardirqs last disabled at (366849): [<ffffffffa11384ef>] rcu_do_batch+0x59f/0x990
[   30.457347] softirqs last  enabled at (366834): [<ffffffffa1c002d7>] __do_softirq+0x2d7/0x4a4
[   30.457357] softirqs last disabled at (366839): [<ffffffffa10928c2>] run_ksoftirqd+0x32/0x60
[   30.457363]
               other info that might help us debug this:
[   30.457369]  Possible unsafe locking scenario:

[   30.457375]        CPU0
[   30.457378]        ----
[   30.457381]   lock(&mgr->vm_lock);
[   30.457386]   <Interrupt>
[   30.457389]     lock(&mgr->vm_lock);
[   30.457394]
                *** DEADLOCK ***

<snips 999 lockdep lines and zillion ATOMIC_SLEEP gripes>
