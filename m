From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: nouveau/ttm: BUG in ttm_bo_release_list
Date: Fri, 17 Sep 2010 19:43:52 +0200
Message-ID: <20100917174352.GA2770@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi
Since upgrade from 2.6.35 to 2.6.36-rc3 (nouveau tree) I'm hitting this bug a couple of times a day:

[ 2869.618504] ------------[ cut here ]------------
[ 2869.618532] kernel BUG at drivers/gpu/drm/ttm/ttm_bo.c:153!
[ 2869.618560] invalid opcode: 0000 [#1] PREEMPT SMP 
[ 2869.618600] last sysfs file: /sys/devices/pci0000:00/0000:00:03.0/0000:02:00.0/pm_status
[ 2869.618637] CPU 0 
[ 2869.618649] Modules linked in: nouveau ttm drm_kms_helper snd_hda_codec_realtek snd_hda_intel snd_hda_codec
[ 2869.618730] 
[ 2869.618742] Pid: 11, comm: kworker/0:1 Not tainted 2.6.36-rc3-nv+ #485 P6T SE/System Product Name
[ 2869.618781] RIP: 0010:[<ffffffffa0082c9e>]  [<ffffffffa0082c9e>] ttm_bo_release_list+0x37/0xcf [ttm]
[ 2869.618830] RSP: 0018:ffff8801bfd85d40  EFLAGS: 00010202
[ 2869.618855] RAX: 0000000000000001 RBX: ffff8801b1e50c00 RCX: ffff8801b7500330
[ 2869.618887] RDX: 0000000000000001 RSI: 0000000000000037 RDI: ffff8801b1e50c44
[ 2869.618918] RBP: ffff8801bfd85d60 R08: 0000000000000002 R09: ffff8801bf683000
[ 2869.618950] R10: ffff8801b1e50c70 R11: 0000000000000000 R12: ffff8801b1e50c44
[ 2869.618981] R13: ffff8801b7500188 R14: 0000000000000000 R15: ffff8801b7500738
[ 2869.619013] FS:  0000000000000000(0000) GS:ffff880001e00000(0000) knlGS:0000000000000000
[ 2869.619048] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
[ 2869.619074] CR2: 00007f2cc0f6b000 CR3: 00000001bfe8a000 CR4: 00000000000006f0
[ 2869.619106] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 2869.619137] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[ 2869.619168] Process kworker/0:1 (pid: 11, threadinfo ffff8801bfd84000, task ffff8801bfd88000)
[ 2869.619205] Stack:
[ 2869.619217]  0000000000000000 ffff8801b1e50c44 ffffffffa0082c67 ffff8801bdcb8ab0
[ 2869.619262] <0> ffff8801bfd85d80 ffffffff8121c83a ffff8801b1e50000 ffff8801b1e50c00
[ 2869.619318] <0> ffff8801bfd85dd0 ffffffffa00839f4 ffff880001e0ebc0 0000000000000001
[ 2869.619374] Call Trace:
[ 2869.619392]  [<ffffffffa0082c67>] ? ttm_bo_release_list+0x0/0xcf [ttm]
[ 2869.619425]  [<ffffffff8121c83a>] kref_put+0x43/0x4d
[ 2869.619451]  [<ffffffffa00839f4>] ttm_bo_delayed_delete+0xa2/0xf9 [ttm]
[ 2869.619484]  [<ffffffffa0083a4b>] ? ttm_bo_delayed_workqueue+0x0/0x30 [ttm]
[ 2869.619517]  [<ffffffffa0083a65>] ttm_bo_delayed_workqueue+0x1a/0x30 [ttm]
[ 2869.619551]  [<ffffffff8107eb83>] process_one_work+0x29f/0x448
[ 2869.619580]  [<ffffffff8107f0e5>] worker_thread+0x1d6/0x349
[ 2869.619607]  [<ffffffff8107ef0f>] ? worker_thread+0x0/0x349
[ 2869.619635]  [<ffffffff81082198>] kthread+0x7d/0x85
[ 2869.619661]  [<ffffffff8102edd4>] kernel_thread_helper+0x4/0x10
[ 2869.619692]  [<ffffffff8105c10b>] ? finish_task_switch+0x49/0xb2
[ 2869.619722]  [<ffffffff814333d1>] ? _raw_spin_unlock_irq+0x19/0x34
[ 2869.619752]  [<ffffffff814339ad>] ? restore_args+0x0/0x30
[ 2869.619779]  [<ffffffff8108211b>] ? kthread+0x0/0x85
[ 2869.619805]  [<ffffffff8102edd0>] ? kernel_thread_helper+0x0/0x10
[ 2869.619832] Code: 48 8d 5f bc 48 83 ec 08 8b 07 4c 8b 6f c4 85 c0 74 04 0f 0b eb fe 8b 47 fc 85 c0 74 04 0f 0b eb fe 8b 87 a8 00 00 00 85 c0 74 04 <0f> 0b eb fe 48 83 bb 38 01 00 00 00 74 04 0f 0b eb fe 48 83 bb 
[ 2869.620255] RIP  [<ffffffffa0082c9e>] ttm_bo_release_list+0x37/0xcf [ttm]
[ 2869.620295]  RSP <ffff8801bfd85d40>
[ 2869.629610] ---[ end trace 302a6257f0da8cdc ]---

this is BUG_ON(atomic_read(&bo->cpu_writers));

I'm on b642f07208988270ac402d2548d42dab1d5fec92 "drm/nv50: fix 100c90 write on nva3".
If you have any patches / ideas how to debug this, let me know.

Marcin
