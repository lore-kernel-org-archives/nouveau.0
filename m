From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: nouveau: BUG: Invalid wait context
Date: Wed, 09 Sep 2020 14:23:34 +0200
Message-ID: <1ea7646a7c641b9c7495d21a5e00b903cac307dc.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Greetings,

Box is an aging generic i4790 + GTX-980 desktop.

[ 1143.133663] =============================
[ 1143.133666] [ BUG: Invalid wait context ]
[ 1143.133671] 5.9.0.g34d4ddd-preempt #2 Tainted: G S          E
[ 1143.133675] -----------------------------
[ 1143.133678] X/2015 is trying to lock:
[ 1143.133682] ffff8d3e9efd63d8 (&zone->lock){..-.}-{3:3}, at: get_page_from_freelist+0x6ed/0x1e10
[ 1143.133694] other info that might help us debug this:
[ 1143.133697] context-{5:5}
[ 1143.133700] 4 locks held by X/2015:
[ 1143.133703]  #0: ffff8d3e562d30c0 (&cli->mutex){+.+.}-{4:4}, at: nouveau_abi16_get+0x2c/0x60 [nouveau]
[ 1143.133756]  #1: ffffa9a6c0c57d30 (reservation_ww_class_acquire){+.+.}-{0:0}, at: drm_ioctl_kernel+0x91/0xe0 [drm]
[ 1143.133785]  #2: ffff8d3e3dcef1a0 (reservation_ww_class_mutex){+.+.}-{4:4}, at: nouveau_gem_ioctl_pushbuf+0x63b/0x1cb0 [nouveau]
[ 1143.133834]  #3: ffff8d3e9ec9ea10 (krc.lock){-.-.}-{2:2}, at: kvfree_call_rcu+0x65/0x210
[ 1143.133845] stack backtrace:
[ 1143.133850] CPU: 2 PID: 2015 Comm: X Kdump: loaded Tainted: G S          E     5.9.0.g34d4ddd-preempt #2
[ 1143.133856] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
[ 1143.133862] Call Trace:
[ 1143.133872]  dump_stack+0x77/0x9b
[ 1143.133879]  __lock_acquire+0x629/0xbd0
[ 1143.133887]  ? try_to_wake_up+0x250/0x860
[ 1143.133894]  lock_acquire+0x92/0x390
[ 1143.133900]  ? get_page_from_freelist+0x6ed/0x1e10
[ 1143.133908]  ? __mutex_unlock_slowpath+0x124/0x280
[ 1143.133915]  _raw_spin_lock+0x2f/0x40
[ 1143.133921]  ? get_page_from_freelist+0x6ed/0x1e10
[ 1143.133927]  get_page_from_freelist+0x6ed/0x1e10
[ 1143.133937]  ? lock_acquire+0x92/0x390
[ 1143.133943]  ? kvfree_call_rcu+0x65/0x210
[ 1143.133949]  __alloc_pages_nodemask+0x173/0x3e0
[ 1143.133957]  __get_free_pages+0xd/0x40
[ 1143.133962]  kvfree_call_rcu+0x135/0x210
[ 1143.134002]  nouveau_fence_unref+0x36/0x50 [nouveau]
[ 1143.134045]  validate_fini_no_ticket.isra.8+0x138/0x240 [nouveau]
[ 1143.134090]  nouveau_gem_ioctl_pushbuf+0x10c8/0x1cb0 [nouveau]
[ 1143.134136]  ? nouveau_gem_ioctl_new+0xc0/0xc0 [nouveau]
[ 1143.134159]  ? drm_ioctl_kernel+0x91/0xe0 [drm]
[ 1143.134170]  drm_ioctl_kernel+0x91/0xe0 [drm]
[ 1143.134182]  drm_ioctl+0x2db/0x380 [drm]
[ 1143.134211]  ? nouveau_gem_ioctl_new+0xc0/0xc0 [nouveau]
[ 1143.134217]  ? _raw_spin_unlock_irqrestore+0x47/0x60
[ 1143.134222]  ? lockdep_hardirqs_on+0x78/0x100
[ 1143.134226]  ? _raw_spin_unlock_irqrestore+0x34/0x60
[ 1143.134257]  nouveau_drm_ioctl+0x56/0xb0 [nouveau]
[ 1143.134263]  __x64_sys_ioctl+0x8e/0xd0
[ 1143.134267]  ? lockdep_hardirqs_on+0x78/0x100
[ 1143.134271]  do_syscall_64+0x33/0x40
[ 1143.134276]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1143.134280] RIP: 0033:0x7f02e2a84ac7
[ 1143.134284] Code: b3 66 90 48 8b 05 d1 13 2c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 13 2c 00 f7 d8 64 89 01 48
[ 1143.134293] RSP: 002b:00007ffe2c2739e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 1143.134298] RAX: ffffffffffffffda RBX: 0000560c3f86ec08 RCX: 00007f02e2a84ac7
[ 1143.134302] RDX: 00007ffe2c273a50 RSI: 00000000c0406481 RDI: 000000000000000e
[ 1143.134306] RBP: 00007ffe2c273a50 R08: 0000560c3f846820 R09: 0000560c3f87fc08
[ 1143.134310] R10: 0000560c401dbb38 R11: 0000000000000246 R12: 00000000c0406481
[ 1143.134314] R13: 000000000000000e R14: 0000560c3f846820 R15: 0000560c3f84a010
