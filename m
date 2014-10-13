From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Subject: v3.17,
	i915 vs nouveau: possible recursive locking detected
Date: Mon, 13 Oct 2014 20:40:33 +0200
Message-ID: <20141013184033.GA5526@marcin-Inspiron-7720>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

=============================================
[ INFO: possible recursive locking detected ]
3.17.0 #50 Not tainted
---------------------------------------------
Xorg/1170 is trying to acquire lock:
 (&dev->struct_mutex){+.+.+.}, at: [<ffffffffa010ae93>] i915_gem_unmap_dma_buf+0x33/0xc0 [i915]

but task is already holding lock:
 (&dev->struct_mutex){+.+.+.}, at: [<ffffffffa001cd1a>] drm_gem_object_handle_unreference_unlocked+0xca/0x120 [drm]

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&dev->struct_mutex);
  lock(&dev->struct_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

1 lock held by Xorg/1170:
 #0:  (&dev->struct_mutex){+.+.+.}, at: [<ffffffffa001cd1a>] drm_gem_object_handle_unreference_unlocked+0xca/0x120 [drm]

stack backtrace:
CPU: 1 PID: 1170 Comm: Xorg Not tainted 3.17.0 #50
Hardware name: Dell Inc.          Inspiron 7720/04M3YM, BIOS A07 08/16/2012
 ffffffff82606b80 ffff880136e27b00 ffffffff81707891 ffffffff82606b80
 ffff880136e27bb8 ffffffff810e0e4f ffffffff00000000 000202000000c795
 0000000000000001 0000000000000000 00000000004ec276 0000000000000300
Call Trace:
 [<ffffffff81707891>] dump_stack+0x4e/0x7a
 [<ffffffff810e0e4f>] __lock_acquire+0x194f/0x19e0
 [<ffffffff810e1631>] lock_acquire+0x91/0x120
 [<ffffffffa010ae93>] ? i915_gem_unmap_dma_buf+0x33/0xc0 [i915]
 [<ffffffffa010ae93>] ? i915_gem_unmap_dma_buf+0x33/0xc0 [i915]
 [<ffffffff8170c014>] mutex_lock_nested+0x54/0x3d0
 [<ffffffffa010ae93>] ? i915_gem_unmap_dma_buf+0x33/0xc0 [i915]
 [<ffffffff810df03a>] ? mark_held_locks+0x6a/0x90
 [<ffffffffa010ae93>] i915_gem_unmap_dma_buf+0x33/0xc0 [i915]
 [<ffffffff814c3032>] dma_buf_unmap_attachment+0x22/0x40
 [<ffffffffa0034e42>] drm_prime_gem_destroy+0x22/0x40 [drm]
 [<ffffffffa0299b5b>] nouveau_gem_object_del+0x3b/0x60 [nouveau]
 [<ffffffffa001c7b7>] drm_gem_object_free+0x27/0x30 [drm]
 [<ffffffffa001cd34>] drm_gem_object_handle_unreference_unlocked+0xe4/0x120 [drm]
 [<ffffffffa001ce2a>] drm_gem_handle_delete+0xba/0x110 [drm]
 [<ffffffffa001d495>] drm_gem_close_ioctl+0x25/0x30 [drm]
 [<ffffffffa001df0c>] drm_ioctl+0x1ec/0x660 [drm]
 [<ffffffff8148e4b2>] ? __pm_runtime_resume+0x32/0x60
 [<ffffffff817102fd>] ? _raw_spin_unlock_irqrestore+0x5d/0x70
 [<ffffffff810df15d>] ? trace_hardirqs_on_caller+0xfd/0x1c0
 [<ffffffff810df22d>] ? trace_hardirqs_on+0xd/0x10
 [<ffffffff817102e2>] ? _raw_spin_unlock_irqrestore+0x42/0x70
 [<ffffffffa0290bd4>] nouveau_drm_ioctl+0x54/0xc0 [nouveau]
 [<ffffffff812072a0>] do_vfs_ioctl+0x300/0x520
 [<ffffffff81211fad>] ? __fget+0xad/0xe0
 [<ffffffff81211f05>] ? __fget+0x5/0xe0
 [<ffffffff81207541>] SyS_ioctl+0x81/0xa0
 [<ffffffff81710ed6>] system_call_fastpath+0x1a/0x1f
